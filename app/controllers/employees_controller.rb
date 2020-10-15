class EmployeesController < ApplicationController

    before_action :find_employee, only: [:show, :edit, :update]

    def index
        @employees = Employee.all
    end 

    def show 
    end 

    def new
        @employee = Employee.new
        @dogs = Dog.all
    end 

    def create
        employee = Employee.create(employee_params)
        if employee.save 
            flash[:success] = "Employee Successfully Created!"
            redirect_to employee_path(employee)
        else 
            flash[:errors] = employee.errors.full_messages
            redirect_to new_employee_path
        end 
    end 

    def edit 
        @dogs = Dog.all
    end 

    def update
        @employee.update(employee_params)
        if @employee.save 
            flash[:success] = "Employee Successfully Created!"
            redirect_to employee_path(@employee)
        else 
            flash[:errors] = @employee.errors.full_messages
            redirect_to edit_employee_path(@employee)
        end 
    end 


    private 

    def find_employee
        @employee = Employee.find(params[:id])
    end 

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :office, :title, :img_url, :dog_id)
    end 
end 
