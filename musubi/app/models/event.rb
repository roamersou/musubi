# == Schema Information
#
# Table name: events
#
#  id         :integer  
#  title      :string(255)        not null, primary key
#  event_time :date
#  place      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null

#

class Event < ApplicationRecord
end
