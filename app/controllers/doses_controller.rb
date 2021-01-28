class DosesController < ApplicationController
  before_action :get_cocktail, only: [ :create, :new ]

  def new
    @dose = @cocktail.doses.new
  end

  def create
    ingredient = Ingredient.find(dose_params["ingredient_id"])
    dose = @cocktail.doses.create(dose_params)
    if dose.save
      redirect_to cocktail_path(dose.cocktail)
    else
      render :new
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def get_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
