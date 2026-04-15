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
    'id': 'soccer_epl_liv_mci_001',
    'sport_key': 'soccer_epl',
    'commence_time': '2026-04-20T19:00:00Z',
    'home_team': 'Manchester City',
    'away_team': 'Liverpool',
    'bookmakers': [
      {
        'key': 'draftkings',
        'title': 'DraftKings',
        'last_update': '2026-04-13T10:00:00Z',
        'markets': [
          {
            'key': 'h2h',
            'outcomes': [
              {'name': 'Liverpool', 'price': 215},
              {'name': 'Manchester City', 'price': 330},
              {'name': 'Draw', 'price': 360},
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
              {'name': 'Liverpool', 'price': 210},
              {'name': 'Manchester City', 'price': 345},
              {'name': 'Draw', 'price': 375},
            ],
          },
        ],
      },
      {
        'key': 'bet365',
        'title': 'Bet365',
        'last_update': '2026-04-13T10:00:00Z',
        'markets': [
          {
            'key': 'h2h',
            'outcomes': [
              {'name': 'Liverpool', 'price': 205},
              {'name': 'Manchester City', 'price': 340},
              {'name': 'Draw', 'price': 410},
            ],
          },
        ],
      },
    ],
  },
  {
    'id': 'soccer_epl_ars_che_002',
    'sport_key': 'soccer_epl',
    'commence_time': '2026-04-10T14:00:00Z',
    'home_team': 'Chelsea',
    'away_team': 'Arsenal',
    'bookmakers': [
      {
        'key': 'draftkings',
        'title': 'DraftKings',
        'last_update': '2026-04-09T10:00:00Z',
        'markets': [
          {
            'key': 'h2h',
            'outcomes': [
              {'name': 'Arsenal', 'price': 245},
              {'name': 'Chelsea', 'price': 285},
              {'name': 'Draw', 'price': 340},
            ],
          },
        ],
      },
      {
        'key': 'fanduel',
        'title': 'FanDuel',
        'last_update': '2026-04-09T10:00:00Z',
        'markets': [
          {
            'key': 'h2h',
            'outcomes': [
              {'name': 'Arsenal', 'price': 255},
              {'name': 'Chelsea', 'price': 275},
              {'name': 'Draw', 'price': 335},
            ],
          },
        ],
      },
      {
        'key': 'bet365',
        'title': 'Bet365',
        'last_update': '2026-04-09T10:00:00Z',
        'markets': [
          {
            'key': 'h2h',
            'outcomes': [
              {'name': 'Arsenal', 'price': 240},
              {'name': 'Chelsea', 'price': 280},
              {'name': 'Draw', 'price': 365},
            ],
          },
        ],
      },
    ],
  },
  {
    'id': 'soccer_ll_rma_bar_003',
    'sport_key': 'soccer_spain_la_liga',
    'commence_time': '2026-04-26T19:00:00Z',
    'home_team': 'Barcelona',
    'away_team': 'Real Madrid',
    'bookmakers': [
      {
        'key': 'draftkings',
        'title': 'DraftKings',
        'last_update': '2026-04-13T10:00:00Z',
        'markets': [
          {
            'key': 'h2h',
            'outcomes': [
              {'name': 'Real Madrid', 'price': 235},
              {'name': 'Barcelona', 'price': 295},
              {'name': 'Draw', 'price': 355},
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
              {'name': 'Real Madrid', 'price': 225},
              {'name': 'Barcelona', 'price': 320},
              {'name': 'Draw', 'price': 365},
            ],
          },
        ],
      },
      {
        'key': 'bet365',
        'title': 'Bet365',
        'last_update': '2026-04-13T10:00:00Z',
        'markets': [
          {
            'key': 'h2h',
            'outcomes': [
              {'name': 'Real Madrid', 'price': 230},
              {'name': 'Barcelona', 'price': 310},
              {'name': 'Draw', 'price': 380},
            ],
          },
        ],
      },
    ],
  },
  {
    'id': 'tennis_atp_alc_sin_004',
    'sport_key': 'tennis_atp_monte_carlo',
    'commence_time': '2026-04-18T12:00:00Z',
    'home_team': 'Sinner',
    'away_team': 'Alcaraz',
    'bookmakers': [
      {
        'key': 'draftkings',
        'title': 'DraftKings',
        'last_update': '2026-04-13T10:00:00Z',
        'markets': [
          {
            'key': 'h2h',
            'outcomes': [
              {'name': 'Alcaraz', 'price': 195},
              {'name': 'Sinner', 'price': 195},
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
              {'name': 'Alcaraz', 'price': 210},
              {'name': 'Sinner', 'price': 182},
            ],
          },
        ],
      },
    ],
  },
  {
    'id': 'tennis_atp_djo_nad_005',
    'sport_key': 'tennis_atp_monte_carlo',
    'commence_time': '2026-04-05T12:00:00Z',
    'home_team': 'Nadal',
    'away_team': 'Djokovic',
    'bookmakers': [
      {
        'key': 'draftkings',
        'title': 'DraftKings',
        'last_update': '2026-04-04T10:00:00Z',
        'markets': [
          {
            'key': 'h2h',
            'outcomes': [
              {'name': 'Djokovic', 'price': 230},
              {'name': 'Nadal', 'price': 165},
            ],
          },
        ],
      },
      {
        'key': 'fanduel',
        'title': 'FanDuel',
        'last_update': '2026-04-04T10:00:00Z',
        'markets': [
          {
            'key': 'h2h',
            'outcomes': [
              {'name': 'Djokovic', 'price': 215},
              {'name': 'Nadal', 'price': 180},
            ],
          },
        ],
      },
      {
        'key': 'bet365',
        'title': 'Bet365',
        'last_update': '2026-04-04T10:00:00Z',
        'markets': [
          {
            'key': 'h2h',
            'outcomes': [
              {'name': 'Djokovic', 'price': 240},
              {'name': 'Nadal', 'price': 162},
            ],
          },
        ],
      },
    ],
  },
  {
    'id': 'tennis_atp_med_zve_006',
    'sport_key': 'tennis_atp_monte_carlo',
    'commence_time': '2026-04-19T10:00:00Z',
    'home_team': 'Zverev',
    'away_team': 'Medvedev',
    'bookmakers': [
      {
        'key': 'draftkings',
        'title': 'DraftKings',
        'last_update': '2026-04-13T10:00:00Z',
        'markets': [
          {
            'key': 'h2h',
            'outcomes': [
              {'name': 'Medvedev', 'price': 205},
              {'name': 'Zverev', 'price': 185},
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
              {'name': 'Medvedev', 'price': 188},
              {'name': 'Zverev', 'price': 202},
            ],
          },
        ],
      },
      {
        'key': 'bet365',
        'title': 'Bet365',
        'last_update': '2026-04-13T10:00:00Z',
        'markets': [
          {
            'key': 'h2h',
            'outcomes': [
              {'name': 'Medvedev', 'price': 200},
              {'name': 'Zverev', 'price': 190},
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
];
