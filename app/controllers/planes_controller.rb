class PlanesController < ApplicationController
  layout 'application-h'

  def index
    #lleva vista
    if !params[:q].nil?
      @planes = Plane.search(params[:q])
    else
      @planes = Plane.all
    end
  end


  def create
    @planes = Plane.new (plane_params)
    if @planes.save
      flash[:success] = 'Avion creado correctamente.'
      redirect_to plane_url(@planes)
    else
      flash[:error] = 'Errores evitaron que se grabara el avion.'
      render 'new'
    end
  end

  def new
    #lleva vista
    @plane = Plane.new
  end

  def edit
    #lleva vista
    @plane = Plane.find(params[:id])
  end

  def show
    #lleva vista
    @plane = Plane.find(params[:id])
  end

  def update
    @plane = Plane.find(params[:id])
    if @plane.update_attributes(plane_params)
      flash[:success] = 'Avion actualizado correctamente.'
      redirect_to plane_url(@plane.id)
    else
      flash[:error] = 'Errores evitaron que se grabara el avion.'
      render 'edit'
    end
  end

  def destroy
    Rails.logger.info "Eliminando avion"
    @plane = Plane.find(params[:id])
    if Plane.custom_delete(@plane)
      flash[:success] = 'Avion deshabilitado correctamente.'
      redirect_to planes_url
    else
      flash[:error] = 'Errores evitaron que se deshabilitara el avion.'
      render 'show'
    end
  end

  private
    # Using a private method to encapsulate the permissible parameters is
    # just a good pattern since you'll be able to reuse the same permit
    # list between create and update. Also, you can specialize this method
    # with per-user checking of permissible attributes.
    def plane_params
    params.require(:plane).permit(:name, :model, :year, :description, :matricula, :status)
    end

end
