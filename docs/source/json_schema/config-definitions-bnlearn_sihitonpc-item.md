# bnlearn_sihitonpc item Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_sihitonpc
```

Semi-Interleaved Hiton-PC algorithm instance

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](config.schema.json "open original schema") |

## bnlearn_sihitonpc Type

`object` ([bnlearn_sihitonpc item](config-definitions-bnlearn_sihitonpc-item.md))

## bnlearn_sihitonpc Examples

```json
{
  "id": "sihitonpc-zf",
  "alpha": [
    0.01,
    0.05
  ],
  "test": "zf",
  "B": null,
  "maxsx": null,
  "debug": false,
  "undirected": false,
  "timeout": null
}
```

# bnlearn_sihitonpc Properties

| Property                  | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                                                          |
| :------------------------ | :-------- | :------- | :------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                 | `string`  | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-bnlearn_sihitonpc-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_sihitonpc/properties/id")                 |
| [alpha](#alpha)           | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-flexprob.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_sihitonpc/properties/alpha")                                          |
| [test](#test)             | `string`  | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-bnlearn_sihitonpc-item-properties-test.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_sihitonpc/properties/test")             |
| [B](#b)                   | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-npn-negative-integer-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_sihitonpc/properties/B")                          |
| [maxsx](#maxsx)           | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-npn-negative-integer-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_sihitonpc/properties/maxsx")                      |
| [debug](#debug)           | `boolean` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-bnlearn_sihitonpc-item-properties-debug.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_sihitonpc/properties/debug")           |
| [undirected](#undirected) | `boolean` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-bnlearn_sihitonpc-item-properties-undirected.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_sihitonpc/properties/undirected") |
| [timeout](#timeout)       | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_sihitonpc/properties/timeout")                    |

## id

Unique identifier

`id`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-bnlearn_sihitonpc-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_sihitonpc/properties/id")

### id Type

`string`

## alpha

Number(s) in the range \[0,1].

`alpha`

*   is required

*   Type: merged type ([Details](config-definitions-flexprob.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-flexprob.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_sihitonpc/properties/alpha")

### alpha Type

merged type ([Details](config-definitions-flexprob.md))

any of

*   [prob type](config-definitions-prob-type.md "check type definition")

*   [problist type](config-definitions-problist-type.md "check type definition")

## test



`test`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-bnlearn_sihitonpc-item-properties-test.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_sihitonpc/properties/test")

### test Type

`string`

### test Constraints

**enum**: the value of this property must be equal to one of the following values:

| Value        | Explanation |
| :----------- | :---------- |
| `"mi"`       |             |
| `"mi-adf"`   |             |
| `"mc-mi"`    |             |
| `"smc-mi"`   |             |
| `"sp-mi"`    |             |
| `"mi-sh"`    |             |
| `"x2"`       |             |
| `"x2-adf"`   |             |
| `"sp-x2"`    |             |
| `"jt"`       |             |
| `"mc-jt"`    |             |
| `"smc-jt"`   |             |
| `"cor"`      |             |
| `"mc-cor"`   |             |
| `"smc-cor"`  |             |
| `"zf"`       |             |
| `"mc-zf"`    |             |
| `"smc-zf"`   |             |
| `"mi-g"`     |             |
| `"mc-mi-g"`  |             |
| `"smc-mi-g"` |             |
| `"mi-g-sh"`  |             |
| `"mi-cg"`    |             |

## B



`B`

*   is required

*   Type: merged type ([Npn-negative integer or null](config-definitions-npn-negative-integer-or-null.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-npn-negative-integer-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_sihitonpc/properties/B")

### B Type

merged type ([Npn-negative integer or null](config-definitions-npn-negative-integer-or-null.md))

any of

*   any of

    *   [natnum type](config-definitions-natnum-type.md "check type definition")

    *   [Positive integer list](config-definitions-non-negative-integers-anyof-positive-integer-list.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-npn-negative-integer-or-null-anyof-1.md "check type definition")

## maxsx



`maxsx`

*   is required

*   Type: merged type ([Npn-negative integer or null](config-definitions-npn-negative-integer-or-null.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-npn-negative-integer-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_sihitonpc/properties/maxsx")

### maxsx Type

merged type ([Npn-negative integer or null](config-definitions-npn-negative-integer-or-null.md))

any of

*   any of

    *   [natnum type](config-definitions-natnum-type.md "check type definition")

    *   [Positive integer list](config-definitions-non-negative-integers-anyof-positive-integer-list.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-npn-negative-integer-or-null-anyof-1.md "check type definition")

## debug



`debug`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-bnlearn_sihitonpc-item-properties-debug.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_sihitonpc/properties/debug")

### debug Type

`boolean`

## undirected



`undirected`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-bnlearn_sihitonpc-item-properties-undirected.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_sihitonpc/properties/undirected")

### undirected Type

`boolean`

## timeout

E.g. 1.5 or \[1.6, 3.8] or null.

`timeout`

*   is required

*   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_sihitonpc/properties/timeout")

### timeout Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

*   any of

    *   [nonnegnum type](config-definitions-nonnegnum-type.md "check type definition")

    *   [nonnegnumlist](config-definitions-nonnegnumlist.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")