package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import menu.Menu;
	
	/**
	 * ...
	 * @author Brian Shantz
	 */
	[SWF(width='640', height='480', backgroundColor='#ffffff', frameRate='30')]
	public class Main extends Sprite 
	{
		public static const WIDTH:Number = 640;
		public static const HEIGHT:Number = 480;
		
		private var _game:Game;
		private var _startMenu:Menu;
		private var _endMenu:Menu;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			//_game = new Game();
			//addChild(_game);
			this.graphics.beginFill(0x000000);
			this.graphics.drawRect(0, 0, Main.WIDTH, Main.HEIGHT);
			this.graphics.endFill();
			
			_startMenu = new Menu("PONG", "pong!", "PLAY");
			_startMenu.x = Main.WIDTH / 2 - _startMenu.width / 2;
			_startMenu.y = Main.HEIGHT / 2 - _startMenu.height / 2;
			addChild(_startMenu);
			
			addEventListener(Event.ENTER_FRAME, update, false, 0, true);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, handleKeyDown, false, 0, true);
			stage.addEventListener(KeyboardEvent.KEY_UP, handleKeyUp, false, 0, true);
			
			_startMenu.addEventListener("play_game", startGame);
		}
		
		private function startGame(e:Event):void
		{
			_startMenu.removeEventListener("play_game", startGame);
			removeChild(_startMenu);
			
			_game = new Game();
			addChild(_game);
		}
		
		private function update(e:Event):void
		{
			if (_game) {
				_game.update(e);
			}
			
		}
		
		private function handleKeyDown(e:KeyboardEvent):void
		{
			if (_game) {
				_game.handleKeyDown(e);
			}	
		}
		
		private function handleKeyUp(e:KeyboardEvent):void
		{
			if (_game) {
				_game.handleKeyUp(e);
			}
		}
		
	}
	
}