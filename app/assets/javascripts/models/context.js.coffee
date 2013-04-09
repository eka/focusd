class Focusd.Context extends Batman.Model
  @storageKey: 'contexts'
  @resourceName: 'context'
  @persist Batman.RailsStorage

  @encode 'id'
  @encode 'name'
  @hasMany "tasks"