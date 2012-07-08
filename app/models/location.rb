class Location < ActiveRecord::Base
  attr_accessible :abbreviation, :name, :description

  has_many :nodes

  def title
    "#{name} (#{abbreviation})"
  end
end
