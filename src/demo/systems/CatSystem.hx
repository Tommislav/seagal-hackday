package demo.systems;
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

class CatSystem extends Sys
{

	override public function tick(gt:GameTime):Void 
	{
		var allCats = em().getEWC([CatComponent]);
		var numCats:Int = 20;
		
		if (allCats.length < numCats) {
			em().allocateEntity()
				.addComponent(new PositionComponent(Math.random() * 540 + 200, 480))
				.addComponent(new TilesheetRenderableComponent(SpriteId.CAT))
				.addComponent(new CatComponent(-Math.random()*2 + 0.2));
		}
		
		for (i in 0...allCats.length) {
			var cat:EW = allCats[i];
			var pos:PositionComponent = cat.comp(PositionComponent);
			
			pos.y += cat.comp(CatComponent).fallSpeed;
			
			if (pos.y < -69 || pos.y > 481)
				em().destroyEntity(cat.getEntity());
		}
	}
	
}