# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)      not null
#  password_digest :string(255)      not null
#  type            :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  has_secure_password

  validates :email, format: /\A[\w\.%\+\-]+@(?:[A-Z0-9\-]+\.)+(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|jobs|museum)\z/i
  validates :email, uniqueness: true, presence: true
  validates :type, presence: true

  def self.email_regex
    email_name_regex  = '[\w\.%\+\-]+'.freeze
    domain_head_regex = '(?:[A-Z0-9\-]+\.)+'.freeze
    domain_tld_regex  = '(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|jobs|museum)'.freeze
    /\A#{email_name_regex}@#{domain_head_regex}#{domain_tld_regex}\z/i
  end

end
