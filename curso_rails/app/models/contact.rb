class Contact < ApplicationRecord
  belongs_to :kind #singular
  has_one :address #singular
  has_many :phones #plural

  #atributos aninhados
  #formulario contato pode receber atributos de endereço
  accepts_nested_attributes_for :address 
  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true  #plural pq é has_manny
end
