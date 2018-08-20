class CompaniesController < ApplicationController

  def show
    @company = Company.find(params[:id])
    @rent_paid = @company.rent_paid
    @employee = Employee.new
  end

  def new
    @company = Company.new
    @offices = @company.offices.build
  end

  def create
    @company = Company.new(company_params)
    if @company.valid?
      @company.save
      new_offices = Company.clean_data(params[:company][:offices_attributes])
      new_offices.values.each do |hash|
        new_office = Office.create(hash)
        @company.offices << new_office
      end
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :offices_attributes => [:building_id, :floor])
  end
end
