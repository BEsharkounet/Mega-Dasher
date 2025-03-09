using Godot;

public partial class SplashScreen : Control
{
	#region private properties
	private AnimationPlayer _animationPlayer;
	private Timer _timer;
	private Node _sceneManager;
	private Variant _optionsOut;
	private Variant _optionsIn;
	private Variant _optionsGeneral;
	private AudioStreamPlayer _sound;
	#endregion
	
	#region public properties
	[Export]
	public float logoDisplayTime = 0.8f;
	[Export]
	public float fadeOutSpeed = 0.8f;
	#endregion

	#region overrides
	public override void _Ready(){
		base._Ready();
		
		PrepareSceneTransition();
		GetNodes();
		LinkSignals();
		StartAnimation();
		PlaySound();
	}
	#endregion

	#region signals
	// start screen transition to open next scene
	private void EndScreen()
	{
		_sceneManager.Call("change_scene", "Menu", _optionsOut, _optionsIn, _optionsGeneral);
	}

	// start a timer after logo animation to let the user see the logo
	private void StartTimer(string animationName)
	{
		_timer.Start(logoDisplayTime);
	}

	#endregion
	
	#region private methods

	private void PlaySound()
	{
		_sound.Play();
	}
	
	private void PrepareSceneTransition()
	{
		GetSceneManager();
		GetOptions();
	}

	private void GetOptions()
	{
		_optionsOut = _sceneManager.Call("create_options", 0.7f, "vertical", 0.5f, false);
		_optionsIn = _sceneManager.Call("create_options", 0.7f, "vertical", 0.5f, false);
		_optionsGeneral = _sceneManager.Call("create_general_options", new Color("#E8B88F"), 0.0f, false, true);
	}

	private void GetSceneManager()
	{
		// Get SceneManager reference
		_sceneManager = GetNode("/root/SceneManager");
	}

	private void LinkSignals()
	{
		_timer.Connect("timeout", new Callable(this, nameof(EndScreen)));
		_animationPlayer.Connect("animation_finished", new Callable(this, nameof(StartTimer)));
	}

	private void StartAnimation()
	{
		_animationPlayer.Play("DisplayLogo");
	}

	
	private void GetNodes()
	{
		_animationPlayer = GetNode<AnimationPlayer>("AnimationPlayer");
		_timer = GetNode<Timer>("Timer");
		_sound = GetNode<AudioStreamPlayer>("Sound");
	}
	
	#endregion
}
