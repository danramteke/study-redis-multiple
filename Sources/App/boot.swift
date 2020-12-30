import Vapor
import Redis

public func boot(_ app: Application) throws {
    let future1 = app.redis1.set("name", to: "Redis 1")
    let future2 = app.redis2.set("name", to: "Redis 2")

    try _ = future1.and(future2).wait()
}
