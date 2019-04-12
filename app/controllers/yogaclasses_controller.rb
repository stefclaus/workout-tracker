class YogaclassesController < ApplicationController

  # GET: /yogaclasses
  get "/yogaclasses" do
    if logged_in?
      @tweets = Tweet.all
      erb :"/yogaclasses/index.html"
    else
      redirect to "/login"
  end


  # GET: /yogaclasses/new
  #get "/yogaclasses/new" do
  #  erb :"/yogaclasses/new.html"
  #end

  # POST: /yogaclasses
  #post "/yogaclasses" do
  #  redirect "/yogaclasses"
  #end

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
