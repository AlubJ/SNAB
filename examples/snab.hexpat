// ImHex Pattern File for SNAB container files

#pragma pattern_limit 4294967296
#pragma array_limit 4294967296

import hex.dec;
import type.guid;

using SnabStruct;
using SnabArray;

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

struct SnabBuffer {
    u32 Length;
    u8 Data[Length];
};

struct SnabValue {
    SnabType Type;
    match (Type) {
        (SnabType::None): break;
        (SnabType::Struct): SnabStruct Value;
        (SnabType::Array): SnabArray Value;
        (SnabType::String): char Value[];
        (SnabType::WString): char16 Value[];
        (SnabType::Real): double Value;
        (SnabType::Integer): s64 Value;
        (SnabType::Buffer): SnabBuffer Value;
        (SnabType::Guid): type::GUID Value;
    }  
};

struct SnabField {
    SnabType Type;
    if(Type != SnabType::None) {
        char Name[];
    }
    match (Type) {
        (SnabType::None): break;
        (SnabType::Struct): SnabStruct Value;
        (SnabType::Array): SnabArray Value;
        (SnabType::String): char Value[];
        (SnabType::WString): char16 Value[];
        (SnabType::Real): double Value;
        (SnabType::Integer): s64 Value;
        (SnabType::Buffer): SnabBuffer Value;
        (SnabType::Guid): type::GUID Value;
    }  
};

struct SnabStruct {
    SnabField Fields[while(true)];
};

struct SnabArray {
    SnabValue Items[while(true)];
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
    le SnabHeader Header;
    if (Header.Flags.Compressed) {
        u8 CompressedData[Header.Length];
    
        std::mem::Section DecompressedData = std::mem::create_section("Decompressed");
    
        hex::dec::zlib_decompress(CompressedData, DecompressedData, 15);
        
        if(Header.Flags.BigEndian)
            be SnabValue Data @ 0x00 in DecompressedData;
        else
            le SnabValue Data @ 0x00 in DecompressedData;
    } else {
        if(Header.Flags.BigEndian)
            be SnabValue Data;
        else
            le SnabValue Data;        
    }
};

SnabContainer Root @ 0x00;