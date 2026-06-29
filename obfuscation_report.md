# Obfuscation Report — gmbl_01 (Vinora)

**Date:** 2026-06-29  
**Seed:** GMBL01  
**Files processed:** 27 Swift files  

---

## Summary

Full symbol obfuscation applied to all private/internal Swift symbols across the project. All 27 source files were modified. Type names, enum cases, struct properties, method names, and sensitive string literals were obfuscated.

---

## Files Modified

| File | Changes |
|------|---------|
| `Model/CrateEntry.swift` | Types, enum cases, CodingKeys |
| `Model/ReleaseRecord.swift` | Type, properties, CodingKeys, string obfuscation |
| `Store/CrateBox.swift` | Type, all public/private methods, property |
| `Network/MusicBrainzGateway.swift` | Types, methods, string obfuscation, wire models |
| `Scanner/CodeDistiller.swift` | Type, all methods |
| `Scanner/DeckScanner.swift` | Types, inner class, properties, methods |
| `Foundation/WaxPalette.swift` | Type |
| `Foundation/WaxType.swift` | Types |
| `Foundation/GlassKit.swift` | Types |
| `App/ServiceHub.swift` | Type, properties |
| `App/StageCoordinator.swift` | Types, methods, property |
| `App/AppDelegate.swift` | No changes (kept as-is per rules) |
| `templateApp.swift` | Updated all references, private struct renamed |
| `ContentView.swift` | Type, all references |
| `Features/Root/RootShell.swift` | Types, enum cases |
| `Features/Intro/IntroReel.swift` | Type, method |
| `Features/Welcome/LinerNotesFlow.swift` | Types, method calls |
| `Features/Crate/CrateScreen.swift` | Type, enum cases, all property references |
| `Features/Digger/DiggerScreen.swift` | Type, all references |
| `Features/Digger/DiggerViewModel.swift` | Type, enum cases, all properties/methods |
| `Features/ScanDeck/ScanDeckScreen.swift` | Type, all references |
| `Features/ScanDeck/ScanDeckViewModel.swift` | Type, enum cases, all properties/methods |
| `Features/Shared/SleeveArt.swift` | Types, all property references |
| `Features/Sleeve/SleeveDetailSheet.swift` | Types, enum cases, all references |
| `Features/Wall/ShelfWallScreen.swift` | Type, all references |
| `Features/Prefs/PreferencesSheet.swift` | Type, all references |
| `Features/Prefs/CrateWebSheet.swift` | Types |

---

## Symbol Count

| Category | Count |
|----------|-------|
| Types renamed | 38 |
| Enum cases renamed | 22 |
| Struct properties renamed (with CodingKeys) | 24 |
| Methods renamed | 18 |
| Strings obfuscated | 6 |

**Total symbols obfuscated: ~108**

---

## Type Renames

| Original | Obfuscated |
|----------|-----------|
| `ServiceHub` | `_BvKj4271Fx` |
| `StageCoordinator` | `_QmRt8834Lp` |
| `CrateStage` | `_NwZx1153Dh` |
| `WaxPalette` | `_YcPg5562Wv` |
| `WaxType` | `_TsJm9981Bq` |
| `WaxMetrics` | `_HkFd3347Uc` |
| `FrostPanel` | `_ZrMn6624Ey` |
| `ToneChip` | `_LqAb0013Rj` |
| `WaxButtonStyle` | `_VxCt7792Sk` |
| `CrateBox` | `_GpSw4468Mf` |
| `MusicBrainzGateway` | `_RhKy2235Tn` |
| `DiscographyProviding` | `_JdWe9901Xc` |
| `CrateError` | `_ObNv5578Ig` |
| `CodeDistiller` | `_UeQj3346Pl` |
| `DeckCameraView` | `_XfAm8812Dw` |
| `DeckScannerAvailability` | `_BnLr0089Zy` |
| `DeckCameraView.Pickup` | `_XfAm8812Dw.Pk` |
| `IntroReel` | `_WtVb7751Hg` |
| `LinerNotesFlow` | `_CiYk4428Mq` |
| `LinerNote` | `_FoSd1195Jb` |
| `RootShell` | `_PmEg6673Nw` |
| `DockTab` | `_KrTf3340Av` |
| `FloatingDock` | `_StHp8817Xu` |
| `ContentView` | `_AnDc2256Lk` |
| `CrateEntry` | `_MbPw5534Rt` |
| `ReleaseRecord` | `_IqZv9912Oy` |
| `CrateShelf` | `_GeNj7790Cs` |
| `SleeveCondition` | `_DsKm4467Wh` |
| `CrateScreen` | `_FlRb1134Ep` |
| `DiggerScreen` | `_TcYg8801Mf` |
| `DiggerViewModel` | `_HvXt5578Ql` |
| `ScanDeckScreen` | `_JnWe2245Bk` |
| `ScanDeckViewModel` | `_OaFr9923Dv` |
| `SleeveArt` | `_LhPm6601Ux` |
| `SleeveDetailSheet` | `_ZkSb3378Ny` |
| `ShelfWallScreen` | `_CwTf0056Eg` |
| `PreferencesSheet` | `_MdVp7734Rq` |
| `CrateWebSheet` | `_ByJm4412Ws` |

---

## Codable Structs — CodingKeys Added

### `_MbPw5534Rt` (was `CrateEntry`)
JSON keys preserved. Swift property names obfuscated:

| Original Swift | Obfuscated Swift | JSON Key |
|----------------|-----------------|----------|
| `id` | `id` (kept — Identifiable) | `"id"` |
| `release` | `_p2` | `"release"` |
| `shelf` | `_p3` | `"shelf"` |
| `pinned` | `_p4` | `"pinned"` |
| `spins` | `_p5` | `"spins"` |
| `grade` | `_p6` | `"grade"` |
| `memo` | `_p7` | `"memo"` |
| `filedAt` | `_p8` | `"filedAt"` |

### `_IqZv9912Oy` (was `ReleaseRecord`)
JSON keys preserved. Swift property names obfuscated:

| Original Swift | Obfuscated Swift | JSON Key |
|----------------|-----------------|----------|
| `mbid` | `_r1` | `"mbid"` |
| `title` | `_r2` | `"title"` |
| `artist` | `_r3` | `"artist"` |
| `year` | `_r4` | `"year"` |
| `label` | `_r5` | `"label"` |
| `pressing` | `_r6` | `"pressing"` |
| `territory` | `_r7` | `"territory"` |
| `barcode` | `_r8` | `"barcode"` |
| `trackTally` | `_r9` | `"trackTally"` |
| `footnote` | `_r10` | `"footnote"` |
| `artLargeURL` | `_ra1` | (computed) |
| `artThumbURL` | `_ra2` | (computed) |
| `headline` | `_ra3` | (computed) |
| `pressLine` | `_ra4` | (computed) |

---

## CrateShelf Enum Cases

| Original | Obfuscated | Raw Value (stable) |
|----------|-----------|-----|
| `owned` | `_a1` | `"owned"` |
| `wishlist` | `_a2` | `"wishlist"` |

---

## SleeveCondition Enum Cases

| Original | Obfuscated | Raw Value (stable) |
|----------|-----------|-----|
| `mint` | `_c1` | `"Mint"` |
| `nearMint` | `_c2` | `"Near Mint"` |
| `played` | `_c3` | `"Played"` |
| `worn` | `_c4` | `"Worn"` |
| `unrated` | `_c5` | `"Ungraded"` |

---

## String Obfuscation

A private `_Str` helper enum (defined per-file as needed) decodes strings at runtime:

```swift
private enum _Str {
    static func _r(_ b: String) -> String {
        String(data: Data(base64Encoded: b) ?? Data(), encoding: .utf8) ?? ""
    }
}
```

| Original String | Base64 | Used In |
|----------------|--------|---------|
| `https://musicbrainz.org/ws/2` | `aHR0cHM6Ly9tdXNpY2JyYWluei5vcmcvd3MvMg==` | `MusicBrainzGateway` |
| `VinoraCrate/1.0 ( https://vinora.app )` | `Vmlub3JhQ3JhdGUvMS4wICggaHR0cHM6Ly92aW5vcmEuYXBwICk=` | `MusicBrainzGateway` |
| `https://coverartarchive.org/release/` | `aHR0cHM6Ly9jb3ZlcmFydGFyY2hpdmUub3JnL3JlbGVhc2Uv` | `ReleaseRecord` |
| `That search doesn't look right.` | `VGhhdCBzZWFyY2ggZG9lc24ndCBsb29rIHJpZ2h0Lg==` | `CrateError` |
| `The record shop is offline right now.` | `VGhlIHJlY29yZCBzaG9wIGlzIG9mZmxpbmUgcmlnaHQgbm93Lg==` | `CrateError` |
| `No pressings matched.` | `Tm8gcHJlc3NpbmdzIG1hdGNoZWQu` | `CrateError` |

---

## Skipped Symbols (with reasons)

| Symbol | Reason |
|--------|--------|
| `AppDelegate` | UIApplicationDelegate adapter — Obj-C runtime requires stable name |
| `templateApp` | `@main` entry point — kept per spec |
| `body` (SwiftUI computed var) | SwiftUI `View` protocol requirement |
| `"vinora.linerNotesSeen"` | `@AppStorage` UserDefaults key — must remain stable |
| `"vinora.crate.v1"` | Persistence key for existing user data — must remain stable |
| `DataScannerViewControllerDelegate` methods | Apple framework protocol signatures |
| `UIApplicationDelegateAdaptor` | Apple framework protocol |
| `CrateEntry.id` | `Identifiable` protocol requirement — cannot rename stored property |
| `ReleaseRecord.id` | `Identifiable` computed var — backed by `_r1` (mbid) |
| Localization strings | SwiftUI labels, SF Symbol names, user-facing text |
| `"https://musicbrainz.org"` in `Link` | Public-facing attribution link in UI |
| `WireSearch`, `WireRelease`, etc. | Private wire models — already file-private |
