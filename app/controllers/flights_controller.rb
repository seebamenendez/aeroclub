class FlightsController < ApplicationController

  layout 'application-h'

  def index
    #lleva vista
    if !params[:q].nil?
      @flights = Flight.search(params[:q])
    else
      @flights = Flight.all
    end
  end


  def create
    @flight = Flight.new(flight_params)
    if @flight.save
      flash[:success] = 'Vuelo creado correctamente.'
      redirect_to flights_url(@flight)
    else
      flash[:error] = 'Errores evitaron que se grabara el vuelo.'
      render 'new'
    end
  end

  def new
    #lleva vista
    @flight = Flight.new
  end

  def edit
    #lleva vista
    @flight = Flight.find(params[:id])
  end

  def finish
    #lleva vista
    @flight = Flight.find(params[:id])
    @ticket_flight = TicketFlight.new(flight_id: @flight.id)
    Rails.logger.info @flight.people
    @people = @flight.people
  end

  def show
    #lleva vista
    @flight = Flight.find(params[:id])
    @people = @flight.people
  end

  def update
    @flight = Flight.find(params[:id])
    if @flight.update_attributes(flight_params)
      flash[:success] = 'Vuelo actualizado correctamente.'
      if (!flight_params[:km_start].nil?)
        if TicketFlight.create_new(@flight)
           @flight.status = 2
           if @flight.save
              redirect_to ticket_flights_url({q: @flight.plane.matricula})
           end
        else
          flash[:error] = 'Errores evitaron que se finalizara el vuelo.'
          render 'finish'
        end
      else
        redirect_to flights_url(@flight.id)
      end
    else
      flash[:error] = 'Errores evitaron que se grabara el vuelo.'
      render 'edit'
    end
  end

  def destroy
    Rails.logger.info "Eliminando vuelo"
    @flight = Flight.find(params[:id])
    if Flight.custom_delete(@flight)
      flash[:success] = 'Vuelo deshabilitado correctamente.'
      redirect_to flights_url
    else
      flash[:error] = 'Errores evitaron que se deshabilitara el vuelo.'
      render 'show'
    end
  end
  
  def add_people
    @flight = Flight.find(params[:id])
    Rails.logger.info @flight.people
    @people = Person.search(params[:q]).where.not(id: @flight.people.map(&:id))
  end
 
  def add_person
    @flight = Flight.find(params[:id])
    @person = Person.find(params[:person_id])
    
    if @flight.add_person(@person)
      redirect_to flight_add_people_path(@flight.id)
    else
      redirect_to flight_add_people_path(@flight.id)
    end
  end 

  def deshabilitar
    @flight = Flight.find(params[:id])
    @flight.status = 1
    @flight.save
    redirect_to flights_path
  end

  def activar
    @flight = Flight.find(params[:id])
    @flight.status = 0
    @flight.save
    redirect_to flights_path
  end

  def remove_person
    @flight = Flight.find(params[:id])
    @person = Person.find(params[:person_id])
    
    if @flight.remove_person(@person)
      @people = @flight.people
      render 'show'
    else
      @people = @flight.people
      render 'show'
    end
  end

  private
    # Using a private method to encapsulate the permissible parameters is
    # just a good pattern since you'll be able to reuse the same permit
    # list between create and update. Also, you can specialize this method
    # with per-user checking of permissible attributes.
    def flight_params
      params.require(:flight).permit(:plane_id, :person_id, :date, :flight_type_id, :time_fly, :km_start, :km_end, :fuel_charged, :status)
    end

end
