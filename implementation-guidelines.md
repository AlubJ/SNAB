# Implementation Guidelines
SNAB is a fairly loose format, and can be adjusted to fit the needs of any usecase. However, general purpose implementations should follow these guidelines. SNAB compliance is defined based on the SNAB specification.

## Design Goals for Implementers
SNAB is designed to be streaming-friendly (when uncompressed) and language-agnostic, all implementations should be able to parse the core datatypes and produce a nested struct and array result. Writers should be able to produce a SNAB file that can be used in any other implementation as long as it is using the core feature set.

## Header
The header of the SNAB should follow the specification to a tee to allow all implementations to parse it correctly. Ensure that all header fields are exact to the specification. An implementation should support all previous versions of SNAB, and should be forwards-compatible with all minor versions where possible. An implementation can reject unsupported major versions. Ensure flags are parsed and validated before parsing the datastream. Validation of the datastream size and checksum are encouraged but not necessary. The language-extended and user-extended flags should automatically be set based on what has been encoded into the datastream. If a flag is set but no extended datatypes are present, implementations should accept the SNAB. The implementation must use a common abbreviation of the language for the language indicator and be in uppercase, such as `PY` for Python or `CS` for C#. If the common abbreviation is more than four characters the implementation can truncate the language indicator. If the common abbreviation is less than four characters you must pad with null bytes.

## Endianness
The header is always encoded as little-endian. Datastream endianness should be consistent with what the header flags suggest and should never assume host endianness.

## Datastream Parsing
Ensure that the root of the datastream is either a struct or an array, and require terminators for all containers. Ensure that array order is preserved, struct order is not important. An implementation may apply limits to nested containers where necessary to avoid stack overflow.

## Datatype Decoding and Encoding
Ensure that all core datatypes are supported. Encountering an unknown datatype indicator must result in an error unless it is supported by the implementation. The `null` and `undefined` datatypes are up for language interpretation, feel free to add constants or use the closest native match.

## Compression and Decompression
Compression must use zlib deflate and inflate to ensure cross-compatibility. The header is not included in the compression and the compressed datastream is the data after the header.

## Error Handling
Feel free to throw errors where necessary. Be descriptive in why the error has occurred.

## Security Considerations
Implementations should validate to avoid excessive memory allocation, stack exhaustion, or infinite loops caused by malformed datastreams.

## API Considerations
An implementation's API design is not strict in naming or case-sensitivity, but it should expose encoding and decoding functionality with appropriate parameters for endianness, compression and other supported features. An implementation's API should include a way to have user-definable datatypes.

## Example SNAB Files
You can find example SNAB files to test an implementations reader in the `examples` folder in this repo.