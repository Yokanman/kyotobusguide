class BusStop < ActiveHash::Base
  self.data = [
    { id: 1, name: 'D1, D2' },
    { id: 2, name: 'B2, B3' },
    { id: 3, name: 'C4' },
    { id: 4, name: 'A1, A2, D1' },
    { id: 5, name: 'A3, B3' },
  ]

  include ActiveHash::Associations
  belongs_to :destination
  end