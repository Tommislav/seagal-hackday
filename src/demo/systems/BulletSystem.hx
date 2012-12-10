package demo.systems;
import demo.components.BulletComponent;
import demo.components.CatComponent;
import demo.components.PositionComponent;
import demo.components.TilesheetRenderableComponent;
import demo.SpriteId;
import se.salomonsson.ent.EW;
import se.salomonsson.ent.GameTime;
import se.salomonsson.ent.Sys;

/**
 * ...
 * @author Tommislav
 */

class BulletSystem extends Sys
{	
	
	override public function tick(gt:GameTime):Void 
	{
		var bullets = em().getEWC([BulletComponent]);
		if (bullets.length == 0)
			return;
			
		for (i in 0...bullets.length) {
			var bullet:EW = bullets[i];
			
			bullet.comp(PositionComponent).x += 6;
			
			if (checkCollision(bullet) || bulletLeftScreen(bullet)) {
				em().destroyEntity(bullet.getEntity());
			}
			
		}
	}
	
	
	
	private function checkCollision(bullet:EW):Bool
	{
		var myPos:PositionComponent = bullet.comp(PositionComponent);
		
		var allCats:Array<EW> = em().getEWC([CatComponent]);
		for (i in 0...allCats.length) {
			var cat:EW = allCats[i];
			
			var catPos:PositionComponent = cat.comp(PositionComponent);
			
			if (myPos.x > (catPos.x + 10) && myPos.x < catPos.x + 35) {
				if (myPos.y > (catPos.y + 5) && myPos.y < catPos.y + 60) {
					
					if (cat.comp(CatComponent).alive) {
						
						cat.comp(CatComponent).alive = false;
						cat.comp(TilesheetRenderableComponent).tileId = SpriteId.CAT_FALLING;
						cat.comp(CatComponent).fallSpeed = 4;
						catPos.y += 46; // offset for gfx
					}
					
					return true;
				}
			}
		}
		
		return false;
	}
	
	private function bulletLeftScreen(bullet:EW):Bool
	{
		return (bullet.comp(PositionComponent).x > 800);
	}
}