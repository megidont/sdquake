void() updatebubble = {

	local entity bubble;

	bubble = findradius(self.origin, self.size_x + 112);

	while(bubble){

		if((bubble.flags & FL_MONSTER) || (bubble.classname == "player") && (bubble != self)){

			local float skilllevel;

			local string ocname;

			ocname = self.classname;
			self.classname = "bubble";

			skilllevel = skill + 1;

			T_Damage(self, self, self, skilllevel*25);
			T_Damage(bubble, self, self, skilllevel*25);

			self.classname = ocname;

		}

		bubble = bubble.chain;

	}

//	self.bubble.origin = self.origin;

}
