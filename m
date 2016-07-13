Return-Path: <serveralex@gmail.com>
Return-Path: <serveralex@gmail.com>
From: =?UTF-8?q?Alexander=20M=C3=BCller?= <serveralex@gmail.com>
To: mturquette@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2 2/7] meson: clk: Move register definitions to meson8b.h
Date: Wed, 13 Jul 2016 19:49:36 +0200
Message-Id: <1468432181-9550-3-git-send-email-serveralex@gmail.com>
In-Reply-To: <1468432181-9550-1-git-send-email-serveralex@gmail.com>
References: <1468432181-9550-1-git-send-email-serveralex@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Alexander Müller <serveralex@gmail.com>
---
 drivers/clk/meson/meson8b.c | 17 +----------------
 drivers/clk/meson/meson8b.h | 40 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+), 16 deletions(-)
 create mode 100644 drivers/clk/meson/meson8b.h

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index b1902e9..537cc53 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -26,22 +26,7 @@
 #include <linux/module.h>
 
 #include "clkc.h"
-
-/*
- * Clock controller register offsets
- *
- * Register offsets from the HardKernel[0] data sheet are listed in comment
- * blocks below. Those offsets must be multiplied by 4 before adding them to
- * the base address to get the right value
- *
- * [0] http://dn.odroid.com/S805/Datasheet/S805_Datasheet%20V0.8%2020150126.pdf
- */
-#define MESON8B_REG_SYS_CPU_CNTL1	0x015c /* 0x57 offset in data sheet */
-#define MESON8B_REG_HHI_MPEG		0x0174 /* 0x5d offset in data sheet */
-#define MESON8B_REG_MALI		0x01b0 /* 0x6c offset in data sheet */
-#define MESON8B_REG_PLL_FIXED		0x0280
-#define MESON8B_REG_PLL_SYS		0x0300
-#define MESON8B_REG_PLL_VID		0x0320
+#include "meson8b.h"
 
 static DEFINE_SPINLOCK(clk_lock);
 
diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
new file mode 100644
index 0000000..5b9cb9f
--- /dev/null
+++ b/drivers/clk/meson/meson8b.h
@@ -0,0 +1,40 @@
+/*
+ * Copyright (c) 2015 Endless Mobile, Inc.
+ * Author: Carlo Caione <carlo@endlessm.com>
+ *
+ * Copyright (c) 2016 BayLibre, Inc.
+ * Michael Turquette <mturquette@baylibre.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef __MESON8B_H
+#define __MESON8B_H
+
+/*
+ * Clock controller register offsets
+ *
+ * Register offsets from the HardKernel[0] data sheet are listed in comment
+ * blocks below. Those offsets must be multiplied by 4 before adding them to
+ * the base address to get the right value
+ *
+ * [0] http://dn.odroid.com/S805/Datasheet/S805_Datasheet%20V0.8%2020150126.pdf
+ */
+#define MESON8B_REG_SYS_CPU_CNTL1	0x015c /* 0x57 offset in data sheet */
+#define MESON8B_REG_HHI_MPEG		0x0174 /* 0x5d offset in data sheet */
+#define MESON8B_REG_MALI		0x01b0 /* 0x6c offset in data sheet */
+#define MESON8B_REG_PLL_FIXED		0x0280
+#define MESON8B_REG_PLL_SYS		0x0300
+#define MESON8B_REG_PLL_VID		0x0320
+
+#endif /* __MESON8B_H */
-- 
2.5.0
