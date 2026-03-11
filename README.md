<h1 align="center">SNAB v1.0</h1>

<p align="center">A binary format for serializing and deserializing struct and array data by <a href="https://alub.dev/" target="_blank">Alun Jones</a> and <a href="https://chosenfewsoftware.com">Isabelle Santin</a> and based on <a href="https://github.com/JujuAdams/SNAP">SNAP Custom Binary</a> by <a href="https://jujuadams.com">Juju Adams</a>.</p>

---

SNAB (Struct n' Array Binary) is a specification which describes how nested struct and array based data is stored in a binary based file format. SNAB is based on work by Juju Adams and takes inspiration from Binary-JSON. The aim of the format is to have cross-compatible data sharing between languages whilst keeping the overhead as small as possible.

SNAB includes a core datatype feature set where the datatypes are deemed to be completely cross-compatible between all major programming languages. Each language implementation may include their own extended datatype feature set which are compatible with their own language.

Below you can find each version of the specification. Any implementation must be backwards compatible with previous versions to be compliant, although the latest version that an implementation supports does not need to be the latest version of the specification.

If you want to contribute to this format by creating an implementation for your favourite language, please read the [implementation guidelines](implementation-guidelines.md) first.

SNAB is licensed under the [MIT license](License), which means you can include the SNAB format in any commercial or non-commercial software.

# SNAB Compliance
SNAB has two compliance levels: Compliant and Supporting.

A Compliant SNAB implementation must follow the specification exactly, implement all core datatypes, accept all valid SNAB files using the core feature set, and produce SNAB files that can be parsed by any other Compliant implementation. A Compliant implementation may support extended datatypes but must not require them.

A Supporting SNAB implementation must correctly parse SNAB files using the core feature set. Supporting implementations must not change the meaning of core datatype indicators, terminator semantics, or the header layout or size. They must not reinterpret endianness rules or produce files that claim to be Compliant when they are not.

# Proposing extensions
SNAB is an extensible specification and will be continuously renewed with new versions. For more information about proposing specification changes, or documenting common format extensions, see the [SNAB Extension Proposal Guide](proposals.md).

# Specification Versions
- [SNAB Spec v1.0](v1.0.md)

# Implementations
Below is a list of SNAB compliant and supporting implementations for various languages.
| **Implementation** | **Language** | **SNAB Version** |
|--------------------|--------------|------------------|
| [CFS.SnabNet](https://github.com/IsaMorphic/CFS.SnabNet)        | .NET         | v1.0             |
| [SNAB.py](https://github.com/AlubJ/SNAB.py)            | Python       | v1.0             |
