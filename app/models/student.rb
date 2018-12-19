class Student < ApplicationRecord
  belongs_to :programme
  belongs_to :company
  
  has_one :contract

  has_many :event 

  accepts_nested_attributes_for :programme
  accepts_nested_attributes_for :contract
  accepts_nested_attributes_for :event


  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" } 
  do_not_validate_attachment_file_type :avatar


  belongs_to :teacher


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


end
