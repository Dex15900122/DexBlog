class PortfoliosController < ApplicationController
  layout 'portfolio'
  def index
    @portfolio_items = Portfolio.all
  end
  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
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
    @portfolio_item = Portfolio.find_by(id: params[:id])

  end

  def edit
    @portfolio_item = Portfolio.find_by(id: params[:id])
  end

  def update
    @portfolio_item=Portfolio.find_by(id: params[:id])
    if @portfolio_item.update(portfolio_item_params)
      redirect_to portfolios_path,notice: "update portfolio successful"
    else
      render :edit
    end
  end

  def destroy
    @portfolio_item = Portfolio.find_by(id: params[:id])
    @portfolio_item.destroy if @portfolio_item
    redirect_to portfolio_path,notice: "delete candidate successful"
  end

 







    private
    def portfolio_item_params
      params.require(:portfolio).permit( :title, :subtitle, :body, technologies_attributes: [:name])
    end








end
