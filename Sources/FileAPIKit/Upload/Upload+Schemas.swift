import FeatherAPIKit
import FeatherOpenAPIKit
import OpenAPIKit

extension File.Upload {

    public enum Schemas {

        enum Id: IDSchema {
            static let description = "Upload identifier"
        }

        enum SimpleDetail: ObjectSchema {
            static let properties: [ObjectSchemaProperty] = [
                .init("resourceId", File.Resource.Schemas.Id.self)
            ]
            static let description = "Simple detail"
        }

        enum ResourceId: IDSchema {
            static let description = "To be live ID for resource after upload"
        }

        enum ChunkedDetail: ObjectSchema {
            static let properties: [ObjectSchemaProperty] = [
                .init("id", Id.self),
                .init("resourceId", ResourceId.self),
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
                static let allowedValues = ["id", "resourceId"]
                static let defaultValue: String? = "id"
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
