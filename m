Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mga18.intel.com ([134.134.136.126]:35622 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726413AbeHCE6m (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 3 Aug 2018 00:58:42 -0400
From: Songjun Wu <songjun.wu@linux.intel.com>
To: hua.ma@linux.intel.com, yixin.zhu@linux.intel.com,
        chuanhua.lei@linux.intel.com, qi-ming.wu@intel.com
Cc: linux-mips@linux-mips.org, linux-clk@vger.kernel.org,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        Songjun Wu <songjun.wu@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, Jiri Slaby <jslaby@suse.com>
Subject: [PATCH v2 16/18] serial: intel: Reorder the head files
Date: Fri,  3 Aug 2018 11:02:35 +0800
Message-Id: <20180803030237.3366-17-songjun.wu@linux.intel.com>
In-Reply-To: <20180803030237.3366-1-songjun.wu@linux.intel.com>
References: <20180803030237.3366-1-songjun.wu@linux.intel.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Reorder the head files according to the coding style.

Signed-off-by: Songjun Wu <songjun.wu@linux.intel.com>
---

Changes in v2:
- New patch to reorder the head files according to the coding style.

 drivers/tty/serial/lantiq.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/tty/serial/lantiq.c b/drivers/tty/serial/lantiq.c
index 35518ab3a80d..804aad60ed80 100644
--- a/drivers/tty/serial/lantiq.c
+++ b/drivers/tty/serial/lantiq.c
@@ -9,22 +9,22 @@
  * Copyright (C) 2018 Intel Corporation.
  */
 
-#include <linux/slab.h>
-#include <linux/ioport.h>
-#include <linux/init.h>
+#include <linux/clk.h>
 #include <linux/console.h>
-#include <linux/sysrq.h>
 #include <linux/device.h>
-#include <linux/tty.h>
-#include <linux/tty_flip.h>
-#include <linux/serial_core.h>
-#include <linux/serial.h>
-#include <linux/of_platform.h>
+#include <linux/gpio.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
-#include <linux/io.h>
-#include <linux/clk.h>
-#include <linux/gpio.h>
+#include <linux/of_platform.h>
+#include <linux/serial.h>
+#include <linux/serial_core.h>
+#include <linux/slab.h>
+#include <linux/sysrq.h>
+#include <linux/tty.h>
+#include <linux/tty_flip.h>
 
 #ifdef CONFIG_LANTIQ
 #include <lantiq_soc.h>
-- 
2.11.0

