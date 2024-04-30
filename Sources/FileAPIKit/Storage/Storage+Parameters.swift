import FeatherOpenAPIKit

extension File.Storage {

    enum Parameters {

        enum Id: PathParameter {
            static let name = "fileId"
            static let description = "File identifier"
            static let schema: Schema.Type = Schemas.Id.self
        }

        enum ChunkNumber: PathParameter {
            static let name = "chunkNumber"
            static let description = "The number of the chunk"
            static let schema: Schema.Type = Schemas.ChunkNumber.self
        }
        
        enum DownloadRequestHeader: HeaderParameter {
            static let name = "Range"
            static let description = "Range download request header"
            static let schema: Schema.Type = Schemas.DownloadHeader.self
        }
        
    }
}
