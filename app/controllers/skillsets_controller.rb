class SkillsetsController < ApplicationController
    before_action :redirect_if_not_signed_in
    before_action :set_user
    before_action :set_skillset, except: [:index, :new, :create]
  
    def index
      @skillsets = Skillset.search(params[:query])
    end
  
    def new
      @skillset = Skillset.new
    end
    
    def create
      @skillset = @user.skillsets.build(skillset_params)
      if @skillset.save
        flash[:notify] = "Skillset successfully created"
        redirect_to skillsets_path
      else
        flash[:notify] = @skillset.errors.full_messages
        render :new
      end
    end
  
    def show
    end
  
    def edit
    end
  
    def update
      if @skillset.update(skillset_params)
        redirect_to skillset_path(@skillset)
      else
        render :edit
      end
    end
  
    def destroy
      @skillset.destroy
      redirect_to skillsets_path
    end
  
    private
  
      def set_user
        @user = User.find_by_id(params[:user_id])
      end
  
      def set_skillset
        @skillset = Skillset.find_by_id(params[:id])
      end
  
      def skillset_params
        params.require(:skillset).permit(:name, :skills, :info, :contact, :user_id)
      end
end
