class PeopleController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @people = Person.includes(:affiliations, :locations)
                    .paginate(page: params[:page], per_page: 10)
                    .order(sort_column + " " + sort_direction)

    @people = @people.search(params[:search]) if params[:search].present?
  end

  def import
    Person.import(params[:file])
    redirect_to people_path, notice: "CSV imported"
  end

  private

  def sort_column
    Person.column_names.include?(params[:sort]) ? params[:sort] : "first_name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
