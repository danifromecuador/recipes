class FoodsController < ApplicationController
    def index
        if params[:user_id]
          @foods = Food.where(user_id: params[:user_id])
        else
          @foods = Food.all
        end
      end
  
    def new
      @food = current_user.foods.build
    end

    def create
        @food = current_user.foods.build(food_params)
    
        if @food.save
          redirect_to foods_path, notice: 'Food successfully created.'
        else
          render :new
        end
      end
    
      private
    
      def food_params
        params.require(:food).permit(:name, :quantity, :measurement_unit, :price)
      end
  end