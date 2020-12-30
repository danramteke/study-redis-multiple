import Vapor
import Redis

extension Application {
  var redis1: Redis {
    Redis(application: self)
  }

var redis2: Redis {
    Redis(application: self)
  }
}

public func configure(_ app: Application) throws {
  app.logger.log(level: .notice, "Redis 1 url: \(Environment.get("REDIS_1_URL")!)")
  app.logger.log(level: .notice, "Redis 2 url: \(Environment.get("REDIS_2_URL")!)")
  app.redis1.configuration = try RedisConfiguration(url: Environment.get("REDIS_1_URL")!)
  app.redis2.configuration = try RedisConfiguration(url: Environment.get("REDIS_2_URL")!)
  try routes(app)
}
