class YogaclassesController < ApplicationController
  register Sinatra::Flash

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
      @yogaclass = current_user.yogaclasses.create(:yogaclass => params[:yogaclass], :instructor => params[:instructor], :description => params[:description], :date => params[:date])
  #    current_user.yogaclasses << @yogaclass
      flash[:new] = "Successfully added yoga class!"
      redirect "/yogaclasses/#{@yogaclass.id}"
    else
      redirect "/yogaclasses/new"
    end
  end

  get '/yogaclasses/:id/edit' do
    if logged_in?
      @yogaclass = Yogaclass.find(params[:id])
      if @yogaclass && @yogaclass.user == current_user
        erb :'yogaclasses/edit.html'
      else
        redirect to '/yogaclasses'
      end
    else
      redirect to '/login'
    end
  end

  patch '/yogaclasses/:id' do
     if !logged_in?
       redirect to '/login'
    else
      @yogaclass = Yogaclass.find(params[:id])
      @yogaclass.update(yogaclass: params[:yogaclass])
      @yogaclass.update(instructor: params[:instructor])
      @yogaclass.update(description: params[:description])
      @yogaclass.update(date: params[:date])
      flash[:edit] = "Successfully updated yoga class."
      redirect "/yogaclasses/#{@yogaclass.id}"
     end
   end

   delete '/yogaclasses/:id' do
     if logged_in?
       @yogaclass = Yogaclass.find_by_id(params[:id])
       flash[:notdelete] = "You can't delete another yogi's class."
       if @yogaclass && @yogaclass.user == current_user
        @yogaclass.delete
        flash[:delete] = "Successfully deleted yoga class."
       end
        redirect "/yogaclasses"
     else
       redirect to '/login'
     end
   end

end
