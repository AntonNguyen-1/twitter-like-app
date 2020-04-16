module UsersHelper

  def self.user_following?(user, following_user_id)
    filtered_following = user['following'].select { |following|  following['user_id'] == following_user_id }
    filtered_following.any?
  end

end
