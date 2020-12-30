import Vapor
import Redis

public func routes(_ app: Application) throws {
    app.get("redis1") { req in
        req.application.redis1.get("name").map { respValue in
            return respValue.string ?? "name not found in Redis 1"
        }
    }

    app.get("redis2") { req in
        req.application.redis2.get("name").map { respValue in
            return respValue.string ?? "name not found in Redis 2"
        }
    }
}
