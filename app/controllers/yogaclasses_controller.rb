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

  get "/yogaclasses/:id" do
    if logged_in?
      @yogaclass = Yogaclass.find(params[:id])
      erb :"/yogaclasses/show.html"
    else
      redirect "/login"
    end
  end

  post "/yogaclasses" do
    if !logged_in?
      redirect "/login"
    elsif !params[:yogaclass].empty?
      @user = current_user
      @yogaclass = Yogaclass.create(:yogaclass => params[:yogaclass], :instructor => params[:instructor], :description => params[:description], :date => params[:date])
      #redirect "/users/#{@user.slug}"
      redirect "/yogaclasses/#{@yogaclass.id}"
    else
      redirect "/yogaclasses/new"
    end
  end

  get '/yogaclasses/:id/edit' do
  #  if logged_in?
      @yogaclass = Yogaclass.find(params[:id])
    #  if @yogaclass && @yogaclass.user == current_user
        erb :'yogaclasses/edit.html'
    #  else
  #      redirect to '/yogaclasses'
    #  end
  #  else
  #    redirect to '/login'
  #  end
  end

  patch '/yogaclasses/:id' do
#     if logged_in?
#       if params[:yogaclass] == ""
#         redirect to "/yogaclasses/#{params[:id]}/edit"
#       else
         @yogaclass = Yogaclass.find(params[:id])
  #       if !params[:yogaclass].empty?
           @yogaclass.update(yogaclass: params[:yogaclass])
           @yogaclass.update(instructor: params[:instructor])
           @yogaclass.update(description: params[:description])
           @yogaclass.update(date: params[:date])
           redirect "/yogaclasses/#{@yogaclass.id}"
#         end
#         else
#         if @yogaclass && @yogaclass.user == current_user
#           if @yogaclass.update(yogaclass: params[:yogaclass])
#           else
#            redirect to "/yogaclass/#{@yogaclass.id}/edit"
#          end
#         else
#           redirect to '/yogaclass'
#         end
#       end
#     else
#       redirect to '/login'
#     end
   end

#   delete '/yogaclass/:id/delete' do
#     if logged_in?
#       @yogaclass = Yogaclass.find_by_id(params[:id])
#       if @yogaclass && @yogaclass.user == current_user
#         @yogaclass.delete
#       end
#       redirect to '/yogaclass'
#     else
#       redirect to '/login'
#     end
#   end



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
