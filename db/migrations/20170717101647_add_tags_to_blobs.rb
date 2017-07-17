Hanami::Model.migration do
  change do
    add_column :blobs, :tags, "jsonb"
  end
end
