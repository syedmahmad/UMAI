class ListItemsController < ApplicationController
	before_action :set_list_item, only: [:show, :edit, :update, :destroy]

	#set_list_item action auto get object with id
	def show
	end

	def new
		@list = List.find_by_id params[:user_id]
		if @list.present?
			@list_item = @list.list_items.new
		else
			redirect_to root_path
		end
		
	end

	def create
		@list_item = ListItem.new(list_item_fetched_params)

		respond_to do |format|
		  if @list_item.save
		    format.html { redirect_to @list_item, notice: 'List Item was successfully created.' }
		    format.json { render :show, status: :created, location: @list_item }
		  else
		    format.html { render :new }
		    format.json { render json: @list_item.errors, status: :unprocessable_entity }
		  end
		end 
	end

	#set_list_item action auto get object with id
	def edit
	end

	def update
		respond_to do |format|
		  if @list_item.update(list_item_fetched_params)
		    format.html { redirect_to @list_item, notice: 'List Item was successfully Updated.' }
		    format.json { render :show, status: :ok, location: @list_item }
		  else
		    format.html { render :edit }
		    format.json { render json: @list_item.errors, status: :unprocessable_entity }
		  end
		end 
	end

	def destroy
		@list_item.destroy
		respond_to do |format|
		  format.html { redirect_to lists_path, notice: 'Post was successfully destroyed.' }
		  format.json { head :no_content }
		end
	end

	private

	  # Use callbacks to share common setup or constraints between actions.
	  def set_list_item
	    @list_item = ListItem.find(params[:id])
	  end

	  # Never trust parameters from the scary internet, only allow the white list through.
	  def list_item_fetched_params
	    params.fetch(:list_item, {}).symbolize_keys
	  end
end
