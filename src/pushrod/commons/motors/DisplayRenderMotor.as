package pushrod.commons.motors
{
	import pushrod.commons.parts.DisplayPart;
	import pushrod.commons.parts.XYPart;
	import pushrod.core.Crate;
	import pushrod.core.IMotor;
	
	
	public class DisplayRenderMotor implements IMotor
	{
		private var display:DisplayPart;
		private var position:XYPart;
		
		public function DisplayRenderMotor()
		{
		}
		
		public function update(crate:Crate):void
		{
			display = crate.getParts("display") as DisplayPart;
			position = crate.getParts("position") as XYPart;
			
			display.display.x = position.x;
			display.display.y = position.y;
		}
	}
}