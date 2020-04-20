void() bubble_touch = {

	//other = toucher
	//self = bubble
	//self.owner = touchee

	if(other == self.owner){

		return;

	}

	if(other.flags & FL_MONSTER){

		local float skilllevel;
		skilllevel = skill + 1;

		T_Damage(self.owner, self, self, skilllevel*25);

	}else if(other.classname == "player"){

		local float skilllevel;
		skilllevel = skill + 1;

		T_Damage(self.owner, self, self, skilllevel*25);
		T_Damage(other, self, self, skilllevel*25);

	}

}

void() makebubble = {

	local entity tbubble;
	tbubble = spawn();
	tbubble.classname = "socialdistance";
	tbubble.solid = SOLID_TRIGGER;
	setmodel(tbubble, "progs/eyes.mdl");
	tbubble.movetype = MOVETYPE_FLY;
	tbubble.modelindex = 0;
	tbubble.model = "";
	tbubble.owner = self;
	tbubble.origin = self.origin;
	tbubble.touch = bubble_touch;
	setsize(tbubble, '0 0 0', '112 112 112');
	self.bubble = tbubble;

}
