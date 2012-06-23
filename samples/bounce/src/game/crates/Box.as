package game.crates
{
	import game.motors.BounceMotor;
	
	import pushrod.commons.motors.DisplayRenderMotor;
	import pushrod.commons.parts.DisplayPart;
	import pushrod.commons.parts.XYPart;
	import pushrod.core.Crate;
	import pushrod.core.Machine;
	
	import starling.display.Quad;
	
	public class Box extends Crate
	{
		public function Box()
		{
			super();
		}
		
		public override function init():void
		{
			addParts("display", new DisplayPart(new Quad(100,100,Math.random()*0xffffff)));
			addParts("position", new XYPart(Math.random()*540, Math.random()*380));
			addParts("state", new XYPart(1,1));
			setProcedure([BounceMotor, DisplayRenderMotor]);
		}
		public override function adding(machine:Machine):void
		{
			super.adding(machine);
			
			machine.target.addChild((getParts("display") as DisplayPart).display);
		}
		public override function dispose():void
		{
			machine.target.removeChild((getParts("display") as DisplayPart).display);
			
			super.dispose();
		}
	}
}