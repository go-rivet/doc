---
title: Task Functions
sidebar_label: Task
---

# Task Functions


### File Path

| Function | Go Signature |
| :--- | :--- |
| **`absPath`** | `via filepath.Abs` |
| **`fromSlash`** | `via filepath.FromSlash` |
| **`joinPath`** | `via filepath.Join` |
| **`relPath`** | `via filepath.Rel` |
| **`toSlash`** | `via filepath.ToSlash` |

### Serialization

| Function | Go Signature |
| :--- | :--- |
| **`fromYaml`** | `(v string) any` |
| **`mustFromYaml`** | `(v string) (any, error)` |
| **`mustToYaml`** | `(v any) (string, error)` |
| **`toYaml`** | `(v any) string` |

### Shell Tokenization

| Function | Go Signature |
| :--- | :--- |
| **`shellQuote`** | `(str string) (string, error)` |
| **`splitArgs`** | `(s string) ([]string, error)` |

### String Manipulation

| Function | Go Signature |
| :--- | :--- |
| **`catLines`** | `(s string) string` |
| **`splitLines`** | `(s string) []string` |
| **`toString`** | `(v any) string` |

### System

| Function | Go Signature |
| :--- | :--- |
| **`ARCH`** | `() string` |
| **`IsSH`** | `() bool` |
| **`OS`** | `() string` |
| **`exeExt`** | `() string` |
| **`numCPU`** | `via runtime.NumCPU` |
| **`randIntN`** | `via mrand.IntN` |
| **`uuid`** | `() string` |

### Utility

| Function | Go Signature |
| :--- | :--- |
| **`joinEnv`** | `(elem ...string) string` |
| **`joinUrl`** | `(elem ...string) string` |
| **`merge`** | `(base map[string]any, v ...map[string]any) map[string]any` |
| **`spew`** | `(v any) string` |
