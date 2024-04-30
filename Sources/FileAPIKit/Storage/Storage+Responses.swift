import OpenAPIKit
import FeatherOpenAPIKit

extension File.Storage {

    enum Responses {

        //TODO: binary response definition in openapi-kit?
        enum Download: Response {
            static let description = "Download response"
            
            static func openAPIResponse() -> OpenAPIKit.OpenAPI.Response {
                .init(
                    description: description,
                    headers: openAPIHeaderMap(),
                    content: [
                        .any: .init(
                            schema: .string(
                                contentEncoding: .binary
                            )
                        )
                    ]
                )
                    
                //TODO: openAPIHeaderMap override in protocol? openAPIContentMap override in protocol?
//                .init(
//                    description: description,
//                    headers: openAPIHeaderMap(),
//                    content: openAPIContentMap()
//                )
            }
        }
        
        enum SimpleDetail: JSONResponse {
            static let description = "Simple file detail object"
            static let schema: Schema.Type = Schemas.SimpleDetail.self
        }

        enum ChunkedDetail: JSONResponse {
            static let description = "Chunked file detail object"
            static let schema: Schema.Type = Schemas.ChunkedDetail.self
        }

        enum ChunkedChunk: JSONResponse {
            static let description = "Chunked chunk details object"
            static let schema: Schema.Type = Schemas.ChunkedChunk.self
        }
    }
}
