import FeatherOpenAPIKit
import OpenAPIKit

extension File.Resource {

    enum Responses {

        enum Download: BinaryResponse {
            static let description = "Download response"
        }

        enum Detail: JSONResponse {
            static let description = "File resource detail object"
            static let schema: Schema.Type = Schemas.Detail.self
        }

        enum List: JSONResponse {
            static let description = "File resource list object"
            static let schema: Schema.Type = Schemas.List.self
        }
    }
}
