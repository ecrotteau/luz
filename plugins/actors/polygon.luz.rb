 ###############################################################################
 #  Copyright 2006 Ian McIntosh <ian@openanswers.org>
 #
 #  This program is free software; you can redistribute it and/or modify
 #  it under the terms of the GNU General Public License as published by
 #  the Free Software Foundation; either version 2 of the License, or
 #  (at your option) any later version.
 #
 #  This program is distributed in the hope that it will be useful,
 #  but WITHOUT ANY WARRANTY; without even the implied warranty of
 #  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 #  GNU Library General Public License for more details.
 #
 #  You should have received a copy of the GNU General Public License
 #  along with this program; if not, write to the Free Software
 #  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 ###############################################################################

class ActorPolygon < ActorShape
	title				"Polygon"
	description "An N-sided polygon with optional center cutout."

	setting 'sides', :integer, :range => 3..100, :default => 5..100, :breaks_cache => true
	setting 'cutout_size', :float, :range => 0.0..1.00, :default => 0.00..1.0, :breaks_cache => true

	cache_rendering

	def shape
		shape = [MyGL.Ring(RADIUS, sides)]
		shape << shape.first.dup.multiply_each(cutout_size) unless cutout_size == 0.0
		yield :shape => shape
	end
end
