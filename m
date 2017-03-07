Return-Path: <zhangqing@rock-chips.com>
From: Elaine Zhang <zhangqing@rock-chips.com>
To: heiko@sntech.de
Cc: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	robh+dt@kernel.org,
	mark.rutland@arm.com,
	linux-clk@vger.kernel.org,
	huangtao@rock-chips.com,
	xxx@rock-chips.com,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Elaine Zhang <zhangqing@rock-chips.com>
Subject: [PATCH v2 3/5] clk: rockchip: add clock ids for timer10-15 of RK3368 SoCs
Date: Tue,  7 Mar 2017 19:05:17 +0800
Message-Id: <1488884719-10350-4-git-send-email-zhangqing@rock-chips.com>
In-Reply-To: <1488884719-10350-1-git-send-email-zhangqing@rock-chips.com>
References: <1488884719-10350-1-git-send-email-zhangqing@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
---
 include/dt-bindings/clock/rk3368-cru.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/dt-bindings/clock/rk3368-cru.h b/include/dt-bindings/clock/rk3368-cru.h
index 2bf23eda8938..aeb83e581a11 100644
--- a/include/dt-bindings/clock/rk3368-cru.h
+++ b/include/dt-bindings/clock/rk3368-cru.h
@@ -81,6 +81,12 @@
 #define SCLK_SFC		126
 #define SCLK_MAC		127
 #define SCLK_MACREF_OUT		128
+#define SCLK_TIMER10		133
+#define SCLK_TIMER11		134
+#define SCLK_TIMER12		135
+#define SCLK_TIMER13		136
+#define SCLK_TIMER14		137
+#define SCLK_TIMER15		138
 
 #define DCLK_VOP		190
 #define MCLK_CRYPTO		191
-- 
1.9.1
