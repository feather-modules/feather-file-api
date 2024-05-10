import FeatherOpenAPIKit

extension File.Resource {

    enum Parameters {

        enum Id: PathParameter {
            static let name = "resourceId"
            static let description = "Resource identifier"
            static let schema: Schema.Type = Schemas.Id.self
        }

        enum DownloadRequestHeader: HeaderParameter {
            static let name = "Range"
            static let description = "Range download request header"
            static let schema: Schema.Type = Schemas.DownloadRequestHeader.self
            static let required = false
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
