Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk fixes for v4.11-rc3
Date: Fri, 24 Mar 2017 18:01:34 -0700
Message-Id: <20170325010134.2884-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:

  Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to 7f0b97d5bb4c1c99c38dd6770ad11f714ea42583:

  Merge tag 'sunxi-clk-fixes-for-4.11' of https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux into clk-fixes (2017-03-23 16:08:46 -0700)

----------------------------------------------------------------
A handful of Sunxi and Rockchip clk driver fixes and a core framework
one where we need to copy a string because we can't guarantee it isn't
freed sometime later.

----------------------------------------------------------------
Arnd Bergmann (1):
      clk: sunxi: ccu-sun5i needs nkmp

Chen-Yu Tsai (2):
      clk: sunxi-ng: mp: Adjust parent rate for pre-dividers
      clk: sunxi-ng: sun6i: Fix enable bit offset for hdmi-ddc module clock

Heiko Stuebner (2):
      clk: rockchip: add "," to mux_pll_src_apll_dpll_gpll_usb480m_p on rk3036
      clk: rockchip: Make uartpll a child of the gpll on rk3036

Icenowy Zheng (1):
      clk: sunxi-ng: fix recalc_rate formula of NKMP clocks

Leonard Crestez (1):
      clk: core: Copy connection id

Philipp Tomsich (1):
      clk: sunxi-ng: Fix div/mult settings for osc12M on A64

Stephen Boyd (1):
      Merge tag 'sunxi-clk-fixes-for-4.11' of https://git.kernel.org/.../mripard/linux into clk-fixes

Thomas Petazzoni (1):
      dt-bindings: arm: update Armada CP110 system controller binding

 .../devicetree/bindings/arm/marvell/cp110-system-controller0.txt | 6 +++---
 drivers/clk/clk.c                                                | 3 ++-
 drivers/clk/rockchip/clk-rk3036.c                                | 9 ++++++++-
 drivers/clk/sunxi-ng/Kconfig                                     | 1 +
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c                            | 2 +-
 drivers/clk/sunxi-ng/ccu-sun6i-a31.c                             | 2 +-
 drivers/clk/sunxi-ng/ccu_mp.c                                    | 8 ++++++++
 drivers/clk/sunxi-ng/ccu_nkmp.c                                  | 2 +-
 8 files changed, 25 insertions(+), 8 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
