class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:notice] = "Company was successfully created"
      redirect_to companies_path
    else
      render :new
    end
  end

  def show
    @company = Company.find(params[:id])
  end

def edit
  @company = Company.find(params[:id])
end

def update
  @company = Company.find(params[:id])
  if @company.update(company_params)
    flash[:notice] = "Company has been successfully updated"
    redirect_to companies_path
  else
    render :edit
  end
end

def destroy
  @company = Company.find(params[:id])
  @company.destroy
  flash[:notice] = "Company has been successfully deleted"
  redirect_to companies_path
end


  def company_params
    params.require(:company).permit(:name)
  end
end
