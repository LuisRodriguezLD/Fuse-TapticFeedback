using Fuse;
using Fuse.Scripting;
using Uno.UX;
using Uno.Compiler.ExportTargetInterop;

[UXGlobalModule]
public class LogModule : NativeModule
{
    static readonly LogModule _instance;
    public LogModule()
    {
        if (_instance != null) return;

        _instance = this;
        Resource.SetGlobalKey(_instance, "LogModule");
        AddMember(new NativeFunction("Log", (NativeCallback)Log));
    }

    static object Log(Context c, object[] args)
    {
        foreach (var arg in args)
            LogForeign.LogIt(arg as string );
        return null;
    }
}

class LogForeign
{
    [Foreign(Language.Java)]
    public static extern(Android) void LogIt(string message)
    @{
        android.util.Log.d("ForeignCodeExample", message);
    @}

    [Foreign(Language.ObjC)]
    public static extern(iOS) void LogIt(string message)
    @{
        NSLog(@"%@", message);
    @}

    public static extern(!mobile) void LogIt(string message)
    {
        debug_log("My first uno says: " + message);
    }
}
