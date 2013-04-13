package  {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.display.Stage;
	import flash.geom.Point;
	import flash.text.TextField;
	
	public class Game extends MovieClip{
		public static const SPEED_INCREMENT:Number = 1;
		private var _bg:Background;
		private var _net:Net;
		private var _scoreHud:ScoreHud;
		private var _p1:Paddle;
		private var _p2:Paddle;
		private var _ball:Ball;
		private var _score:Object;
		private var _singlePlayer:Boolean;
		
		private var _speed:uint = 4;
		
		public function Game() {
			// constructor code
			_bg = new Background();
			addChild(_bg);
			
			_net = new Net();
			addChild(_net);
			
			_scoreHud = new ScoreHud();
			_scoreHud.x = 0;
			_scoreHud.y = 0;
			addChild(_scoreHud);
			
			_p1 = new Paddle(0, Main.HEIGHT);
			_p1.x = 0;
			_p1.y = Main.HEIGHT / 2 - _p1.height / 2;
			addChild(_p1);
			
			_p2 = new Paddle(0, Main.HEIGHT, true);
			_p2.x = Main.WIDTH - _p2.width;
			_p2.y = Main.HEIGHT / 2 - _p2.height / 2;
			addChild(_p2);
			
			_ball = new Ball();
			_ball.x = Main.WIDTH / 2 - _ball.width / 2;
			_ball.y = Main.HEIGHT / 2 - _ball.height / 2;
			addChild(_ball);
			
			_score = new Object();
			_score.p1 = 0;
			_score.p2 = 0;
			
			resetGame();
		}
		
		private function resetGame():void
		{
			_score.p1 = 0;
			_score.p2 = 0;
			serve();
		}
		
		private function serve():void
		{
			_p2.targetOffset = Helpers.randomMinMax(_ball.height / 2, _p2.height + _ball.height / 2);
			_scoreHud.setScore(_score.p1, _score.p2);
			if (_score.p1 > 10 || _score.p2 > 10) {
				resetGame();
			}
			_speed = 4;
			_ball.reset(Main.WIDTH / 2 - _ball.width / 2, Main.HEIGHT / 2 - _ball.height / 2);
		}
		
		public function update(e:Event):void
		{
			_ball.update(e);
			_p1.update(e);
			_p2.target = new Point(_p2.x, _ball.y + _ball.height/2);
			_p2.update(e);
			
			var distance:Number = 0;
			var ratio:Number = 0;
			if (_ball.x < _p1.x + _p1.width && _ball.y + _ball.height > _p1.y && _ball.y < _p1.y + _p1.height)
			{
				_speed++;
				_ball.vx = _speed;
				
				distance = (_ball.y + _ball.height / 2) - (_p1.y + _p1.height / 2);
				ratio = distance / (_p1.height / 2);
				_ball.vy = _ball.vx * ratio;
				
				_p2.targetOffset = Helpers.randomMinMax(_ball.height / 2, _p2.height + _ball.height / 2);
			}
			if (_ball.x + _ball.width > _p2.x &&  _ball.y + _ball.height > _p2.y && _ball.y < _p2.y + _p2.height)
			{
				_speed ++;
				_ball.vx = _speed * -1;
				
				distance = (_ball.y + _ball.height / 2) - (_p2.y + _p2.height / 2);
				ratio = distance / (_p2.height / 2);
				_ball.vy = _ball.vx * ratio;
			}
			if (_ball.y < 0 || _ball.y + _ball.height > Main.HEIGHT)
			{
				_ball.vy *= -1;
			}
			
			if (_ball.x + _ball.width < 0) {
				_score.p2 ++;
				serve();
			}
			if (_ball.x > Main.WIDTH) {
				_score.p1 ++;
				serve();
			}
		}
		
		public function handleKeyDown(e:KeyboardEvent):void
		{
			switch(e.keyCode){
				case 38:
					_p1.moveUp = true;
					break;
				case 40: 
					_p1.moveDown = true;
					break;
			}
		}
		
		public function handleKeyUp(e:KeyboardEvent):void
		{
			switch(e.keyCode){
				case 38:
					_p1.moveUp = false;
					break;
				case 40: 
					_p1.moveDown = false;
					break;
			}
		}

	}
	
}
