Return-Path: <shawn.lin@rock-chips.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH 0/6] Some trivial fixes for rockchip clk/pm stuff
Date: Mon, 15 Feb 2016 11:32:33 +0800
Message-Id: <1455507153-12914-1-git-send-email-shawn.lin@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>


Happy Chinese new year, Rockchipers!

This patchset fix some trivial things for rockchip clk/pm
driver when learning clk stuff which I'm interested in during the
holiday.

All of them is based on Heiko's tree(master branch):
git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git



Shawn Lin (6):
  clk: rockchip: handle alt_parent in err cases when registering cpuclk
  clk: rockchip: check grf when waiting pll lock
  clk: rockchip: don't return NULL when registering inverter fails
  clk: rockchip: don't return NULL when registering mmc branch fails
  clk: rockchip: fix coding style for clk-cpu.c
  soc: rockchip: power-domain: check the existing of regmap

 drivers/clk/rockchip/clk-cpu.c       | 8 +++++---
 drivers/clk/rockchip/clk-inverter.c  | 8 ++------
 drivers/clk/rockchip/clk-mmc-phase.c | 8 ++------
 drivers/clk/rockchip/clk-pll.c       | 8 +++++++-
 drivers/soc/rockchip/pm_domains.c    | 4 ++++
 5 files changed, 20 insertions(+), 16 deletions(-)

-- 
2.3.7
