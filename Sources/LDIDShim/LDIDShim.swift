#if canImport(LDID)
@_exported import LDID
public enum LDIDShim{public static let ok:Int=1}
#else
public enum LDIDShim{public static let ok:Int=1}
#endif
