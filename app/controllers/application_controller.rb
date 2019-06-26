class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes/new' do

    erb :new

  end

  post '/recipes' do

    Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])


    redirect "/recipes/#{Recipe.last.id}"


  end

  get '/recipes/:id' do

   @recipe = Recipe.find(params[:id])

   erb :show

  end

  get '/recipes' do

    @recipes = Recipe.all

    erb :index

  end

  get '/recipes/:id/edit' do

    @recipe_object = Recipe.find(params[:id])

    erb :edit

  end

end
