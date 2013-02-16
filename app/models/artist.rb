class Artist < ActiveRecord::Base
  attr_accessible :birth_date, :label_id, :name, :occupation
end
