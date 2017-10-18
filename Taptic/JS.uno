using Fuse;
using Fuse.Scripting;
using Uno.UX;
using Uno.Compiler.ExportTargetInterop;

[UXGlobalModule]
public class FeedbackModule : NativeModule
{
	static readonly FeedbackModule _instance;
	public FeedbackModule()
	{
		if (_instance != null) return;
		_instance = this;
		Resource.SetGlobalKey(_instance, "FeedbackModule");
		AddMember(new NativeFunction("Raise", (NativeCallback)Raise));
	}

	static object Raise(Context c, object[] args)
	{
		foreach (var arg in args)
            if (arg.Equals("Light")){
				StartForeign.Light();
			} else if (arg.Equals("Medium")){
				StartForeign.Medium();
			} else if (arg.Equals("Heavy")){
				StartForeign.Heavy();
			} else if (arg.Equals("Success")){
				StartForeign.Success();
			} else if (arg.Equals("Error")){
				StartForeign.Error();
			} else if (arg.Equals("Warning")){
				StartForeign.Warning();
			} else {
				debug_log("Error. Something is wrong with the argument.");
			}
		return null;
	}
}

[ForeignInclude(Language.ObjC, "@(Project.Name)-Swift.h")]
class StartForeign
{
	// Simulator
	public static extern(!mobile) void Light()
	{
		debug_log("Light Feedback Received!");
	}
	public static extern(!mobile) void Medium()
	{
		debug_log("Medium Feedback Received!");
	}
	public static extern(!mobile) void Heavy()
	{
		debug_log("Heavy Feedback Received!");
	}
	public static extern(!mobile) void Success()
	{
		debug_log("Success Feedback Received!");
	}
	public static extern(!mobile) void Error()
	{
		debug_log("Error Feedback Received!");
	}
	public static extern(!mobile) void Success()
	{
		debug_log("Success Feedback Received!");
	}

	// Android
	[Foreign(Language.Java)]
	public static extern(Android) void Light()
	@{
		android.util.Log.d("Not (yet) Implemented for Android");
	@}
	public static extern(Android) void Medium()
	@{
		android.util.Log.d("Not (yet) Implemented for Android");
	@}
	public static extern(Android) void Heavy()
	@{
		android.util.Log.d("Not (yet) Implemented for Android");
	@}
	public static extern(Android) void Success()
	@{
		android.util.Log.d("Not (yet) Implemented for Android");
	@}
	public static extern(Android) void Error()
	@{
		android.util.Log.d("Not (yet) Implemented for Android");
	@}
	public static extern(Android) void Warning()
	@{
		android.util.Log.d("Not (yet) Implemented for Android");
	@}

	// iOS
	[Foreign(Language.ObjC)]
	public static extern(iOS) void Light()
	@{
		Impact* x = [[Impact alloc] init];
		[x light];
	@}
	public static extern(iOS) void Medium()
	@{
		Impact* x = [[Impact alloc] init];
		[x medium];
	@}
	public static extern(iOS) void Heavy()
	@{
		Impact* x = [[Impact alloc] init];
		[x heavy];
	@}
	public static extern(iOS) void Success()
	@{
		Notification* x = [[Notification alloc] init];
		[x success];
	@}
	public static extern(iOS) void Error()
	@{
		Notification* x = [[Notification alloc] init];
		[x error];
	@}
	public static extern(iOS) void Warning()
	@{
		Notification* x = [[Notification alloc] init];
		[x warning];
	@}
}
