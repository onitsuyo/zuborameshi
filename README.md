
## users

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |

### Association

- has_many :recipes
- has_many :comments
- has_many :favorites

## recipes

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| recipe_title | string     | null: false                    |
| caption      | string     | null: false                    |
| cooking_time | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- has_many :recipe_ingredients
- has_many :ingredients, through: :recipe_ingredients
- has_many :recipe_seasonings
- has_many :seasonings, through: :recipe_seasonings
- has_many :recipe_procedures
- has_many :procedures, through: :recipe_procedures
- has_many :comments
- has_many :favorites
- belongs_to :user

## ingredients

| Column            | Type       | Options                       |
| ----------------- | ---------- | ----------------------------- |
| ingredient_name   | text       |                               |

### Association

- has_many :recipe_ingredients
- has_many :recipes, through: :recipe_ingredients

## recipe_ingredients

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| recipe     | references | null: false, foreign_key: true |
| ingredient | references | null: false, foreign_key: true |

### Association

- belongs_to :recipe
- belongs_to :ingredient

## seasonings

| Column           | Type       | Options                       |
| ---------------- | ---------- | ----------------------------- |
| seasoning_name   | text       |                               |

### Association

- has_many :recipe_seasonings
- has_many :recipes, through: :recipe_seasonings

## recipe_seasonings

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| recipe    | references | null: false, foreign_key: true |
| seasoning | references | null: false, foreign_key: true |

### Association

- belongs_to :recipe
- belongs_to :seasoning

## procedures

| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| step   | text       |                               |

### Association

- has_many :recipe_procedures
- has_many :recipes, through: :recipe_procedures

## recipe_procedures

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| recipe    | references | null: false, foreign_key: true |
| procedure | references | null: false, foreign_key: true |

### Association

- belongs_to :recipe
- belongs_to :procedure

## comments

| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| recipe | references | null:false, foreign_key: true |
| user   | references | null:false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :recipe

## favorites

| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| recipe | references | null:false, foreign_key: true |
| user   | references | null:false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :recipe
