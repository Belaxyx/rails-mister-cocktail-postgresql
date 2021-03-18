class ReviewsController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id]) # !!! ceci ne rend pas un id mais unde instance de coktail !!!! et non pas params[id] car on est dans la table review!!!
    # => #<Cocktail id: 1, name: "Mojito", created_at: "2021-03-18 14:15:56.229861000 +0000", updated_at: "2021-03-18 14:15:56.229861000 +0000">
    @review = Review.new # /restaurants/:restaurant_id/reviews/new
  end

  # POST /restaurants/:restaurant_id/reviews
  def create
    @review = Review.new(review_params) # do not content the mandatory cocktail_id field!!
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review.cocktail = @cocktail # cette review appartient a ce cocktail => assigne l'id
    # @review.cocktail_id = @cocktail.id => same!!!
    if @review.save
      redirect_to cocktail_path(@cocktail.id)
    else
      render '/cocktails/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
