class ListMember < ApplicationRecord

  belongs_to :person, :optional => false
  belongs_to :list, :optional => false

end
