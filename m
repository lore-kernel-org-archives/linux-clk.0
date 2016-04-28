Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 0/7] clk: rockchip: cleanup some code duplication
Date: Thu, 28 Apr 2016 15:11:08 +0200
Message-Id: <1461849075-8310-1-git-send-email-heiko@sntech.de>
List-ID: <linux-clk.vger.kernel.org>

This tries to generalize code paths that contain some (nearly)
duplicate code. While it's only a bit noticeable now for 3 different
plls, the effect should be more pronounced when the next pll-type
shows up.


Heiko Stuebner (7):
  clk: rockchip: lookup General Register Files in rockchip_clk_init
  clk: rockchip: simplify GRF handling in pll clocks
  clk: rockchip: drop old_rate calculation on pll rate changes
  clk: rockchip: abstract pll get-params and set-params operations
  clk: rockchip: generalize pll set-rate operation
  clk: rockchip: move pll rate-comparison into a callable function
  clk: rockchip: fold pll init functions into one common one

 drivers/clk/rockchip/clk-pll.c | 329 ++++++++++++++++-------------------------
 drivers/clk/rockchip/clk.c     |  10 +-
 drivers/clk/rockchip/clk.h     |   1 -
 3 files changed, 131 insertions(+), 209 deletions(-)

-- 
2.6.4
