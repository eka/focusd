class Focusd.Stack extends Batman.Model
  @storageKey: 'stack'
  @resourceName: 'stack'
  @persist Batman.RailsStorage
  @encode 'context_id'
  @encode 'task_id'
