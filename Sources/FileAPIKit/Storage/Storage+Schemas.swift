import OpenAPIKit
import FeatherOpenAPIKit

extension File.Storage {

    enum Schemas {
        
        enum Id: IDSchema {
            static let description = "File unique identifier"
        }

        enum DownloadHeader: TextSchema {
            static let description = "Download request header"
            static let examples = [
                "bytes=0-1023"
            ]
        }
        
        enum SimpleDetail: ObjectSchema {
            static let properties: [ObjectSchemaProperty] = [
                .init("id", Id.self)
            ]
            static let description = "Simple detail"
        }
        
        enum ChunkedDetail: ObjectSchema {
            static let properties: [ObjectSchemaProperty] = [
                
            ] + SimpleDetail.properties
            static let description = "Chunked detail"
        }

        enum ChunkedChunk: ObjectSchema {
            static let properties: [ObjectSchemaProperty] = [
                .init("id", Id.self),
                .init("number", ChunkNumber.self),
            ]
            static let description = "A Chunk of Chunked File"
        }

        enum ChunkedFinish: ArraySchema {
            static let items: Schema.Type = ChunkedDetail.self
            static let description = "Chunked finish"
        }

        enum ChunkNumber: IntSchema {
            static let minimum = 0
            static let maximum = 1000   //TODO: enough?
            static let description = "The number of the chunk"
        }
    }
}
