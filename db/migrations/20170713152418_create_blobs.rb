Hanami::Model.migration do
  change do
    create_table :blobs do
      primary_key :id

      column :format, String, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
