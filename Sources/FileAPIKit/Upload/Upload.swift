import FeatherOpenAPIKit

extension File {

    public enum Upload: Component {
        static let path: Path = File.path / "uploads"
    }
}
