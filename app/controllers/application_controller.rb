class ApplicationController < ActionController::Base
  include RedirectBack
  include SorceryAddons
  include TheRoleAddons
  include TheRole::Controller
  include TheComments::ViewToken

  prepend_view_path "app/views/#{ AppConfig.theme }"

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def app_role_access_denied
    redirect_to login_url, alert: t('users.have_not_role')
  end

  alias_method :user_require,       :require_login
  alias_method :role_access_denied, :app_role_access_denied

  before_action :define_user
  after_action  :save_audit

  private

  def define_user
    @root   = User.root
    @user   = current_user
    user_id = params[:user_id]

    if user_id
      @user = if TheFriendlyId.int? user_id
        User.find(user_id)
      else
        User.where(login: user_id).first
      end
    end
  end

  def save_audit
    (@audit || Audit.new.init(self)).save unless controller_name == 'audits'
  end

  def not_authenticated
    redirect_to login_url, alert: t('users.not_authenticated')
  end
end