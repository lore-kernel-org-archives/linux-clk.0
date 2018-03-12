Return-Path: <shawnguo@kernel.org>
Date: Mon, 12 Mar 2018 16:26:45 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Jiancheng Xue <xuejiancheng@hisilicon.com>, linux-clk@vger.kernel.org
Subject: [GIT PULL v2] Hi3798cv200 clock driver update for 4.17
Message-ID: <20180312082644.GA26859@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen, Mike,

This is v2 of Hi3798cv200 clock driver pull request [1].  It includes
the eMMC phase clock support patches [2] on top of v1.  I believe they
are ready to go.  Please consider to pull it for 4.17.  Thanks.

Shawn

[1] https://www.spinics.net/lists/linux-clk/msg23911.html
[2] https://patchwork.kernel.org/patch/10258235/


The following changes since commit 7928b2cbe55b2a410a0f5c1f154610059c57b1b2:

  Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/clk-hi3798cv200-4.17

for you to fetch changes up to d1b0399543cec5fa5d3a2d33b525a7cd7912e635:

  clk: hi3798cv200: add emmc sample and drive clock (2018-03-12 15:56:58 +0800)

----------------------------------------------------------------
Hi3798CV200 clock driver updates for 4.17:
 - Add COMBPHY0 and USB2_OTG_UTMI clock support.
 - Correct the parent clock of HISTB_IR_CLK.
 - Fix unregister call sequence in hi3798cv200_clk_register() function.
 - A coding-style improvement on Hi3798CV200 driver code indent.
 - Add a HiSilicon specific phase clock type and using the type for eMMC
   clocks on Hi3798CV200.

----------------------------------------------------------------
Jianguo Sun (1):
      clk: hi3798cv200: add COMBPHY0 clock support

Shawn Guo (3):
      clk: hi3798cv200: fix unregister call sequence in error path
      clk: hi3798cv200: add support for HISTB_USB2_OTG_UTMI_CLK
      clk: hi3798cv200: fix define indentation

Younian Wang (1):
      clk: hi3798cv200: correct IR clock parent

tianshuliang (2):
      clk: hisilicon: add hisi phase clock support
      clk: hi3798cv200: add emmc sample and drive clock

 drivers/clk/hisilicon/Makefile          |   2 +-
 drivers/clk/hisilicon/clk-hisi-phase.c  | 121 ++++++++++++++++++++++++++++++++
 drivers/clk/hisilicon/clk.c             |  24 +++++++
 drivers/clk/hisilicon/clk.h             |  19 +++++
 drivers/clk/hisilicon/crg-hi3798cv200.c | 100 ++++++++++++++++----------
 include/dt-bindings/clock/histb-clock.h |  55 ++++++++-------
 6 files changed, 257 insertions(+), 64 deletions(-)
 create mode 100644 drivers/clk/hisilicon/clk-hisi-phase.c
