const List<Map<String, dynamic>> mockSportsResponse = [
  {
    'key': 'basketball_nba',
    'group': 'Basketball',
    'title': 'NBA',
    'description': 'US Basketball',
    'active': true,
    'has_outrights': true,
  },
  {
    'key': 'americanfootball_nfl',
    'group': 'American Football',
    'title': 'NFL',
    'description': 'US Football',
    'active': true,
    'has_outrights': false,
  },
  {
    'key': 'baseball_mlb',
    'group': 'Baseball',
    'title': 'MLB',
    'description': 'US Baseball',
    'active': true,
    'has_outrights': false,
  },
  {
    'key': 'icehockey_nhl',
    'group': 'Ice Hockey',
    'title': 'NHL',
    'description': 'US Ice Hockey',
    'active': true,
    'has_outrights': false,
  },
  {
    'key': 'soccer_usa_mls',
    'group': 'Soccer',
    'title': 'MLS',
    'description': 'Major League Soccer',
    'active': true,
    'has_outrights': false,
  },
];

const List<Map<String, dynamic>> mockOddsResponse = [
  {
    'id': 'nba_lal_bos_001',
    'sport_key': 'basketball_nba',
    'commence_time': '2026-03-06T00:30:00Z',
    'home_team': 'Boston Celtics',
    'away_team': 'Los Angeles Lakers',
    'bookmakers': [
      {
        'key': 'draftkings',
        'title': 'DraftKings',
        'last_update': '2026-03-05T03:00:00Z',
        'markets': [
          {
            'key': 'h2h',
            'outcomes': [
              {'name': 'Los Angeles Lakers', 'price': 155},
              {'name': 'Boston Celtics', 'price': -172},
            ],
          },
          {
            'key': 'spreads',
            'outcomes': [
              {'name': 'Los Angeles Lakers', 'price': -110, 'point': 4.5},
              {'name': 'Boston Celtics', 'price': -110, 'point': -4.5},
            ],
          },
          {
            'key': 'totals',
            'outcomes': [
              {'name': 'Over', 'price': -102, 'point': 228.5},
              {'name': 'Under', 'price': -118, 'point': 228.5},
            ],
          },
        ],
      },
      {
        'key': 'fanduel',
        'title': 'FanDuel',
        'last_update': '2026-03-05T03:00:00Z',
        'markets': [
          {
            'key': 'h2h',
            'outcomes': [
              {'name': 'Los Angeles Lakers', 'price': 162},
              {'name': 'Boston Celtics', 'price': -178},
            ],
          },
          {
            'key': 'spreads',
            'outcomes': [
              {'name': 'Los Angeles Lakers', 'price': -108, 'point': 5.0},
              {'name': 'Boston Celtics', 'price': -112, 'point': -5.0},
            ],
          },
          {
            'key': 'totals',
            'outcomes': [
              {'name': 'Over', 'price': -110, 'point': 228.5},
              {'name': 'Under', 'price': -106, 'point': 228.5},
            ],
          },
        ],
      },
    ],
  },
  {
    'id': 'nba_mia_den_002',
    'sport_key': 'basketball_nba',
    'commence_time': '2026-03-06T02:00:00Z',
    'home_team': 'Denver Nuggets',
    'away_team': 'Miami Heat',
    'bookmakers': [
      {
        'key': 'caesars',
        'title': 'Caesars',
        'last_update': '2026-03-05T03:00:00Z',
        'markets': [
          {
            'key': 'h2h',
            'outcomes': [
              {'name': 'Miami Heat', 'price': 170},
              {'name': 'Denver Nuggets', 'price': -190},
            ],
          },
          {
            'key': 'spreads',
            'outcomes': [
              {'name': 'Miami Heat', 'price': -110, 'point': 5.5},
              {'name': 'Denver Nuggets', 'price': -110, 'point': -5.5},
            ],
          },
          {
            'key': 'totals',
            'outcomes': [
              {'name': 'Over', 'price': -105, 'point': 221.5},
              {'name': 'Under', 'price': -115, 'point': 221.5},
            ],
          },
        ],
      },
      {
        'key': 'betmgm',
        'title': 'BetMGM',
        'last_update': '2026-03-05T03:00:00Z',
        'markets': [
          {
            'key': 'h2h',
            'outcomes': [
              {'name': 'Miami Heat', 'price': 165},
              {'name': 'Denver Nuggets', 'price': -185},
            ],
          },
          {
            'key': 'spreads',
            'outcomes': [
              {'name': 'Miami Heat', 'price': -108, 'point': 5.0},
              {'name': 'Denver Nuggets', 'price': -112, 'point': -5.0},
            ],
          },
          {
            'key': 'totals',
            'outcomes': [
              {'name': 'Over', 'price': -112, 'point': 221.5},
              {'name': 'Under', 'price': -104, 'point': 221.5},
            ],
          },
        ],
      },
    ],
  },
  {
    'id': 'nba_gsw_phx_003',
    'sport_key': 'basketball_nba',
    'commence_time': '2026-03-06T03:30:00Z',
    'home_team': 'Phoenix Suns',
    'away_team': 'Golden State Warriors',
    'bookmakers': [
      {
        'key': 'pointsbet',
        'title': 'PointsBet',
        'last_update': '2026-03-05T03:00:00Z',
        'markets': [
          {
            'key': 'h2h',
            'outcomes': [
              {'name': 'Golden State Warriors', 'price': 120},
              {'name': 'Phoenix Suns', 'price': -132},
            ],
          },
          {
            'key': 'spreads',
            'outcomes': [
              {'name': 'Golden State Warriors', 'price': -110, 'point': 2.5},
              {'name': 'Phoenix Suns', 'price': -110, 'point': -2.5},
            ],
          },
          {
            'key': 'totals',
            'outcomes': [
              {'name': 'Over', 'price': -108, 'point': 225.5},
              {'name': 'Under', 'price': -112, 'point': 225.5},
            ],
          },
        ],
      },
      {
        'key': 'unibet',
        'title': 'Unibet',
        'last_update': '2026-03-05T03:00:00Z',
        'markets': [
          {
            'key': 'h2h',
            'outcomes': [
              {'name': 'Golden State Warriors', 'price': 125},
              {'name': 'Phoenix Suns', 'price': -138},
            ],
          },
          {
            'key': 'spreads',
            'outcomes': [
              {'name': 'Golden State Warriors', 'price': -108, 'point': 3.0},
              {'name': 'Phoenix Suns', 'price': -112, 'point': -3.0},
            ],
          },
          {
            'key': 'totals',
            'outcomes': [
              {'name': 'Over', 'price': -101, 'point': 225.5},
              {'name': 'Under', 'price': -120, 'point': 225.5},
            ],
          },
        ],
      },
    ],
  },
  {
    'id': 'nba_dal_nyk_004',
    'sport_key': 'basketball_nba',
    'commence_time': '2026-03-06T05:00:00Z',
    'home_team': 'New York Knicks',
    'away_team': 'Dallas Mavericks',
    'bookmakers': [
      {
        'key': 'espnbet',
        'title': 'ESPN BET',
        'last_update': '2026-03-05T03:00:00Z',
        'markets': [
          {
            'key': 'h2h',
            'outcomes': [
              {'name': 'Dallas Mavericks', 'price': 118},
              {'name': 'New York Knicks', 'price': -126},
            ],
          },
          {
            'key': 'spreads',
            'outcomes': [
              {'name': 'Dallas Mavericks', 'price': -110, 'point': 2.0},
              {'name': 'New York Knicks', 'price': -110, 'point': -2.0},
            ],
          },
          {
            'key': 'totals',
            'outcomes': [
              {'name': 'Over', 'price': -114, 'point': 218.5},
              {'name': 'Under', 'price': -104, 'point': 218.5},
            ],
          },
        ],
      },
      {
        'key': 'wynnbet',
        'title': 'WynnBET',
        'last_update': '2026-03-05T03:00:00Z',
        'markets': [
          {
            'key': 'h2h',
            'outcomes': [
              {'name': 'Dallas Mavericks', 'price': 105},
              {'name': 'New York Knicks', 'price': -102},
            ],
          },
          {
            'key': 'spreads',
            'outcomes': [
              {'name': 'Dallas Mavericks', 'price': -108, 'point': 2.5},
              {'name': 'New York Knicks', 'price': -112, 'point': -2.5},
            ],
          },
          {
            'key': 'totals',
            'outcomes': [
              {'name': 'Over', 'price': -102, 'point': 218.5},
              {'name': 'Under', 'price': -118, 'point': 218.5},
            ],
          },
        ],
      },
    ],
  },
  {
    'id': 'nfl_kc_buf_005',
    'sport_key': 'americanfootball_nfl',
    'commence_time': '2026-03-06T20:25:00Z',
    'home_team': 'Buffalo Bills',
    'away_team': 'Kansas City Chiefs',
    'bookmakers': [
      {
        'key': 'betrivers',
        'title': 'BetRivers',
        'last_update': '2026-03-05T03:00:00Z',
        'markets': [
          {
            'key': 'h2h',
            'outcomes': [
              {'name': 'Kansas City Chiefs', 'price': 112},
              {'name': 'Buffalo Bills', 'price': -118},
            ],
          },
          {
            'key': 'spreads',
            'outcomes': [
              {'name': 'Kansas City Chiefs', 'price': -110, 'point': 1.5},
              {'name': 'Buffalo Bills', 'price': -110, 'point': -1.5},
            ],
          },
          {
            'key': 'totals',
            'outcomes': [
              {'name': 'Over', 'price': -108, 'point': 48.5},
              {'name': 'Under', 'price': -112, 'point': 48.5},
            ],
          },
          {
            'key': 'outrights',
            'outcomes': [
              {'name': 'Kansas City Chiefs AFC Winner', 'price': 240},
              {'name': 'Buffalo Bills AFC Winner', 'price': 255},
            ],
          },
        ],
      },
      {
        'key': 'hardrockbet',
        'title': 'Hard Rock Bet',
        'last_update': '2026-03-05T03:00:00Z',
        'markets': [
          {
            'key': 'h2h',
            'outcomes': [
              {'name': 'Kansas City Chiefs', 'price': 102},
              {'name': 'Buffalo Bills', 'price': 104},
            ],
          },
          {
            'key': 'spreads',
            'outcomes': [
              {'name': 'Kansas City Chiefs', 'price': -108, 'point': 2.0},
              {'name': 'Buffalo Bills', 'price': -112, 'point': -2.0},
            ],
          },
          {
            'key': 'totals',
            'outcomes': [
              {'name': 'Over', 'price': -104, 'point': 48.5},
              {'name': 'Under', 'price': -116, 'point': 48.5},
            ],
          },
          {
            'key': 'outrights',
            'outcomes': [
              {'name': 'Kansas City Chiefs AFC Winner', 'price': 265},
              {'name': 'Buffalo Bills AFC Winner', 'price': 235},
            ],
          },
        ],
      },
    ],
  },
  {
    'id': 'soccer_arb_3way_future',
    'sport_key': 'soccer_epl',
    'commence_time': '2026-04-20T15:00:00Z',
    'home_team': 'Arsenal',
    'away_team': 'Chelsea',
    'bookmakers': [
      {
        'key': 'draftkings',
        'title': 'DraftKings',
        'last_update': '2026-04-13T10:00:00Z',
        'markets': [
          {
            'key': 'h2h',
            'outcomes': [
              {'name': 'Arsenal', 'price': 210},
              {'name': 'Chelsea', 'price': 250},
              {'name': 'Draw', 'price': 280},
            ],
          },
        ],
      },
      {
        'key': 'fanduel',
        'title': 'FanDuel',
        'last_update': '2026-04-13T10:00:00Z',
        'markets': [
          {
            'key': 'h2h',
            'outcomes': [
              {'name': 'Arsenal', 'price': 215},
              {'name': 'Chelsea', 'price': 245},
              {'name': 'Draw', 'price': 275},
            ],
          },
        ],
      },
    ],
  },
  {
    'id': 'soccer_arb_3way_past',
    'sport_key': 'soccer_epl',
    'commence_time': '2026-04-10T15:00:00Z',
    'home_team': 'Liverpool',
    'away_team': 'Man City',
    'bookmakers': [
      {
        'key': 'bet365',
        'title': 'Bet365',
        'last_update': '2026-04-13T10:00:00Z',
        'markets': [
          {
            'key': 'h2h',
            'outcomes': [
              {'name': 'Liverpool', 'price': 310},
              {'name': 'Man City', 'price': 310},
              {'name': 'Draw', 'price': 310},
            ],
          },
        ],
      },
    ],
  },
  {
    'id': 'tennis_arb_2way_future',
    'sport_key': 'tennis_atp',
    'commence_time': '2026-04-25T12:00:00Z',
    'home_team': 'Alcaraz',
    'away_team': 'Sinner',
    'bookmakers': [
      {
        'key': 'draftkings',
        'title': 'DraftKings',
        'last_update': '2026-04-13T10:00:00Z',
        'markets': [
          {
            'key': 'h2h',
            'outcomes': [
              {'name': 'Alcaraz', 'price': 205},
              {'name': 'Sinner', 'price': 190},
            ],
          },
        ],
      },
      {
        'key': 'fanduel',
        'title': 'FanDuel',
        'last_update': '2026-04-13T10:00:00Z',
        'markets': [
          {
            'key': 'h2h',
            'outcomes': [
              {'name': 'Alcaraz', 'price': 190},
              {'name': 'Sinner', 'price': 205},
            ],
          },
        ],
      },
    ],
  },
  {
    'id': 'tennis_arb_2way_past',
    'sport_key': 'tennis_atp',
    'commence_time': '2026-04-01T12:00:00Z',
    'home_team': 'Djokovic',
    'away_team': 'Nadal',
    'bookmakers': [
      {
        'key': 'bet365',
        'title': 'Bet365',
        'last_update': '2026-04-13T10:00:00Z',
        'markets': [
          {
            'key': 'h2h',
            'outcomes': [
              {'name': 'Djokovic', 'price': 210},
              {'name': 'Nadal', 'price': 210},
            ],
          },
        ],
      },
    ],
  },
  {
    'id': 'non_arb_2way_future',
    'sport_key': 'basketball_nba',
    'commence_time': '2026-05-01T00:00:00Z',
    'home_team': 'Bucks',
    'away_team': '76ers',
    'bookmakers': [
      {
        'key': 'draftkings',
        'title': 'DraftKings',
        'last_update': '2026-04-13T10:00:00Z',
        'markets': [
          {
            'key': 'h2h',
            'outcomes': [
              {'name': 'Bucks', 'price': 190},
              {'name': '76ers', 'price': 190},
            ],
          },
        ],
      },
    ],
  },
  {
    'id': 'non_arb_2way_past',
    'sport_key': 'basketball_nba',
    'commence_time': '2026-04-01T00:00:00Z',
    'home_team': 'Lakers',
    'away_team': 'Clippers',
    'bookmakers': [
      {
        'key': 'fanduel',
        'title': 'FanDuel',
        'last_update': '2026-04-13T10:00:00Z',
        'markets': [
          {
            'key': 'h2h',
            'outcomes': [
              {'name': 'Lakers', 'price': 190},
              {'name': 'Clippers', 'price': 190},
            ],
          },
        ],
      },
    ],
  },
  {
    'id': 'non_arb_3way_future',
    'sport_key': 'soccer_epl',
    'commence_time': '2026-06-01T15:00:00Z',
    'home_team': 'Real Madrid',
    'away_team': 'Barcelona',
    'bookmakers': [
      {
        'key': 'bet365',
        'title': 'Bet365',
        'last_update': '2026-04-13T10:00:00Z',
        'markets': [
          {
            'key': 'h2h',
            'outcomes': [
              {'name': 'Real Madrid', 'price': 250},
              {'name': 'Barcelona', 'price': 250},
              {'name': 'Draw', 'price': 250},
            ],
          },
        ],
      },
    ],
  },
  {
    'id': 'non_arb_3way_past',
    'sport_key': 'soccer_epl',
    'commence_time': '2026-01-01T15:00:00Z',
    'home_team': 'Inter',
    'away_team': 'Milan',
    'bookmakers': [
      {
        'key': 'draftkings',
        'title': 'DraftKings',
        'last_update': '2026-04-13T10:00:00Z',
        'markets': [
          {
            'key': 'h2h',
            'outcomes': [
              {'name': 'Inter', 'price': 250},
              {'name': 'Milan', 'price': 250},
              {'name': 'Draw', 'price': 250},
            ],
          },
        ],
      },
    ],
  },
];
