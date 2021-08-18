# テーブル設計

## usersテーブル

| Column                        | Type      | Options             |
| -------------------------------- |  ---------- |  ----------------------|
| nickname                     |  string    | null:  false         |
| encrypted_password    |  string    | null:  false         |
| email                            |  string    | null:  false         |
| first_name                    |  string    | null:  false         |
| family_name                 |  string    | null:  false         |
| first_name_kana           |  string    |  null: false         |
| family_name_kana        |  string    |  null: false         |
| birth_date                    |  string    |  null: false         |

Association

・has_many :items
・has_many :purchases

## itemsテーブル

Column                        | Type            | Options                             |
| ------------------------------ |  -----------------|---------------------------------------|
| user                           |  references  | null: false, foreign_key: true|
| item_name                 |  string          | null: false                           |
| explanation                |  text             | null: false                           |
| price                          |  integer        | null: false                           |
| item_condition            |  integer       | null: false                            |
| delivery_fee                |  integer        | null: false                           |
| delivery_zone              |  integer       | null: false                            |
| category                     |  integer       | null: false                           |

Association

・belongs_to :user
・has_one :purchase

## purchases

Column                        | Type            | Options                                     |
| -------------------------------|  -----------------|  --------------------------------------------|
| user                           |  references  | null: false, foreign_key: true        |
| item                           |  references  | null: false, foreign_key: true        |

Association

・belongs_to :user
・belongs_to :item
・has_one :residence

## residences

Column                          | Type          | Options                                       |
| -------------------------------- | ----------------| -----------------------------------------------|
| purchase                      | references | null: false, foreign_key: true          |
| post_number                | integer       | null: false                                     |
| prefectures                  |  string        | null: false                                     |
| municipalities               |  string         | null: false                                     |
| address                        |  string        | null: false                                     |
| Building_name              |  string        | null: false                                      |
| phone_number              |  string        | null: false                                     |

Association

・belongs_to :purchase