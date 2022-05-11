class Warehouse < ApplicationRecord
  # Associations
  has_many :inventory_items, inverse_of: :warehouse, dependent: :destroy

  # Validations
  validates_presence_of :address, :city, :zipcode

  validates :contact_number, :presence => true,
                    :numericality => true,
                    :length => { :minimum => 10, :maximum => 15 }

  validates :zipcode, length: { is: 6 }


  def info
    [address, city, zipcode].join(",")
  end
end
