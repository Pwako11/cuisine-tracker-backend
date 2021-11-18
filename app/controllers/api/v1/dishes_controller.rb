class Api::V1::DishesController < ApplicationController
  before_action :set_dish, only: [:show, :update, :destroy]

  # GET /dishes
  def index
    if logged_in?

      @dishes = current_user.dishes

      serializedDishes = DishSerializer.new(@dishes).serializable_hash.to_json

      render json: serializedDishes
    else 
      render json: {
        error: "you must be logged in to view more information"
      }
    end 
  end

  # GET /dishes/1
  def show

    serializedDish = DishSerializer.new(@dish).serializable_hash.to_json

    render json: serializedDish
  end

  # POST /dishes
  def create
    @dish = Dish.new(dish_params)

    byebug 

    if @dish.save
      render json: DishSerializer.new(@dish).serializable_hash.to_json, status: :created
    else
      error_resp = {
        error: @dish.errors.full_message.to_sentence
      }
      render json: error_resp, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dishes/1
  def update
    if @dish.update(dish_params)
      serializedDish = DishSerializer.new(@dish).serializable_hash.to_json
      render json: serializedDish
    else
      error_resp = {
        error: @dish.errors.full_message.to_sentence
      }
      render json: error_resp, status: :unprocessable_entity
    end
  end

  # DELETE /dishes/1
  def destroy
    if @dish.destroy
      render json: {data: "Selected dish was successfully deleted"}, status: :ok
    else 
      error_resp = {
        error: "Dish not found"
      }
      render json: error_resp, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dish
      @dish = Dish.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dish_params
      params.require(:dish).permit(:name, :ingredients)
    end
end
