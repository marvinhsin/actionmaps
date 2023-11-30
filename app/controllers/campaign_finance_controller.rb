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
      top_20_candidates(cycle, category)
      render :search
    else
      flash[:alert] = 'Please select both election cycle and category.'
      redirect_to campaign_finance_index_path
    end
  end

  private

  def top_20_candidates(cycle, category)
    @top_20_candidates = CampaignFinance.top_20_candidates(cycle, category.downcase.gsub(' ', '-'))
    selected_category_and_api(cycle, category)
  end

  def selected_category_and_api(cycle, category)
    category_mapping = {
      'Candidate Loan'      => 'candidate_loans',
      'Contribution Total'  => 'total_contributions',
      'Debts Owed'          => 'debts_owed',
      'Disbursements Total' => 'total_disbursements',
      'End Cash'            => 'end_cash',
      'Individual Total'    => 'total_from_individuals',
      'PAC Total'           => 'total_from_pacs',
      'Receipts Total'      => 'total_receipts',
      'Refund Total'        => 'total_refunds'
    }
    @selected_category = category
    @selected_cycle = cycle
    @selected_ctg_api = category_mapping[category]
  end
end
