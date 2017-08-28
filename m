Return-Path: <romain.perier@collabora.com>
From: Romain Perier <romain.perier@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Kumar Gala <galak@codeaurora.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Romain Perier <romain.perier@collabora.com>
Subject: [PATCH 1/4] clk: rockchip: add clock id for PCLK_EFUSE256 of RK3368 SoCs
Date: Mon, 28 Aug 2017 14:16:01 +0200
Message-Id: <20170828121604.15968-2-romain.perier@collabora.com>
In-Reply-To: <20170828121604.15968-1-romain.perier@collabora.com>
References: <20170828121604.15968-1-romain.perier@collabora.com>
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Romain Perier <romain.perier@collabora.com>
---
 include/dt-bindings/clock/rk3368-cru.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/rk3368-cru.h b/include/dt-bindings/clock/rk3368-cru.h
index aeb83e581a11..a0063ed7284a 100644
--- a/include/dt-bindings/clock/rk3368-cru.h
+++ b/include/dt-bindings/clock/rk3368-cru.h
@@ -156,6 +156,7 @@
 #define PCLK_ISP		366
 #define PCLK_VIP		367
 #define PCLK_WDT		368
+#define PCLK_EFUSE256		369
 
 /* hclk gates */
 #define HCLK_SFC		448
-- 
2.11.0
