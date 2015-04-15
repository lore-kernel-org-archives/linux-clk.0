Return-Path: <Aisheng.Dong@freescale.com>
From: Dong Aisheng <aisheng.dong@freescale.com>
To: <linux-clk@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <sboyd@codeaurora.org>,
	<mturquette@linaro.org>, <shawn.guo@linaro.org>, <b29396@freescale.com>,
	<linux-arm-kernel@lists.infradead.org>, <Ranjani.Vaidyanathan@freescale.com>,
	<b20596@freescale.com>, <r64343@freescale.com>, <b20788@freescale.com>
Subject: [PATCH RFC v1 0/5] clk: support clocks which requires parent clock on during operation
Date: Wed, 15 Apr 2015 22:26:34 +0800
Message-ID: <1429107999-24413-1-git-send-email-aisheng.dong@freescale.com>
Return-Path: aisheng.dong@freescale.com
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

This patch series adds support in clock framework for clocks which operations
requires its parent clock is on.

Such clock type is initially met on Freescale i.MX7D platform that all clocks
operations, including enable/disable, rate change and re-parent, requires its
parent clock on. No sure if any other SoC has the similar clock type.

Current clock core can not support such type of clock well.

This patch introduce a new flag CLK_SET_PARENT_ON to handle this special case
in clock core that enable its parent clock firstly for each operation and disable
it later after operation complete.

The most special case is for set_parent() operation which requires both parent,
old one and new one, to be enabled at the same time during the operation.

Patch 1~3 are minor cleanup & fixes.
Patch 4 add CLK_SET_PARENT_ON flags in clock core to support such type clocks
Patch 5 show the need of introducing clk_core_enable_lock and
	clk_core_disable_lock to easily use and reduce duplicated code.
	It can be merged into patch 4 if required.

The patch series is based on for-next branch of Michael's git:
git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git

Dong Aisheng (5):
  clk: change clk_core name of __clk_set_parent_after
  clk: add missing lock when call clk_core_enable in clk_set_parent
  clk: remove unneeded __clk_enable and __clk_disable
  clk: core: add CLK_SET_PARENT_ON flags to support clocks require
    parent on
  clk: introduce clk_core_enable_lock and clk_core_disable_lock
    functions

 drivers/clk/clk.c            | 112 ++++++++++++++++++++++++++++++++++---------
 include/linux/clk-provider.h |   5 ++
 2 files changed, 94 insertions(+), 23 deletions(-)

-- 
1.9.1
