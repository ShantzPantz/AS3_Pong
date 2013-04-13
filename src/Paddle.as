package  {
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	public class Paddle extends MovieClip{
		public static const PADDLE_WIDTH:int = 20;
		public static const PADDLE_HEIGHT:int = 100;
		public static const PADDLE_SPEED:Number = 10;
		public static const CPU_SPEED:Number = 6;
		
		public var moveUp:Boolean = false;
		public var moveDown:Boolean = false;
		
		private var _minY:Number;
		private var _maxY:Number;
		
		private var _isCpu:Boolean;
		private var _target:Point;
		private var _targetOffset:Number = 0;

		
		public function Paddle(minY:Number = 0, maxY:Number = 0, cpu:Boolean = false) {
			// constructor code
			_minY = minY;
			_maxY = maxY;
			_isCpu = cpu;
			_target = null;
			
			this.graphics.beginFill(0xFFFFFF);
			this.graphics.drawRect(0, 0, PADDLE_WIDTH, PADDLE_HEIGHT);
			this.graphics.endFill();
		}
		
		public function update(e:Event):void
		{
			if (_isCpu && _target) {
				if (this.y < target.y ) {
					if (target.y - this.y < CPU_SPEED) {
						this.y = target.y;
					}else {
						this.y += CPU_SPEED;
					}	
				} else if (this.y > target.y) {
					if (this.y - target.y < CPU_SPEED) {
						this.y = target.y;
					}else {
						this.y -= CPU_SPEED;
					}	
				}
			}else {
				if (moveUp) {
					this.y -= PADDLE_SPEED;
				}
				if (moveDown) {
					this.y += PADDLE_SPEED;
				}
			}
			
			if (this.y + this.height > _maxY) {
				this.y = _maxY - this.height;
			}
			if (this.y < _minY) {
				this.y = _minY;
			}
		}
		
		public function set target(p:Point):void
		{
			_target = p;
		}
		
		public function get target():Point
		{
			return new Point(_target.x, _target.y - _targetOffset);
		}
		
		public function set targetOffset(n:Number):void
		{
			_targetOffset = n;
		}
	}
	
}
