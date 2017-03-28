function Component()
{
    component.addOperation("AppendFile", "@TargetDir@/jtj", "#!/bin/bash\ncd @TargetDir@ && export LD_LIBRARY_PATH=bin/linux/lib && ./bin/linux/Jack_the_Janitor");
    component.addOperation("Execute", "chmod", "u+x", "@TargetDir@/jtj");
}
