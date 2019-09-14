class SkillsetsController < ApplicationController
    before_action :redirect_if_not_signed_in
    before_action :set_user
    before_action :set_skillset, except: [:index, :new, :create]
  
    def index
      @skillsets = Skillset.search(params[:query], params[:user_id])
    end
  
    def new
      @skillset = Skillset.new
    end
    
    def create
      @skillset = @user.skillsets.build(skillset_params)
      if @skillset.save
        redirect_to skillsets_path
        flash[:notify] = "Skillset successfully created"
      else
        flash[:notify] = @skillset.errors.full_messages
        render :new
      end
    end
  
    def show
    end
  
    def edit
      redirect_to skillsets_path unless current_user == @skillset.user
    end
  
    def update
      if @skillset.update(skillset_params)
        redirect_to skillset_path(@skillset)
      else
        flash[:notify] = @skillset.errors.full_messages
        render :edit
      end
    end
  
    def destroy
      if current_user == @skillset.user
      @skillset.destroy
      end
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
