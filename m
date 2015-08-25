Return-Path: <manabian@gmail.com>
Return-Path: <manabian@gmail.com>
From: Joachim Eastwood <manabian@gmail.com>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: Joachim Eastwood <manabian@gmail.com>,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 0/2] Fix unused clock disabling on LPC18xx
Date: Tue, 25 Aug 2015 20:34:01 +0200
Message-Id: <1440527643-2960-1-git-send-email-manabian@gmail.com>
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

Maybe this check to see if the parent clock is running clock be added
to the clk core and enabled with a flag(?) For now this patch set fixes
the issue seen on lpc18xx.

Changes since v2:
 - Add clk.h to cgu since it uses clk_get_parent().
 - Rebase on clk-next

Joachim Eastwood (2):
  clk: lpc18xx-ccu: fix potential system hang when disabling unused clocks
  clk: lpc18xx-cgu: fix potential system hang when disabling unused clocks

 drivers/clk/nxp/clk-lpc18xx-ccu.c | 14 +++++++++++++
 drivers/clk/nxp/clk-lpc18xx-cgu.c | 43 ++++++++++++++++++++++++++++++++++++---
 2 files changed, 54 insertions(+), 3 deletions(-)

-- 
1.8.0
