class Story < ActiveRecord::Base

  default_scope { order(updated_at: :desc) }

  has_many :sentences, -> {order(position: :asc)}

end
