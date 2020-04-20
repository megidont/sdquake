void() bubble_touch = {

	//other = toucher
	//self = bubble
	//self.owner = touchee

	if(other == self.owner){

		return;

	}

	if((other.flags & FL_MONSTER) || (other.classname == "player")){

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

	local vector tempsize;
	local vector negtempsize;

	tempsize_x = self.size_x/2;
	tempsize_y = self.size_y/2;
	tempsize_z = self.size_z/2;
	tempsize_x = tempsize_x + 56;
	tempsize_y = tempsize_y + 56;
	tempsize_z = tempsize_z + 56;

	negtempsize_x = tempsize_x * -1;
	negtempsize_y = tempsize_y * -1;
	negtempsize_z = tempsize_z * -1;

	setsize(tbubble, negtempsize, tempsize);
	self.bubble = tbubble;

}

void() updatebubble = {

	self.bubble.origin = self.origin;

}

void() removebubble = {

	remove(self.bubble);

}
