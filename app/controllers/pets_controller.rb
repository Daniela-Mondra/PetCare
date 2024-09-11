class PetsController < ApplicationController
  before_action :set_pets, only: %i[edit update destroy]

  def index
    @pets = Pet.all
  end

  def new
    @pet = Pet.new
  end

  def edit
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user

    if @pet.save
      redirect_to "/", notice: 'Pet was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    redirect_to pets_path, notice: 'Pet was successfully updated.' if @pet.update(pet_params)
  end

  def destroy
    @vpet.destroy
    flash[:notice] = 'Pet was deleted.'
    redirect_to pets_path
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :photo, :specie, :description, :likes, :dislikes, :age, :weight)
  end

  def set_pets
    @pet = Pet.find(params[:id])
  end
end
