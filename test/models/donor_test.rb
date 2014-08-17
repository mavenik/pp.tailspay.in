# == Schema Information
#
# Table name: donors
#
#  id              :integer          not null, primary key
#  email           :string(255)      not null
#  password_digest :string(255)      not null
#  type            :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#

require 'test_helper'

class DonorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
