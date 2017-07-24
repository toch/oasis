class BlobRepository < Hanami::Repository
  def find_by(criteria)
    blobs.where(criteria.to_h)
  end
end
