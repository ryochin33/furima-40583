class Category < ActiveHash::Base
self.data = [
  { id: 0, name: '---' },
  { id: 1, name: 'メンズ' },
  { id: 2, name: 'レディース' },
  { id: 3, name: 'ベビー・キッズ' },
  { id: 4, name: 'インテリア・住まい・小物' },
  { id: 5, name: '本・音楽・ゲーム' },
  { id: 6, name: 'おもちゃ・ホビー・グッズ' },
  { id: 7, name: '家電・スマホ・カメラ' },
  { id: 8, name: 'スポーツ・レジャー' },
  { id: 9, name: 'ハンドメイド' },
  { id: 10, name: 'その他' }
  
]

  include ActiveHash::Associations
  has_many :items

end