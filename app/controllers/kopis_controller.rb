class KopisController < ApplicationController
  def index
    @kopis = Kopi.all

  end

  def new
    @roasts = Roast.all
    @origins = Origin.all
  end

  def create
    @kopi = Kopi.new(kopi_params)
    @kopi.save

    redirect_to root_path
  end

  def show
    @kopi = Kopi.find(params[:id])
  end

  def edit
    @kopi = Kopi.find(params[:id])
    @roasts = Roast.all
    @origins = Origin.all
  end

  def update
    @kopi = Kopi.find(params[:id])
    @kopi.update(kopi_params)
    @kopi.save
    redirect_to kopi_path(@kopi)
  end

  def destroy
    @kopi = Kopi.find(params[:id])
    @kopi.destroy
    redirect_to kopis_path
  end

  private
    def kopi_params
      params.require(:kopi).permit(:name, :roast_id, :origin_id)
    end
end
