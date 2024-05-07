import FeatherOpenAPIKit

extension File.Chunk {

    enum Parameters {

        enum Id: PathParameter {
            static let name = "chunkId"
            static let description = "Chunk identifier"
            static let schema: Schema.Type = Schemas.Id.self
        }
        
        enum Number: PathParameter {
            static let name = "chunkNumber"
            static let description = "The number of the chunk"
            static let schema: Schema.Type = Schemas.Number.self
        }
    }
}
