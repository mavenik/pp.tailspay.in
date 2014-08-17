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

class Furry < ActiveRecord::Base
  include Elasticsearch::Model

  after_save    { Indexer.perform_async(:index, self.class.name  self.id) }
  after_destroy { Indexer.perform_async(:delete, self.class.name, self.id) }
end
