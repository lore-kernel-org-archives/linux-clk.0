Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: meson: fix SET_PARM macro
Date: Tue, 28 Feb 2017 10:30:16 +0100
Message-Id: <20170228093016.5624-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

parameter val is not enclosed in parenthesis which is buggy when given an
expression instead of a simple value

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/clkc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/clkc.h b/drivers/clk/meson/clkc.h
index 9bb70e7a7d6a..c6be77dd8694 100644
--- a/drivers/clk/meson/clkc.h
+++ b/drivers/clk/meson/clkc.h
@@ -25,7 +25,7 @@
 #define PARM_GET(width, shift, reg)					\
 	(((reg) & SETPMASK(width, shift)) >> (shift))
 #define PARM_SET(width, shift, reg, val)				\
-	(((reg) & CLRPMASK(width, shift)) | (val << (shift)))
+	(((reg) & CLRPMASK(width, shift)) | ((val) << (shift)))
 
 #define MESON_PARM_APPLICABLE(p)		(!!((p)->width))
 
-- 
2.9.3
