module PostsHelper
  def posts_background
    case 19
    when 5..9
      'text-white bg-gradient-to-r from-indigo-900 via-indigo-500 to-sky-200'
    when 10..14
      'bg-gradient-to-r from-sky-300 via-sky-200 to-yellow-200'
    when 15..18
      'bg-gradient-to-r from-yellow-300 via-yellow-200 to-orange-300'
    when 19..21
      'bg-gradient-to-r from-orange-400 via-orange-300 to-indigo-400'
    else
      # deep night
      'text-white bg-gradient-to-r from-indigo-800 via-indigo-200 to-white'
    end
  end
end