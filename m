Return-Path: <paweljarosz3691@gmail.com>
Return-Path: <paweljarosz3691@gmail.com>
From: =?UTF-8?q?Pawe=C5=82=20Jarosz?= <paweljarosz3691@gmail.com>
To: heiko@sntech.de,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: =?UTF-8?q?Pawe=C5=82=20Jarosz?= <paweljarosz3691@gmail.com>
Subject: [PATCH 1/3] clk: rockchip: Add new id for rk3066 tsadc clock
Date: Tue, 19 Jan 2016 13:09:19 +0100
Message-Id: <1453205361-27267-2-git-send-email-paweljarosz3691@gmail.com>
In-Reply-To: <1453205361-27267-1-git-send-email-paweljarosz3691@gmail.com>
References: <1453205361-27267-1-git-send-email-paweljarosz3691@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

This patch adds new id for the sclk supplying the tsadc on rk3066 socs.

Signed-off-by: Paweł Jarosz <paweljarosz3691@gmail.com>
---
 include/dt-bindings/clock/rk3188-cru-common.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/rk3188-cru-common.h b/include/dt-bindings/clock/rk3188-cru-common.h
index 8df77a7..4f53e70 100644
--- a/include/dt-bindings/clock/rk3188-cru-common.h
+++ b/include/dt-bindings/clock/rk3188-cru-common.h
@@ -55,6 +55,7 @@
 #define SCLK_TIMER6		90
 #define SCLK_JTAG		91
 #define SCLK_SMC		92
+#define SCLK_TSADC		93
 
 #define DCLK_LCDC0		190
 #define DCLK_LCDC1		191
-- 
1.9.1
