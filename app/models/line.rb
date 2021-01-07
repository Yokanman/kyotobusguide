class Line < ActiveHash::Base
  self.data = [
    { id: 1, name: '86, 100, 106, 110, 206' },
    { id: 2, name: '101, 205' },
    { id: 3, name: '南5, 105' },
    { id: 4, name: '5, 17, 100' },
    { id: 5, name: '205, 206' },
    { id: 6, name: 'IT' },
    { id: 7, name: 'エンタメ' },
    { id: 8, name: 'スポーツ' },
    { id: 9, name: 'グルメ' },
    { id: 10, name: 'その他' }
  ]

  include ActiveHash::Associations
  belongs_to :destination
  end