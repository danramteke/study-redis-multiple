import Vapor
import Redis

extension RedisID {
    static var redis1: RedisID {
        RedisID(string: "redis1")
    }

    static var redis2: RedisID {
        RedisID(string: "redis2")
    }
}

public func configure(_ app: Application) throws {
    app.logger.log(level: .notice, "Redis 1 url: \(Environment.get("REDIS_1_URL")!)")
    app.logger.log(level: .notice, "Redis 2 url: \(Environment.get("REDIS_2_URL")!)")
    app.redises.use(try RedisConfiguration(url: Environment.get("REDIS_1_URL")!), as: .redis1)
    app.redises.use(try RedisConfiguration(url: Environment.get("REDIS_2_URL")!), as: .redis2)
    try routes(app)
}
