import FeatherOpenAPIKit
import OpenAPIKit

extension File.Chunk {

    enum RequestBodies {

        enum Upload: BinaryBody {
            static let contentType: OpenAPI.ContentType = .any
            static let description = """
                    Upload request body
                    5 MiB to 5 GiB. There is no minimum size limit on the last part of your multipart upload.
                """
        }
    }
}
