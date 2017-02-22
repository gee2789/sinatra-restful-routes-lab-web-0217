class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @recipies_id = Recipe.create(params)
    redirect to "/recipes/#{@recipies_id.id}"
  end

  get '/recipes' do
    @all_recipies = Recipe.all
    erb :index
  end

  get '/recipes/:id' do
    @recipies_id = Recipe.find_by_id(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do
    @recipies_id = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @recipies_id = Recipe.find_by_id(params[:id])
    @recipies_id.name = params[:name]
    @recipies_id.ingredients = params[:ingredients]
    @recipies_id.cook_time = params[:cook_time]
    @recipies_id.save
    erb :show
  end

  delete '/recipes/:id/delete' do
    @recipie_delete = Recipe.find_by_id(params[:id])
    @recipie_delete.delete
    erb :deleted
  end

end
