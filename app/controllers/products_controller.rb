class ProductsController < ApplicationController

    def index
        @products = Product.where(user_id: current_user.id)
        update_list

        respond_to do |format|
            format.json { render json: @products }
        end
    end

    def list_all
      @products = Product.where(status: 'Disponível')

      respond_to do |format|
          format.json { render json: @products }
      end
    end

    def my_list
      @products = Product.where(status: 'Indisponivel').where(reserve_id: current_user.id)

      respond_to do |format|
          format.json { render json: @products }
      end
    end

    def rent
       @product = Product.find(params[:id])

       if current_user
         @product.status = 'Indisponivel'
         @product.reserve_id = current_user.id
         @product.save

       end

       respond_to do |format|
           format.json { render json: @product }
       end
     end

    def show
        @product = Product.find(params[:id])

        respond_to do |format|
            format.json { render json: @product }
        end
    end

    def create
        @product = Product.create(product_params)

        respond_to do |format|
            format.json { render json: @product }
        end
    end

    def update
        @product = Product.find(params[:id])

        @product.update_attributes(product_params);

        respond_to do |format|
            format.json { render json: @product }
            # format.json { head :no_content }
        end
    end

    def destroy
        @product = Product.find(params[:id])

        @product.destroy

        respond_to do |format|
            format.json { render json: @product }
            # format.json { head :no_content }
        end
    end

    def update_list
      products = Product.where(user_id: nil)

      products.each do |product|
        product.user_id = current_user.id
        product.save
      end
    end

    private
        def product_params
            params.require(:product).permit(:name, :price, :quantity, :user_id, :reserve_id, :status)
        end
end
