Return-Path: <Yixun.Lan@amlogic.com>
From: Yixun Lan <yixun.lan@amlogic.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet
	<jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione
	<carlo@caione.org>
CC: Yixun Lan <yixun.lan@amlogic.com>, Rob Herring <robh@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Qiufang Dai
	<qiufang.dai@amlogic.com>, <linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/7] clk: meson: drop meson_aoclk_gate_regmap_ops
Date: Fri, 23 Mar 2018 22:38:10 +0800
Message-ID: <20180323143816.200573-2-yixun.lan@amlogic.com>
In-Reply-To: <20180323143816.200573-1-yixun.lan@amlogic.com>
References: <20180323143816.200573-1-yixun.lan@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: yixun.lan@amlogic.com
List-ID: <linux-clk.vger.kernel.org>

let's remove the unused meson_aoclk_gate_regmap_ops

Fixes: 1f932d99710d ("clk: meson: remove superseded aoclk_gate_regmap")
Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
---
 drivers/clk/meson/gxbb-aoclk.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/meson/gxbb-aoclk.h b/drivers/clk/meson/gxbb-aoclk.h
index 0be78383f257..badc4c22b4ee 100644
--- a/drivers/clk/meson/gxbb-aoclk.h
+++ b/drivers/clk/meson/gxbb-aoclk.h
@@ -17,8 +17,6 @@
 #define AO_RTC_ALT_CLK_CNTL0	0x94
 #define AO_RTC_ALT_CLK_CNTL1	0x98
 
-extern const struct clk_ops meson_aoclk_gate_regmap_ops;
-
 struct aoclk_cec_32k {
 	struct clk_hw hw;
 	struct regmap *regmap;
-- 
2.15.1
