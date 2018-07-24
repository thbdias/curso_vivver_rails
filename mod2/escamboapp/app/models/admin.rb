class Admin < ApplicationRecord
  enum role: [:full_access, :restricted_access]

  #### ESCOPO
  scope :with_full_access, -> { where(role: :full_access)} # '->' lambda
  scope :with_restricted_access, -> { where(role: :restricted_access)} # '->' lambda
  
  # ou
  
  #def self.with_full_access
  #  where(role: :full_access )
  #end
  ###########


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
