class AlterSequenceForFosterDonor < ActiveRecord::Migration
  @@inherited_tables = [:fosters, :donors]
  @@parent_table = :users
  @@column = :id

  def up
    @@inherited_tables.each do |inherited_table|
      execute "alter table #{inherited_table} alter column #{@@column} set default nextval('#{@@parent_table}_#{@@column}_seq')"
    end
  end

  def down
    @@inherited_tables.each do |inherited_table|
      execute "alter table #{inherited_table} alter column #{@@column} set default nextval('#{inherited_table}_#{@@column}_seq')"
    end
  end

end
