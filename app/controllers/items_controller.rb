# frozen_string_literal: true

class ItemsController < ApplicationController
  def new
    @item = Item.new
    @organization = Organization.all.sample
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = 'Objet ajouté !'
      redirect_to items_path
    else
      flash.now[:error] = "Désolé il y a une erreur :#{@item.errors.full_messages.to_sentence}"
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.all
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:success] = 'Les informations ont bien été mises à jour'
      redirect_to item_path(@item.id)
    else
      flash.now[:error] = "Désolé il y a une erreur :#{@item.errors.full_messages.to_sentence}"
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:success] = "L'objet a été supprimé"
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category, :type_of_transaction, :availability, :organization_id, :images[])
  end
end
