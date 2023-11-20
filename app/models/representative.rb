# frozen_string_literal: true

class Representative < ApplicationRecord
  has_many :news_items, dependent: :delete_all

  def self.civic_api_to_representative_params(rep_info)
    rep_info.officials.map.with_index do |official, index|
      office_info = get_office_info(rep_info, index)
      create_or_update_representative(official, office_info)
    end
  end

  private_class_method def self.get_office_info(rep_info, index)
    office_info = { ocdid: '', title: '' }
    rep_info.offices.each do |office|
      next unless office.official_indices.include? index

      office_info[:title] = office.name
      office_info[:ocdid] = office.division_id
      break
    end
    office_info
  end

  private_class_method def self.create_or_update_representative(official, office_info)
    rep_attributes = representative_attributes(official, office_info)
    Representative.find_or_create_by(rep_attributes)
  end

  private_class_method def self.representative_attributes(official, office_info)
    {
      name:      official.name,
      ocdid:     office_info[:ocdid],
      title:     office_info[:title],
      street:    official_address(official, :line1),
      city:      official_address(official, :city),
      state:     official_address(official, :state),
      zip:       official_address(official, :zip),
      party:     official.party || '',
      photo_url: official.photo_url || ''
    }
  end

  private_class_method def self.official_address(official, attribute)
    if official.address
      official.address[0].send(attribute)
    else
      ''
    end
  end
end
