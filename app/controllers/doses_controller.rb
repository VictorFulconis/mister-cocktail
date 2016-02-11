class DosesController < ApplicationController

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.save
    redirect_to cocktail_path(params[:cocktail_id])
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.delete
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient)
  end

end
