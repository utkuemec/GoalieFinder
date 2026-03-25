export interface Field {
  name: string;
  address: string;
  lat: number;
  lng: number;
  type: 'Indoor' | 'Outdoor' | 'Indoor/Outdoor';
}

export interface City {
  id: string;
  name: string;
  province: string;
  lat: number;
  lng: number;
  fields: Field[];
}

export const CANADIAN_CITIES: City[] = [
  // ===================== ONTARIO =====================
  {
    id: 'toronto',
    name: 'Toronto',
    province: 'ON',
    lat: 43.6532,
    lng: -79.3832,
    fields: [
      { name: 'Central Tech Stadium', address: '725 Bathurst St, Toronto, ON', lat: 43.6629, lng: -79.4113, type: 'Outdoor' },
      { name: 'Central Tech Boarded', address: '725 Bathurst St, Toronto, ON', lat: 43.6625, lng: -79.4108, type: 'Outdoor' },
      { name: 'Canoe Landing Park', address: '95 Fort York Blvd, Toronto, ON', lat: 43.6388, lng: -79.3957, type: 'Outdoor' },
      { name: 'Cherry Beach Sports Fields', address: '1 Cherry St, Toronto, ON', lat: 43.6380, lng: -79.3524, type: 'Outdoor' },
      { name: 'Earlscourt Park', address: '1200 Lansdowne Ave, Toronto, ON', lat: 43.6795, lng: -79.4440, type: 'Outdoor' },
      { name: 'St. Patrick\'s', address: '131 McCaul St, Toronto, ON', lat: 43.6533, lng: -79.3918, type: 'Outdoor' },
      { name: 'Ballsports Pier', address: '215 Queens Quay W, Toronto, ON', lat: 43.6379, lng: -79.3823, type: 'Indoor' },
      { name: 'The Hangar', address: '50 Carl Hall Rd, Toronto, ON', lat: 43.7510, lng: -79.4698, type: 'Indoor' },
      { name: 'MLS Arena Scarborough', address: '45 Overlea Blvd, Scarborough, ON', lat: 43.7058, lng: -79.3230, type: 'Indoor' },
      { name: 'Scarborough Soccer Centre', address: '90 Bridlewood Blvd, Scarborough, ON', lat: 43.7890, lng: -79.2876, type: 'Indoor' },
      { name: 'Michael Power Field', address: '105 Eringate Dr, Etobicoke, ON', lat: 43.6480, lng: -79.5665, type: 'Outdoor' },
      { name: 'Prime Athletic Centre', address: '110 Ironside Cres, Etobicoke, ON', lat: 43.7436, lng: -79.5520, type: 'Indoor' },
      { name: 'Toronto Soccerplex', address: '100 Bethridge Rd, Etobicoke, ON', lat: 43.6896, lng: -79.5608, type: 'Indoor' },
      { name: 'Metro Golf Sportsplex', address: '2175 Victoria Park Ave, Toronto, ON', lat: 43.7439, lng: -79.3010, type: 'Indoor' },
      { name: 'Monarch Stadium', address: '115 Felstead Ave, Toronto, ON', lat: 43.6839, lng: -79.3372, type: 'Indoor/Outdoor' },
      { name: 'LCI Sports Centre', address: '5800 Sheppard Ave E, Scarborough, ON', lat: 43.7987, lng: -79.2050, type: 'Indoor/Outdoor' },
      { name: 'Lamport Stadium', address: '1155 King St W, Toronto, ON', lat: 43.6383, lng: -79.4213, type: 'Outdoor' },
      { name: 'Birchmount Stadium', address: '93 Birchmount Rd, Scarborough, ON', lat: 43.6945, lng: -79.2675, type: 'Outdoor' },
      { name: 'Downsview Park', address: '35 Carl Hall Rd, Toronto, ON', lat: 43.7515, lng: -79.4702, type: 'Outdoor' },
      { name: 'Esther Shiner Stadium', address: '24 Sheppard Ave E, Toronto, ON', lat: 43.7620, lng: -79.4100, type: 'Outdoor' },
    ],
  },
  {
    id: 'mississauga',
    name: 'Mississauga',
    province: 'ON',
    lat: 43.5890,
    lng: -79.6441,
    fields: [
      { name: 'Mississauga Stadium', address: '1975 Matheson Blvd E, Mississauga, ON', lat: 43.6226, lng: -79.6018, type: 'Indoor/Outdoor' },
      { name: 'United Soccer Centre', address: '1800 Sismet Rd, Mississauga, ON', lat: 43.6270, lng: -79.6180, type: 'Indoor' },
      { name: 'Invader Sportsplex', address: '801 Matheson Blvd W, Mississauga, ON', lat: 43.6094, lng: -79.6545, type: 'Indoor' },
      { name: 'Hershey Centre Fields', address: '5500 Rose Cherry Pl, Mississauga, ON', lat: 43.6126, lng: -79.6492, type: 'Indoor/Outdoor' },
      { name: 'Iceland Mississauga', address: '6325 Dixie Rd, Mississauga, ON', lat: 43.6440, lng: -79.5988, type: 'Indoor' },
    ],
  },
  {
    id: 'brampton',
    name: 'Brampton',
    province: 'ON',
    lat: 43.7315,
    lng: -79.7624,
    fields: [
      { name: 'Brampton Soccer Centre', address: '1495 Sandalwood Pkwy E, Brampton, ON', lat: 43.7524, lng: -79.7178, type: 'Indoor' },
      { name: 'Chris Gibson Recreation Centre', address: '125 McLaughlin Rd S, Brampton, ON', lat: 43.6724, lng: -79.7510, type: 'Indoor/Outdoor' },
      { name: 'Creditview Sandalwood Park', address: '10460 Creditview Rd, Brampton, ON', lat: 43.7564, lng: -79.7695, type: 'Outdoor' },
      { name: 'Gore Meadows Sports Complex', address: '10150 The Gore Rd, Brampton, ON', lat: 43.7890, lng: -79.6890, type: 'Indoor/Outdoor' },
    ],
  },
  {
    id: 'hamilton',
    name: 'Hamilton',
    province: 'ON',
    lat: 43.2557,
    lng: -79.8711,
    fields: [
      { name: 'Tim Hortons Field', address: '64 Melrose Ave N, Hamilton, ON', lat: 43.2531, lng: -79.8316, type: 'Outdoor' },
      { name: 'Redeemer Sports Complex', address: '777 Garner Rd E, Ancaster, ON', lat: 43.2127, lng: -79.9512, type: 'Indoor' },
      { name: 'Cardinal Newman Turf', address: '240 Albright Rd, Hamilton, ON', lat: 43.2238, lng: -79.8525, type: 'Outdoor' },
      { name: 'Mohawk Sports Park', address: '135 Emerson St, Hamilton, ON', lat: 43.2402, lng: -79.8827, type: 'Outdoor' },
    ],
  },
  {
    id: 'ottawa',
    name: 'Ottawa',
    province: 'ON',
    lat: 45.4215,
    lng: -75.6972,
    fields: [
      { name: 'Superdome East', address: '1660 Bearbrook Rd, Ottawa, ON', lat: 45.4530, lng: -75.5125, type: 'Indoor' },
      { name: 'Orleans Dome', address: '6401 Mer Bleue Rd, Ottawa, ON', lat: 45.4670, lng: -75.4885, type: 'Indoor' },
      { name: 'Millennium Sports Park', address: '1355 Windmill Ln, Ottawa, ON', lat: 45.3268, lng: -75.6614, type: 'Outdoor' },
      { name: 'Terry Fox Athletic Facility', address: '2780 Jim Durrell Dr, Ottawa, ON', lat: 45.3660, lng: -75.6178, type: 'Outdoor' },
      { name: 'Minto Field at Lansdowne', address: '1015 Bank St, Ottawa, ON', lat: 45.3982, lng: -75.6810, type: 'Outdoor' },
      { name: 'Louis Riel Dome', address: '1655 Bearbrook Rd, Gloucester, ON', lat: 45.4524, lng: -75.5140, type: 'Indoor' },
    ],
  },
  {
    id: 'markham',
    name: 'Markham',
    province: 'ON',
    lat: 43.8561,
    lng: -79.3370,
    fields: [
      { name: 'Markham Sports Dome', address: '155 Bullock Dr, Markham, ON', lat: 43.8760, lng: -79.2962, type: 'Indoor' },
      { name: 'Angus Glen Sports Complex', address: '3990 Bur Oak Ave, Markham, ON', lat: 43.8795, lng: -79.3203, type: 'Indoor/Outdoor' },
      { name: 'Rouge Park Soccer Fields', address: '1749 14th Ave, Markham, ON', lat: 43.8618, lng: -79.2573, type: 'Outdoor' },
    ],
  },
  {
    id: 'vaughan',
    name: 'Vaughan',
    province: 'ON',
    lat: 43.8361,
    lng: -79.4983,
    fields: [
      { name: 'BMO Training Ground', address: '7600 Martin Grove Rd, Vaughan, ON', lat: 43.7854, lng: -79.5832, type: 'Outdoor' },
      { name: 'Ontario Soccer Centre', address: '7601 Martin Grove Rd, Vaughan, ON', lat: 43.7868, lng: -79.5842, type: 'Indoor/Outdoor' },
      { name: 'Vaughan Sportsplex', address: '7601 Weston Rd, Vaughan, ON', lat: 43.8245, lng: -79.5422, type: 'Indoor' },
    ],
  },
  {
    id: 'kitchener',
    name: 'Kitchener-Waterloo',
    province: 'ON',
    lat: 43.4516,
    lng: -80.4925,
    fields: [
      { name: 'Rim Park Indoor', address: '2001 University Ave E, Waterloo, ON', lat: 43.4841, lng: -80.5070, type: 'Indoor/Outdoor' },
      { name: 'Activa Sportsplex', address: '135 Father David Bauer Dr, Waterloo, ON', lat: 43.4440, lng: -80.5542, type: 'Indoor' },
      { name: 'Breithaupt Park', address: '350 Margaret Ave, Kitchener, ON', lat: 43.4530, lng: -80.4790, type: 'Outdoor' },
      { name: 'McLennan Park', address: '1100 Doon Village Rd, Kitchener, ON', lat: 43.3975, lng: -80.4420, type: 'Outdoor' },
    ],
  },
  {
    id: 'london',
    name: 'London',
    province: 'ON',
    lat: 42.9849,
    lng: -81.2453,
    fields: [
      { name: 'Western Fair Sports Centre', address: '845 Florence St, London, ON', lat: 42.9980, lng: -81.2137, type: 'Indoor' },
      { name: 'BMO Centre', address: '295 Rectory St, London, ON', lat: 42.9665, lng: -81.2175, type: 'Indoor' },
      { name: 'Greenway Park', address: '255 Greenway Park Cres, London, ON', lat: 43.0120, lng: -81.2820, type: 'Outdoor' },
    ],
  },
  {
    id: 'milton',
    name: 'Milton',
    province: 'ON',
    lat: 43.5183,
    lng: -79.8774,
    fields: [
      { name: 'Milton Soccer Dome', address: '155 Bronte St S, Milton, ON', lat: 43.5073, lng: -79.8826, type: 'Indoor' },
      { name: 'Milton Sports Centre', address: '605 Santa Maria Blvd, Milton, ON', lat: 43.5210, lng: -79.8640, type: 'Indoor/Outdoor' },
    ],
  },

  // ===================== BRITISH COLUMBIA =====================
  {
    id: 'vancouver',
    name: 'Vancouver',
    province: 'BC',
    lat: 49.2827,
    lng: -123.1207,
    fields: [
      { name: 'Hillcrest Mini Turf Field', address: '4501 Clancy Loranger Way, Vancouver, BC', lat: 49.2438, lng: -123.1089, type: 'Outdoor' },
      { name: 'Jericho Turf', address: '1600 Discovery St, Vancouver, BC', lat: 49.2724, lng: -123.1972, type: 'Outdoor' },
      { name: 'Trillium Park Turf', address: '600 National Ave, Vancouver, BC', lat: 49.2690, lng: -123.0878, type: 'Outdoor' },
      { name: 'UBC Ken Woods Field', address: '2700 E Mall, Vancouver, BC', lat: 49.2579, lng: -123.2459, type: 'Outdoor' },
      { name: 'Memorial South Turf', address: '5950 Prince Albert St, Vancouver, BC', lat: 49.2381, lng: -123.0542, type: 'Outdoor' },
      { name: 'TOCA Soccer Centre', address: '1075 Roosevelt Cres, North Vancouver, BC', lat: 49.3105, lng: -123.0247, type: 'Indoor' },
      { name: 'Upland Sports Centre', address: '800 Hendry Ave, North Vancouver, BC', lat: 49.3191, lng: -123.0445, type: 'Indoor' },
    ],
  },
  {
    id: 'surrey',
    name: 'Surrey',
    province: 'BC',
    lat: 49.1913,
    lng: -122.8490,
    fields: [
      { name: 'BMO Coastal Soccer Centre', address: '2295 148 St, Surrey, BC', lat: 49.1658, lng: -122.8010, type: 'Indoor' },
      { name: 'Cloverdale Athletic Park', address: '6220 176 St, Surrey, BC', lat: 49.1038, lng: -122.7370, type: 'Outdoor' },
      { name: 'Newton Athletic Park', address: '7395 128 St, Surrey, BC', lat: 49.1412, lng: -122.8510, type: 'Outdoor' },
      { name: 'South Surrey Athletic Park', address: '14600 20 Ave, Surrey, BC', lat: 49.0507, lng: -122.8210, type: 'Outdoor' },
    ],
  },
  {
    id: 'richmond',
    name: 'Richmond',
    province: 'BC',
    lat: 49.1666,
    lng: -123.1336,
    fields: [
      { name: 'Full90 Soccer Centre', address: '5960 Minoru Blvd, Richmond, BC', lat: 49.1644, lng: -123.1364, type: 'Indoor' },
      { name: 'Hugh Boyd Park', address: '9191 Saunders Rd, Richmond, BC', lat: 49.1573, lng: -123.1656, type: 'Outdoor' },
      { name: 'Minoru Park', address: '7191 Granville Ave, Richmond, BC', lat: 49.1652, lng: -123.1360, type: 'Outdoor' },
    ],
  },

  // ===================== QUEBEC =====================
  {
    id: 'montreal',
    name: 'Montreal',
    province: 'QC',
    lat: 45.5017,
    lng: -73.5673,
    fields: [
      { name: 'Stade de Soccer de Montréal', address: '9235 Ave Papineau, Montréal, QC', lat: 45.5562, lng: -73.6254, type: 'Indoor/Outdoor' },
      { name: 'Socceroof Le Plateau', address: '5061 Rue Fullum, Montréal, QC', lat: 45.5322, lng: -73.5670, type: 'Indoor' },
      { name: 'Socceroof Hochelaga', address: '5498 Rue Hochelaga, Montréal, QC', lat: 45.5418, lng: -73.5459, type: 'Indoor' },
      { name: 'Parc Villeray', address: '8000 Rue de Normandville, Montréal, QC', lat: 45.5540, lng: -73.6220, type: 'Outdoor' },
      { name: 'Complexe Sportif Claude-Robillard', address: '1000 Ave Émile-Journault, Montréal, QC', lat: 45.5380, lng: -73.6360, type: 'Indoor/Outdoor' },
      { name: 'Centre Sportif de l\'UQAM', address: '1212 Rue Sanguinet, Montréal, QC', lat: 45.5140, lng: -73.5617, type: 'Indoor' },
      { name: 'Parc Jarry', address: '285 Rue Gary-Carter, Montréal, QC', lat: 45.5338, lng: -73.6305, type: 'Outdoor' },
    ],
  },
  {
    id: 'quebec-city',
    name: 'Quebec City',
    province: 'QC',
    lat: 46.8139,
    lng: -71.2080,
    fields: [
      { name: 'Stade Chauveau', address: '7200 Boul de la Colline, Québec, QC', lat: 46.8406, lng: -71.2955, type: 'Indoor/Outdoor' },
      { name: 'Stade TELUS-UL', address: '2300 Rue de la Terrasse, Québec, QC', lat: 46.7836, lng: -71.2736, type: 'Indoor/Outdoor' },
      { name: 'Complexe Enviro Loisirs', address: '2600 Ave Watt, Québec, QC', lat: 46.8290, lng: -71.3180, type: 'Indoor' },
    ],
  },

  // ===================== ALBERTA =====================
  {
    id: 'calgary',
    name: 'Calgary',
    province: 'AB',
    lat: 51.0447,
    lng: -114.0719,
    fields: [
      { name: 'Calgary Soccer Centre', address: '7000 48 St SE, Calgary, AB', lat: 50.9940, lng: -114.0297, type: 'Indoor/Outdoor' },
      { name: 'Accurate Fieldhouse', address: '5715 2 St SE, Calgary, AB', lat: 51.0112, lng: -114.0540, type: 'Indoor' },
      { name: 'Shouldice Athletic Park', address: '4612 Montalban Dr NW, Calgary, AB', lat: 51.0684, lng: -114.1520, type: 'Outdoor' },
      { name: 'Shouldice Dome', address: '4500 Montalban Dr NW, Calgary, AB', lat: 51.0690, lng: -114.1505, type: 'Indoor' },
      { name: 'Coyote Den', address: '6039 Centre St S, Calgary, AB', lat: 50.9861, lng: -114.0634, type: 'Indoor' },
      { name: 'Viper\'s Dome', address: '2010 35 Ave NE, Calgary, AB', lat: 51.0782, lng: -114.0218, type: 'Indoor' },
    ],
  },
  {
    id: 'edmonton',
    name: 'Edmonton',
    province: 'AB',
    lat: 53.5461,
    lng: -113.4938,
    fields: [
      { name: 'Edmonton Soccer Dome', address: '9303 34 Ave NW, Edmonton, AB', lat: 53.4793, lng: -113.4753, type: 'Indoor' },
      { name: 'Commonwealth Stadium', address: '11000 Stadium Rd, Edmonton, AB', lat: 53.5607, lng: -113.4744, type: 'Outdoor' },
      { name: 'Clarke Stadium', address: '11000 Stadium Rd, Edmonton, AB', lat: 53.5590, lng: -113.4710, type: 'Outdoor' },
      { name: 'Mill Creek Sports Park', address: '9555 84 Ave NW, Edmonton, AB', lat: 53.5200, lng: -113.4650, type: 'Outdoor' },
      { name: 'Clareview Recreation Centre', address: '3804 139 Ave NW, Edmonton, AB', lat: 53.6063, lng: -113.4570, type: 'Indoor' },
    ],
  },

  // ===================== MANITOBA =====================
  {
    id: 'winnipeg',
    name: 'Winnipeg',
    province: 'MB',
    lat: 49.8951,
    lng: -97.1384,
    fields: [
      { name: 'WSA Soccer Complex', address: '999 King Edward St, Winnipeg, MB', lat: 49.8816, lng: -97.1863, type: 'Indoor/Outdoor' },
      { name: 'Winnipeg Soccer Federation Complex', address: '930 Waverley St, Winnipeg, MB', lat: 49.8380, lng: -97.1521, type: 'Indoor/Outdoor' },
      { name: 'Investors Group Field', address: '315 Chancellor Matheson Rd, Winnipeg, MB', lat: 49.8075, lng: -97.1396, type: 'Outdoor' },
      { name: 'Ralph Chicken Sports Complex', address: '535 Chicken Rd, Winnipeg, MB', lat: 49.9330, lng: -97.0410, type: 'Outdoor' },
    ],
  },

  // ===================== SASKATCHEWAN =====================
  {
    id: 'saskatoon',
    name: 'Saskatoon',
    province: 'SK',
    lat: 52.1332,
    lng: -106.6700,
    fields: [
      { name: 'SaskTel Sports Centre', address: '110 Leisure Lane, Saskatoon, SK', lat: 52.1072, lng: -106.6930, type: 'Indoor' },
      { name: 'Gordie Chicken Sports Park', address: '3900 Chicken Rd, Saskatoon, SK', lat: 52.1045, lng: -106.6960, type: 'Outdoor' },
      { name: 'Griffiths Stadium', address: '2020 College Dr, Saskatoon, SK', lat: 52.1296, lng: -106.6340, type: 'Outdoor' },
    ],
  },

  // ===================== NOVA SCOTIA =====================
  {
    id: 'halifax',
    name: 'Halifax',
    province: 'NS',
    lat: 44.6488,
    lng: -63.5752,
    fields: [
      { name: 'BMO Soccer Centre', address: '920 Cole Harbour Rd, Dartmouth, NS', lat: 44.6560, lng: -63.5040, type: 'Indoor' },
      { name: 'Mainland Common', address: '30 Pebblecreek Dr, Halifax, NS', lat: 44.6485, lng: -63.6340, type: 'Outdoor' },
      { name: 'Wanderers Grounds', address: '1131 South Park St, Halifax, NS', lat: 44.6371, lng: -63.5765, type: 'Outdoor' },
      { name: 'Halifax Forum', address: '2901 Windsor St, Halifax, NS', lat: 44.6550, lng: -63.5976, type: 'Indoor' },
    ],
  },

  // ===================== NEW BRUNSWICK =====================
  {
    id: 'moncton',
    name: 'Moncton',
    province: 'NB',
    lat: 46.0878,
    lng: -64.7782,
    fields: [
      { name: 'CN Sportsplex', address: '55 Mark Ave, Moncton, NB', lat: 46.0862, lng: -64.7670, type: 'Indoor' },
      { name: 'Moncton Stadium', address: '170 Main St, Moncton, NB', lat: 46.0904, lng: -64.7736, type: 'Outdoor' },
    ],
  },
];

export function getCityById(id: string): City | undefined {
  return CANADIAN_CITIES.find((c) => c.id === id);
}

export function getProvinces(): string[] {
  return [...new Set(CANADIAN_CITIES.map((c) => c.province))].sort();
}

export function getCitiesByProvince(province: string): City[] {
  return CANADIAN_CITIES.filter((c) => c.province === province);
}
