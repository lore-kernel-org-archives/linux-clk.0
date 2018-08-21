Return-Path: <wsa+renesas@sang-engineering.com>
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/11] clk: renesas: use SPDX identifier for Renesas drivers
Date: Wed, 22 Aug 2018 00:02:14 +0200
Message-Id: <20180821220233.9202-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180821220233.9202-1-wsa+renesas@sang-engineering.com>
References: <20180821220233.9202-1-wsa+renesas@sang-engineering.com>
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

To be applied individually per subsystem tree. Morimoto-san, could you maybe
ack this with your Renesas address?

 drivers/clk/renesas/clk-div6.c            | 5 +----
 drivers/clk/renesas/r8a7795-cpg-mssr.c    | 5 +----
 drivers/clk/renesas/r8a7796-cpg-mssr.c    | 5 +----
 drivers/clk/renesas/r8a77995-cpg-mssr.c   | 5 +----
 drivers/clk/renesas/rcar-gen3-cpg.c       | 5 +----
 drivers/clk/renesas/rcar-usb2-clock-sel.c | 5 +----
 drivers/clk/renesas/renesas-cpg-mssr.c    | 5 +----
 drivers/clk/renesas/renesas-cpg-mssr.h    | 5 +----
 8 files changed, 8 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/renesas/clk-div6.c b/drivers/clk/renesas/clk-div6.c
index 9febbf42c3df..6643733952a6 100644
--- a/drivers/clk/renesas/clk-div6.c
+++ b/drivers/clk/renesas/clk-div6.c
@@ -1,13 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * r8a7790 Common Clock Framework support
  *
  * Copyright (C) 2013  Renesas Solutions Corp.
  *
  * Contact: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; version 2 of the License.
  */
 
 #include <linux/clk-provider.h>
diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index ca8cb0eed950..119c02440726 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * r8a7795 Clock Pulse Generator / Module Standby and Software Reset
  *
@@ -6,10 +7,6 @@
  * Based on clk-rcar-gen3.c
  *
  * Copyright (C) 2015 Renesas Electronics Corp.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; version 2 of the License.
  */
 
 #include <linux/device.h>
diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index 7e98fb8b1074..10567386e6dd 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * r8a7796 Clock Pulse Generator / Module Standby and Software Reset
  *
@@ -7,10 +8,6 @@
  *
  * Copyright (C) 2015 Glider bvba
  * Copyright (C) 2015 Renesas Electronics Corp.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; version 2 of the License.
  */
 
 #include <linux/device.h>
diff --git a/drivers/clk/renesas/r8a77995-cpg-mssr.c b/drivers/clk/renesas/r8a77995-cpg-mssr.c
index 49e6a0de5491..47e60e3dbe05 100644
--- a/drivers/clk/renesas/r8a77995-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77995-cpg-mssr.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * r8a77995 Clock Pulse Generator / Module Standby and Software Reset
  *
@@ -7,10 +8,6 @@
  *
  * Copyright (C) 2015 Glider bvba
  * Copyright (C) 2015 Renesas Electronics Corp.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; version 2 of the License.
  */
 
 #include <linux/device.h>
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 4346fdeef01b..4ba38f98cc7b 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * R-Car Gen3 Clock Pulse Generator
  *
@@ -6,10 +7,6 @@
  * Based on clk-rcar-gen3.c
  *
  * Copyright (C) 2015 Renesas Electronics Corp.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; version 2 of the License.
  */
 
 #include <linux/bug.h>
diff --git a/drivers/clk/renesas/rcar-usb2-clock-sel.c b/drivers/clk/renesas/rcar-usb2-clock-sel.c
index 6cd030a58964..b241f9ca3d71 100644
--- a/drivers/clk/renesas/rcar-usb2-clock-sel.c
+++ b/drivers/clk/renesas/rcar-usb2-clock-sel.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Renesas R-Car USB2.0 clock selector
  *
@@ -6,10 +7,6 @@
  * Based on renesas-cpg-mssr.c
  *
  * Copyright (C) 2015 Glider bvba
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; version 2 of the License.
  */
 
 #include <linux/clk.h>
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index f90b0d0ba46a..1a0c15896894 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Renesas Clock Pulse Generator / Module Standby and Software Reset
  *
@@ -7,10 +8,6 @@
  *
  * Copyright (C) 2013 Ideas On Board SPRL
  * Copyright (C) 2015 Renesas Electronics Corp.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; version 2 of the License.
  */
 
 #include <linux/clk.h>
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.h b/drivers/clk/renesas/renesas-cpg-mssr.h
index 2e1730bc5ef2..874a4fb9f010 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.h
+++ b/drivers/clk/renesas/renesas-cpg-mssr.h
@@ -1,11 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Renesas Clock Pulse Generator / Module Standby and Software Reset
  *
  * Copyright (C) 2015 Glider bvba
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; version 2 of the License.
  */
 
 #ifndef __CLK_RENESAS_CPG_MSSR_H__
-- 
2.11.0
