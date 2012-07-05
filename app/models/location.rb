class Location < ActiveRecord::Base
  attr_accessible :abbreviation, :name, :description

  def title
    "#{name} (#{abbreviation})"
  end
end
