import FeatherOpenAPIKit

extension File.Upload {

    enum Parameters {

        enum Id: PathParameter {
            static let name = "uploadId"
            static let description = "Upload identifier"
            static let schema: Schema.Type = Schemas.Id.self
        }
    }
}
