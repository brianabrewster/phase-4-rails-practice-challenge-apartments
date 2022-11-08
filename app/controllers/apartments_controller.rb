class ApartmentsController < ApplicationController
    def index
        render json: Apartment.all
    end

    def show
        apt = find_apt
        render json: apt
    end

    def create
        apt = Apartment.create(number: params[:number])
        render json: apt, status: :created
    end

    def update
        apt = find_apt
        apt.udpate(number: params[:number])
        render json: apt, status: :accepted
    end

    def destroy
        apt = find_apt
        apt.destroy
        header: :no_content
    end

    private

    def find_apt
        render json: Apartment.find(params[:id])
    end
end
