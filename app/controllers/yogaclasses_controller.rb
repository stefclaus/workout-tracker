class YogaclassesController < ApplicationController

  # GET: /yogaclasses
  get "/yogaclasses" do
    if logged_in?
      @yogaclasses = Yogaclass.all
      erb :"/yogaclasses/index.html"
    else
      redirect to "/login"
    end
  end


  get "/yogaclasses/new" do
    if logged_in?
      erb :"/yogaclasses/new.html"
    else
      redirect "/login"
    end
  end


  post "/yogaclasses" do
    if !logged_in?
      redirect "/login"
    elsif !params[:yogaclass].empty?
      @user = current_user
      @yogaclass = Yogaclass.create(:yogaclass => params[:yogaclass])
      @user.yogaclass << @yogaclass
      redirect "/yogaclasses/#{@yogaclass.id}"
    else
      redirect "/yogaclasses/new"
    end
  end


  # GET: /yogaclasses/5
  #get "/yogaclasses/:id" do
  #  erb :"/yogaclasses/show.html"
  #end

  # GET: /yogaclasses/5/edit
  #get "/yogaclasses/:id/edit" do
  #  erb :"/yogaclasses/edit.html"
  #end

  # PATCH: /yogaclasses/5
  #patch "/yogaclasses/:id" do
  #  redirect "/yogaclasses/:id"
#  end

  # DELETE: /yogaclasses/5/delete
  #delete "/yogaclasses/:id/delete" do
  #  redirect "/yogaclasses"
  #end
end
