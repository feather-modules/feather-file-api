import FeatherOpenAPIKit
import OpenAPIKit

extension File.Chunk {

    enum Schemas {

        enum Id: IDSchema {
            static let description = "Chunk identifier"
        }

        enum Number: IntSchema {
            static let minimum = 0
            static let maximum = 1000
            static let description = "The number of the chunk"
        }
        
        enum Detail: ObjectSchema {
            static let properties: [ObjectSchemaProperty] = [
                .init("id", Id.self),
                .init("uploadId", File.Upload.Schemas.Id.self),
                .init("chunkNumber", Number.self),
            ]
            static let description = "Chunk detail"
        }

        enum List: ArraySchema {
            static let items: Schema.Type = Detail.self
            static let description = "Chunk list"
        }
    }
}
