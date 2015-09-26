class PilotHabilitationsController < ApplicationController
  layout 'application-h'

  def index
    #lleva vista
    if !params[:q].nil?
      @pilot = PilotHabilitation.search(params[:q])
    else
      @pilot = PilotHabilitation.all
    end
  end
  
  def habilitation
    @pilot = Person.find(params[:id])
    @habilitation = @pilot.pilot_habilitation if @pilot.pilot_habilitation
    @habilitation = PilotHabilitation.new(person: @pilot) unless @pilot.pilot_habilitation
    render 'new'
  end


  def create
    @pilot = PilotHabilitation.new (pilot_a_params)
    if @pilot.save
      flash[:success] = 'Habilitacion piloto creado correctamente.'
      redirect_to people_url(@pilot.id)
    else
      flash[:error] = 'Errores evitaron que se grabara la habilitacion.'
      render 'new'
    end
  end

  def new
    #lleva vista
    @pilot = PilotHabilitation.new
  end

  def edit
    #lleva vista
    @pilot = PilotHabilitation.find(params[:id])
  end

  def show
    #lleva vista
    @pilot = PilotHabilitation.find(params[:id])
  end

  def update
    @pilot = PilotHabilitation.find(params[:id])
    if @pilot.update_attributes(pilot_a_params)
      flash[:success] = 'Habilitacion actualizada correctamente.'
      redirect_to people_url(@pilot.id)
    else
      flash[:error] = 'Errores evitaron que se grabara la habilitacion.'
      render 'edit'
    end
  end

  def destroy
    Rails.logger.info "Eliminando habilitacion"
    @pilot = PilotHabilitation.find(params[:id])
    if PilotHabilitation.custom_delete(@pilot)
      flash[:success] = 'Habilitacion deshabilitada correctamente.'
      redirect_to pilot_habilitation_url
    else
      flash[:error] = 'Errores evitaron que se deshabilitara la habilitacion.'
      render 'show'
    end
  end

  private
    # Using a private method to encapsulate the permissible parameters is
    # just a good pattern since you'll be able to reuse the same permit
    # list between create and update. Also, you can specialize this method
    # with per-user checking of permissible attributes.
    def pilot_a_params
    params.require(:pilot_habilitation).permit(:person_id, :date_expiration, :date_start, :status)
    end

end
