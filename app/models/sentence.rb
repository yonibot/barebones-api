class Sentence < ActiveRecord::Base

  belongs_to :story

  validates_uniqueness_of :position, scope: :story_id

end
