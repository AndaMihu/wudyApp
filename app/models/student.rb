class Student < ApplicationRecord
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  belongs_to :programme
  
  has_one :contract
  has_one :company, through: :contract


  has_many :event 

 # accepts_nested_attributes_for :programme
  accepts_nested_attributes_for :contract
  accepts_nested_attributes_for :event

  belongs_to :teacher


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


end
