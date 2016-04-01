Return-Path: <narmstrong@baylibre.com>
Return-Path: <narmstrong@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
To: linux-clk@vger.kernel.org,
	mturquette@baylibre.com,
	sjan@baylibre.com,
	ahaslam@baylibre.com,
	abailon@baylibre.com
Cc: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 3/5] clk: Add build support for schrodinger clock
Date: Fri,  1 Apr 2016 13:37:13 +0200
Message-Id: <1459510635-8204-4-git-send-email-narmstrong@baylibre.com>
In-Reply-To: <1459510635-8204-1-git-send-email-narmstrong@baylibre.com>
References: <1459510635-8204-1-git-send-email-narmstrong@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 46869d6..4976efe 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_COMMON_CLK)	+= clk.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-divider.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-fixed-factor.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-fixed-rate.o
+obj-$(CONFIG_COMMON_CLK)	+= clk-schrodinger.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-gate.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-multiplier.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-mux.o
-- 
1.9.1
