import FeatherOpenAPIKit

extension File {

    public enum Storage: Component {
        static let path: Path = File.path / "storage"
    }
}
