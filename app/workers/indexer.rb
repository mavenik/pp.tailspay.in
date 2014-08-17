class Indexer
  include Sidekiq::Worker
  sidekiq_options queue: 'elasticsearch', retry: false

  Logger = Sidekiq.logger.level == Logger::DEBUG ? Sidekiq.logger : nil
  Client = Elasticsearch::Client.new host: 'localhost:9200', logger: Logger

  def perform(operation, record_id)
    logger.debug [operation, "ID: #{record_id}"]

    case operation.to_s
    when /index/
      record = Article.find(record_id)
      Client.index  index: 'articles', type: 'article', id: record.id, body: record.as_indexed_json
    when /delete/
      Client.delete index: 'articles', type: 'article', id: record_id
    else raise ArgumentError, "Unknown operation '#{operation}'"
    end
  end
end
