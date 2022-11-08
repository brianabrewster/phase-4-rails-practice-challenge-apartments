class LeasesController < ApplicationController
    def create
        lease = Lease.create(rent: params[:rent])
        render json: lease, status: :created
    end

    def destroy
        lease = Lease.find(params[:id])
        lease.destroy
        header: :no_content
    end
end
