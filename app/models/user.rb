class User < ApplicationRecord
  def to_pleasant_string
    "#{id}. name:#{first_name} email:#{email}"
  end
end
