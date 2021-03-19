class DosesController < ApplicationController

  def create
    @cocktail = Cocktail.find(params[:cocktail_id]) # logique /cocktails/:cocktail_id/doses
    @dose = Dose.new(dose_params) # il manque le cocktail id pour creer la dose!!
    @dose.cocktail = @cocktail # on assigne l'id ici
    if @dose.save
      redirect_to cocktail_path(@cocktail.id)
    else
      render "cocktails/show"
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail # ici on veut trouver le cocktail qui est associé à cette dose
    @dose.destroy
    redirect_to cocktail_path(@cocktail.id)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
