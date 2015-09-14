Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Mon, 14 Sep 2015 16:29:45 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	mturquette@baylibre.com
Subject: [GIT PULL] clk: fixes for 4.3-rc1
Message-ID: <20150914232945.GA5264@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit ba30011577330b7e29ecb5916d89c6db9fbc5b3d:

  clk: s5pv210: add missing call to samsung_clk_of_add_provider() (2015-08-27 12:03:21 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to 3bba75a2ec32bd5fa7024a4de3b8cf9ee113a76a:

  clk: rockchip: Add pclk_peri to critical clocks on RK3066/RK3188 (2015-09-10 13:55:30 -0700)

----------------------------------------------------------------
A couple build fixes for drivers introduced in the merge window and a
handful of patches to add more critical clocks on rockchip SoCs that
are affected by newly introduced gpio clock handling.

----------------------------------------------------------------
Guenter Roeck (1):
      clk: h8s2678: Fix compile error

Heiko Stuebner (1):
      clk: rockchip: handle critical clocks after registering all clocks

Leo Yan (1):
      clk: Hi6220: separately build stub clock driver

Michael Niewoehner (1):
      clk: rockchip: add pclk_cpu to the list of rk3188 critical clocks

Romain Perier (1):
      clk: rockchip: Add pclk_peri to critical clocks on RK3066/RK3188

 drivers/clk/h8300/clk-h8s2678.c   | 1 +
 drivers/clk/hisilicon/Kconfig     | 8 +++++++-
 drivers/clk/hisilicon/Makefile    | 3 ++-
 drivers/clk/rockchip/clk-rk3188.c | 9 +++++++--
 4 files changed, 17 insertions(+), 4 deletions(-)
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
