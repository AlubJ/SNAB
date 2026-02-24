# Implementation Guidelines
SNAB is a fairly loose format, and can be adjusted to fit the needs of any usecase. However, general purpose implementations should follow these guidelines. SNAB compliance is defined based on the SNAB specification.

## Design Goals for Implementers
SNAB is designed to be streaming-friendly (when uncompressed) and language-agnostic, all implementations should be able to parse the core datatypes and produce a nested struct and array result. Writers should be able to produce a SNAB file that can be used in any other implementation as long as it is using the core feature set.

## Header
The header of the SNAB should follow the specification to a tee to allow all implementations to parse it correctly. Ensure that all header fields are exact to the specification. Your implementation should support all previous versions of SNAB, and should be forwards-compatible with all minor versions where possible. Your implementation can reject unsupported major versions. Ensure flags are parsed and validated before parsing the datastream. Validation of the datastream size and checksum are encouraged but not necessary.

## Endianness
The header is always encoded as little-endian. Datastream endianness should be consistent with what the header flags suggest and should never assume host endianness.

## Datastream Parsing
Ensure that the root of the datastream is either a struct or an array, and require terminators for all containers. Ensure that array order is preserved, struct order is not important. You may apply limits to nested containers where necessary to avoid stack overflowing.

## Datatype Decoding
Ensure that all core datatypes are supported, and reject a SNAB if an extended feature set is not supported. The `null` and `undefined` datatypes are up for language interpretation, feel free to add constants or use the closest native match.

## Compression and Decompression
Compression must use zlib deflate and inflate to ensure cross-compatibility. The header is not included in the compression and the compressed datastream is the data after the header.

## Error Handling
Feel free to throw errors where necessary. Be descriptive in why the error has occurred.

## Security Considerations
Implementations should validate to avoid excessive memory allocation, stack exhaustion, or inifinite loops cause by malformed datastreams.