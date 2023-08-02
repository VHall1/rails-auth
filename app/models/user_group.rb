class UserGroup < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :group_id, uniqueness: { message: 'has already been assigned to this user' }
end
