import FeatherOpenAPIKit

extension File.Resource {

    enum PathItems {

        enum Main: PathItem {
            static let path: Path = File.Resource.path
            static let get: Operation.Type? = Operations.List.self
        }

        enum Download: PathItem {
            static let path: Path =
                Main.path / "download" / Parameters.Id.path
            static let parameters: [Parameter.Type] = [
                Parameters.Id.self
            ]
            static let get: Operation.Type? = Operations.Download.self
        }

        enum Item: PathItem {
            static let path: Path =
                Main.path / Parameters.Id.path
            static let parameters: [Parameter.Type] = [
                Parameters.Id.self
            ]
            static let delete: Operation.Type? = Operations.Delete.self
            static let get: Operation.Type? = Operations.Get.self
        }
    }
}
