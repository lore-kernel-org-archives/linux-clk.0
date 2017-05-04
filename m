Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Icenowy Zheng <icenowy@aosc.io>
To: Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 02/10] pinctrl: sunxi: add definitions for add A20 and R40
 support to A10 driver
Date: Thu,  4 May 2017 21:49:58 +0800
Message-Id: <20170504135006.16483-3-icenowy@aosc.io>
In-Reply-To: <20170504135006.16483-1-icenowy@aosc.io>
References: <20170504135006.16483-1-icenowy@aosc.io>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-sunxi@googlegroups.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

Allwinner A10, A20 and R40 SoCs have similar GPIO layout.

Add SoC definitions in pinctrl-sunxi.h, in order to merge A20 support
into A10 driver, and add R40 support into it.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index a9d315a1256c..1bfc0d8a55df 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -87,6 +87,9 @@
 #define PINCTRL_SUN5I_GR8	BIT(3)
 #define PINCTRL_SUN6I_A31	BIT(4)
 #define PINCTRL_SUN6I_A31S	BIT(5)
+#define PINCTRL_SUN4I_A10	BIT(6)
+#define PINCTRL_SUN7I_A20	BIT(7)
+#define PINCTRL_SUN8I_R40	BIT(8)
 
 struct sunxi_desc_function {
 	unsigned long	variant;
-- 
2.12.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
