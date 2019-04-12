class UsersController < ApplicationController


  get "/signup" do
    if !logged_in?
      erb :"users/new.html"
    else !!logged_in?
      redirect "/users/index.html"
    end
  end

  post "/signup" do
    user = User.new(:email => params[:email], :username => params[:username], :password => params[:password])
    if params[:email] == "" || params[:username] == "" || params[:password] == ""
      redirect '/signup'
    else
      user.save
      session[:user_id] = user.id
      redirect "/users/index.html"
    end
  end

  get '/login' do
    if !logged_in?
      erb :"users/login.html"
    else
      redirect "/users/index.html"
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/users/index.html"
    else
      redirect "/signup"
    end
  end

  get "/users/:slug" do
    @user = User.find_by_slug(params[:slug])
    erb :"users/show.html"
  end


  get "/logout" do
    if !!logged_in?
      session.clear
      redirect "/"
    else
      redirect "/"
    end
  end

end
