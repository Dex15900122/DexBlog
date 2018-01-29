class PortfoliosController < ApplicationController
  layout 'portfolio'
  before_action :set_portfolio_item, only: [:show, :edit, :update, :destroy]

  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all
  def index
    @portfolio_items = Portfolio.by_position
  end
  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end

  def sort
    params[:order].each do |key, value|
    Portfolio.find(value[:id]).update(position: value[:position])
  end

    render nothing: true
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  def create
    @portfolio_item=Portfolio.new(portfolio_item_params)
    if @portfolio_item.save
      redirect_to portfolios_path,notice: "create Portfolio successful"
    else
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    if @portfolio_item.update(portfolio_item_params)
      redirect_to portfolios_path,notice: "update portfolio successful"
    else
      render :edit
    end
  end

  def destroy
    @portfolio_item.destroy if @portfolio_item
    redirect_to portfolio_path,notice: "delete candidate successful"
  end

 







    private
    def portfolio_item_params
      params.require(:portfolio).permit( :title, :subtitle, :body, technologies_attributes: [:name])
    end


    def set_portfolio_item
      @portfolio_item = Portfolio.find_by(id: params[:id])
    end






end
