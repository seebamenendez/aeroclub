class PeopleController < ApplicationController

layout 'application-h'

  def index
    #lleva vista
    if !params[:q].nil?
      @people = Person.search(params[:q])
    else
      @people = Person.all
    end
  end


  def create
  @people = Person.new (people_params)
   if @people.save
    flash[:success] = 'Persona creada correctamente.'
    redirect_to people_url(@people)
   else
    flash[:error] = 'Errores evitaron que se grabara la persona.'
    render 'new'
   end
  end

  def new
    #lleva vista
    @people = Person.new
  end

  def edit
  #lleva vista
  @people = Person.find(params[:id])
  end

  def show
  #lleva vista
  @people = Person.find(params[:id])
  end

  def update
  @people = Person.find(params[:id])
  if @people.update_attributes(people_params)
  flash[:success] = 'Persona actualizada correctamente.'
  redirect_to people_url(@people.id)
  else
  flash[:error] = 'Errores evitaron que se grabara la persona.'
  render 'edit'
  end
  end

  def destroy
  Rails.logger.info "Eliminando persona"
    @people = Person.find(params[:id])
    if Person.custom_delete(@people)
    flash[:success] = 'Persona deshabilitada correctamente.'
    redirect_to people_url
  else
  flash[:error] = 'Errores evitaron que se deshabilitara la persona.'
  render 'show'
  end    
  end

  private
  # Using a private method to encapsulate the permissible parameters is
  # just a good pattern since you'll be able to reuse the same permit
    # list between create and update. Also, you can specialize this method
    # with per-user checking of permissible attributes.
    def people_params
    params.require(:person).permit(:name, :surname, :mail, :home, :phone, :age, :pilot, :member, :guest, :status, :id_number)
    end

end
