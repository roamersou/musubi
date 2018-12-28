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

ActiveRecord::Schema.define(version: 20181227142437) do

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "content"
    t.bigint "user_id"
    t.bigint "give_me_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["give_me_id"], name: "index_comments_on_give_me_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url"
  end

  create_table "give_mes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "title"
    t.string "picture"
  end

  create_table "gy_comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "content"
    t.bigint "user_id"
    t.bigint "payforward_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payforward_id"], name: "index_gy_comments_on_payforward_id"
    t.index ["user_id"], name: "index_gy_comments_on_user_id"
  end

  create_table "payforwards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "content"
    t.string "date"
    t.string "place"
    t.string "picture"
    t.index ["user_id", "created_at"], name: "index_payforwards_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_payforwards_on_user_id"
  end

  create_table "private_conversations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "recipient_id"
    t.integer "sender_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_id", "sender_id"], name: "index_private_conversations_on_recipient_id_and_sender_id", unique: true
    t.index ["recipient_id"], name: "index_private_conversations_on_recipient_id"
    t.index ["sender_id"], name: "index_private_conversations_on_sender_id"
  end

  create_table "private_messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "content"
    t.bigint "user_id"
    t.string "conversation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_private_messages_on_conversation_id"
    t.index ["user_id"], name: "index_private_messages_on_user_id"
  end

  create_table "thanksletters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "receiver_id"
    t.index ["user_id", "created_at"], name: "index_thanksletters_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_thanksletters_on_user_id"
  end

  create_table "tl_comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "content"
    t.bigint "user_id"
    t.bigint "thanksletter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["thanksletter_id"], name: "index_tl_comments_on_thanksletter_id"
    t.index ["user_id"], name: "index_tl_comments_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "self_intro"
    t.string "tw_account"
    t.string "fb_account"
    t.string "insta_account"
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "picture"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "comments", "give_mes"
  add_foreign_key "comments", "users"
  add_foreign_key "gy_comments", "payforwards"
  add_foreign_key "gy_comments", "users"
  add_foreign_key "payforwards", "users"
  add_foreign_key "private_messages", "users"
  add_foreign_key "thanksletters", "users"
  add_foreign_key "tl_comments", "thanksletters"
end
