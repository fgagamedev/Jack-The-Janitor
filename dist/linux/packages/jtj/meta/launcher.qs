function Component()
{
    component.addOperation("AppendFile", "@TargetDir@/jtj", "#!/bin/bash\n");
    component.addOperation("AppendFile", "@TargetDir@/jtj", "cd @TargetDir@ && export LD_LIBRARY_PATH=libs && ./bin/Jack_the_Janitor");
    component.addOperation("Execute", "chmod", "u+x", "@TargetDir@/jtj");
}
