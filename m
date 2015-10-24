Return-Path: <manabian@gmail.com>
Return-Path: <manabian@gmail.com>
From: Joachim Eastwood <manabian@gmail.com>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: Joachim Eastwood <manabian@gmail.com>,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 0/3] Fix unused clock disabling on LPC18xx
Date: Sat, 24 Oct 2015 18:55:21 +0200
Message-Id: <1445705724-20805-1-git-send-email-manabian@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

I have finally managed to track down the reason for the hang that would
occur when disabling clocks on lpc18xx under certain conditions. These
conditions depend on boot mode used, what the boot loader does and if
certain devices are enabled.

One of reasons why it took me a while was that my primary platform was
not affected by it and the data sheet has a rather misleading typo.

The hang will occur if the boot rom/loader doesn't setup USB0 clocks
and if certain AMBA devices are enabled (PL022 SSP and maybe others).

Cause of the hang is that the CCU registers can not be accessed if the
base (parent) clock is not enabled. To make sure the parent is running
a check for this has been added to the is_enabled clk_ops callback.
Since clocks in the CGU can be cascaded this check must also be added
here.

To better understand the clock system on lpc18xx please take the time
to look at the diagrams on:
https://github.com/manabian/linux-lpc/wiki/LPC18xx-LPC43xx-clocks

This version address the comments from Stephen Boyd.

Changes since v3:
 - add clk_hw_is_enabled
 - fix typo on CGU gate enable function
 - use clk_hw_get_parent() insted of clk_get_parent()
 - rebase on v4.3-rc1

Changes since v2:
 - Add clk.h to cgu since it uses clk_get_parent().
 - Rebase on clk-next

Joachim Eastwood (3):
  clk: Add clk_hw_is_enabled() for use by clk providers
  clk: lpc18xx-ccu: fix potential system hang when disabling unused clocks
  clk: lpc18xx-cgu: fix potential system hang when disabling unused clocks

 drivers/clk/clk.c                 |  5 +++++
 drivers/clk/nxp/clk-lpc18xx-ccu.c | 17 ++++++++++++++--
 drivers/clk/nxp/clk-lpc18xx-cgu.c | 42 ++++++++++++++++++++++++++++++++++++---
 include/linux/clk-provider.h      |  1 +
 4 files changed, 60 insertions(+), 5 deletions(-)

-- 
1.8.0
