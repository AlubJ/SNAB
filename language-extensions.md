# Lanugage Extensions
Each implementation of SNAB can include specific language features and are only readable in that language, though other languages may implement similar features. Custom implementations DO NOT have to include extended language features. The "Version" fields will denote what versions of SNAB the extension will be valid for, as sometimes, we may add an extension as a core feature and deprecate the extension.

# .NET (C#)
| **Datatype** | **Indicator(s)** | **Size** | **Usage** | **Version (Introduced)** | **Version (Advanced to Core)** |
|--------------|---------------|----------|-----------|----------------------|----------------------|
| `GUID/UUID`  | `0x80` (Legacy)<br />`0x0C` (Core) | `0x16`   | Unique identifier for discrete records or other uses following the [RFC4122 spec](https://www.rfc-editor.org/rfc/rfc4122.txt). | `v1.0` | `v1.1` |