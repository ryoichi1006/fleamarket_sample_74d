class Address < ApplicationRecord
  belongs_to :user, optional: true

  enum prefecture:{
    "---":0,
    北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,
    沖縄県:47
  }

  #名字に漢字とひらがなを使えるように正規表現を設定
  VALID_LASTNAME_REGEX = /\A[一-龥ぁ-ん]/
  validates :family_name, presence: true, format: { with: VALID_LASTNAME_REGEX}

  #名前に漢字とひらがなを使えるように名字から正規表現を参照している
  VALID_FIRSTNAME_REGEX = VALID_LASTNAME_REGEX
  validates :given_name, presence: true, format: { with: VALID_FIRSTNAME_REGEX}

  #名字のフリガナにカタカナを使えるように正規表現を設定
  VALID_LASTNAMEKANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :family_name_kana, presence: true, format: { with: VALID_LASTNAMEKANA_REGEX}

  #名前のフリガナにカタカナを使えるように名字のフリガナから正規表現を参照している
  VALID_FIRSTNAMEKANA_REGEX = VALID_LASTNAMEKANA_REGEX
  validates :given_name_kana, presence: true, format: { with: VALID_FIRSTNAMEKANA_REGEX}

  validates :postcode,   presence: true
  validates :prefecture, presence: true
  validates :city,       presence: true
  validates :block,      presence: true
end
