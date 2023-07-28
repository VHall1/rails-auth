class UserGroup < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :user_id, presence: true
  validates :group_id, presence: true, uniqueness: { message: 'has already been assigned to this user' }
end
