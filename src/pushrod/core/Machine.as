package pushrod.core
{
	import org.as3commons.collections.ArrayList;
	import org.as3commons.collections.Map;
	import org.as3commons.collections.framework.core.ArrayListIterator;
	
	import pushrod.events.MachineEvent;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	import starling.events.EventDispatcher;
	import starling.events.KeyboardEvent;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	
	public class Machine extends EventDispatcher
	{
		private var _target:Sprite;
		
		private var _crate:ArrayList;
		private var _motor:Map;
		private var i_crate:ArrayListIterator;
		
		private var _key:Vector.<Boolean>;
		private var _targetTouch:Touch;
		private var _currentTouch:Touch;
		
		private var _gameData:Crate;
		
		// iterators
		private var i:uint;
		
		public function Machine(target:Sprite)
		{
			super();
			
			_target = target;
			_crate = new ArrayList();
			_motor = new Map();
			
			generateKey();
			init();
		}
		
		public function init():void
		{
			
		}
		
		public final function get target():Sprite
		{
			return _target;
		}
		
		public final function addCrate(crate:Crate, toUpdate:Boolean=false):void
		{
			var proced:Array = crate.getProcedure();
			var cProced:Class;
			
			for (i = 0; i < proced.length; i++) {
				cProced = proced[i] as Class;
				if (_motor.itemFor(cProced) == null) _motor.add(cProced, new cProced());
			}
			
			crate.adding(this);
			_crate.add(crate);
			
			if (toUpdate) crateUpdate(crate);
		}

		public final function removeCrate(crate:Crate):void
		{
			_crate.remove(crate);
			crate.dispose();
		}
		
		public final function setGameData(data:Crate):void
		{
			_gameData = data;
		}
		
		public final function get gameData():Crate
		{
			return _gameData;
		}
		
		public final function dispose():void
		{
			stop();
			
			i_crate = _crate.iterator() as ArrayListIterator;
			
			while (i_crate.hasNext()) {
				(i_crate.next() as Crate).dispose();
			}
			
			_motor.clear();
			_crate.clear();
		}

		public final function start():void
		{
			update();
			
			_target.addEventListener(EnterFrameEvent.ENTER_FRAME, update);
			_target.addEventListener(KeyboardEvent.KEY_DOWN, onKey);
			_target.addEventListener(KeyboardEvent.KEY_UP, onKey);
			_target.addEventListener(TouchEvent.TOUCH, onTouch);
		}
		
		public final function stop():void 
		{
			_target.removeEventListener(EnterFrameEvent.ENTER_FRAME, update);
			_target.removeEventListener(KeyboardEvent.KEY_DOWN, onKey);
			_target.removeEventListener(KeyboardEvent.KEY_UP, onKey);
			_target.removeEventListener(TouchEvent.TOUCH, onTouch);
		}
		
		public final function reset():void
		{
			dispose();
			init();
			start();
		}
		
		private function generateKey():void {
			_key = new Vector.<Boolean>(256, true);
			
			for (i = 0; i < 256; i++) {
				_key[i] = false;
			}
		}
		
		private function onKey(e:KeyboardEvent):void
		{
			switch (e.type) {
				case KeyboardEvent.KEY_DOWN: _key[e.keyCode] = true; break;
				case KeyboardEvent.KEY_UP: _key[e.keyCode] = false; break;
			}
		}
		
		private function onTouch(e:TouchEvent):void
		{
			_targetTouch = e.getTouch(e.target as DisplayObject) as Touch;
			_currentTouch = e.getTouch(e.currentTarget as DisplayObject) as Touch;
		}
		
		private function update(e:EnterFrameEvent=null):void
		{
			if (_gameData != null) crateUpdate(_gameData);
			
			i_crate = _crate.iterator() as ArrayListIterator;
			while (i_crate.hasNext()) {
				crateUpdate(i_crate.next() as Crate);
			}
		}
		
		private function crateUpdate(crate:Crate):void
		{
			var pro:Array = crate.getProcedure();
			var cla:Class;
			var mot:IMotor;
			
			for (i = 0; i < pro.length; i++) {
				cla = pro[i] as Class;
				mot = _motor.itemFor(cla) as IMotor;
				mot.update(crate);
			}
			
			pro.splice(0);
			pro = null;
		}

	}
}