class User < ApplicationRecord
validates :name, presence: true, length: {maximum: 15}

VALID_EMAIL_REGEX = /\A[\w+-.]+@[a-z\d-.]+.[a-z]+.[A-Z]+\z/i
validates :email, presence: true, uniqueness: true, format: {with: VALID_EMAIL_REGEX}

VALID_PASSWORD_REGEX = /\A(?=.?[a-z])(?=.?[A-Z])(?=.*?\d)[a-zA-Z\d]{8,32}+\z/
validates :password_digest, presence: true, uniqueness: true, format: {with: VALID_PASSWORD_REGEX}

has_secure_password
end