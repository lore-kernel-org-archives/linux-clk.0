Return-Path: <caesar.upstream@gmail.com>
Return-Path: <caesar.upstream@gmail.com>
From: Caesar Wang <wxt@rock-chips.com>
To: Heiko Stuebner <heiko@sntech.de>,
	"David S. Miller" <davem@davemloft.net>,
	Rob Herring <robh+dt@kernel.org>
Cc: linux-rockchip@lists.infradead.org,
	keescook@google.com,
	leozwang@google.com,
	sergei.shtylyov@cogentembedded.com,
	netdev@vger.kernel.org,
	Xing Zheng <zhengxing@rock-chips.com>,
	Caesar Wang <wxt@rock-chips.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org,
	Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/9] clk: rockchip: add clock-id for rk3036 emac pll source clock
Date: Mon, 14 Mar 2016 16:01:58 +0800
Message-Id: <1457942520-12859-8-git-send-email-wxt@rock-chips.com>
In-Reply-To: <1457942520-12859-1-git-send-email-wxt@rock-chips.com>
References: <1457942520-12859-1-git-send-email-wxt@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

From: Xing Zheng <zhengxing@rock-chips.com>

Suitable PLLs for the emac on the rk3036 are difficult to find
and one of them is the (continuously changing) APLL. So in most
cases it will be necessary to select a PLL manually.
So add a clock-id for it.

Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
Signed-off-by: Caesar Wang <wxt@rock-chips.com>
Cc: Xing Zheng <zhengxing@rock-chips.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org

---

Changes in v3:
- Add the Cc people.

Changes in v2: None

 include/dt-bindings/clock/rk3036-cru.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/rk3036-cru.h b/include/dt-bindings/clock/rk3036-cru.h
index 3396591..de44109 100644
--- a/include/dt-bindings/clock/rk3036-cru.h
+++ b/include/dt-bindings/clock/rk3036-cru.h
@@ -54,6 +54,7 @@
 #define SCLK_PVTM_VIDEO		125
 #define SCLK_MAC		151
 #define SCLK_MACREF		152
+#define SCLK_MACPLL		153
 #define SCLK_SFC		160
 
 /* aclk gates */
-- 
1.9.1
