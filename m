Return-Path: <wens@wens.csie.org>
From: Chen-Yu Tsai <wens@csie.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@googlegroups.com
Subject: [PATCH 0/3] clk: sunxi-ng: Add support for A83T's PRCM
Date: Fri, 26 May 2017 16:00:22 +0800
Message-Id: <20170526080025.28532-1-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

Hi everyone,

This series adds support for the A83T's PRCM to the existing sun8i-r-ccu
driver. When the sun8i-r-ccu driver was introduced, indices were reserved
for all the possible clocks and resets of the sun8i family. In patch 2
we simply pick existing clocks, and implement ones that are different or
missing.

Differences from other sun8i implementations include different clock parent
names, due to the A83T not having a proper 32.768 kHz oscillator, and
different predividers for the IR clock.

Patch 1 adds a compatible string for the A83T variant.

Patch 2 adds the driver support, as mentioned above.

Patch 3 adds a device node for the PRCM.


Regards
ChenYu


Chen-Yu Tsai (3):
  dt-bindings: clock: sunxi-ccu: Add compatible string for A83T PRCM
  clk: sunxi-ng: a83t: Add support for A83T's PRCM
  ARM: sun8i: a83t: Add device node for PRCM

 .../devicetree/bindings/clock/sunxi-ccu.txt        |   3 +-
 arch/arm/boot/dts/sun8i-a83t.dtsi                  |   9 ++
 drivers/clk/sunxi-ng/ccu-sun8i-r.c                 | 107 +++++++++++++++++++++
 3 files changed, 118 insertions(+), 1 deletion(-)

-- 
2.11.0
