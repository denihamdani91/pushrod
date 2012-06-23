package pushrod.core
{
	import org.as3commons.collections.ArrayList;
	import org.as3commons.collections.Map;
	import org.as3commons.collections.utils.Lists;

	public class Crate
	{
		private var _part:Map;
		private var _procedure:ArrayList;
		private var _machine:Machine;
		
		public function Crate()
		{
			_part = new Map();
			_procedure = new ArrayList();
			
			init();
		}
		
		public function init():void {}
		
		public function get machine():Machine
		{
			return _machine;
		}
		
		public function adding(machine:Machine):void
		{
			_machine = machine;
		}
		
		public function dispose():void
		{
			_part.clear();
			_procedure.clear();
			_machine = null;
			
			// oevrride here...
		}
		
		public final function setProcedure(motor:Array):void
		{
			Lists.addFromArray(_procedure, motor);
		}
		
		public final function getProcedure():Array
		{
			return _procedure.toArray();
		}

		public final function addParts(name:String, part:IPart):void
		{
			_part.add(name, part);
		}
		
		public final function getParts(name:String):IPart
		{
			return _part.itemFor(name) as IPart;
		}
	}
}