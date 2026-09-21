///|
/// FUSE operation identifiers used by the wire protocol.
pub enum Opcode {
  Lookup
  Forget
  Getattr
  Setattr
  Readlink
  Symlink
  Mknod
  Mkdir
  Unlink
  Rmdir
  Rename
  Open
  Read
  Write
  Statfs
  Release
  Fsync
  Readdir
  Releasedir
  Fsyncdir
  Init
  Interrupt
  Destroy
  Create
  Getxattr
  Setxattr
  Listxattr
  Removexattr
  Flush
  Opendir
  Access
  BatchForget
  Fallocate
}

///|
/// Convert a raw FUSE opcode to a typed operation.
pub fn Opcode::from_raw(value : UInt) -> Opcode? {
  match value {
    1U => Some(Lookup)
    2U => Some(Forget)
    3U => Some(Getattr)
    4U => Some(Setattr)
    5U => Some(Readlink)
    6U => Some(Symlink)
    8U => Some(Mknod)
    9U => Some(Mkdir)
    10U => Some(Unlink)
    11U => Some(Rmdir)
    12U => Some(Rename)
    14U => Some(Open)
    15U => Some(Read)
    16U => Some(Write)
    17U => Some(Statfs)
    18U => Some(Release)
    20U => Some(Fsync)
    21U => Some(Readdir)
    22U => Some(Releasedir)
    24U => Some(Fsyncdir)
    26U => Some(Init)
    35U => Some(Create)
    36U => Some(Interrupt)
    38U => Some(Destroy)
    _ => None
  }
}

///|
/// Header sent by the Linux FUSE device.
pub struct RequestHeader {
  pub length : UInt
  pub opcode : UInt
  pub unique : UInt64
  pub nodeid : UInt64
  pub uid : UInt
  pub gid : UInt
  pub pid : UInt
}

///|
/// A parsed request with its payload left available for an operation decoder.
pub struct Request {
  pub header : RequestHeader
  pub operation : Opcode?
  pub payload : Bytes
}

///|
/// A reply header returned to the FUSE device.
pub struct ReplyHeader {
  pub length : UInt
  pub error : Int
  pub unique : UInt64
}

///|
/// Construct a request header for decoders in other packages.
pub fn request_header(
  length : UInt,
  opcode : UInt,
  unique : UInt64,
  nodeid : UInt64,
  uid : UInt,
  gid : UInt,
  pid : UInt,
) -> RequestHeader {
  { length, opcode, unique, nodeid, uid, gid, pid, }
}
