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
Subject: [PATCH v2 2/5] clk: rockchip: rk3368: remove the unused id
Date: Tue,  7 Mar 2017 19:05:16 +0800
Message-Id: <1488884719-10350-3-git-send-email-zhangqing@rock-chips.com>
In-Reply-To: <1488884719-10350-1-git-send-email-zhangqing@rock-chips.com>
References: <1488884719-10350-1-git-send-email-zhangqing@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

remove SCLK_TIMER6 id

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
---
 include/dt-bindings/clock/rk3368-cru.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/dt-bindings/clock/rk3368-cru.h b/include/dt-bindings/clock/rk3368-cru.h
index 52f86ddac773..2bf23eda8938 100644
--- a/include/dt-bindings/clock/rk3368-cru.h
+++ b/include/dt-bindings/clock/rk3368-cru.h
@@ -50,7 +50,6 @@
 #define SCLK_TIMER03		88
 #define SCLK_TIMER04		89
 #define SCLK_TIMER05		90
-#define SCLK_TIMER6		91
 #define SCLK_OTGPHY0		93
 #define SCLK_OTG_ADP		96
 #define SCLK_HSICPHY480M	97
-- 
1.9.1
