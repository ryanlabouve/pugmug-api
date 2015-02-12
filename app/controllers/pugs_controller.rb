class PugsController < ApplicationController
  before_action :set_pug, only: [:show, :update, :destroy]

  # GET /pugs
  # GET /pugs.json
  def index
    @pugs = Pug.all

    render json: @pugs
  end

  # GET /pugs/1
  # GET /pugs/1.json
  def show
    render json: @pug
  end

  # POST /pugs
  # POST /pugs.json
  def create
    @pug = Pug.new(pug_params)

    if @pug.save
      render json: @pug, status: :created, location: @pug
    else
      render json: @pug.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pugs/1
  # PATCH/PUT /pugs/1.json
  def update
    @pug = Pug.find(params[:id])

    if @pug.update(pug_params)
      head :no_content
    else
      render json: @pug.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pugs/1
  # DELETE /pugs/1.json
  def destroy
    @pug.destroy

    head :no_content
  end

  private

    def set_pug
      @pug = Pug.find(params[:id])
    end

    def pug_params
      params.require(:pug).permit(:url, :title, :self_text)
    end
end
