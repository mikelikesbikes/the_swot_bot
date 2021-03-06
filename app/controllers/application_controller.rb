class ApplicationController < ActionController::Base
  before_filter :redirect_to_https

  include ApplicationHelper
  include ReportGenerator
  protect_from_forgery

  def profile_path
    if current_student?
      :students_root
    elsif current_guardian?
      :guardians_root
    elsif current_teacher?
      :teachers_root
    else
      raise RuntimeError, "User Identity #{@user.id} has no profile"
    end
  end
  def redirect_to_https
    if Rails.env.production? && !(request.ssl? || request.local?)
      redirect_to :protocol => "https://"
    end
  end
end

