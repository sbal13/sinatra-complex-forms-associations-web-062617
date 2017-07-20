require 'pry'
class PetsController < ApplicationController

  # get '/pets' do
  #   @pets = Pet.all
  #   erb :'/pets/index' 
  # end

  # get '/pets/new' do 
  #   @owners = Owner.all
  #   erb :'/pets/new'
  # end

  # post '/pets' do 
  #   @pet = Pet.create(params[:pet])

  #   if params[:pet][:owner_id].blank?
  #     @pet.owner = Owner.create(params[:owner])
  #   end

  #   redirect to "pets/#{@pet.id}"
  # end

  # get '/pets/:id/edit' do 
  #   @pet = Pet.find(params[:id])
  #   @owner = @pet.owner
  #   @owners = Owner.all
  #   erb :'/pets/edit'
  # end

  # get '/pets/:id' do 
  #   @pet = Pet.find(params[:id])
  #   @pet.owner.nil? ? @owner_name = "No owner" : @owner_name = @pet.owner.name
  #   erb :'/pets/show'
  # end

  # post '/pets/:id' do 

  #   @pet = Pet.find(params[:id])
  #   @pet.update(params[:pet])

  #   if !params[:owner].blank?
  #     @pet.owner = Owner.create(params[:owner])
  #   end

  #   redirect to "pets/#{@pet.id}"
  # end


   get '/pets' do
    @pets = Pets.all
    erb :'/pets/index' 
  end

  get '/pets/new' do
    @owners = Owner.all
    erb :'/pets/new'
  end


  post '/pets' do 
    @pet = Pet.create(params[:pet])
    if !params["owner"]["name"].empty?
      @pet.owner = Owner.create(params["owner"])
    end

    @pet.save
    redirect "/pets/#{@pet.id}"
  end

  get '/pets/:id/edit' do 
    @pet = Pet.find(params[:id])
    @owners = Owner.all
    erb :'/pets/edit'
  end



  get '/pets/:id' do 
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  post '/pets/:id' do 

    @pet = Pet.find(params[:id])
    @pet.update(params["pet"])
    if !params["owner"]["name"].empty?
      @pet.owner = Owner.create(params["owner"])
    end

    @pet.save
    redirect to "pets/#{@pet.id}" 
  end
end