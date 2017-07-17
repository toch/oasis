class BlobRepository < Hanami::Repository
  def by_format(format)
    blobs.where(format: format)
  end

  def by_tags(tags)
    blobs.where(tags: tags)
  end
end
