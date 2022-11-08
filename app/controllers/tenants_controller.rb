class TenantsController < ApplicationController
    def index
        render json: Tenant.all
    end

    def show
        tenant = find_tenant
        render json: tenant
    end

    def create
        tenant = Tenant.create(name: params[:name], age: params[:age])
        render json: tenant, status: :created
    end

    def update
        tenant = find_tenant
        tenant.udpate(name: params[:name], age: params[:age])
        render json: tenant, status: :accepted
    end

    def destroy
        tenant = find_tenant
        tenant.destroy
        header: :no_content
    end

    private

    def find_tenant
        render json: Tenant.find(params[:id])
    end

end
