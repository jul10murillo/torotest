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

ActiveRecord::Schema.define(version: 20180120004311) do

  create_table "active_admin_comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "strongbolt_capabilities", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "description"
    t.string "model"
    t.string "action"
    t.string "attr"
    t.boolean "require_ownership", default: false, null: false
    t.boolean "require_tenant_access", default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "strongbolt_capabilities_roles", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "role_id"
    t.integer "capability_id"
    t.index ["capability_id"], name: "index_strongbolt_capabilities_roles_on_capability_id"
    t.index ["role_id"], name: "index_strongbolt_capabilities_roles_on_role_id"
  end

  create_table "strongbolt_roles", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.string "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["lft"], name: "index_strongbolt_roles_on_lft"
    t.index ["parent_id"], name: "index_strongbolt_roles_on_parent_id"
    t.index ["rgt"], name: "index_strongbolt_roles_on_rgt"
  end

  create_table "strongbolt_roles_user_groups", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_group_id"
    t.integer "role_id"
    t.index ["role_id"], name: "index_strongbolt_roles_user_groups_on_role_id"
    t.index ["user_group_id"], name: "index_strongbolt_roles_user_groups_on_user_group_id"
  end

  create_table "strongbolt_user_groups", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "strongbolt_user_groups_users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_group_id"
    t.integer "user_id"
    t.index ["user_group_id", "user_id"], name: "index_strongbolt_user_groups_users_unique", unique: true
    t.index ["user_group_id"], name: "index_strongbolt_user_groups_users_on_user_group_id"
    t.index ["user_id"], name: "index_strongbolt_user_groups_users_on_user_id"
  end

  create_table "strongbolt_users_tenants", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.integer "tenant_id"
    t.string "type"
    t.index ["tenant_id", "type"], name: "index_strongbolt_users_tenants_on_tenant_id_and_type"
    t.index ["tenant_id"], name: "index_strongbolt_users_tenants_on_tenant_id"
    t.index ["type"], name: "index_strongbolt_users_tenants_on_type"
    t.index ["user_id"], name: "index_strongbolt_users_tenants_on_user_id"
  end

end
