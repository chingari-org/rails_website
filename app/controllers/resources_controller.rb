class ResourcesController < ApplicationController
    before_action :authenticate_user!
    before_action :find_resource, only: [:edit,:update,:show, :destroy]
    before_action :authorize!, only: [:new, :create, :edit, :update, :destroy]

    def new
        @resource = Resource.new
    end

    def create
        @resource = Resource.new resource_params
        @resource.user = current_user
        if @resource.save
            flash[:notice] = 'Resource added successfully.'
            redirect_to resource_path(@resource.id)
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @resource.update resource_params
            flash[:notice] = 'Resource updated successfully.'
            redirect_to resource_path(@resource.id)
        else
            render :edit
        end
    end

    def immigration
        @resources = Resource.find_by(category: "immigration")
    end

    def legal_rights
        @resources = Resource.find_by(category: "legal rights")
    end

    def womens_rights
        @resources = Resource.find_by(category: "women's rights")
    end

    def personal_dev
        @resources = Resource.find_by(category: "personal development")
    end

    def professional_dev
        @resources = Resource.find_by(category: "professional development")
    end

    def community
        @resources = Resource.find_by(category: "community")
    end

    def show
    end

    def destroy
        @resource.destroy
        redirect_to resources_path
    end

    private

    def find_resource
        @resource = Resource.find params[:id]
    end
    
    def resource_params
        params.require(:product).permit(:title, :category, :body)
    end

    def authorize!
        unless can?(:crud, @resource)
            redirect_to root_path, alert: 'You do not have permission to access this page.'
        end
    end
end
