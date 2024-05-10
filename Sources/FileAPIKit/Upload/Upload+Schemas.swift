import FeatherAPIKit
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

        enum StorageId: TextSchema {
            static let description = "Storage subsystem id"
            static var examples: [String] = ["Any storage subsystem id format"]
        }

        enum ChunkedDetail: ObjectSchema {
            static let properties: [ObjectSchemaProperty] = [
                .init("uploadId", Id.self),
                .init("storageId", StorageId.self),
            ]
            static let description = "Chunked detail"
        }

        enum FinishChunkedDetail: ObjectSchema {
            static let properties: [ObjectSchemaProperty] = [
                .init("resourceId", File.Resource.Schemas.Id.self)
            ]
            static let description = "Chunked finish detail"
        }

        enum List: ObjectSchema {

            enum Item: ObjectSchema {
                static let description = "Upload list item"
                static let properties: [ObjectSchemaProperty] = ChunkedDetail
                    .properties
            }

            enum Items: ArraySchema {
                static let description = "Upload list items"
                static let items: Schema.Type = Item.self
            }

            enum Sort: EnumSchema {
                static let description = "The sort key for the list"
                static let allowedValues = ["uploadId", "storageId"]
                static let defaultValue: String? = "uploadId"
            }

            static let description = "Upload list"
            static let properties: [ObjectSchemaProperty] =
                [
                    .init("items", Items.self),
                    .init("sort", Sort.self, required: false),
                ] + Feather.Core.Schemas.List.properties
        }
    }
}
