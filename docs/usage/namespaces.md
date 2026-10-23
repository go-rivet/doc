# Namespaces


## Taskfiles

Rivet locates the root taskfile by searching _up_ the file system for a root taskfile (i.e. a taskfile with no `namespace` node).
From there Rivet will automatically scan and load all namespaced taskfiles found under the root taskfile folder. 

```yaml title="Taskfile.yml (Root taskfile)"
version: 42

tasks:
  default:
    cmds:
      - task: project:util:message
```

```yaml title="common/util/Tasfile.yml (Namespaced taskfile)"
version: 42

namespace: project:util

tasks:
  message:
    cmds:
      - cmd: echo "Hello World!"
```

```bash title="Run the Taskfiles example"
rivet

# Expected output:
Hello World!
```

### Multi-doc Taskfiles

Taskfiles can also be combined into Multi-doc YAML files. The first non-namespaced taskfile will be used as the root taskfile.

```yaml title="Taskfile.yml (Multi-doc YAML)"
---
version: 42

tasks:
  default:
    cmds:
      - task: project:util:message
---
version: 42

namespace: project:util

tasks:
  message:
    cmds:
      - cmd: echo "Hello World!"
```

```bash title="Run the Multi-doc Taskfiles example"
rivet

# Expected output:
Hello World!
```


## Tasks

### Root and Namespace Tasks

```yaml title="Taskfile.yml (Root and Namespace tasks)"
---
version: 42

tasks:
  message:
    cmds:
      -cmd: echo "Hello from root task"
---
version: 42

namespace: tasks

tasks:
  message:
    cmds:
      - cmd: echo "Hello from namespace task"
  example:
    cmds:
      - task: message
      - task: :message
```

```bash title="Run the Root and Namespace example"
rivet tasks:example

# Expected output:
Hello from namespace task
Hello from root task
```


### Namespaced Tasks

```yaml title="Taskfile.yml (Namespaced Tasks example)"
---
version: 42

tasks:
  default:
    cmds:
      - task: ::message
---
version: 42

namespace: some:tasks

tasks:
  message:
    cmds:
      - cmd: echo "Hello from some namespace task"
---
version: 42

namespace: some:other:tasks

tasks:
  message:
    cmds:
      - cmd: echo "Hello from other other namespace task"
```

```bash title="Run the Namespaced Tasks example"
rivet

# Expected output:
Hello from some namespace task
Hello from other namespace task
```


### Merged Namespaces

```yaml title="Taskfile.yml (Merged Namespaces example)"
---
version: 42

tasks:
  default:
    cmds:
      - task: some:tasks:message
---
version: 42

namespace: some:tasks

vars:
  ns: '{{NAMESPACE}}'

tasks:
  message:
    cmds:
      - task: hello
      - task: world
  hello:
    cmds:
      - cmd: echo "Hello ({{ns}})"
---
version: 42

namespace: some:tasks

tasks:
  world:
    cmds:
      - cmd: echo "World! ({{ns}})"
```

```bash title="Run the Merged Namespaces example"
rivet

# Expected output:
Hello (some:tasks)
World! (some:tasks)
```


## Variables

### Global Variables

```yaml title="Taskfile.yml (Global/Root Variables example)"
---
version: 42

vars:
  message: Hello World!

tasks:
  default:
    cmds:
      - task: tasks:message
---
version: 42

namespace: tasks

vars:
  message: "Hello from namespace"

tasks:
  world:
    cmds:
      - cmd: echo "{{:message}}"
      - cmd: echo "{{message}}"
```

```bash title="Run the Global Variables example"
rivet

# Expected output:
Hello World!
Hello from namespace
```


### Namespaced Variables

```yaml title="Taskfile.yml (Namespaced Variables example)"
---
version: 42

tasks:
  default:
    cmds:
      - cmd: echo "{{tasks:message}}"
---
version: 42

namespace: tasks

vars:
  message: Hello World!
```

```bash title="Run the Namespaced Variables example"
rivet

# Expected output:
Hello World!
```


## Imports

```yaml title="Taskfile.yml (Root/Entry taskfile)"
version: 42

imports:
  - uri: common/util
    as: util

tasks:
  default:
    cmds:
      - task: util:message
```

```yaml title="common/util/Tasfile.yml (Utility taskfile)"
version: 42

tasks:
  message:
    cmds:
      - cmd: echo "Hello World!"
```

```bash title="Run the imports example"
rivet

# Expected output:
Hello World!
```


### Authentication

#### HTTPS

> Planned: A .netrc style mechanism.


#### Git

> Planned: Directly use the `git` executable and use (indirectly) its authentication.


#### Headers

> Planned: Raw headers can be specified which are appended to any HTTP/HTTPS request.


```yaml title="Taskfile import with header authentication"
version: 42

imports:
  - uri: common/util
    as: util
    headers:
      Authorization: "Bearer {{TOKEN}}"
```


#### Certificates

Certificates should be configured in the host operating system.


### Variables

When importing a taskfile its possible to set variables in the imported taskfiles namespace. These
variables will overwrite any variables with the same name in the imported taskfile.

```yaml title="Taskfile.yml (Root/Entry taskfile)"
version: 42

imports:
  - uri: common/util
    as: util
    vars:
      message: Hello World!

tasks:
  default:
    cmds:
      - task: util:message
```

```yaml title="common/util/Tasfile.yml (Utility taskfile)"
version: 42

vars:
  message: Hello?

tasks:
  message:
    cmds:
      - cmd: echo "{{message}}"
```

```bash title="Run the import variables example"
rivet

# Expected output:
Hello World!
```