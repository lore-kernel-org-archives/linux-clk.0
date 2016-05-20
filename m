Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:49492 "EHLO
	conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751618AbcETOvP (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 20 May 2016 10:51:15 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-clk@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Jay Sternberg <jay.e.sternberg@intel.com>,
	Jens Axboe <axboe@fb.com>, linux-kernel@vger.kernel.org,
	=?UTF-8?q?Matias=20Bj=C3=B8rling?= <m@bjorling.me>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	Alan Tull <atull@opensource.altera.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Valentin Rothberg <valentinrothberg@gmail.com>
Subject: [PATCH v2] clk: probe common clock drivers earlier
Date: Fri, 20 May 2016 23:49:53 +0900
Message-Id: <1463755793-9131-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Several SoCs implement platform drivers for clocks rather than
CLK_OF_DECLARE().  Clocks should come earlier because they are
prerequisites for many of other drivers.  It will help to mitigate
EPROBE_DEFER issues.

Also, drop the comment since it does not look valuable.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Move clk/ above dma/ since DMA drivers generally enable clk

 drivers/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/Makefile b/drivers/Makefile
index 8f5d076..ff39051 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -29,6 +29,8 @@ obj-$(CONFIG_SFI)		+= sfi/
 # was used and do nothing if so
 obj-$(CONFIG_PNP)		+= pnp/
 obj-y				+= amba/
+
+obj-y				+= clk/
 # Many drivers will want to use DMA so this has to be made available
 # really early.
 obj-$(CONFIG_DMADEVICES)	+= dma/
@@ -141,8 +143,6 @@ obj-$(CONFIG_VHOST_RING)	+= vhost/
 obj-$(CONFIG_VLYNQ)		+= vlynq/
 obj-$(CONFIG_STAGING)		+= staging/
 obj-y				+= platform/
-#common clk code
-obj-y				+= clk/
 
 obj-$(CONFIG_MAILBOX)		+= mailbox/
 obj-$(CONFIG_HWSPINLOCK)	+= hwspinlock/
-- 
1.9.1

