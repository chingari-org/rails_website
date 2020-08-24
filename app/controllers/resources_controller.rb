class ResourcesController < ApplicationController
    before_action :authenticate_user!
    before_action :find_resource, only: [:edit,:update,:show, :destroy]
    before_action :authorize!, except: [:index, :show]

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

    def index
        @resources = Resource.all
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
