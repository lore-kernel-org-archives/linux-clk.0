Return-Path: <mka@google.com>
Return-Path: <mka@google.com>
From: Matthias Kaehlcke <mka@chromium.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH] clk: sunxi-ng: Fix header guard of ccu-sun8i-r.h
Date: Wed, 26 Jul 2017 14:02:21 -0700
Message-Id: <20170726210221.173968-1-mka@chromium.org>
List-ID: <linux-clk.vger.kernel.org>

Remove trailing extra underscore in definition of _CCU_SUN8I_R_H

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
 drivers/clk/sunxi-ng/ccu-sun8i-r.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-r.h b/drivers/clk/sunxi-ng/ccu-sun8i-r.h
index a7a407f12b56..fb01bffb929d 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-r.h
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-r.h
@@ -13,7 +13,7 @@
  */
 
 #ifndef _CCU_SUN8I_R_H
-#define _CCU_SUN8I_R_H_
+#define _CCU_SUN8I_R_H
 
 #include <dt-bindings/clock/sun8i-r-ccu.h>
 #include <dt-bindings/reset/sun8i-r-ccu.h>
-- 
2.14.0.rc0.400.g1c36432dff-goog
