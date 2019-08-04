class PeopleController < ApplicationController
  def index
    @people = Person.includes(:affiliations, :locations).paginate(page: params[:page], per_page: 10)
  end

  def import
    Person.import(params[:file])
    redirect_to people_path, notice: "CSV imported"
  end
end
