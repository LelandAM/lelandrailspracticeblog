module SessionHelper
  def current_user
    @cached_user = @cached_user || User.find_by(id: session[:user_id])
  end
  #returns true or false to autheticate
  def logged_in?
    current_user != nil
  end

  def admin?
    current_user == User.find(1)
  end

  #you have to have a 404.erb to use this

  #only allows the user who created something to access it
end