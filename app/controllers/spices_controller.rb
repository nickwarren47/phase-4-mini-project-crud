class SpicesController < ApplicationController
    # rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response   
    #GET /spices
    def index 
      spices = Spice.all
      render json: spices
    end
    
    #POST /spices
    def create
      spice = Spice.create(spice_params)
      render json: spice, status: :created
    end
  
    #PATCH /spices/:id
    def update
      spice = Spice.find_by(id: params[:id])
      spice.update(spice_params)
      render json: spice
    end
  
    #DELETE /spices/:id
    def destroy
      spice = Spice.find_by(id: params[:id]) 
      spice.destroy 
      head :no_content 
    end
  
    private 
      
      def spice_params
          params.permit(:title, :image, :description, :notes, :rating)
      end
  
    #   def spice_find
    #       Spice.find(params[:id])
    #   end
  
    #   def render_not_found_response
    #       render json: {error: "Spice not found"}, status: :not_found
    #   end
end
