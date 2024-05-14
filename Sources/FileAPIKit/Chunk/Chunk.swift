import FeatherOpenAPIKit

extension File {

    public enum Chunk: Component {
        static let path: Path =
            File.Upload.PathItems.Chunked.path / File.Upload.Parameters.Id.path
    }
}
