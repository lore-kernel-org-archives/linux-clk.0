Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:19671 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751476AbcIRQSc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 18 Sep 2016 12:18:32 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Cc: linux-clk@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Jay Sternberg <jay.e.sternberg@intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Andrew F. Davis" <afd@ti.com>, Jens Axboe <axboe@fb.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Sebastian Reichel <sre@kernel.org>,
        =?UTF-8?q?Matias=20Bj=C3=B8rling?= <m@bjorling.me>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Subject: [RESEND PATCH v2] clk: probe common clock drivers earlier
Date: Mon, 19 Sep 2016 01:16:44 +0900
Message-Id: <1474215404-13433-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Several SoCs implement platform drivers for clocks rather than
CLK_OF_DECLARE().  Clocks should come earlier because they are
prerequisites for many of other drivers.  It will help to mitigate
EPROBE_DEFER issues.

Also, drop the comment since it does not carry much value.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Acked-by: Michael Turquette <mturquette@baylibre.com>
---

Changes in v2:
  - Move clk/ even earlier.
    (above dma/ since many of DMA drivers use clk.)

 drivers/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/Makefile b/drivers/Makefile
index 53abb4a..f0afdfb 100644
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
@@ -142,8 +144,6 @@ obj-$(CONFIG_VHOST)		+= vhost/
 obj-$(CONFIG_VLYNQ)		+= vlynq/
 obj-$(CONFIG_STAGING)		+= staging/
 obj-y				+= platform/
-#common clk code
-obj-y				+= clk/
 
 obj-$(CONFIG_MAILBOX)		+= mailbox/
 obj-$(CONFIG_HWSPINLOCK)	+= hwspinlock/
-- 
1.9.1

