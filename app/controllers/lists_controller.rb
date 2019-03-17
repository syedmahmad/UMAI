class ListsController < ApplicationController
	before_action :set_item, only: [:show, :edit, :update, :destroy]

	def index
		@lists = List.all.un_archive
	end

	#set_item action auto get object with id
	def show
	end

	def new
		@list = List.new
	end

	def create
		@list = List.new(list_fetched_params)

		respond_to do |format|
		  if @list.save
		    format.html { redirect_to @list, notice: 'List was successfully created.' }
		    format.json { render :show, status: :created, location: @list }
		  else
		    format.html { render :new }
		    format.json { render json: @list.errors, status: :unprocessable_entity }
		  end
		end 
	end

	#set_item action auto get object with id
	def edit
	end

	def update
		respond_to do |format|
		  if @list.update(list_fetched_params)
		    format.html { redirect_to @list, notice: 'List was successfully Updated.' }
		    format.json { render :show, status: :ok, location: @list }
		  else
		    format.html { render :edit }
		    format.json { render json: @list.errors, status: :unprocessable_entity }
		  end
		end 
	end

	def destroy
		@list.destroy
		respond_to do |format|
		  format.html { redirect_to lists_url, notice: 'Post was successfully destroyed.' }
		  format.json { head :no_content }
		end
	end

	private

	  # Use callbacks to share common setup or constraints between actions.
	  def set_item
	    @list = List.find(params[:id])
	  end

	  # Never trust parameters from the scary internet, only allow the white list through.
	  def list_fetched_params
	    params.fetch(:list, {}).symbolize_keys
	  end
end
