class Audit < ActiveRecord::Base
  include TheAudit::Base
end