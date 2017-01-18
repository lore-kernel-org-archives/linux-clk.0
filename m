Return-Path: <jacobchen110@gmail.com>
Return-Path: <jacobchen110@gmail.com>
From: Jacob Chen <jacob-chen@iotwrt.com>
To: heiko@sntech.de,
	mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	zhangqing@rock-chips.com,
	zhengxing@rock-chips.com,
	Jacob Chen <jacob-chen@iotwrt.com>
Subject: [PATCH v2 1/3] clk: rockchip: add rk3288 vip_out clock ids
Date: Wed, 18 Jan 2017 13:42:38 +0800
Message-Id: <1484718161-27702-1-git-send-email-jacob-chen@iotwrt.com>
List-ID: <linux-clk.vger.kernel.org>

Add clock-ids for the vip block of the rk3288

Signed-off-by: Jacob Chen <jacob-chen@iotwrt.com>
---
 include/dt-bindings/clock/rk3288-cru.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/rk3288-cru.h b/include/dt-bindings/clock/rk3288-cru.h
index 9a586e2..11183bf 100644
--- a/include/dt-bindings/clock/rk3288-cru.h
+++ b/include/dt-bindings/clock/rk3288-cru.h
@@ -88,6 +88,7 @@
 #define SCLK_PVTM_GPU		124
 #define SCLK_CRYPTO		125
 #define SCLK_MIPIDSI_24M	126
+#define SCLK_VIP_OUT	127
 
 #define SCLK_MAC		151
 #define SCLK_MACREF_OUT		152
-- 
2.7.4
