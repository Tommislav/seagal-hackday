package demo.components;
import se.salomonsson.ent.IComponent;

/**
 * ...
 * @author Tommislav
 */

class TilesheetRenderableComponent implements IComponent
{
	public var tileId:Float;
	
	public function new(startId:Float) {
		this.tileId = startId;
	}
	
	
}