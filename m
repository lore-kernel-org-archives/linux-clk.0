Return-Path: <shawnguo@kernel.org>
Date: Tue, 27 Feb 2018 09:54:08 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org, project-aspen-dev@linaro.org,
	Shawn Guo <shawnguo@kernel.org>
Subject: [GIT PULL] Hi3798cv200 clock driver update for 4.17
Message-ID: <20180227015407.GW3217@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen, Michael,

This is a pull request containing a series of small hi3798cv200 clock
driver updates posted a while ago [1].  Please consider to pull it
for 4.17.  Thanks.

Shawn

[1] https://www.spinics.net/lists/linux-clk/msg22822.html


The following changes since commit 7928b2cbe55b2a410a0f5c1f154610059c57b1b2:

  Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/clk-hi3798cv200

for you to fetch changes up to 80f8ce589517c478abdae07a758b37b362886cb2:

  clk: hi3798cv200: add COMBPHY0 clock support (2018-02-27 09:19:12 +0800)

----------------------------------------------------------------
A series of small hi3798cv200 clock updates for 4.17:
 - Add COMBPHY0 and USB2_OTG_UTMI clock support
 - Correct the parent clock of HISTB_IR_CLK
 - Fix unregister call sequence in hi3798cv200_clk_register() function
 - A coding-style improvement on Hi3798CV200 driver code indent

----------------------------------------------------------------
Jianguo Sun (1):
      clk: hi3798cv200: add COMBPHY0 clock support

Shawn Guo (3):
      clk: hi3798cv200: fix unregister call sequence in error path
      clk: hi3798cv200: add support for HISTB_USB2_OTG_UTMI_CLK
      clk: hi3798cv200: fix define indentation

Younian Wang (1):
      clk: hi3798cv200: correct IR clock parent

 drivers/clk/hisilicon/crg-hi3798cv200.c | 80 ++++++++++++++++++---------------
 include/dt-bindings/clock/histb-clock.h | 55 ++++++++++++-----------
 2 files changed, 72 insertions(+), 63 deletions(-)
