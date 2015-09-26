class TicketMembersController < ApplicationController

layout 'application-h'

  def index
    #lleva vista
    if !params[:q].nil?
      @ticket_members = TicketMember.search(params[:q])
    else
      @ticket_members = TicketMember.all
    end
  end


  def create
   @ticket_member = TicketMember.new (ticket_members_params)
   if @ticket_member.save
    flash[:success] = 'El ticket del socio creado correctamente.'
    redirect_to ticket_members_url(@ticket_member)
   else
    flash[:error] = 'Errores evitaron que se grabara el ticket del socio.'
    render 'new'
   end
  end

  def new
    #lleva vista
    @ticket_member = TicketMember.new
  end

  def edit
  #lleva vista
  @ticket_member = TicketMember.find(params[:id])
  end

  def show
  #lleva vista
  @ticket_member = TicketMember.find(params[:id])
  end

  def update
  @ticket_member = TicketMember.find(params[:id])
  if @ticket_member.update_attributes(ticket_members_params)
  flash[:success] = 'El ticket del socio actualizado correctamente.'
  redirect_to ticket_members_url(@ticket_member.id)
  else
  flash[:error] = 'Errores evitaron que se grabara el ticket del socio.'
  render 'edit'
  end
  end

  def destroy
  Rails.logger.info "Eliminando el ticket del socio."
    @ticket_member = TicketMember.find(params[:id])
    if TicketMember.custom_delete(@ticket_member)
    flash[:success] = 'El ticket del socio deshabilitado correctamente.'
    redirect_to ticket_members_url
  else
  flash[:error] = 'Errores evitaron que se deshabilitara el ticket del socio.'
  render 'show'
  end    
  end

  private
  # Using a private method to encapsulate the permissible parameters is
  # just a good pattern since you'll be able to reuse the same permit
    # list between create and update. Also, you can specialize this method
    # with per-user checking of permissible attributes.
    def ticket_members_params
    params.require(:ticket_member).permit(:person_id, :price, :status, :date)
    end

end
