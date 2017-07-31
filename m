Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Carlo Caione <carlo@caione.org>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 0/2] clk: meson: add mmc input 0 clocks
Date: Mon, 31 Jul 2017 13:56:01 +0200
Message-Id: <20170731115603.29720-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

This patchset adds the clocks feeding the clock input 0 of the mmc
controllers

This patchset depends on the following patchset being merged first:
* https://lkml.kernel.org/r/20170727161755.10393-1-jbrunet@baylibre.com
* https://lkml.kernel.org/r/20170731113832.26490-1-jbrunet@baylibre.com

FIXME:
We need CLK_IGNORE_UNUSED in clock flags because mmc DT node point to
xtal instead of these clocks. W/O the flag, CCF would gate the mmc clocks
on boot, killing the mmc controllers. CLK_IGNORE_UNUSED could be removed
once the DT is fixed

Changes between v2 and v3 [1]:
* Split driver and header changes
* Add CLK_INGORE_UNUSED flag

Changes between v1 and v2 [0]:
* Correct commit description and comments.

[1]: https://lkml.kernel.org/r/20170727103902.3262-1-jbrunet@baylibre.com
[0]: https://lkml.kernel.org/r/20170726203138.11367-1-jbrunet@baylibre.com

Jerome Brunet (2):
  clk: meson: gxbb: Add sd_emmc clk0 clkids
  clk: meson: gxbb: Add sd_emmc clk0 clocks

 drivers/clk/meson/gxbb.c              | 177 ++++++++++++++++++++++++++++++++++
 drivers/clk/meson/gxbb.h              |  10 +-
 include/dt-bindings/clock/gxbb-clkc.h |   3 +
 3 files changed, 188 insertions(+), 2 deletions(-)

-- 
2.9.4
