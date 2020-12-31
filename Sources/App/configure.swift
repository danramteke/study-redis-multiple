import Vapor
import Redis

extension RedisID {
    static let redis1: RedisID = .init(string: "redis1")
    static let redis2: RedisID = .init(string: "redis2")
}

public func configure(_ app: Application) throws {
    app.logger.log(level: .notice, "Redis 1 url: \(Environment.get("REDIS_1_URL")!)")
    app.logger.log(level: .notice, "Redis 2 url: \(Environment.get("REDIS_2_URL")!)")
    app.redis(.redis1).configuration = try RedisConfiguration(url: Environment.get("REDIS_1_URL")!)
    app.redis(.redis2).configuration = try RedisConfiguration(url: Environment.get("REDIS_2_URL")!)
    try routes(app)
}
