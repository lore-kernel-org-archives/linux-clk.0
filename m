Return-Path: <sboyd@kernel.org>
From: sboyd@kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk fixes for v4.18-rc3
Date: Fri,  6 Jul 2018 10:52:54 -0700
Message-Id: <20180706175254.174724-1-sboyd@kernel.org>
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

From: Stephen Boyd <sboyd@kernel.org>

The following changes since commit ce397d215ccd07b8ae3f71db689aedb85d56ab40:

  Linux 4.18-rc1 (2018-06-17 08:04:49 +0900)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to 9cc63791fad6d2624878c93f3415da77780e68a7:

  Merge branch 'clk-fix-imx6ul-defs' into clk-fixes (2018-06-29 11:40:29 -0700)

----------------------------------------------------------------
The usual collection of driver fixlets:

 - Build cleanup/fix for the sunxi makefile that tried to save size
   but failed and prevented dead code elimination from working

 - Two Davinci clk driver fixes for a typo causing build failures
   in different configurations and an error check that checks
   the wrong variable.

 - Undo the DT ABI breaking imx6ul binding header shuffle that got
   merged this cycle.

----------------------------------------------------------------
Bartosz Golaszewski (1):
      clk: davinci: fix a typo (which leads to build failures)

Dan Carpenter (1):
      clk: davinci: cfgchip: testing the wrong variable

Fabio Estevam (1):
      dt-bindings: clock: imx6ul: Do not change the clock definition order

Masahiro Yamada (1):
      clk: sunxi-ng: replace lib-y with obj-y

Stephen Boyd (2):
      Merge tag 'clk-davinci-fixes-4.18' of https://github.com/dlech/linux into clk-fixes
      Merge branch 'clk-fix-imx6ul-defs' into clk-fixes

 drivers/clk/Makefile                     |  2 +-
 drivers/clk/davinci/da8xx-cfgchip.c      |  2 +-
 drivers/clk/davinci/psc.h                |  2 +-
 drivers/clk/sunxi-ng/Makefile            | 39 ++++++++++++-------------------
 include/dt-bindings/clock/imx6ul-clock.h | 40 +++++++++++++++-----------------
 5 files changed, 37 insertions(+), 48 deletions(-)

-- 
Sent by a computer through tubes
