Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Carlo Caione <carlo@caione.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/9] clk: meson: pll fixes
Date: Fri, 19 Jan 2018 16:55:20 +0100
Message-Id: <20180119155529.11532-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

This changeset is a collection of fixes and clean-up around the pll clock
provider. This has been triggered by the discussion around the ethernet
clock on the axg [0].

On the axg the rate reported by the fixed_pll is off by 8Mhz, which leads
the internal mux of the ethernet driver to pick an mpll2 instead of the
fdiv4.

With this series applied, the fixed_pll of the axg now reports
1999998046 Hz, which is coherent with measurements (~2GHz)

While debugging this, we uncovered quite a mess around the hdmi_pll
of the gxbb and gxl family. This is also fixed by this series.

Last, the parameters table provided to the read-only sys_plls have
been removed, saving a bit of memory

There is still work to be done on this clock provider. Someday,
I hope to see the parameter tables go away completely. This pll
is just a (quite complex) fractional divider, we sould be able to
figure something out at runtime.

Changes since v1: [1]
* fix several typos in the comments
* fix arm32 u64 math in patch 3 (Thanks a lot Martin!!)

[0]: https://lkml.kernel.org/r/1516095424.2608.36.camel@baylibre.com
[1]: https://lkml.kernel.org/r/20180118184532.6856-1-jbrunet@baylibre.com

Jerome Brunet (9):
  clk: meson: check pll rate param table before using it
  clk: meson: remove useless pll rate params tables
  clk: meson: remove unnecessary rounding in the pll clock
  clk: meson: use the frac parameter width instead of a constant
  clk: meson: add od3 to the pll driver
  clk: meson: add the gxl hdmi pll
  clk: meson: fix rate calculation of plls with a fractional part
  clk: meson: gxbb: add the fractional part of the fixed_pll
  clk: meson: axg: add the fractional part of the fixed_pll

 drivers/clk/meson/axg.c     |  99 ++------------------------
 drivers/clk/meson/clk-pll.c |  41 ++++++++---
 drivers/clk/meson/clkc.h    |   2 +
 drivers/clk/meson/gxbb.c    | 166 +++++++++++++++++++-------------------------
 drivers/clk/meson/gxbb.h    |   3 +-
 5 files changed, 111 insertions(+), 200 deletions(-)

-- 
2.14.3
