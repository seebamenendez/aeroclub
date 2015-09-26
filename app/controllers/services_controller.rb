class ServicesController < ApplicationController
  layout 'application-h'

  def index
    #lleva vista
    if !params[:q].nil?
      @services = Service.search(params[:q])
    else
      @services = Service.all
    end
  end


  def create
  @service = Service.new (service_params)
    if @service.save
      flash[:success] = 'Service creado correctamente.'
      redirect_to service_url(@service)
    else
      flash[:error] = 'Errores evitaron que se grabara el service.'
      render 'new'
    end
  end

  def new
  #lleva vista
  @service = Service.new
  end

  def edit
  #lleva vista
  @service = Service.find(params[:id])
  end

  def show
  #lleva vista
  @service = Service.find(params[:id])
  end

  def update
  @service = Service.find(params[:id])
    if @service.update_attributes(service_params)
      flash[:success] = 'Service actualizado correctamente.'
      redirect_to service_url(@service.id)
    else
      flash[:error] = 'Errores evitaron que se grabara el Service'
      render 'edit'
    end
  end

  def destroy
  Rails.logger.info "Eliminando Service"
    @service = Service.find(params[:id])
    if Service.custom_delete(@service)
    flash[:success] = 'Service deshabilitado correctamente.'
    redirect_to service_url
    else
    flash[:error] = 'Errores evitaron que se deshabilitara el Service.'
    render 'show'
    end
  end

  private
    # Using a private method to encapsulate the permissible parameters is
    # just a good pattern since you'll be able to reuse the same permit
    # list between create and update. Also, you can specialize this method
    # with per-user checking of permissible attributes.
    def service_params
    params.require(:service).permit(:name, :description, :date, :plane_id, :status)
    end

end
