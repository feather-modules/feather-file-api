import FeatherAPIKit
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
                .init("sizeInBytes", SizeInBytes.self),
            ]
            static let description = "File resource detail"
        }

        enum List: ObjectSchema {

            enum Item: ObjectSchema {
                static let description = "File resource list item"
                static let properties: [ObjectSchemaProperty] = Detail
                    .properties
            }

            enum Items: ArraySchema {
                static let description = "File resource list items"
                static let items: Schema.Type = Item.self
            }

            enum Sort: EnumSchema {
                static let description = "The sort key for the list"
                static let allowedValues = ["resourceId", "sizeInBytes"]
                static let defaultValue: String? = "sizeInBytes"
            }

            static let description = "File resource list"
            static let properties: [ObjectSchemaProperty] =
                [
                    .init("items", Items.self),
                    .init("sort", Sort.self, required: false),
                ] + Feather.Core.Schemas.List.properties
        }
    }
}
