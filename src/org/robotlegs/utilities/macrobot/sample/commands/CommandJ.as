/*
* Copyright (c) 2010 the original author or authors
* 
* Permission is hereby granted to use, modify, and distribute this file 
* in accordance with the terms of the license agreement accompanying it.
*/
package org.robotlegs.utilities.macrobot.sample.commands
{
	import org.robotlegs.utilities.macrobot.AsyncCommand;
	
	public class CommandJ extends AsyncCommand
	{
		override public function execute():void
		{
			trace('CommandJ complete.');
			dispatchComplete(true);
		}
	}
}