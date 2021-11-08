class User < ApplicationRecord
    has_secure_password

    has_many :dishes, dependent: :destroy

    validates_uniqueness_of :email, :username
    validates_presence_of :name, :username, :email, :password_digest
end
