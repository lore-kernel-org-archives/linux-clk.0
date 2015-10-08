Return-Path: <sboyd@codeaurora.org>
Date: Thu, 8 Oct 2015 16:33:47 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	mturquette@baylibre.com
Subject: [GIT PULL] clk: fixes for 4.3-rc5
Message-ID: <20151008233347.GL26883@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit 9ffecb10283508260936b96022d4ee43a7798b4c:

  Linux 4.3-rc3 (2015-09-27 07:50:08 -0400)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to 9f30a04d768f64280dc0c40b730746e82f298d88:

  Merge branch 'for-4.3-rc/ti-clk-fixes' of https://github.com/t-kristo/linux-pm into clk-fixes (2015-10-02 11:22:23 -0700)

----------------------------------------------------------------
A Samsung driver fix and a handful of TI driver fixes.

----------------------------------------------------------------
Bartlomiej Zolnierkiewicz (1):
      clk: samsung: fix cpu clock's flags checking

Ben Dooks (1):
      clk: ti: fix dual-registration of uart4_ick

Peter Ujfalusi (1):
      clk: ti: clk-7xx: Remove hardwired ABE clock configuration

Stephen Boyd (1):
      Merge branch 'for-4.3-rc/ti-clk-fixes' of https://github.com/t-kristo/linux-pm into clk-fixes

Suman Anna (1):
      clk: ti: dflt: fix enable_reg validity check

 drivers/clk/samsung/clk-cpu.c | 10 +++++-----
 drivers/clk/ti/clk-3xxx.c     |  2 +-
 drivers/clk/ti/clk-7xx.c      | 18 +-----------------
 drivers/clk/ti/clkt_dflt.c    |  4 ++--
 4 files changed, 9 insertions(+), 25 deletions(-)

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
