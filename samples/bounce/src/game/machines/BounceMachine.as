package game.machines
{
	import game.crates.BoxDel;
	import game.crates.BoxGen;
	
	import pushrod.core.Machine;
	
	import starling.display.Sprite;
	
	public class BounceMachine extends Machine
	{
		public function BounceMachine(target:Sprite)
		{
			super(target);
		}
		public override function init():void
		{
			addCrate(new BoxGen());
			addCrate(new BoxDel());
		}
	}
}