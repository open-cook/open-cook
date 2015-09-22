module RedirectBack
  extend ActiveSupport::Concern

  included do
    def redirect_back_or(default_path = '/', opts = {})
      redirect_to :back, opts
      rescue ActionController::RedirectBackError
      redirect_to default_path, opts
    end

    def redirect_back(notice = {})
      redirect_back_or '/', notice
    end
  end
end
