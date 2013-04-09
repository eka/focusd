class Focusd.StackController extends Batman.Controller
  routingKey: 'stack'

  index: ->
    console.log "*** in the index action"
    stack = new Focusd.Stack()
    Focusd.set 'currentStack', stack
    stack.url = '/stack.json'
    stack.load (err) =>
      throw err if err
      context_id = stack.get('context_id')
      task_id = stack.get('task_id')
      task = new Focusd.Task(id: task_id, context_id: context_id)
      Focusd.set 'currentTask', task
      task.load (err) =>
        throw err if err
    @render false

  update: ->
    console.log "*** in the update action"
    Focusd.get('currentTask').save (err) ->
      throw err if err
    @render false

  defer: ->
    console.log "*** in the defer action"
    task = Focusd.get('currentTask')
    context_id = Focusd.get('currentStack').get('context_id')
    task.url = "/contexts/#{context_id}/tasks/#{task.get('id')}/defer"
    task.save (err) =>
      throw err if err
      stack = new Focusd.Stack()
      Focusd.set 'currentStack', stack
      stack.url = '/stack.json'
      stack.load (err) =>
        throw err if err
        context_id = stack.get('context_id')
        task_id = stack.get('task_id')
        task = new Focusd.Task(id: task_id, context_id: context_id)
        Focusd.set 'currentTask', task
        task.load (err) =>
        throw err if err

    @render false



