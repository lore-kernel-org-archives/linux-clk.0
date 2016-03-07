Return-Path: <horms@vergenet.net>
From: Simon Horman <horms+renesas@verge.net.au>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@baylibre.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] clk: renesas: Rename header file renesas.h
Date: Mon,  7 Mar 2016 10:44:25 +0900
Message-Id: <1457315065-28705-1-git-send-email-horms+renesas@verge.net.au>
List-ID: <linux-clk.vger.kernel.org>

This is part of an ongoing process to migrate from ARCH_SHMOBILE to
ARCH_RENESAS the motivation for which being that RENESAS seems to be a more
appropriate name than SHMOBILE for the majority of Renesas ARM based SoCs.

Along with the above mentioned Kconfig changes it seems appropriate
to also rename files.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

---
* Based on clk-next
* As the co-maintainer of Renesas ARM-based SoCs I am happy
  with the arch/arm/mach-shmobile/ changes going through the clk tree
  as I believe the likelyhood of conflicts is low. And yes, I realise
  that directory could do with a rename too.
---
 arch/arm/mach-shmobile/pm-rmobile.c      |  2 +-
 arch/arm/mach-shmobile/setup-r8a7778.c   |  2 +-
 arch/arm/mach-shmobile/setup-r8a7779.c   |  2 +-
 arch/arm/mach-shmobile/setup-rcar-gen2.c |  2 +-
 drivers/clk/renesas/clk-mstp.c           |  2 +-
 drivers/clk/renesas/clk-r8a73a4.c        |  2 +-
 drivers/clk/renesas/clk-r8a7740.c        |  2 +-
 drivers/clk/renesas/clk-r8a7778.c        |  2 +-
 drivers/clk/renesas/clk-r8a7779.c        |  2 +-
 drivers/clk/renesas/clk-rcar-gen2.c      |  2 +-
 drivers/clk/renesas/clk-rz.c             |  2 +-
 drivers/clk/renesas/clk-sh73a0.c         |  2 +-
 include/linux/clk/renesas.h              | 35 ++++++++++++++++++++++++++++++++
 include/linux/clk/shmobile.h             | 35 --------------------------------
 14 files changed, 47 insertions(+), 47 deletions(-)
 create mode 100644 include/linux/clk/renesas.h
 delete mode 100644 include/linux/clk/shmobile.h

diff --git a/arch/arm/mach-shmobile/pm-rmobile.c b/arch/arm/mach-shmobile/pm-rmobile.c
index 46d0a1ddce75..c0b05e9e6442 100644
--- a/arch/arm/mach-shmobile/pm-rmobile.c
+++ b/arch/arm/mach-shmobile/pm-rmobile.c
@@ -12,7 +12,7 @@
  * License.  See the file "COPYING" in the main directory of this archive
  * for more details.
  */
-#include <linux/clk/shmobile.h>
+#include <linux/clk/renesas.h>
 #include <linux/console.h>
 #include <linux/delay.h>
 #include <linux/of.h>
diff --git a/arch/arm/mach-shmobile/setup-r8a7778.c b/arch/arm/mach-shmobile/setup-r8a7778.c
index fab95d1271bc..cf236db686a9 100644
--- a/arch/arm/mach-shmobile/setup-r8a7778.c
+++ b/arch/arm/mach-shmobile/setup-r8a7778.c
@@ -15,7 +15,7 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/clk/shmobile.h>
+#include <linux/clk/renesas.h>
 #include <linux/io.h>
 #include <linux/irqchip.h>
 
diff --git a/arch/arm/mach-shmobile/setup-r8a7779.c b/arch/arm/mach-shmobile/setup-r8a7779.c
index 1e572a903f8e..0007ff51d180 100644
--- a/arch/arm/mach-shmobile/setup-r8a7779.c
+++ b/arch/arm/mach-shmobile/setup-r8a7779.c
@@ -14,7 +14,7 @@
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU General Public License for more details.
  */
-#include <linux/clk/shmobile.h>
+#include <linux/clk/renesas.h>
 #include <linux/clocksource.h>
 #include <linux/init.h>
 #include <linux/irq.h>
diff --git a/arch/arm/mach-shmobile/setup-rcar-gen2.c b/arch/arm/mach-shmobile/setup-rcar-gen2.c
index 9eccde3c7b13..949b402c0f19 100644
--- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c
@@ -15,7 +15,7 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/clk/shmobile.h>
+#include <linux/clk/renesas.h>
 #include <linux/clocksource.h>
 #include <linux/device.h>
 #include <linux/dma-contiguous.h>
diff --git a/drivers/clk/renesas/clk-mstp.c b/drivers/clk/renesas/clk-mstp.c
index 3b09716ebda2..3d44e183aedd 100644
--- a/drivers/clk/renesas/clk-mstp.c
+++ b/drivers/clk/renesas/clk-mstp.c
@@ -14,7 +14,7 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/clkdev.h>
-#include <linux/clk/shmobile.h>
+#include <linux/clk/renesas.h>
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/of.h>
diff --git a/drivers/clk/renesas/clk-r8a73a4.c b/drivers/clk/renesas/clk-r8a73a4.c
index 9326204bed9d..28d204bb659e 100644
--- a/drivers/clk/renesas/clk-r8a73a4.c
+++ b/drivers/clk/renesas/clk-r8a73a4.c
@@ -9,7 +9,7 @@
  */
 
 #include <linux/clk-provider.h>
-#include <linux/clk/shmobile.h>
+#include <linux/clk/renesas.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
diff --git a/drivers/clk/renesas/clk-r8a7740.c b/drivers/clk/renesas/clk-r8a7740.c
index 1e6b1da58065..2f7ce6696b6c 100644
--- a/drivers/clk/renesas/clk-r8a7740.c
+++ b/drivers/clk/renesas/clk-r8a7740.c
@@ -9,7 +9,7 @@
  */
 
 #include <linux/clk-provider.h>
-#include <linux/clk/shmobile.h>
+#include <linux/clk/renesas.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
diff --git a/drivers/clk/renesas/clk-r8a7778.c b/drivers/clk/renesas/clk-r8a7778.c
index b1741551fff2..40e3a501a50e 100644
--- a/drivers/clk/renesas/clk-r8a7778.c
+++ b/drivers/clk/renesas/clk-r8a7778.c
@@ -9,7 +9,7 @@
  */
 
 #include <linux/clk-provider.h>
-#include <linux/clk/shmobile.h>
+#include <linux/clk/renesas.h>
 #include <linux/of_address.h>
 #include <linux/slab.h>
 
diff --git a/drivers/clk/renesas/clk-r8a7779.c b/drivers/clk/renesas/clk-r8a7779.c
index 92275c5f2c60..cf2a37df03b1 100644
--- a/drivers/clk/renesas/clk-r8a7779.c
+++ b/drivers/clk/renesas/clk-r8a7779.c
@@ -11,7 +11,7 @@
  */
 
 #include <linux/clk-provider.h>
-#include <linux/clk/shmobile.h>
+#include <linux/clk/renesas.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/of.h>
diff --git a/drivers/clk/renesas/clk-rcar-gen2.c b/drivers/clk/renesas/clk-rcar-gen2.c
index 841977240305..00e6aba4b9c0 100644
--- a/drivers/clk/renesas/clk-rcar-gen2.c
+++ b/drivers/clk/renesas/clk-rcar-gen2.c
@@ -11,7 +11,7 @@
  */
 
 #include <linux/clk-provider.h>
-#include <linux/clk/shmobile.h>
+#include <linux/clk/renesas.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/math64.h>
diff --git a/drivers/clk/renesas/clk-rz.c b/drivers/clk/renesas/clk-rz.c
index 9766e3cb595f..f6312c62f16b 100644
--- a/drivers/clk/renesas/clk-rz.c
+++ b/drivers/clk/renesas/clk-rz.c
@@ -10,7 +10,7 @@
  */
 
 #include <linux/clk-provider.h>
-#include <linux/clk/shmobile.h>
+#include <linux/clk/renesas.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/of.h>
diff --git a/drivers/clk/renesas/clk-sh73a0.c b/drivers/clk/renesas/clk-sh73a0.c
index 8966f8bbfd72..eea38f6ea77e 100644
--- a/drivers/clk/renesas/clk-sh73a0.c
+++ b/drivers/clk/renesas/clk-sh73a0.c
@@ -9,7 +9,7 @@
  */
 
 #include <linux/clk-provider.h>
-#include <linux/clk/shmobile.h>
+#include <linux/clk/renesas.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/of.h>
diff --git a/include/linux/clk/renesas.h b/include/linux/clk/renesas.h
new file mode 100644
index 000000000000..cb19cc1865ca
--- /dev/null
+++ b/include/linux/clk/renesas.h
@@ -0,0 +1,35 @@
+/*
+ * Copyright 2013 Ideas On Board SPRL
+ * Copyright 2013, 2014 Horms Solutions Ltd.
+ *
+ * Contact: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+ * Contact: Simon Horman <horms@verge.net.au>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#ifndef __LINUX_CLK_SHMOBILE_H_
+#define __LINUX_CLK_SHMOBILE_H_
+
+#include <linux/types.h>
+
+struct device;
+struct device_node;
+struct generic_pm_domain;
+
+void r8a7778_clocks_init(u32 mode);
+void r8a7779_clocks_init(u32 mode);
+void rcar_gen2_clocks_init(u32 mode);
+
+#ifdef CONFIG_PM_GENERIC_DOMAINS_OF
+void cpg_mstp_add_clk_domain(struct device_node *np);
+int cpg_mstp_attach_dev(struct generic_pm_domain *domain, struct device *dev);
+void cpg_mstp_detach_dev(struct generic_pm_domain *domain, struct device *dev);
+#else
+static inline void cpg_mstp_add_clk_domain(struct device_node *np) {}
+#endif
+
+#endif
diff --git a/include/linux/clk/shmobile.h b/include/linux/clk/shmobile.h
deleted file mode 100644
index cb19cc1865ca..000000000000
--- a/include/linux/clk/shmobile.h
+++ /dev/null
@@ -1,35 +0,0 @@
-/*
- * Copyright 2013 Ideas On Board SPRL
- * Copyright 2013, 2014 Horms Solutions Ltd.
- *
- * Contact: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
- * Contact: Simon Horman <horms@verge.net.au>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- */
-
-#ifndef __LINUX_CLK_SHMOBILE_H_
-#define __LINUX_CLK_SHMOBILE_H_
-
-#include <linux/types.h>
-
-struct device;
-struct device_node;
-struct generic_pm_domain;
-
-void r8a7778_clocks_init(u32 mode);
-void r8a7779_clocks_init(u32 mode);
-void rcar_gen2_clocks_init(u32 mode);
-
-#ifdef CONFIG_PM_GENERIC_DOMAINS_OF
-void cpg_mstp_add_clk_domain(struct device_node *np);
-int cpg_mstp_attach_dev(struct generic_pm_domain *domain, struct device *dev);
-void cpg_mstp_detach_dev(struct generic_pm_domain *domain, struct device *dev);
-#else
-static inline void cpg_mstp_add_clk_domain(struct device_node *np) {}
-#endif
-
-#endif
-- 
2.1.4
