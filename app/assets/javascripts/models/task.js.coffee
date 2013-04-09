class Focusd.Task extends Batman.Model
  @storageKey: 'tasks'
  @resourceName: 'task'
  @persist Batman.RailsStorage
  @belongsTo 'context', { inverseOf: 'tasks'}
  @urlNestsUnder 'context'
  @encode 'id'
  @encode 'name'
  @encode 'notes'
  @encode 'context_id'
