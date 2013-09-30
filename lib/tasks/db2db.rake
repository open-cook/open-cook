# encoding: UTF-8
DB_MOVING = true

CONNECTION_PARAMS = {
  :adapter  => "mysql2",
  :host     => "localhost",
  :username => "root",
  :password => "qwerty",
  :database => "open_cook_dev",
  :encoding => "utf8"
}

# OLD DataBase
class OldFiles < ActiveRecord::Base
  establish_connection CONNECTION_PARAMS
  self.table_name = :uploaded_files
end

class OldComments < ActiveRecord::Base
  establish_connection CONNECTION_PARAMS
  self.table_name = :comments
end

class OldRecipe < ActiveRecord::Base
  establish_connection CONNECTION_PARAMS
  self.table_name = :recipes
end

class OldMenu < ActiveRecord::Base
  establish_connection CONNECTION_PARAMS
  self.table_name = :menus
end

class OldTagRelation < ActiveRecord::Base
  establish_connection CONNECTION_PARAMS
  self.table_name = :taggings
end

class OldTag < ActiveRecord::Base
  establish_connection CONNECTION_PARAMS
  self.table_name = :tags
end

# ActsAsTaggableOn::Tagging.where(taggable_id: 39, taggable_type: :Post).count

# Helpers
def create_system_hub slug, title, type
  User.root.hubs.where(title: title).first_or_create!(
    slug:  slug,
    title: title,
    pubs_type: type,
    state: :published
  )
end

def create_hub_for_recipes menu, parent_hub
  hub = Hub.where(title: menu.title).first

  unless hub
    hub = Hub.create!(
      user: User.root,
      title: menu.title,
      pubs_type: :posts,
      state: menu.state
    )
  end

  hub.move_to_child_of(parent_hub) if parent_hub
  hub
end

def set_tags_on item, type = :Post
  rels     = OldTagRelation.where(taggable_id: item.id, taggable_type: type, context: :tags)
  tag_ids  = rels.pluck(:tag_id)
  tag_list = OldTag.where(id: tag_ids).pluck(:name).join(', ')

  if !tag_list.blank?
    p "==> #{tag_list}"
    item.tag_list = tag_list
    unless item.save
      puts "Tags set wrong", item.errors.to_s
    end
  end

  # contexts = OldTagRelation.pluck(:context).uniq
  # contexts.each do |context|; end
end

def set_comments_for item, type = :Post
  comments = OldComments.where(object_id: item.id, object_type: type)

  comments.each do |comment|
    item.comments.create!(
      title: comment.title,
      contacts: comment.contacts,
      raw_content: comment.textile_content,
      state: :published
    )
    print 'c'
  end
  puts
end

def set_files_for(item, type = :Post)
  missing_files = []

  admin   = User.root
  files   = OldFiles.where(storage_id: item.id, storage_type: type).order('id ASC')
  storage = OldRecipe.where(id: files.first.storage_id).first

  unless storage
    puts "Has no storage id #{files.first.storage_id}"
    return false
  end

  files.each do |file|
    fn = "#{Rails.root}/public/old_uploads/root/recipe/#{storage.zip}/files/original/#{file.file_file_name}"
    if File.exists? fn
      if _file = item.attached_files.create(
        user: admin,
        attachment: File.open(fn)
      )
      else
        puts 'ERROR'
        puts _file.errors.to_s
      end

      print 'f'
    else
      missing_files.push "#{storage.zip}/files/original/#{file.file_file_name}"
    end
  end
  
  if file = files.select{|f| f.file_content_type =~ /image/ }.last
    fn = "#{Rails.root}/public/old_uploads/root/recipe/#{storage.zip}/files/original/#{file.file_file_name}"
    
    if File.exists? fn
      unless item.update( main_image: File.open(fn) )
        puts "Cant to set Main Image", item.errors.to_s
      end
      print ' Mf'
    end
  end

  if !missing_files.empty?
    puts "missing_files"
    puts  missing_files
  end

  puts
end

# lagacy_url
# view count

namespace :db do
  namespace :to do
    # rake db:to:db
    task db: :environment do
      Rake::Task["db:bootstrap"].invoke
      Rake::Task["db:first:user"].invoke

      root        = User.root
      recipes_hub = create_system_hub(:recipes, 'Рецепты', :posts)

      recipes = OldRecipe.all[100..200]
      rcount  = recipes.count

      recipes.each_with_index do |old_recipe, index|
        menu     = OldMenu.find(old_recipe.menu_id)
        comments = OldComments.where(object_id: old_recipe.id, object_type: :Recipe)
        files    = OldFiles.where(storage_id: old_recipe.id, storage_type: :Recipe)

        recipe_hub = create_hub_for_recipes(menu, recipes_hub)

        recipe = recipe_hub.pubs.where(title: old_recipe.title).first_or_create!(
          user:            root,
          title:           old_recipe.title,
          raw_intro:       old_recipe.textile_annotation,
          raw_content:     old_recipe.textile_content,
          show_count:      old_recipe.show_count,

          state:           old_recipe.state,
          legacy_url:      old_recipe.friendly_url # /recipes/rc56797---lavandovyy-limonad | /recipes/rc56797
        )

        puts "(!) #{recipe.title} => #{index}/#{rcount}"
        set_tags_on(recipe, :Recipe)
        set_comments_for(recipe, :Recipe)
        set_files_for(recipe, :Recipe)

        puts '-'*10
        puts
      end
    end
  end
end