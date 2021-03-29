# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_29_101940) do

  create_table "games", force: :cascade do |t|
    t.integer "league_id", null: false
    t.datetime "date_and_time"
    t.integer "local_team_id"
    t.integer "local_score"
    t.integer "away_team_id"
    t.integer "away_score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status"
    t.index ["league_id"], name: "index_games_on_league_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.string "name"
    t.string "sport"
    t.integer "manager_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["manager_id"], name: "index_leagues_on_manager_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "photo"
  end

  create_table "team_players", force: :cascade do |t|
    t.integer "team_id"
    t.integer "player_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_team_players_on_player_id"
    t.index ["team_id"], name: "index_team_players_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.integer "league_id", null: false
    t.integer "coordinator_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coordinator_id"], name: "index_teams_on_coordinator_id"
    t.index ["league_id"], name: "index_teams_on_league_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name"
    t.integer "league_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["league_id"], name: "index_tournaments_on_league_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "player_id"
    t.index ["player_id"], name: "index_users_on_player_id"
  end

  add_foreign_key "games", "leagues"
  add_foreign_key "leagues", "users", column: "manager_id"
  add_foreign_key "teams", "leagues"
  add_foreign_key "teams", "users", column: "coordinator_id"
  add_foreign_key "tournaments", "leagues"
end
