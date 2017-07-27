Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Carlo Caione <carlo@caione.org>,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] clk: meson: gxbb: fix audio divider flags
Date: Thu, 27 Jul 2017 15:09:38 +0200
Message-Id: <20170727130940.18005-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

Two audio clocks incorrectly set divider flags in the hw.init flag.
Just move these flags where they belong.

Jerome Brunet (2):
  clk: meson: gxbb: fix meson cts_amclk divider flags
  clk: meson: gxbb: fix clk_mclk_i958 divider flags

 drivers/clk/meson/gxbb.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

-- 
2.9.4
