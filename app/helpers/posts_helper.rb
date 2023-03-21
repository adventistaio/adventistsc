# frozen_string_literal: true

module PostsHelper
  def posts_background
    case Time.current.hour
    when 5..9 then   'text-white bg-gradient-to-r from-indigo-900 via-indigo-500 to-sky-200'
    when 10..14 then 'bg-gradient-to-r from-sky-300 via-sky-200 to-yellow-200'
    when 17..19 then 'bg-gradient-to-r from-yellow-300 via-yellow-200 to-orange-300'
    when 20..21 then 'bg-gradient-to-r from-orange-400 via-orange-300 to-indigo-400'
    else
      'text-white bg-gradient-to-r from-indigo-800 via-indigo-900 to-gray-800'
    end
  end
end
