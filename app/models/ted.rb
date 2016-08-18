class Ted < ApplicationRecord
  def status_enum
    [nil, 'contacted', 'corresponding', 'applied', 'rejected', 'accepted', 'try again next year']
  end
end
