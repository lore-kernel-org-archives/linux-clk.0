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
Subject: [PATCH 0/2] clk: meson: fix protection against undefined clks
Date: Thu, 27 Jul 2017 18:17:53 +0200
Message-Id: <20170727161755.10393-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

If the last clkids defined have no hw pointer associated with them in
the hw_onecell_data array, the initialization is going to crash badly
because the array is not big enough.

The patchset makes sure the array is big enough, and that each clkid is
associated with a valid hw pointer, or NULL.

Doing it in two patches to ease backport, since we are not fixing the
same commit on meson8b and gxbb

Jerome Brunet (2):
  clk: meson: meson8b: fix protection against undefined clks
  clk: meson: gxbb: fix protection against undefined clks

 drivers/clk/meson/gxbb.c    | 2 ++
 drivers/clk/meson/meson8b.c | 1 +
 2 files changed, 3 insertions(+)

-- 
2.9.4
