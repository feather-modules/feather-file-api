import FeatherOpenAPIKit

extension File.Upload {

    public enum PathItems {

        enum Main: PathItem {
            static let path: Path = File.Upload.path
        }

        enum Simple: PathItem {
            static let path: Path = Main.path / "simple"
            static let post: Operation.Type? = Operations.Simple.self
        }

        enum Chunked: PathItem {
            static let path: Path = Main.path / "chunked"
            static let post: Operation.Type? = Operations.Chunked.self
            static let get: Operation.Type? = Operations.List.self
        }

        enum Item: PathItem {
            static let path: Path = Chunked.path / Parameters.Id.path
            static let parameters: [Parameter.Type] = [
                Parameters.Id.self
            ]
            static let post: Operation.Type? = Operations.ChunkedFinish.self
            static let delete: Operation.Type? = Operations.ChunkedAbort.self
            static let get: Operation.Type? = Operations.Get.self
        }
    }
}
