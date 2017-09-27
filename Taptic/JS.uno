using Fuse;
using Fuse.Scripting;
using Uno.UX;
using Uno.Compiler.ExportTargetInterop;

[UXGlobalModule]
public class TapticModule : NativeModule
{
    static readonly TapticModule _instance;
    public TapticModule()
    {
        if (_instance != null) return;

        _instance = this;
        Resource.SetGlobalKey(_instance, "TapticModule");
        AddMember(new NativeFunction("Light", (NativeCallback)Light));
        AddMember(new NativeFunction("Medium", (NativeCallback)Medium));
        AddMember(new NativeFunction("Heavy", (NativeCallback)Heavy));
    }

    static object Light(Context c, object[] args)
    {
        StartForeign.Light();
        return null;
    }
    static object Medium(Context c, object[] args)
    {
        StartForeign.Medium();
        return null;
    }
    static object Heavy(Context c, object[] args)
    {
        StartForeign.Heavy();
        return null;
    }
}

[ForeignInclude(Language.ObjC, "@(Project.Name)-Swift.h")]
class StartForeign
{
	// Simulator
	public static extern(!mobile) void Light()
    {
        debug_log("Not Implemented for simulator");
    }
	public static extern(!mobile) void Medium()
    {
        debug_log("Not Implemented for simulator");
    }
	public static extern(!mobile) void Heavy()
    {
        debug_log("Not Implemented for simulator");
    }

	// Android
    [Foreign(Language.Java)]
    public static extern(Android) void Light()
    @{
        android.util.Log.d("Not Implemented for Android");
    @}
    public static extern(Android) void Medium()
    @{
        android.util.Log.d("Not Implemented for Android");
    @}
    public static extern(Android) void Heavy()
    @{
        android.util.Log.d("Not Implemented for Android");
    @}

	// iOS
    [Foreign(Language.ObjC)]
    public static extern(iOS) void Light()
    @{
		Taptic* x = [[Taptic alloc] init];
		[x light];
    @}
    public static extern(iOS) void Medium()
    @{
		Taptic* x = [[Taptic alloc] init];
		[x medium];
    @}
    public static extern(iOS) void Heavy()
    @{
		Taptic* x = [[Taptic alloc] init];
		[x heavy];
    @}
}
