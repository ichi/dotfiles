# custom-title package

Set your own template for Atom's title bar. Uses [underscore.js templates](http://underscorejs.org/#template).

The following variables are available:

- `projectPath`
- `projectName`
- `filePath`
- `relativeFilePath`
- `fileName`
- `gitHead`
- `gitAdded`
- `gitDeleted`
- `devMode`
- `safeMode`

Plus the `atom` global, as usual.

## Examples

### Default

The default template matches the regular Atom titlebar:

```
<%= fileName %><% if (projectPath) { %> - <%= projectPath %><% } %>
```

### With Atom version

```
<%= fileName %><% if (projectPath) { %> - <%= projectPath %><% } %> - Atom <%= atom.getVersion() %>
```

### With the current git branch

```
<%= fileName %><% if (projectPath) { %> - <%= projectPath %><% if (gitHead) { %> [<%= gitHead %>]<% } %><% } %>
```
