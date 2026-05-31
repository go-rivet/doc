---
title: Sprig Functions
sidebar_label: Sprig
---

# Sprig Functions


### Basic Arithmetic

| Function | Go Signature |
| :--- | :--- |
| **`add`** | `(i ...any) int64` |
| **`add1`** | `(i any) int64` |
| **`biggest`** | `(a any, i ...any) int64` |
| **`div`** | `(a any) int64` |
| **`mod`** | `(a any) int64` |
| **`mul`** | `(a any, v ...any) int64` |
| **`randInt`** | `(min int) int` |
| **`sub`** | `(a any) int64` |

### Checksum

| Function | Go Signature |
| :--- | :--- |
| **`adler32sum`** | `(input string) string` |
| **`sha1sum`** | `(input string) string` |
| **`sha256sum`** | `(input string) string` |

### Data Structure

| Function | Go Signature |
| :--- | :--- |
| **`dict`** | `(v ...any) map[string]any` |
| **`get`** | `(d map[string]any, k string) any` |
| **`hasKey`** | `(d map[string]any, k string) bool` |
| **`keys`** | `(dicts ...map[string]any) []string` |
| **`omit`** | `(dict map[string]any, keys ...string) map[string]any` |
| **`pick`** | `(dict map[string]any, keys ...string) map[string]any` |
| **`pluck`** | `(key string, d ...map[string]any) []any` |
| **`set`** | `(d map[string]any, k string, v any) map[string]any` |
| **`tuple`** | `(v ...any) []any` |
| **`unset`** | `(d map[string]any, k string) map[string]any` |
| **`values`** | `(dict map[string]any) []any` |

### Date

| Function | Go Signature |
| :--- | :--- |
| **`ago`** | `(date any) string` |
| **`date`** | `(fmt string, d any) string` |
| **`dateAgo`** | `(date any) string` |
| **`dateInZone`** | `(fmt string, date any, zone string) string` |
| **`dateModify`** | `(fmt string, date time.Time) time.Time` |
| **`date_in_zone`** | `(fmt string, date any, zone string) string` |
| **`date_modify`** | `(fmt string, date time.Time) time.Time` |
| **`duration`** | `(sec any) string` |
| **`durationRound`** | `(duration any) string` |
| **`htmlDate`** | `(d any) string` |
| **`htmlDateInZone`** | `(d any, zone string) string` |
| **`mustDateModify`** | `(fmt string, date time.Time) (time.Time, error)` |
| **`mustToDate`** | `(fmt string) (time.Time, error)` |
| **`must_date_modify`** | `(fmt string, date time.Time) (time.Time, error)` |
| **`now`** | `via time.Now` |
| **`toDate`** | `(fmt string) time.Time` |
| **`unixEpoch`** | `(date time.Time) string` |

### Encoding

| Function | Go Signature |
| :--- | :--- |
| **`b32dec`** | `(v string) string` |
| **`b32enc`** | `(v string) string` |
| **`b64dec`** | `(v string) string` |
| **`b64enc`** | `(v string) string` |

### Filepaths

| Function | Go Signature |
| :--- | :--- |
| **`osBase`** | `via filepath.Base` |
| **`osClean`** | `via filepath.Clean` |
| **`osDir`** | `via filepath.Dir` |
| **`osExt`** | `via filepath.Ext` |
| **`osIsAbs`** | `via filepath.IsAbs` |

### Flow Control

| Function | Go Signature |
| :--- | :--- |
| **`fail`** | `(msg string) (string, error)` |

### General

| Function | Go Signature |
| :--- | :--- |
| **`fragment`** | `via parsedURL.Fragment` |
| **`host`** | `via parsedURL.Host` |
| **`hostname`** | `()` |
| **`opaque`** | `via parsedURL.Opaque` |
| **`path`** | `via parsedURL.Path` |
| **`query`** | `via parsedURL.RawQuery` |
| **`scheme`** | `via parsedURL.Scheme` |
| **`userinfo`** | `()` |

### List

| Function | Go Signature |
| :--- | :--- |
| **`append`** | `(list any, v any) []any` |
| **`chunk`** | `(size int, list any) [][]any` |
| **`compact`** | `(list any) []any` |
| **`concat`** | `(lists ...any) any` |
| **`first`** | `(list any) any` |
| **`has`** | `(needle any, haystack any) bool` |
| **`initial`** | `(list any) []any` |
| **`last`** | `(list any) any` |
| **`list`** | `(v ...any) []any` |
| **`prepend`** | `(list any, v any) []any` |
| **`push`** | `(list any, v any) []any` |
| **`rest`** | `(list any) []any` |
| **`reverse`** | `(v any) []any` |
| **`slice`** | `(list any, indices ...any) any` |
| **`sortAlpha`** | `(list any) []string` |
| **`split`** | `(sep string) map[string]string` |
| **`splitList`** | `(sep string) []string` |
| **`splitn`** | `(sep string, n int, orig string) map[string]string` |
| **`toStrings`** | `(v any) []string` |
| **`uniq`** | `(list any) []any` |
| **`without`** | `(list any, omit ...any) []any` |

### Network

| Function | Go Signature |
| :--- | :--- |
| **`getHostByName`** | `(name string) string` |

### Numerical

| Function | Go Signature |
| :--- | :--- |
| **`atoi`** | `(a string) int` |
| **`ceil`** | `(v any) float64` |
| **`float64`** | `(v any) float64` |
| **`floor`** | `(v any) float64` |
| **`int`** | `(v any) int` |
| **`int64`** | `(v any) int64` |
| **`max`** | `(a any, i ...any) int64` |
| **`maxf`** | `(a any, i ...any) float64` |
| **`min`** | `(a any, i ...any) int64` |
| **`minf`** | `(a any, i ...any) float64` |
| **`round`** | `(a any, p int, rOpt ...float64) float64` |
| **`seq`** | `(params ...int) string` |
| **`toDecimal`** | `(v any) int64` |
| **`toFloat64`** | `(v any) float64` |
| **`toInt`** | `(v any) int` |
| **`toInt64`** | `(v any) int64` |
| **`until`** | `(count int) []int` |
| **`untilStep`** | `(start int) []int` |

### OS

| Function | Go Signature |
| :--- | :--- |
| **`env`** | `via os.Getenv` |
| **`expandenv`** | `via os.ExpandEnv` |

### Path

| Function | Go Signature |
| :--- | :--- |
| **`base`** | `via path.Base` |
| **`clean`** | `via path.Clean` |
| **`dir`** | `via path.Dir` |
| **`ext`** | `via path.Ext` |
| **`isAbs`** | `via path.IsAbs` |

### Reflection

| Function | Go Signature |
| :--- | :--- |
| **`deepEqual`** | `via reflect.DeepEqual` |
| **`kindIs`** | `(target string, src any) bool` |
| **`kindOf`** | `(src any) string` |
| **`typeIs`** | `(target string, src any) bool` |
| **`typeIsLike`** | `(target string, src any) bool` |
| **`typeOf`** | `(src any) string` |

### Regex

| Function | Go Signature |
| :--- | :--- |
| **`mustRegexMatch`** | `(rx string) (bool, error)` |
| **`regexFind`** | `(rx string) string` |
| **`regexFindAll`** | `(rx string, n int) []string` |
| **`regexMatch`** | `(rx string) bool` |
| **`regexQuoteMeta`** | `(s string) string` |
| **`regexReplaceAll`** | `(rx string) string` |
| **`regexReplaceAllLiteral`** | `(rx string) string` |
| **`regexSplit`** | `(rx string, n int) []string` |

### String

| Function | Go Signature |
| :--- | :--- |
| **`base32encode`** | `(v string) string` |
| **`base64encode`** | `(v string) string` |
| **`cat`** | `(v ...any) string` |
| **`contains`** | `(substr string, str string) bool` |
| **`hasPrefix`** | `(substr string, str string) bool` |
| **`hasSuffix`** | `(substr string, str string) bool` |
| **`indent`** | `(sp int, v string) string` |
| **`join`** | `(sep string, v any) string` |
| **`lower`** | `via strings.ToLower` |
| **`nindent`** | `(sp int, v string) string` |
| **`plural`** | `(one string, count int) string` |
| **`quote`** | `(str ...any) string` |
| **`repeat`** | `(count int, str string) string` |
| **`replace`** | `(old string) string` |
| **`squote`** | `(str ...any) string` |
| **`substr`** | `(start int, s string) string` |
| **`title`** | `via strings.Title` |
| **`toString`** | `(v any) string` |
| **`trim`** | `via strings.TrimSpace` |
| **`trimAll`** | `(a string) string` |
| **`trimPrefix`** | `(a string) string` |
| **`trimSuffix`** | `(a string) string` |
| **`trunc`** | `(c int, s string) string` |
| **`upper`** | `via strings.ToUpper` |

### URL

| Function | Go Signature |
| :--- | :--- |
| **`urlJoin`** | `(d map[string]any) string` |
| **`urlParse`** | `(v string) map[string]any` |

### Utility

| Function | Go Signature |
| :--- | :--- |
| **`all`** | `(v ...any) bool` |
| **`any`** | `(v ...any) bool` |
| **`coalesce`** | `(v ...any) any` |
| **`default`** | `(d any, given ...any) any` |
| **`empty`** | `(given any) bool` |
| **`fromJson`** | `(v string) any` |
| **`hello`** | `() string` |
| **`mustFromJson`** | `(v string) (any, error)` |
| **`mustToJson`** | `(v any) (string, error)` |
| **`mustToPrettyJson`** | `(v any) (string, error)` |
| **`mustToRawJson`** | `(v any) (string, error)` |
| **`ternary`** | `(vt any, vf any, v bool) any` |
| **`toJson`** | `(v any) string` |
| **`toPrettyJson`** | `(v any) string` |
| **`toRawJson`** | `(v any) string` |
