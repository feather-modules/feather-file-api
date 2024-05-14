import FeatherOpenAPIKit
import OpenAPIKit

extension File.Chunk {

    public enum Responses {

        enum Detail: JSONResponse {
            static let description = "Chunk detail object"
            static let schema: Schema.Type = Schemas.Detail.self
        }

        enum List: JSONResponse {
            static let description = "Chunk list object"
            static let schema: Schema.Type = Schemas.List.self
        }
    }
}
