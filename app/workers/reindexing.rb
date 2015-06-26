class Reindexing
  @queue = :reindex_queue

  def self.perform
    `rake ts:index`
  end

end