package  
{
	import flash.events.Event;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Brian Shantz
	 */
	public class CpuPaddle extends Paddle 
	{
		private var _target:Point;
		private var _targetOffset:Number = 0;
		
		public function CpuPaddle() 
		{
			super();
		}
		
		override public function update(e:Event):void
		{
			
			if (_target) {
				if (this.y + 10 < _target.y) {
					this.y += PADDLE_SPEED;
				} else if (this.y + PADDLE_HEIGHT - 10 > _target.y) {
					this.y -= PADDLE_SPEED;
				}
			}
			
			/*
			if (_target) {
				this.y = _target.y - this.height/2;
			}
			*/
		}
		
		public function set target(p:Point):void {
			_target = p;
		}
		public function get target():Point {
			return _target;
		}
		
	}

}