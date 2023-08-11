class StepsController < ApplicationController
    def index
        @steps = Step.all
    end
    
      def new
        @step = Step.new
      end
    
      def create
        Cloudinary.config do |config|
          config.cloud_name = 'ddkn46dt4'
          config.api_key = '229258328938113'
          config.api_secret = 'jMW0bqvCiFdRPqB1n_RzcRwiTl8'
        end

        step = Step.new(step_params)
        step.user_id = current_user.id
        if step.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end
    

    
      def edit
        @step = Step.find(params[:id])
      end
    
      def update
        step = Step.find(params[:id])
        if step.update(step_params)
          redirect_to :action => "show", :id => step.id
        else
          redirect_to :action => "new"
        end
      end
    
      def destroy
        step = Step.find(params[:id])
        step.destroy
        redirect_to action: :index
      end
    
      private
      def step_params
        params.require(:step).permit(:body_second, :book, :image, :star, :tipe_second)
      end
end
