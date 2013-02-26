class SessionsController < ApplicationController
  def new
  end

  def create
    auth = request.env["omniauth.auth"]
    if (User.find_by_provider_and_uid(auth["provider"], auth["uid"]))
      user = User.find_by_provider_and_uid(auth["provider"], auth["uid"])
    else 
      user = User.new
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.save
    end

    session[:user_id] = user.id
    redirect_to root_url, :notice => "Welcome!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out"
  end

  def failure
    redirect_to login_path, alert: "Authentication failed, please try again."
  end
end
