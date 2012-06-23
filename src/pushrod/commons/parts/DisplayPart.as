package pushrod.commons.parts
{
	import pushrod.core.IPart;
	
	import starling.display.DisplayObject;
	
	public class DisplayPart implements IPart
	{
		public var display:DisplayObject;
		
		public function DisplayPart(display:DisplayObject=null)
		{
			this.display = display;
		}
	}
}