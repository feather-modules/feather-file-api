import FeatherOpenAPIKit
import OpenAPIKit

extension File.Resource {

    enum Schemas {

        enum Id: IDSchema {
            static let description = "File resource identifier"
        }

        enum SizeInBytes: Int64Schema {
            static let description = "File resource size"
        }
        
        enum DownloadRequestHeader: TextSchema {
            static let description = "Download request header"
            static let examples = [
                "bytes=0-1023"
            ]
        }

        enum Detail: ObjectSchema {
            static let properties: [ObjectSchemaProperty] = [
                .init("resourceId", Id.self),
                .init("sizeInBytes", SizeInBytes.self)
            ]
            static let description = "File resource detail"
        }

        enum List: ArraySchema {
            static let items: Schema.Type = Detail.self
            static let description = "File resource list"
        }
    }
}
