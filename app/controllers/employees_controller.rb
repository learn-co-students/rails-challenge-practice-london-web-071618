class EmployeesController < ApplicationController

  def create
    @employee = Employee.new(employee_params)
    if @employee.valid?
      @employee.save
      redirect_to company_path(@employee.company)
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to company_path(@employee.company)
  end



  private

  def employee_params
    params.require(:employee).permit(:name, :company_id)
  end
end
