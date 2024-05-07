import FeatherOpenAPIKit

extension File {

    public enum Chunk: Component {
        static let path: Path = File.path / File.Upload.Parameters.Id.path
    }
}
