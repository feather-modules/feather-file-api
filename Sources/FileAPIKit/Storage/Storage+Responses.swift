import FeatherOpenAPIKit
import OpenAPIKit

extension File.Storage {

    enum Responses {

        enum Download: BinaryResponse {
            static let description = "Download response"
        }

        enum SimpleDetail: JSONResponse {
            static let description = "Simple file detail object"
            static let schema: Schema.Type = Schemas.SimpleDetail.self
        }

        enum UploadChunkedDetail: JSONResponse {
            static let description = "Chunked file detail object"
            static let schema: Schema.Type = Schemas.UploadChunkedDetail.self
        }

        enum FinishChunkedDetail: JSONResponse {
            static let description = "Chunked file detail object"
            static let schema: Schema.Type = Schemas.FinishChunkedDetail.self
        }

        enum ChunkDetail: JSONResponse {
            static let description = "Chunked chunk detail object"
            static let schema: Schema.Type = Schemas.ChunkDetail.self
        }

        enum UploadList: JSONResponse {
            static let description = "Upload list object"
            static let schema: Schema.Type = Schemas.UploadList.self
        }

        enum ChunkList: JSONResponse {
            static let description = "Chunk list object"
            static let schema: Schema.Type = Schemas.ChunkList.self
        }
    }
}
