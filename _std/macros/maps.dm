
/// Given a map type, returns true if it is that map.
#define ismap(x) (map_setting == x)

#ifdef UNDERWATER_MAP //should this be using z level defines? maybe not
#define isrestrictedz(z) ((z) == 2 || (z) == 3  || (z) == 4)
#define isghostrestrictedz(z) (isrestrictedz(z) || (z) == 5)
#else
#define isrestrictedz(z) ((z) == 2 || (z) == 4)
#define isghostrestrictedz(z) (isrestrictedz(z))
#endif

#define inrestrictedz(thing) (isnull(get_step(thing, 0)) ? FALSE : isrestrictedz(get_step(thing, 0):z))
#define inunrestrictedz(thing) (isnull(get_step(thing, 0)) ? FALSE : !isrestrictedz(get_step(thing, 0):z))

/// Returns true if the atom is inside of centcom
#define in_centcom(x) (isarea(x) ? (x?:is_centcom) : (get_step(x, 0)?.loc:is_centcom))

/// areas where we will skip searching for shit like APCs and that do not have innate power
#define area_space_nopower(x) (x.type == /area/space || x.type == /area/allowGenerate || x.type == /area/allowGenerate/trench)
