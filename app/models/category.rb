class Category < ActiveHash::Base

  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'メンズ' },
    { id: 3, name: 'レディース' },
    { id: 4, name: 'ベビー' },
    { id: 5, name: 'キッズ' },
    { id: 6, name: 'インテリア' },
    { id: 7, name: '住まい' },
    { id: 8, name: '小物' },
    { id: 9, name: '本・音楽・ゲーム' },
    { id: 10, name: 'おもちゃ・ホビー・グッズ' },
    { id: 11, name: '家電・スマホ・カメラ' },
    { id: 12, name: 'スポーツ・レジャー' },
    { id: 13, name: 'ハンドメイド' },
    { id: 14, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :category


  
end
