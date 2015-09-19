Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Sat, 19 Sep 2015 15:20:43 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	mturquette@baylibre.com
Subject: [GIT PULL] clk: fixes for 4.3-rc2
Message-ID: <20150919222043.GD23081@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit 3bba75a2ec32bd5fa7024a4de3b8cf9ee113a76a:

  clk: rockchip: Add pclk_peri to critical clocks on RK3066/RK3188 (2015-09-10 13:55:30 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to d34e210ed3a28050441f15228fd5ed929028d9cd:

  drivers: clk: st: Rename st_pll3200c32_407_c0_x into st_pll3200c32_cx_x (2015-09-17 11:51:43 -0700)

----------------------------------------------------------------
A few driver fixes for tegra, rockchip, and st SoCs and a two-liner
in the framework to avoid oops when get_parent ops return out of range
values on tegra platforms.

----------------------------------------------------------------
Gabriel Fernandez (1):
      drivers: clk: st: Rename st_pll3200c32_407_c0_x into st_pll3200c32_cx_x

Heiko Stübner (1):
      clk: rockchip: add critical clock for rk3368

Mans Rullgard (1):
      clk: check for invalid parent index of orphans in __clk_init()

Thierry Reding (1):
      clk: tegra: dfll: Properly protect OPP list

 drivers/clk/clk.c                 |  3 ++-
 drivers/clk/rockchip/clk-rk3368.c |  6 ++++++
 drivers/clk/st/clkgen-fsyn.c      |  8 ++++----
 drivers/clk/st/clkgen-pll.c       | 12 ++++++------
 drivers/clk/tegra/clk-dfll.c      |  8 +++++++-
 5 files changed, 25 insertions(+), 12 deletions(-)

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
