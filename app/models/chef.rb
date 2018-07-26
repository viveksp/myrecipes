class Chef < ApplicationRecord
    
    before_save {self.email = email.downcase}
    
    validates :chefname, presence: true
    
    
    VALID_EMIAL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,
                     format: {with: VALID_EMIAL_REGEX},
                     uniqueness: {case_sensitive: false}
    
    has_many :recipes, dependent: :destroy
    
    has_secure_password 
    
    validates :password, presence: true, length: {minimum: 2}, allow_nil: true
    
    has_many :comments, dependent: :destroy
end
