module ApplicationHelper
  include Pagy::Frontend

  def dark_mode
    hour = Time.current.hour
    'dark' if hour.in?(20..23) || hour.in?(0..7)
  end
end
