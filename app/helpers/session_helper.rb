module SessionHelper
  extend self

  def set_session_params(session)
    user =  User.find(session[:user]) if session[:user]
    ideas = user.sorted_ideas if session[:user]
    {
      user: user,
      user_new: User.new,
      idea: Idea.new,
      ideas: ideas,
      category: Category.new,
      categories: Category.sorted_categories,
      image: Image.new,
      images: Image.all
    }
  end

end
