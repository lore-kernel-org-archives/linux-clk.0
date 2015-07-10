Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:33995 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753312AbbGJXdv (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 10 Jul 2015 19:33:51 -0400
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 21/45] clk: rockchip: Properly include clk.h
Date: Fri, 10 Jul 2015 16:33:19 -0700
Message-Id: <1436571223-10959-22-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Clock provider drivers generally shouldn't include clk.h because
it's the consumer API. Only include clk.h if it's actually used.

Cc: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/rockchip/clk-cpu.c       | 1 +
 drivers/clk/rockchip/clk-mmc-phase.c | 1 +
 drivers/clk/rockchip/clk-pll.c       | 1 -
 drivers/clk/rockchip/clk-rk3188.c    | 1 +
 drivers/clk/rockchip/clk.h           | 4 ++--
 5 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/rockchip/clk-cpu.c b/drivers/clk/rockchip/clk-cpu.c
index fb7721bd37e6..330870a6d8bf 100644
--- a/drivers/clk/rockchip/clk-cpu.c
+++ b/drivers/clk/rockchip/clk-cpu.c
@@ -35,6 +35,7 @@
 #include <linux/of.h>
 #include <linux/slab.h>
 #include <linux/io.h>
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include "clk.h"
 
diff --git a/drivers/clk/rockchip/clk-mmc-phase.c b/drivers/clk/rockchip/clk-mmc-phase.c
index e9f8df324e7c..3244c6e391d7 100644
--- a/drivers/clk/rockchip/clk-mmc-phase.c
+++ b/drivers/clk/rockchip/clk-mmc-phase.c
@@ -14,6 +14,7 @@
  */
 
 #include <linux/slab.h>
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include "clk.h"
 
diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pll.c
index 76027261f7ed..1f88dd158b93 100644
--- a/drivers/clk/rockchip/clk-pll.c
+++ b/drivers/clk/rockchip/clk-pll.c
@@ -17,7 +17,6 @@
 #include <linux/slab.h>
 #include <linux/io.h>
 #include <linux/delay.h>
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
 #include "clk.h"
diff --git a/drivers/clk/rockchip/clk-rk3188.c b/drivers/clk/rockchip/clk-rk3188.c
index e4f9d472f1ff..91ea848c9d18 100644
--- a/drivers/clk/rockchip/clk-rk3188.c
+++ b/drivers/clk/rockchip/clk-rk3188.c
@@ -13,6 +13,7 @@
  * GNU General Public License for more details.
  */
 
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
index 6b092673048a..1b16781b67c5 100644
--- a/drivers/clk/rockchip/clk.h
+++ b/drivers/clk/rockchip/clk.h
@@ -24,8 +24,8 @@
 #define CLK_ROCKCHIP_CLK_H
 
 #include <linux/io.h>
-#include <linux/clk.h>
-#include <linux/clk-provider.h>
+
+struct clk;
 
 #define HIWORD_UPDATE(val, mask, shift) \
 		((val) << (shift) | (mask) << ((shift) + 16))
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

