trigger deletetask on Task (before delete)
    {
    if(Trigger.IsDelete)
        {
        for (Task t : trigger.old)
            if (t.Status == 'In Progress')
                {
                t.addError('Error: You cannot delete a Task when it is marked Inprogress.');
                }
        }
        }