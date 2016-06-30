class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :recipes_new
  end

  get '/recipes/:id' do 
    @recipe = Recipe.find(params[:id])
    erb :recipe_id
  end

  post '/recipes' do 
    @recipe = Recipe.create(params)
    redirect "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id/delete' do
    redirect '/recipes'
  end

  get '/recipes/:id/edit' do 
    @recipe = Recipe.find(params[:id])
    erb :recipes_id_edit
  end

  post '/recipes/:id' do 
    @recipe = Recipe.update(id: params[:id])
    erb :recipe_id
  end

  post '/recipes/:id/delete' do 
    Recipe.destroy(params[:id])
  end


end