Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:19083 "EHLO
	conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753216AbcEEH5e (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 5 May 2016 03:57:34 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-clk@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
	Jay Sternberg <jay.e.sternberg@intel.com>,
	Jens Axboe <axboe@fb.com>, linux-kernel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>,
	=?UTF-8?q?Matias=20Bj=C3=B8rling?= <m@bjorling.me>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Valentin Rothberg <valentinrothberg@gmail.com>
Subject: [PATCH] clk: probe common clock drivers earlier
Date: Thu,  5 May 2016 16:57:17 +0900
Message-Id: <1462435037-27979-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Several SoCs implement platform drivers for clocks rather than
CLK_OF_DECLARE().  Clocks should come earlier because they are
prerequisites for many of other drivers.  It will help to mitigate
EPROBE_DEFER issues.

Also, drop the comment since it does not look valuable.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/Makefile b/drivers/Makefile
index 8f5d076..a2a4922 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -44,6 +44,7 @@ obj-$(CONFIG_REGULATOR)		+= regulator/
 
 # reset controllers early, since gpu drivers might rely on them to initialize
 obj-$(CONFIG_RESET_CONTROLLER)	+= reset/
+obj-y				+= clk/
 
 # tty/ comes before char/ so that the VT console is the boot-time
 # default.
@@ -141,8 +142,6 @@ obj-$(CONFIG_VHOST_RING)	+= vhost/
 obj-$(CONFIG_VLYNQ)		+= vlynq/
 obj-$(CONFIG_STAGING)		+= staging/
 obj-y				+= platform/
-#common clk code
-obj-y				+= clk/
 
 obj-$(CONFIG_MAILBOX)		+= mailbox/
 obj-$(CONFIG_HWSPINLOCK)	+= hwspinlock/
-- 
1.9.1

