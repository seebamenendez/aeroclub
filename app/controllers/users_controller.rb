class UsersController < ApplicationController
  layout 'application-h'
  before_action :presidente, except: [:recover, :do_recover]
  
  def index
    #lleva vista
    if !params[:q].nil?
      @users = User.search(params[:q])
    else
      @users = User.all
    end
  end

  def new
  #lleva vista
  @user = User.new
  end

	def create
     @user = User.new (user-params)
    	if @user.save
      flash[:success] = 'Usuario creado correctamente.'
      redirect_to user_url
    	else
      flash[:error] = 'Errores evitaron que se guardara el usuario.'
      render 'new'
    	end
	end

  def show
    #lleva vista
    @user = User.find(params[:id])
  end

  def update
     @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'Usuario actualizado correctamente.'
      redirect_to user_url(@piloto.id)
    else
      flash[:error] = 'Errores evitaron que se guardara el usuario.'
      render 'edit'
    end
  end

  def edit
    #lleva vista
    @user = User.find(params[:id])
  end

  def destroy
      Rails.logger.info "Eliminando usuario."

       @user = User.find(params[:id])
    if User.custom_delete(@user)
      flash[:success] = 'Usuario deshabilitado correctamente.'
      redirect_to user_url
    else
      flash[:error] = 'Errores evitaron que se deshabilitara el usuario.'
      render 'show'
    end    
  end
  
  def recover
  
  end
  
  def do_recover
    user = User.where(email: params[:email]).first
    user.password = params[:password]
    user.password_confirmation = params[:password_confirmation]
    if user.save() 
      redirect_to root_path
    else
      flash[:error] = 'Errores evitaron que se reiniciara su clave.'
      render 'recover'
    end
  end

  private
    # Using a private method to encapsulate the permissible parameters is
    # just a good pattern since you'll be able to reuse the same permit
    # list between create and update. Also, you can specialize this method
    # with per-user checking of permissible attributes.
    def user_params
      params.require(:user).permit(:name_user, :password)
    end
  
    def presidente
      if !current_user.try(:Presidente?) 
        redirect_to root_path
      end
    end

end
