ActiveRecord::Schema.define(version: 20160418212458) do
  enable_extension "plpgsql"
  enable_extension "tablefunc"

  create_table "locations", force: :cascade do |t|
    t.integer "x_coordinate"
    t.integer "y_coordinate"
  end
end
