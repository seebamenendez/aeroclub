class TicketFlightsController < ApplicationController

  layout 'application-h'


  def index
    #lleva vista
    if !params[:q].nil?
      @tickets = TicketFlight.search(params[:q]).order('created_at DESC')
    else
      @tickets = TicketFlight.all
    end
  end

  def deshabilitar
    @ticket = TicketFlight.find(params[:id])
    @ticket.status = 1
    @ticket.save
    redirect_to ticket_flights_path
  end

  def activar
    @ticket = TicketFlight.find(params[:id])
    @ticket.status = 0
    @ticket.save
    redirect_to ticket_flights_path
  end

  def create
    @ticket = TicketFlight.new (ticket_params)
    if @ticket.save
      flash[:success] = 'Factura creada correctamente.'
      redirect_to ticket_url(@ticket)
     else
      flash[:error] = 'Errores evitaron que se grabara la factura.'
      render 'new'
    end
  end

  def new
    #lleva vista
    @ticket =TicketFlight.new
  end

  def edit
    #lleva vista
    @ticket = TicketFlight.find(params[:id])
  end

  def show
    #lleva vista
    @ticket =TicketFlight.find(params[:id])
  end

  def update
    @ticket = TicketFlight.find(params[:id])
    if @ticket.update_attributes(ticket_params)
      flash[:success] = 'Factura Vuelo actualizado correctamente.'
      if (!ticket_params[:km_start].nil?)
        if TicketFlight.create_new(@ticket)
           @ticket.status = 2
           if @ticket.save
              redirect_to ticket_flights_url({q: @ticket.plane.name})
           end
        else
          flash[:error] = 'Errores evitaron que se finalizara la factura vuelo.'
          render 'finish'
        end
      else
        redirect_to ticket_flights_url(@ticket.id)
      end
    else
      flash[:error] = 'Errores evitaron que se grabara la factura vuelo.'
      render 'edit'
    end
  end

  def destroy
    Rails.logger.info "Eliminando factura"
      @ticket = TicketFlight.find(params[:id])
      if TicketFlight.custom_delete(@ticket)
        flash[:success] = 'factura deshabilitado correctamente.'
        redirect_to ticket_url
      else
        flash[:error] = 'Errores evitaron que se deshabilitara la factura.'
        render 'show'
      end
  end


  def deshabilitar
    @ticket = TicketFlight.find(params[:id])
    @ticket.status = 1
    @ticket.save
    redirect_to ticket_flight_path
  end

  def activar
    @ticket = Flight.find(params[:id])
    @ticket.status = 0
    @ticket.save
    redirect_to ticket_flight_path
  end


  private
    # Using a private method to encapsulate the permissible parameters is
    # just a good pattern since you'll be able to reuse the same permit
    # list between create and update. Also, you can specialize this method
    # with per-user checking of permissible attributes.
    def ticket_params
      params.require(:ticket_flight).permit(:flight_id, :person_id, :plane_id, :flight_type_id, :price, :status, :km_start, :km_end)
    end

end

