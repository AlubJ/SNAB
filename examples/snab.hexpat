// ImHex Pattern File for SNAB container files

#pragma endianness little
#pragma pattern_limit 4294967296
#pragma array_limit 4294967296

import hex.dec;

using SnabStructLE;
using SnabStructBE;
using SnabArrayLE;
using SnabArrayBE;

enum SnabType : u8 {
    None = 0x00,
    Struct = 0x01,
    Array = 0x02,
    String = 0x03,
    WString = 0x04,
    Real = 0x05,
    Integer = 0x06,
    False = 0x07,
    True = 0x08,
    Undefined = 0x09,
    Null = 0x0A,
    Buffer = 0x0B,
    Guid = 0x80,
};

struct SnabBufferLE {
    le u32 Length;
    u8 Data[Length];
};

struct SnabBufferBE {
    be u32 Length;
    u8 Data[Length];
};

struct SnabValueLE {
    SnabType Type;
    match (Type) {
        (SnabType::None): break;
        (SnabType::Struct): SnabStructLE Value;
        (SnabType::Array): SnabArrayLE Value;
        (SnabType::String): char Value[];
        (SnabType::WString): char16 Value[];
        (SnabType::Real): le double Value;
        (SnabType::Integer): le s64 Value;
        (SnabType::Buffer): SnabBufferLE Value;
        (SnabType::Guid): u8 Value[16];
    }  
};

struct SnabValueBE {
    SnabType Type;
    match (Type) {
        (SnabType::None): break;
        (SnabType::Struct): SnabStructBE Value;
        (SnabType::Array): SnabArrayBE Value;
        (SnabType::String): char Value[];
        (SnabType::WString): char16 Value[];
        (SnabType::Real): be double Value;
        (SnabType::Integer): be s64 Value;
        (SnabType::Buffer): SnabBufferBE Value;
        (SnabType::Guid): u8 Value[16];
    }  
};

struct SnabFieldLE {
    SnabType Type;
    if(Type != SnabType::None) {
        char Name[];
    }
    match (Type) {
        (SnabType::None): break;
        (SnabType::Struct): SnabStructLE Value;
        (SnabType::Array): SnabArrayLE Value;
        (SnabType::String): char Value[];
        (SnabType::WString): char16 Value[];
        (SnabType::Real): le double Value;
        (SnabType::Integer): le s64 Value;
        (SnabType::Buffer): SnabBufferLE Value;
        (SnabType::Guid): u8 Value[16];
    }  
};

struct SnabFieldBE {
    SnabType Type;
    if(Type != SnabType::None) {
        char Name[];
    }
    match (Type) {
        (SnabType::None): break;
        (SnabType::Struct): SnabStructBE Value;
        (SnabType::Array): SnabArrayBE Value;
        (SnabType::String): char Value[];
        (SnabType::WString): char16 Value[];
        (SnabType::Real): be double Value;
        (SnabType::Integer): be s64 Value;
        (SnabType::Buffer): SnabBufferBE Value;
        (SnabType::Guid): u8 Value[16];
    }  
};

struct SnabStructLE {
    SnabFieldLE Fields[while(true)];
};

struct SnabArrayLE {
    SnabValueLE Items[while(true)];
};

bitfield SnabFlags {
    bool BigEndian : 1;
    bool Extended : 1;
    bool User : 1;
    bool Compressed : 1;
    padding : 12;
};

struct SnabHeader {
    u8 MajorVersion;
    u8 MinorVersion;
    SnabFlags Flags;
    char LangId[4];
    u32 Checksum;
    u32 Length;
};

struct SnabContainer {
    SnabHeader Header;
    if (Header.Flags.Compressed) {
        u8 CompressedData[Header.Length];
    
        std::mem::Section DecompressedData = std::mem::create_section("Decompressed Data");
    
        hex::dec::zlib_decompress(CompressedData, DecompressedData, 15);
        
        if(Header.Flags.BigEndian)
            SnabValueBE Data @ 0x00 in DecompressedData;
        else
            SnabValueLE Data @ 0x00 in DecompressedData;
    } else {
        if(Header.Flags.BigEndian)
            SnabValueBE Data;
        else
            SnabValueLE Data;        
    }
};

SnabContainer Root @ 0x00;