
properties {
    $x = 42
}

task default -depends 'TaskAFromModuleA'

task 'TaskAFromModuleA' -FromModule TaskModuleA -depends TaskAFromModuleB

task 'TaskAFromModuleB' -Frommodule TaskModuleB -minimumVersion 0.2.0 -depends xxx -continueOnError

task xxx {
    throw 'oops'
}

task 'TaskbFromModuleA' -FromModule TaskModuleA -minimumVersion 0.0.1 -maximumVersion 0.2.0

task 'TaskbFromModuleB' -Frommodule TaskModuleB -minimumVersion 0.2.0 -maximumVersion 0.3.0

# I don't really understand why using task 'TaskAFromModuleA' -FromModule TaskModuleA seems to be illegal
# Using this task again fails the test at Task.ps1 L:241 Assert (-not $psake.ReferenceTasks.ContainsKey($referenceTask.Name))
