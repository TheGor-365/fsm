class CargosController < ApplicationController
  before_action :set_cargo, only: %i[ show edit update update_state destroy ]

  def index
    @cargos = Cargo.all
  end

  def show; end
  def edit; end

  def new
    @cargo = Cargo.new
  end

  def update_state
    UpdateStateOperation.new(cargo: @cargo, key: params[:state_key])
  end

  def create
    @cargo = Cargo.new(cargo_params)

    respond_to do |format|
      if @cargo.save
        format.html { redirect_to cargo_url(@cargo) }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @cargo.update(cargo_params)
        format.html { redirect_to cargo_url(@cargo) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @cargo.destroy
    respond_to do |format|
      format.html { redirect_to cargos_url }
    end
  end

  private
  def set_cargo
    @cargo = Cargo.find(params[:id])
  end

  def cargo_params
    params.require(:cargo).permit(:title)
  end
end
