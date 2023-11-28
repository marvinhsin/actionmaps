# frozen_string_literal: true

class CampaignFinanceController < ApplicationController
  def index; end

  def search
    cycle_option = %w[2010 2012 2014 2016 2018 2020]
    category_option = ['Candidate Loan', 'Contribution Total', 'Debts Owed', 'Disbursements Total', 'End Cash',
                       'Individual Total', 'PAC Total', 'Receipts Total', 'Refund Total']

    cycle = params[:cycle]
    category = params[:category]

    if cycle_option.include?(cycle) && category_option.include?(category)
      @top_20_candidates = CampaignFinance.top_20_candidates(cycle, category.downcase.gsub(' ', '-'))
    else
      flash[:alert] = 'Please select both election cycle and category.'
      redirect_to campaign_finance_path
    end
  end
end
