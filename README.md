# README

## User

|column       |type        |options                          |
|-------------|------------|---------------------------------|
|email        |string      |null: false                      |
|password     |string      |null: false                      |
|nickname     |string      |null: false                      |

## Associations

has_many :user_rooms
has_many :rooms, through: user_rooms
has_many :posts
has_many :messages

## Post

|column       |type        |options                          |
|-------------|------------|---------------------------------|
|name         |string      |null: false                      |
|content      |text        |null: false                      |
|user         |references  |null: false, foreign_key: true   |

## Associations

has_one :room
has_many :post_tags
has_many :tags, through: post_tags
belongs_to :user

## Room

|column       |type        |options                          |
|-------------|------------|---------------------------------|
|name         |string      |null: false                      |
|post         |references  |null: false, foreign_key: true   |

## Associations

has_many :user_rooms
has_many :users, through: user_rooms
belongs_to :post
has_many :messages
has_one :memo

## User_Room

|column       |type        |options                          |
|-------------|------------|---------------------------------|
|user         |references  |null: false, foreign_key: true   |
|room         |references  |null: false, foreign_key: true   |

## Associations

belongs_to :user
belongs_to :room

## Message

|column       |type        |options                          |
|-------------|------------|---------------------------------|
|content      |string      |null: false                      |
|user         |references  |null: false, foreign_key: true   |
|room         |references  |null: false, foreign_key: true   |

## Associations

belongs_to :user
belongs_to :room

## Memo

|column       |type        |options                          |
|-------------|------------|---------------------------------|
|content      |string      |                                 |
|room         |references  |null: false, foreign_key: true   |


## Associations

belongs_to :room



