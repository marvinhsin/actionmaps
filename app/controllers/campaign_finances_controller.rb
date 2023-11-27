# frozen_string_literal: true

class CampaignFinancesController < ApplicationController
  def index
  end

  def show
  end

  def search
    cycle = params[:cycle]
    category = params[:category]

    if cycle.present? && category.present?
      # @top_candidates = top_20_candidates(cycle, category)
    else
      flash[:alert] = 'Please select both election cycle and category.'
      # redirect here as needed
    end
  end
end
