class Tool < ActiveRecord::Base
  has_many    :user_tools
  has_many    :users, through: :user_tools
  validates   :name, presence: :true

  def in_stock?(quantity)
    quantity <= self.qty
  end
end
