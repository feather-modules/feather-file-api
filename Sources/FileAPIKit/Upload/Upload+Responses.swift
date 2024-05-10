import FeatherOpenAPIKit
import OpenAPIKit

extension File.Upload {

    enum Responses {

        enum SimpleDetail: JSONResponse {
            static let description = "Simple upload detail object"
            static let schema: Schema.Type = Schemas.SimpleDetail.self
        }

        enum ChunkedDetail: JSONResponse {
            static let description = "Chunked upload detail object"
            static let schema: Schema.Type = Schemas.ChunkedDetail.self
        }

        enum FinishChunkedDetail: JSONResponse {
            static let description = "Chunked finish upload detail object"
            static let schema: Schema.Type = Schemas.FinishChunkedDetail.self
        }

        enum List: JSONResponse {
            static let description = "Upload list object"
            static let schema: Schema.Type = Schemas.List.self
        }
    }
}
