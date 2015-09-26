class FlightTypesController < ApplicationController


  layout 'application-h'

  def index
    #lleva vista
    if !params[:q].nil?
      @flight_types = FlightType.search(params[:q])
    else
      @flight_types = FlightType.all
    end
  end


  def create
    @flight_type = FlightType.new (flight_type_params)
    if @flight_type.save
      flash[:success] = 'Tipo de vuelo creado correctamente.'
      redirect_to flight_types_url(@flight_type)
    else
      flash[:error] = 'Errores evitaron que se grabara el tipo de vuelo.'
      render 'new'
    end
  end

  def new
    #lleva vista
    @flight_type = FlightType.new
  end

  def edit
    #lleva vista
    @flight_type = FlightType.find(params[:id])
  end

  def show
    #lleva vista
    @flight_type = FlightType.find(params[:id])
  end

  def update
    @flight_type = FlightType.find(params[:id])
    if @flight_type.update_attributes(flight_type_params)
      flash[:success] = 'Tipo de vuelo actualizado correctamente.'
      redirect_to flight_type_url(@flight_type.id)
    else
      flash[:error] = 'Errores evitaron que se grabara el tipo de vuelo.'
      render 'edit'
    end
  end

  def destroy
    Rails.logger.info "Eliminando tipo de vuelo"
    @flight_type = FlightType.find(params[:id])
    if FlightType.custom_delete(@flight_type)
      flash[:success] = 'Tipo de vuelo deshabilitado correctamente.'
      redirect_to flight_type_url
    else
      flash[:error] = 'Errores evitaron que se deshabilitara el tipo de vuelo.'
      render 'show'
    end
  end

  private
    # Using a private method to encapsulate the permissible parameters is
    # just a good pattern since you'll be able to reuse the same permit
    # list between create and update. Also, you can specialize this method
    # with per-user checking of permissible attributes.
    def flight_type_params
    params.require(:flight_type).permit(:name_flight, :description, :price, :status)
    end

end
