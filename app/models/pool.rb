# == Schema Information
#
# Table name: pools
#
#  id         :integer         not null, primary key
#  event_id   :integer         not null
#  title      :string(255)     not null
#  user_id    :integer         not null
#  welcome    :text
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  fix        :boolean         default(FALSE)
#

class Pool < ActiveRecord::Base
  
  belongs_to :user   # is owner/admin/manager  
  
  has_many :pool_users, :class_name => 'PoolUser'
  has_many :players, :through => :pool_users, :source => :user  

  belongs_to :event
  
  def full_title
    "#{title} #{event.title}"
  end
  
  def fix?
    fix == true
  end
  
  def flex?
    fix != true
  end
  
end
