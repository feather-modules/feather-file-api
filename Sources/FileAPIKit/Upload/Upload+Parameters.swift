import FeatherOpenAPIKit

extension File.Upload {

    enum Parameters {

        enum Id: PathParameter {
            static let name = "uploadId"
            static let description = "Upload identifier"
            static let schema: Schema.Type = Schemas.Id.self
        }

        enum List {
            enum Sort: QueryParameter {
                static let name = "sort"
                static let description = "Sort by parameter"
                static let schema: Schema.Type = Schemas.List.Sort.self
            }
        }
    }
}
