package demo;
import demo.components.CPRenderSystem;
import demo.components.PositionComponent;
import demo.components.TilesheetRenderableComponent;
import demo.systems.BulletSystem;
import demo.systems.CatSystem;
import demo.systems.ShipSystem;
import demo.systems.TilesheetRendererSystem;
import nme.display.DisplayObjectContainer;
import nme.display.Sprite;
import nme.events.Event;
import se.salomonsson.ent.Core;
import se.salomonsson.game.systems.KeyboardInputSystem;
import se.salomonsson.game.systems.PlaySoundSystem;

/**
 * ...
 * @author Tommislav
 */

class DemoMain 
{
	private var holder:Sprite;
	private var core:Core;
	
	
	
	public function new(holder:Sprite) 
	{
		this.holder = holder;
		core = new Core();
		
		//core.addSystem(new TilesheetRendererSystem(this.holder), 9);
		core.addSystem(new CPRenderSystem(), 9);
		core.addSystem(new PlaySoundSystem(), 9);
		core.addSystem(new CatSystem(), 2);
		core.addSystem(new ShipSystem(), 2);
		core.addSystem(new BulletSystem(), 2);
		core.addSystem(new KeyboardInputSystem(), 0);
		
		//core.getEntManager().allocateEntity().addComponent(new PositionComponent(2.0, 5.0)).addComponent(new TilesheetRenderableComponent(SpriteId.SHIP));
		//core.getEntManager().allocateEntity().addComponent(new PositionComponent(100.0, 120.0)).addComponent(new TilesheetRenderableComponent(SpriteId.SHIP));
		//core.getEntManager().allocateEntity().addComponent(new PositionComponent(300.0, 220.0)).addComponent(new TilesheetRenderableComponent(SpriteId.CAT));
		
		holder.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		
	}
	
	private function onEnterFrame(e:Event):Void 
	{
		core.tick();
	}
	
}