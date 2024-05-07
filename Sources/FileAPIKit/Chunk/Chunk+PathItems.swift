import FeatherOpenAPIKit

extension File.Chunk {

    enum PathItems {

        enum Main: PathItem {
            static let path: Path = File.Chunk.path / "chunks"
            static let parameters = File.Upload.PathItems.Item.parameters
        }

        enum Chunks: PathItem {
            static let path: Path = Main.path
            static let parameters = Main.parameters
            static let get: Operation.Type? = Operations.List.self
        }

        enum Chunk: PathItem {
            static let path: Path = Main.path / Parameters.Number.path
            static let parameters =
                [
                    Parameters.Number.self
                ] + Main.parameters
            static let post: Operation.Type? = Operations.Upload.self
            static let delete: Operation.Type? = Operations.Remove.self
            static let get: Operation.Type? = Operations.Get.self
        }

        enum ChunkById: PathItem {
            static let path: Path = File.path / "chunks" / Parameters.Id.path
            static let parameters =
                [
                    Parameters.Id.self
                ]
            static let get: Operation.Type? = Operations.GetById.self
            static let delete: Operation.Type? = Operations.RemoveById.self
        }
    }
}
