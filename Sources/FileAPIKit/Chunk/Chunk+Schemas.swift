import FeatherAPIKit
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

        enum StorageId: TextSchema {
            static let description = "Storage subsystem id"
            static var examples: [String] = ["Any storage subsystem id format"]
        }

        enum Detail: ObjectSchema {
            static let properties: [ObjectSchemaProperty] = [
                .init("id", Id.self),
                .init("uploadId", File.Upload.Schemas.Id.self),
                .init("chunkNumber", Number.self),
                .init("storageId", StorageId.self),
            ]
            static let description = "Chunk detail"
        }

        enum List: ObjectSchema {

            enum Item: ObjectSchema {
                static let description = "Chunk list item"
                static let properties: [ObjectSchemaProperty] = Detail
                    .properties
            }

            enum Items: ArraySchema {
                static let description = "Chunk list items"
                static let items: Schema.Type = Item.self
            }

            enum Sort: EnumSchema {
                static let description = "The sort key for the list"
                static let allowedValues = [
                    "id", "uploadId", "chunkNumber", "storageId",
                ]
                static let defaultValue: String? = "chunkNumber"
            }

            static let description = "Chunk list"
            static let properties: [ObjectSchemaProperty] =
                [
                    .init("items", Items.self),
                    .init("sort", Sort.self, required: false),
                ] + Feather.Core.Schemas.List.properties
        }
    }
}
