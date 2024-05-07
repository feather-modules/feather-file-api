import FeatherOpenAPIKit
import OpenAPIKit

extension File.Upload {

    enum Schemas {

        enum Id: IDSchema {
            static let description = "Upload identifier"
        }

        enum SimpleDetail: ObjectSchema {
            static let properties: [ObjectSchemaProperty] = [
                .init("resourceId", File.Resource.Schemas.Id.self)
            ]
            static let description = "Simple detail"
        }

        enum ChunkedDetail: ObjectSchema {
            static let properties: [ObjectSchemaProperty] = [
                .init("uploadId", Id.self)
            ]
            static let description = "Chunked detail"
        }
        
        enum FinishChunkedDetail: ObjectSchema {
            static let properties: [ObjectSchemaProperty] = [
                .init("resourceId", File.Resource.Schemas.Id.self)
            ]
            static let description = "Chunked finish detail"
        }

        enum List: ArraySchema {
            static let items: Schema.Type = ChunkedDetail.self
            static let description = "Upload list"
        }
    }
}
