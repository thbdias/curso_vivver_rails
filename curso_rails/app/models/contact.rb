class Contact < ApplicationRecord
  belongs_to :kind
  has_one :address

  #atributos aninhados
  #formulario contato pode receber atributos de endereço
  accepts_nested_attributes_for :address 
end
