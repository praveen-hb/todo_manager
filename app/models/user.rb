class User < ActiveRecord::Base
  def to_pleasant_string
    "#{id}. name:#{name} email:#{email}"
  end
end
