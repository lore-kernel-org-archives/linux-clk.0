Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk fixes for v4.7-rc2
Date: Tue,  7 Jun 2016 16:07:05 -0700
Message-Id: <20160607230705.17390-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit 1a695a905c18548062509178b98bc91e67510864:

  Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to 72ad679aa7182d23d269cbe4d655f7e129d3b057:

  clk: nxp: Select MFD_SYSCON for creg driver (2016-06-01 15:14:06 -0700)

----------------------------------------------------------------
This finally removes the CLK_IS_ROOT flag by picking up the last few
stragglers that didn't get merged by anyone this time around. Better to
do it now than wait for another one to pop up. There's also a minor
maintainers update and a Kconfig fix.

----------------------------------------------------------------
Ezequiel Garcia (1):
      clk: nxp: Select MFD_SYSCON for creg driver

Geert Uytterhoeven (1):
      MAINTAINERS: Add file patterns for clock device tree bindings

Stephen Boyd (4):
      vexpress/spc: Remove CLK_IS_ROOT
      powerpc/512x: clk: Remove CLK_IS_ROOT
      clk: microchip: Remove CLK_IS_ROOT
      clk: Remove CLK_IS_ROOT flag

 MAINTAINERS                                   |  1 +
 arch/arm/mach-vexpress/spc.c                  |  2 +-
 arch/powerpc/platforms/512x/clock-commonclk.c |  2 +-
 drivers/clk/Kconfig                           |  1 +
 drivers/clk/microchip/clk-pic32mzda.c         | 10 +++++-----
 include/linux/clk-provider.h                  |  2 +-
 6 files changed, 10 insertions(+), 8 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
