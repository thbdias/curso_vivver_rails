class Contact < ApplicationRecord
  belongs_to :kind #singular
  has_one :address, dependent: :delete #singular
  has_many :phones, dependent: :delete_all #plural

  #atributos aninhados
  #formulario contato pode receber atributos de endereço
  accepts_nested_attributes_for :address 
  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true  #plural pq é has_manny

  validates :name, presence: true, length: { minimum: 3}
  validates :email, presence: true
end
