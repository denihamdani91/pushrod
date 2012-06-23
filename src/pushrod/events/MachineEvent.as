package pushrod.events
{
	import pushrod.core.Crate;
	
	import starling.events.Event;
	
	public class MachineEvent extends Event
	{
		public static const DATA_TRANSFER:String = "datatransfer";
		
		public var data:Crate;
		
		public function MachineEvent(type:String, data:Crate=null, bubbles:Boolean=false)
		{
			super(type, bubbles);
			this.data = data;
		}
	}
}