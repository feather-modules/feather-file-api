import FeatherAPIKit
import FeatherOpenAPIKit
import OpenAPIKit

extension File.Chunk {

    public enum Schemas {

        enum Number: IntSchema {
            static let minimumValue: Int? = 1
            static let maximumValue: Int? = 10000
            static let description = "The number of the chunk"
        }

        enum Detail: ObjectSchema {
            static let properties: [ObjectSchemaProperty] = [
                .init("uploadId", File.Upload.Schemas.Id.self),
                .init("number", Number.self),
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
                    "uploadId", "number",
                ]
                static let defaultValue: String? = "number"
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
