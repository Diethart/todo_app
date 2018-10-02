# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20181002120233) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "checklist_templates", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "checklist_templates_items", force: :cascade do |t|
    t.bigint "checklist_template_id"
    t.bigint "item_id"
    t.integer "position", default: 0
    t.index ["checklist_template_id"], name: "index_checklist_templates_items_on_checklist_template_id"
    t.index ["item_id"], name: "index_checklist_templates_items_on_item_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "task", limit: 100, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "checklist_templates_items", "checklist_templates"
  add_foreign_key "checklist_templates_items", "items"
end
