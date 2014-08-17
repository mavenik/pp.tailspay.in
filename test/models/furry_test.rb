# == Schema Information
#
# Table name: furries
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  location_id :integer
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class FurryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
