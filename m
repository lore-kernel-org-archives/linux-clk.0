Return-Path: <zhangqing@rock-chips.com>
From: Elaine Zhang <zhangqing@rock-chips.com>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	heiko@sntech.de
Cc: robh+dt@kernel.org,
	mark.rutland@arm.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	xxx@rock-chips.com,
	xf@rock-chips.com,
	huangtao@rock-chips.com,
	cl@rock-chips.com,
	andy.yan@rock-chips.com,
	wdc@rock-chips.com,
	Elaine Zhang <zhangqing@rock-chips.com>
Subject: [PATCH v1 1/3] clk: rockchip: add rv1108 ACLK_GAMC and PCLK_GMAC ID
Date: Mon, 21 Aug 2017 10:30:26 +0800
Message-Id: <1503282628-23542-2-git-send-email-zhangqing@rock-chips.com>
In-Reply-To: <1503282628-23542-1-git-send-email-zhangqing@rock-chips.com>
References: <1503282628-23542-1-git-send-email-zhangqing@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

This patch exports gmac aclk and pclk for dts reference.

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
---
 include/dt-bindings/clock/rv1108-cru.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/rv1108-cru.h b/include/dt-bindings/clock/rv1108-cru.h
index f269d833e41a..2239ae2a19b9 100644
--- a/include/dt-bindings/clock/rv1108-cru.h
+++ b/include/dt-bindings/clock/rv1108-cru.h
@@ -110,6 +110,7 @@
 #define ACLK_CIF2			207
 #define ACLK_CIF3			208
 #define ACLK_PERI			209
+#define ACLK_GMAC			210
 
 /* pclk gates */
 #define PCLK_GPIO1			256
@@ -141,6 +142,7 @@
 #define PCLK_EFUSE0			282
 #define PCLK_EFUSE1			283
 #define PCLK_WDT			284
+#define PCLK_GMAC			285
 
 /* hclk gates */
 #define HCLK_I2S0_8CH			320
-- 
1.9.1
