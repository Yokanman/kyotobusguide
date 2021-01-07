# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| --------------------| ------ | ----------- |
| nickname            | string | null: false, unique: true|
| email               | string | null: false, unique: true|
| encrypted_password  | string | null: false |
| first_name          | string | null: false |
| family_name         | string | null: false |

### Association

- has_many :articles

## articles テーブル

| Column        | Type       | Options           |
| --------------| -----------| -----------       |
| title         | string     | null: false       |
| date          | date       | null: false       |
| destination   | references | null: false, foreign_key: true   |
| user          | references | null: false, foreign_key: true   |
| details       | text       | null: false                    |

### Association

- belongs_to :user
- has many :destinations_articles

## Destinations_Articles テーブル

| Column             | Type       | Options     |
| -------------------| -----------| ----------- |
| destination        | references | null: false, foreign_key: true |
| article            | references | null: false, foreign_key: true |

### Association

- belongs to :article
- belongs_to :destination


## destinations テーブル

| Column          | Type       | Options     |
| ----------------| -----------| ----------- |
| name            | string     | null: false |
| line            | references | null: false, foreign_key: true |


### Association

- belongs_to :line
- has_many :destinations_articles


## Lines テーブル

| Column        | Type       | Options           |
| --------------| -----------| -----------       |
| name          | string     | null: false       |
| bus_stop      | references | null: false, foreign_key: true   |
| destination   | references | null: false, foreign_key: true   |

### Association

- has_many :bus_stop
- has_many :destinations


## Bus_stops テーブル

| Column        | Type       | Options           |
| --------------| -----------| -----------       |
| number        | string     | null: false       |
| name          | string     | null: false       |
| line          | references | null: false, foreign_key: true   |

### Association

- belongs_to :line