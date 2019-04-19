class StructureClassificationsController < ApplicationController
  def new
    @structure_classifications = StructureClassification.all
  end

  def create
    @classification = StructureClassification.create(name: params[:name])
    redirect_to new_structure_classification_path
  end

  def edit
    @structure_classification = StructureClassification.find(params[:id])
  end

  def update
    @structure_classification = StructureClassification.find(params[:id])
    @structure_classification.update(name: params[:name])
    redirect_to new_structure_classification_path
  end

  def destroy
    @structure_classification = StructureClassification.find(params[:id])
    @structure_classification.structures.destroy_all
    @structure_classification.destroy
    redirect_to new_structure_classification_path
  end
end
