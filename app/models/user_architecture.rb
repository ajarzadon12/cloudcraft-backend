class UserArchitecture
  include Mongoid::Document

  field :name, type: String
  field :architecture_json, type: Hash
	
  belongs_to :user
end
