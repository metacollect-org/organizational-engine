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

ActiveRecord::Schema.define(version: 20161204165810) do

  create_table "contact_contacts", force: :cascade do |t|
    t.integer "platform_id",     null: false
    t.string  "content",         null: false
    t.string  "accessible_type"
    t.integer "accessible_id"
    t.index ["accessible_type", "accessible_id"], name: "index_contact_contacts_on_accessible_type_and_accessible_id"
  end

  create_table "contact_platforms", force: :cascade do |t|
    t.string "uid",  limit: 32, null: false
    t.string "logo"
    t.index ["uid"], name: "index_contact_platforms_on_uid", unique: true
  end

  create_table "descriptive_descriptions", force: :cascade do |t|
    t.string  "definition",       limit: 80,   null: false
    t.text    "full",             limit: 1000, null: false
    t.string  "describable_type",              null: false
    t.integer "describable_id",                null: false
    t.integer "language_id",                   null: false
    t.index ["describable_type", "describable_id"], name: "index_descriptive_descriptions_describable"
  end

  create_table "geo_countries", force: :cascade do |t|
    t.string "code",       limit: 2
    t.string "zip_format"
    t.index ["code"], name: "index_geo_countries_on_code", unique: true
  end

  create_table "geo_locations", force: :cascade do |t|
    t.string  "address"
    t.string  "zip_code",       limit: 20
    t.integer "place_id"
    t.integer "country_id"
    t.float   "latitude"
    t.float   "longitude"
    t.string  "locatable_type"
    t.integer "locatable_id"
    t.index ["locatable_type", "locatable_id"], name: "index_geo_locations_on_locatable_type_and_locatable_id"
  end

  create_table "geo_places", force: :cascade do |t|
    t.string "uid"
    t.index ["uid"], name: "index_geo_places_on_uid", unique: true
  end

  create_table "multilingual_languages", force: :cascade do |t|
    t.string "code", limit: 2, null: false
    t.index ["code"], name: "index_multilingual_languages_on_code"
  end

  create_table "multilingual_translation_types", force: :cascade do |t|
    t.string  "uid",   limit: 32, null: false
    t.integer "level",            null: false
    t.index ["uid"], name: "index_multilingual_translation_types_on_uid"
  end

  create_table "multilingual_translations", force: :cascade do |t|
    t.string  "content",           null: false
    t.integer "language_id",       null: false
    t.string  "translatable_type", null: false
    t.integer "translatable_id",   null: false
    t.integer "type_id"
    t.index ["translatable_type", "translatable_id"], name: "index_multilingual_translations_translatable"
  end

  create_table "ontological_categories", force: :cascade do |t|
    t.string "uri", null: false
    t.index ["uri"], name: "index_ontological_categories_on_uri"
  end

  create_table "ontological_relationships", force: :cascade do |t|
    t.integer "subject_id",   null: false
    t.integer "predicate_id", null: false
    t.integer "object_id",    null: false
  end

  create_table "organizational_entities", force: :cascade do |t|
    t.string "name", null: false
    t.string "url",  null: false
    t.string "logo"
  end

end
