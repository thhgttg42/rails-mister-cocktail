class DosesController < ApplicationController
  # def new
  #   @cocktail = Cocktail.find(params[:cocktail_id])
  #   @dose = Dose.new
  # end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      @review = Review.new
      render "cocktails/show"
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end

# class DosesController < ApplicationController
#   before_action :set_cocktail, only: [:new, :create]

#   def new
#     @dose = Dose.new
#   end

#   def create
#     dose = Dose.new(strong_params_dose)
#     dose.cocktail = @cocktail
#     if dose.save
#       redirect_to cocktails_path
#     else
#       render :new
#     end
#   end

#   def destroy
#     dose = Dose.find(params[:id])
#     dose.destroy
#     redirect_to cocktails_path
#   end

#   private

#   def set_cocktail
#     @cocktail = Cocktail.find(params[:cocktail_id])
#   end

#   def strong_params_dose
#     params.require(:dose).permit(:description, :ingredient_id)
#   end
# end
