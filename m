Return-Path: <SRS0=aw6K=MH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A830AC43382
	for <linux-clk@archiver.kernel.org>; Tue, 25 Sep 2018 07:34:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4DBD920877
	for <linux-clk@archiver.kernel.org>; Tue, 25 Sep 2018 07:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DBD920877
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728488AbeIYNk1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Sep 2018 09:40:27 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:41972 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbeIYNk1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Sep 2018 09:40:27 -0400
Received: from ramsan.of.borg ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id fja81y00y3XaVaC06ja8s9; Tue, 25 Sep 2018 09:34:09 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.86_2)
        (envelope-from <geert@linux-m68k.org>)
        id 1g4hrE-0000HU-Mq; Tue, 25 Sep 2018 09:34:08 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1g4hrE-0006u4-Ki; Tue, 25 Sep 2018 09:34:08 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: Convert to SPDX identifiers
Date:   Tue, 25 Sep 2018 09:34:05 +0200
Message-Id: <20180925073405.26491-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180925073405.ot-dDqBePj6xlEfCbhqD7dhyPA1omHt4qDgN45II_kw@z>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

This patch updates license to use SPDX-License-Identifier
instead of verbose license text.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
[rebased against clk-spdx]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
	Hi Mike, Stephen,

Morimoto-san converted all files under drivers/clk/renesas/, while you had
already applied the partial conversion e848c2ea117f222b ("clk: renesas:
use SPDX identifier for Renesas drivers") from Wolfram.

Hence I rebased Morimoto-san's work on top of the clk-spdx branch, which is
where Wolfram's patch was applied.

Please apply directly.  Thanks!

 drivers/clk/renesas/Kconfig             |  2 ++
 drivers/clk/renesas/clk-emev2.c         | 14 +-------------
 drivers/clk/renesas/clk-mstp.c          |  5 +----
 drivers/clk/renesas/clk-r8a73a4.c       |  5 +----
 drivers/clk/renesas/clk-r8a7740.c       |  5 +----
 drivers/clk/renesas/clk-r8a7778.c       |  5 +----
 drivers/clk/renesas/clk-r8a7779.c       |  5 +----
 drivers/clk/renesas/clk-rcar-gen2.c     |  5 +----
 drivers/clk/renesas/clk-rz.c            |  5 +----
 drivers/clk/renesas/clk-sh73a0.c        |  5 +----
 drivers/clk/renesas/r8a7743-cpg-mssr.c  |  5 +----
 drivers/clk/renesas/r8a7745-cpg-mssr.c  |  5 +----
 drivers/clk/renesas/r8a7790-cpg-mssr.c  |  5 +----
 drivers/clk/renesas/r8a7791-cpg-mssr.c  |  5 +----
 drivers/clk/renesas/r8a7792-cpg-mssr.c  |  5 +----
 drivers/clk/renesas/r8a7794-cpg-mssr.c  |  5 +----
 drivers/clk/renesas/r8a77970-cpg-mssr.c |  5 +----
 drivers/clk/renesas/rcar-gen2-cpg.c     |  5 +----
 drivers/clk/renesas/rcar-gen2-cpg.h     |  7 ++-----
 drivers/clk/renesas/rcar-gen3-cpg.h     |  7 ++-----
 drivers/clk/renesas/renesas-cpg-mssr.h  |  4 ++--
 include/linux/clk/renesas.h             |  8 ++------
 22 files changed, 27 insertions(+), 95 deletions(-)

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 9022bbe1297e7f3c..ab2110f962256079 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -1,3 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
 config CLK_RENESAS
 	bool "Renesas SoC clock support" if COMPILE_TEST && !ARCH_RENESAS
 	default y if ARCH_RENESAS
diff --git a/drivers/clk/renesas/clk-emev2.c b/drivers/clk/renesas/clk-emev2.c
index a91825471c79acd2..7f3b5f9631bd4db1 100644
--- a/drivers/clk/renesas/clk-emev2.c
+++ b/drivers/clk/renesas/clk-emev2.c
@@ -1,21 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * EMMA Mobile EV2 common clock framework support
  *
  * Copyright (C) 2013 Takashi Yoshii <takashi.yoshii.ze@renesas.com>
  * Copyright (C) 2012 Magnus Damm
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; version 2 of the License.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
  */
 #include <linux/clk-provider.h>
 #include <linux/clkdev.h>
diff --git a/drivers/clk/renesas/clk-mstp.c b/drivers/clk/renesas/clk-mstp.c
index e82adcb16a52a3b7..7df14bb1cbbcfc1e 100644
--- a/drivers/clk/renesas/clk-mstp.c
+++ b/drivers/clk/renesas/clk-mstp.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * R-Car MSTP clocks
  *
@@ -5,10 +6,6 @@
  * Copyright (C) 2015 Glider bvba
  *
  * Contact: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; version 2 of the License.
  */
 
 #include <linux/clk.h>
diff --git a/drivers/clk/renesas/clk-r8a73a4.c b/drivers/clk/renesas/clk-r8a73a4.c
index 7b903ce4c9015ad7..e1a9e89defddf8dc 100644
--- a/drivers/clk/renesas/clk-r8a73a4.c
+++ b/drivers/clk/renesas/clk-r8a73a4.c
@@ -1,11 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * r8a73a4 Core CPG Clocks
  *
  * Copyright (C) 2014  Ulrich Hecht
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; version 2 of the License.
  */
 
 #include <linux/clk-provider.h>
diff --git a/drivers/clk/renesas/clk-r8a7740.c b/drivers/clk/renesas/clk-r8a7740.c
index a7a30d2eca418f6e..d6817126313779d1 100644
--- a/drivers/clk/renesas/clk-r8a7740.c
+++ b/drivers/clk/renesas/clk-r8a7740.c
@@ -1,11 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * r8a7740 Core CPG Clocks
  *
  * Copyright (C) 2014  Ulrich Hecht
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; version 2 of the License.
  */
 
 #include <linux/clk-provider.h>
diff --git a/drivers/clk/renesas/clk-r8a7778.c b/drivers/clk/renesas/clk-r8a7778.c
index 886a8380e91247a1..f986ba34661d59f4 100644
--- a/drivers/clk/renesas/clk-r8a7778.c
+++ b/drivers/clk/renesas/clk-r8a7778.c
@@ -1,11 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * r8a7778 Core CPG Clocks
  *
  * Copyright (C) 2014  Ulrich Hecht
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; version 2 of the License.
  */
 
 #include <linux/clk-provider.h>
diff --git a/drivers/clk/renesas/clk-r8a7779.c b/drivers/clk/renesas/clk-r8a7779.c
index 5adcca4656c33303..437d92cb0630524a 100644
--- a/drivers/clk/renesas/clk-r8a7779.c
+++ b/drivers/clk/renesas/clk-r8a7779.c
@@ -1,13 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * r8a7779 Core CPG Clocks
  *
  * Copyright (C) 2013, 2014 Horms Solutions Ltd.
  *
  * Contact: Simon Horman <horms@verge.net.au>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; version 2 of the License.
  */
 
 #include <linux/clk-provider.h>
diff --git a/drivers/clk/renesas/clk-rcar-gen2.c b/drivers/clk/renesas/clk-rcar-gen2.c
index bccd62f2cb092fac..738b723045ce18a0 100644
--- a/drivers/clk/renesas/clk-rcar-gen2.c
+++ b/drivers/clk/renesas/clk-rcar-gen2.c
@@ -1,13 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * rcar_gen2 Core CPG Clocks
  *
  * Copyright (C) 2013  Ideas On Board SPRL
  *
  * Contact: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; version 2 of the License.
  */
 
 #include <linux/clk-provider.h>
diff --git a/drivers/clk/renesas/clk-rz.c b/drivers/clk/renesas/clk-rz.c
index ac2f86d626b694be..7fe8729bf66c84cb 100644
--- a/drivers/clk/renesas/clk-rz.c
+++ b/drivers/clk/renesas/clk-rz.c
@@ -1,12 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * RZ/A1 Core CPG Clocks
  *
  * Copyright (C) 2013 Ideas On Board SPRL
  * Copyright (C) 2014 Wolfram Sang, Sang Engineering <wsa@sang-engineering.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; version 2 of the License.
  */
 
 #include <linux/clk-provider.h>
diff --git a/drivers/clk/renesas/clk-sh73a0.c b/drivers/clk/renesas/clk-sh73a0.c
index bab33610eb6caedf..576259237666bc07 100644
--- a/drivers/clk/renesas/clk-sh73a0.c
+++ b/drivers/clk/renesas/clk-sh73a0.c
@@ -1,11 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * sh73a0 Core CPG Clocks
  *
  * Copyright (C) 2014  Ulrich Hecht
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; version 2 of the License.
  */
 
 #include <linux/clk-provider.h>
diff --git a/drivers/clk/renesas/r8a7743-cpg-mssr.c b/drivers/clk/renesas/r8a7743-cpg-mssr.c
index 011c170ec3f95d65..f880b9cb72e0172f 100644
--- a/drivers/clk/renesas/r8a7743-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7743-cpg-mssr.c
@@ -1,11 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * r8a7743 Clock Pulse Generator / Module Standby and Software Reset
  *
  * Copyright (C) 2016 Cogent Embedded Inc.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License version 2 as published
- * by the Free Software Foundation; of the License.
  */
 
 #include <linux/device.h>
diff --git a/drivers/clk/renesas/r8a7745-cpg-mssr.c b/drivers/clk/renesas/r8a7745-cpg-mssr.c
index 4b0a9243b7481176..493874e5ebeeb6bb 100644
--- a/drivers/clk/renesas/r8a7745-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7745-cpg-mssr.c
@@ -1,11 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * r8a7745 Clock Pulse Generator / Module Standby and Software Reset
  *
  * Copyright (C) 2016 Cogent Embedded Inc.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License version 2 as published
- * by the Free Software Foundation; of the License.
  */
 
 #include <linux/device.h>
diff --git a/drivers/clk/renesas/r8a7790-cpg-mssr.c b/drivers/clk/renesas/r8a7790-cpg-mssr.c
index f936cb74b6811678..c57cb93f831589f8 100644
--- a/drivers/clk/renesas/r8a7790-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7790-cpg-mssr.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * r8a7790 Clock Pulse Generator / Module Standby and Software Reset
  *
@@ -6,10 +7,6 @@
  * Based on clk-rcar-gen2.c
  *
  * Copyright (C) 2013 Ideas On Board SPRL
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; version 2 of the License.
  */
 
 #include <linux/device.h>
diff --git a/drivers/clk/renesas/r8a7791-cpg-mssr.c b/drivers/clk/renesas/r8a7791-cpg-mssr.c
index 1b91f03b75980766..65702debcabbf654 100644
--- a/drivers/clk/renesas/r8a7791-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7791-cpg-mssr.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * r8a7791 Clock Pulse Generator / Module Standby and Software Reset
  *
@@ -6,10 +7,6 @@
  * Based on clk-rcar-gen2.c
  *
  * Copyright (C) 2013 Ideas On Board SPRL
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; version 2 of the License.
  */
 
 #include <linux/device.h>
diff --git a/drivers/clk/renesas/r8a7792-cpg-mssr.c b/drivers/clk/renesas/r8a7792-cpg-mssr.c
index 493e07859f5fa40d..cf8b84a3a06052fb 100644
--- a/drivers/clk/renesas/r8a7792-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7792-cpg-mssr.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * r8a7792 Clock Pulse Generator / Module Standby and Software Reset
  *
@@ -6,10 +7,6 @@
  * Based on clk-rcar-gen2.c
  *
  * Copyright (C) 2013 Ideas On Board SPRL
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; version 2 of the License.
  */
 
 #include <linux/device.h>
diff --git a/drivers/clk/renesas/r8a7794-cpg-mssr.c b/drivers/clk/renesas/r8a7794-cpg-mssr.c
index 088f4b79fdfcdab4..c1948693c5c1c499 100644
--- a/drivers/clk/renesas/r8a7794-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7794-cpg-mssr.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * r8a7794 Clock Pulse Generator / Module Standby and Software Reset
  *
@@ -6,10 +7,6 @@
  * Based on clk-rcar-gen2.c
  *
  * Copyright (C) 2013 Ideas On Board SPRL
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; version 2 of the License.
  */
 
 #include <linux/device.h>
diff --git a/drivers/clk/renesas/r8a77970-cpg-mssr.c b/drivers/clk/renesas/r8a77970-cpg-mssr.c
index f55842917e8dd36a..38509873d06c4c50 100644
--- a/drivers/clk/renesas/r8a77970-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77970-cpg-mssr.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * r8a77970 Clock Pulse Generator / Module Standby and Software Reset
  *
@@ -6,10 +7,6 @@
  * Based on r8a7795-cpg-mssr.c
  *
  * Copyright (C) 2015 Glider bvba
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; version 2 of the License.
  */
 
 #include <linux/device.h>
diff --git a/drivers/clk/renesas/rcar-gen2-cpg.c b/drivers/clk/renesas/rcar-gen2-cpg.c
index daf88bc2cdae177b..f596a2dafcf4d8d1 100644
--- a/drivers/clk/renesas/rcar-gen2-cpg.c
+++ b/drivers/clk/renesas/rcar-gen2-cpg.c
@@ -1,11 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * R-Car Gen2 Clock Pulse Generator
  *
  * Copyright (C) 2016 Cogent Embedded Inc.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License version 2 as published
- * by the Free Software Foundation.
  */
 
 #include <linux/bug.h>
diff --git a/drivers/clk/renesas/rcar-gen2-cpg.h b/drivers/clk/renesas/rcar-gen2-cpg.h
index 020a3baad0154231..bff9551c7a38a01e 100644
--- a/drivers/clk/renesas/rcar-gen2-cpg.h
+++ b/drivers/clk/renesas/rcar-gen2-cpg.h
@@ -1,11 +1,8 @@
-/*
+/* SPDX-License-Identifier: GPL-2.0
+ *
  * R-Car Gen2 Clock Pulse Generator
  *
  * Copyright (C) 2016 Cogent Embedded Inc.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License version 2 as published
- * by the Free Software Foundation; version 2 of the License.
  */
 
 #ifndef __CLK_RENESAS_RCAR_GEN2_CPG_H__
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.h b/drivers/clk/renesas/rcar-gen3-cpg.h
index ea4f8fc3c4c972e7..6ebc4b42c5a3b584 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.h
+++ b/drivers/clk/renesas/rcar-gen3-cpg.h
@@ -1,11 +1,8 @@
-/*
+/* SPDX-License-Identifier: GPL-2.0
+ *
  * R-Car Gen3 Clock Pulse Generator
  *
  * Copyright (C) 2015-2016 Glider bvba
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; version 2 of the License.
  */
 
 #ifndef __CLK_RENESAS_RCAR_GEN3_CPG_H__
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.h b/drivers/clk/renesas/renesas-cpg-mssr.h
index 59b1b30c1dba5db8..d52d1f8da9d7932b 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.h
+++ b/drivers/clk/renesas/renesas-cpg-mssr.h
@@ -1,5 +1,5 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
+/* SPDX-License-Identifier: GPL-2.0
+ *
  * Renesas Clock Pulse Generator / Module Standby and Software Reset
  *
  * Copyright (C) 2015 Glider bvba
diff --git a/include/linux/clk/renesas.h b/include/linux/clk/renesas.h
index 9ebf1f8243bb57af..0ebbe2f0b45e7854 100644
--- a/include/linux/clk/renesas.h
+++ b/include/linux/clk/renesas.h
@@ -1,14 +1,10 @@
-/*
+/* SPDX-License-Identifier: GPL-2.0+
+ *
  * Copyright 2013 Ideas On Board SPRL
  * Copyright 2013, 2014 Horms Solutions Ltd.
  *
  * Contact: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  * Contact: Simon Horman <horms@verge.net.au>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
  */
 
 #ifndef __LINUX_CLK_RENESAS_H_
-- 
2.17.1

