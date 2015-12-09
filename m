Return-Path: <sboyd@codeaurora.org>
Date: Wed, 9 Dec 2015 12:39:32 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	mturquette@baylibre.com
Subject: [GIT PULL] clk: fixes for 4.4
Message-ID: <20151209203932.GA22188@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit 8005c49d9aea74d382f474ce11afbbc7d7130bec:

  Linux 4.4-rc1 (2015-11-15 17:00:27 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to 59f0ec231f397001801264063db3b6dcc3eef590:

  clk: sunxi: pll2: Fix clock running too fast (2015-12-02 23:27:47 -0800)

----------------------------------------------------------------
One small build fix, a couple do_div() fixes, and a fix for the gpio basic
clock type are the major changes here. There's also a couple fixes for
the TI, sunxi, and scpi clock drivers.

----------------------------------------------------------------
Arnd Bergmann (1):
      clk: mmp: add linux/clk.h includes

Grygorii Strashko (1):
      clk: ti: drop locking code from mux/divider drivers

Julia Lawall (1):
      clk: scpi: add missing of_node_put

Jyri Sarha (1):
      clk: gpio: Get parent clk names in of_gpio_clk_setup()

Maxime Ripard (1):
      clk: sunxi: pll2: Fix clock running too fast

Neil Armstrong (1):
      clk: ti816x: Add missing dmtimer clkdev entries

Nicolas Pitre (4):
      clk: ti: clkt_dpll: fix wrong do_div() usage
      clk: ti: fapll: fix wrong do_div() usage
      imx/clk-pllv1: fix wrong do_div() usage
      imx/clk-pllv2: fix wrong do_div() usage

Stephen Boyd (1):
      Merge branch 'for-4.4-rc/ti-clk-fixes' of https://github.com/t-kristo/linux-pm into clk-fixes

Sudip Mukherjee (1):
      clk: qoriq: fix memory leak

 drivers/clk/clk-gpio.c           | 33 +++++++++++++++++----------------
 drivers/clk/clk-qoriq.c          |  4 +++-
 drivers/clk/clk-scpi.c           |  1 +
 drivers/clk/imx/clk-pllv1.c      | 14 +++++++-------
 drivers/clk/imx/clk-pllv2.c      |  9 +++++----
 drivers/clk/mmp/clk-mmp2.c       |  1 +
 drivers/clk/mmp/clk-pxa168.c     |  1 +
 drivers/clk/mmp/clk-pxa910.c     |  1 +
 drivers/clk/sunxi/clk-a10-pll2.c | 23 +++++------------------
 drivers/clk/ti/clk-816x.c        |  2 ++
 drivers/clk/ti/clkt_dpll.c       |  4 ++--
 drivers/clk/ti/divider.c         | 16 +++-------------
 drivers/clk/ti/fapll.c           |  4 ++--
 drivers/clk/ti/mux.c             | 15 +++------------
 14 files changed, 53 insertions(+), 75 deletions(-)
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
