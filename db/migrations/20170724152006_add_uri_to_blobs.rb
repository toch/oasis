Hanami::Model.migration do
  change do
    add_column :blobs, :uri, String
  end
end
