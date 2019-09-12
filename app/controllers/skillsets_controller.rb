class SkillsetsController < ApplicationController
    before_action :redirect_if_not_signed_in
    def index
        @skillsets = Skillset.all
    end
  
    def new
  
    end
  
    def create
  
    end
  
    def show
  
    end
  
    def edit
  
    end
  
    def update
  
    end
  
    def destroy
  
    end
end
