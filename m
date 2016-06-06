Return-Path: <huanglin821201@gmail.com>
Return-Path: <huanglin821201@gmail.com>
From: Lin Huang <hl@rock-chips.com>
To: heiko@sntech.de,
	mark.yao@rock-chips.com,
	myungjoo.ham@samsung.com
Cc: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	airlied@linux.ie,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	kyungmin.park@samsung.com,
	dianders@chromium.org,
	dbasehore@chromium.org,
	cw00.choi@samsung.com,
	Lin Huang <hl@rock-chips.com>
Subject: [RFC PATCH v2 2/6] clk: rockchip: rk3399: add SCLK_DDRCLK ID for ddrc
Date: Mon,  6 Jun 2016 18:13:02 +0800
Message-Id: <1465207986-17888-3-git-send-email-hl@rock-chips.com>
In-Reply-To: <1465207986-17888-1-git-send-email-hl@rock-chips.com>
References: <1465207986-17888-1-git-send-email-hl@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Lin Huang <hl@rock-chips.com>
---

Changes in v2:
- None 
Changes in v1:
- None

 include/dt-bindings/clock/rk3399-cru.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/rk3399-cru.h b/include/dt-bindings/clock/rk3399-cru.h
index 50a44cf..8a0f0442 100644
--- a/include/dt-bindings/clock/rk3399-cru.h
+++ b/include/dt-bindings/clock/rk3399-cru.h
@@ -131,6 +131,7 @@
 #define SCLK_DPHY_RX0_CFG		165
 #define SCLK_RMII_SRC			166
 #define SCLK_PCIEPHY_REF100M		167
+#define SCLK_DDRCLK			168
 
 #define DCLK_VOP0			180
 #define DCLK_VOP1			181
-- 
1.9.1
