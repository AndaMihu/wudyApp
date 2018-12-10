class Teacher < ApplicationRecord

  has_many :student
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" } 
  do_not_validate_attachment_file_type :avatar


  accepts_nested_attributes_for :student
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
      end