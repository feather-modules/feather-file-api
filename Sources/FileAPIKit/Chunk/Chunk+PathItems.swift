import FeatherOpenAPIKit

extension File.Chunk {

    public enum PathItems {

        enum Main: PathItem {
            static let path: Path = File.Chunk.path / "chunks"
            static let parameters = File.Upload.PathItems.Item.parameters
            static let get: Operation.Type? = Operations.List.self
        }

        enum Chunk: PathItem {
            static let path: Path = Main.path / Parameters.Number.path
            static let parameters: [Parameter.Type] =
                [
                    Parameters.Number.self
                ] + Main.parameters
            static let post: Operation.Type? = Operations.Upload.self
            static let delete: Operation.Type? = Operations.Delete.self
            static let get: Operation.Type? = Operations.Get.self
        }
    }
}
