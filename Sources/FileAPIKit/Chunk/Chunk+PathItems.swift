import FeatherOpenAPIKit

extension File.Chunk {

    enum PathItems {

        enum Main: PathItem {
            static let path: Path = File.Chunk.path
            static let parameters = File.Upload.PathItems.Item.parameters
        }

        enum Chunks: PathItem {
            static let path: Path = Main.path / "chunks"
            static let parameters = Main.parameters
            static let get: Operation.Type? = Operations.List.self
        }

        enum ChunksItem: PathItem {
            static let path: Path = Chunks.path / Parameters.Id.path
            static let parameters =
                [
                    Parameters.Id.self
                ] + Chunks.parameters
            static let get: Operation.Type? = Operations.ChunksItemGet.self
        }

        enum Chunk: PathItem {
            static let path: Path = Main.path / "chunk" / Parameters.Number.path
            static let parameters =
                [
                    Parameters.Number.self
                ] + Main.parameters
            static let post: Operation.Type? = Operations.Upload.self
            static let delete: Operation.Type? = Operations.Remove.self
            static let get: Operation.Type? = Operations.ChunkGet.self
        }
    }
}
