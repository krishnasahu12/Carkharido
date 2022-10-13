class User < ApplicationRecord
  after_create :set_profile

  has_many :cars
  has_one :profile, :dependent => :destroy
  validates :email, presence: true
  validates :username, presence: true
  validates :mobile, presence: true
  has_many :likes, as: :likeable ,dependent: :destroy

  attr_accessor :login

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:login]

  def login
    @login || self.username || self.mobile || self.email
   end

  def email_required?
    false
  end

  def set_profile
    self.create_profile
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(mobile) = :value OR lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:email) || conditions.has_key?(:mobile) || conditions.has_key?(:username)
      where(conditions.to_h).first
    end
  end
end

