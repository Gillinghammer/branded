class UsersController < Devise::RegistrationsController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    super
  end

  # POST /users
  # POST /users.json
  def create
    build_resource(sign_up_params)
    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
    if resource.save
      # resource.searches.build
      @company = Company.find_by name: resource.email.gsub(/.+@([^.]+).+/, '\1')
      if @company
        @company.users << resource
      else
        @company = Company.new
        @company.update_attributes(email_domain: resource.email, name: resource.email.gsub(/.+@([^.]+).+/, '\1'))
        @company.users << resource
      end
      @company.save!
    end

    # @user = User.new(user_params)
    # respond_to do |format|
    #   if @user.save

      #   format.html { redirect_to @user, notice: 'User was successfully created.' }
      #   format.json { render :show, status: :created, location: @user }
      # else
      #   format.html { render :new }
      #   format.json { render json: @user.errors, status: :unprocessable_entity }
      # end
    # end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    super
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params[:user]
    end
  end
