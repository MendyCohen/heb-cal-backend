class User < ApplicationRecord
  has_many :events
  has_many :global_events
end
