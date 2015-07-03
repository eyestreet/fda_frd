String.prototype.trimToLength = (m = 150) ->
  if @length > m then $.trim(@).substring(0, m).split(' ').slice(0, -1).join(' ') + '...' else @
