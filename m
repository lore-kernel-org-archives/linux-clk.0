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
Subject: [PATCH v5 6/7] clk: meson: drop CLK_SET_RATE_PARENT flag
Date: Mon, 9 Apr 2018 22:37:48 +0800
Message-ID: <20180409143749.71197-7-yixun.lan@amlogic.com>
In-Reply-To: <20180409143749.71197-1-yixun.lan@amlogic.com>
References: <20180409143749.71197-1-yixun.lan@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: yixun.lan@amlogic.com
List-ID: <linux-clk.vger.kernel.org>

The clk81 is not expected to be changed, so drop this flag.

Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
---
 drivers/clk/meson/gxbb-aoclk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/gxbb-aoclk.c b/drivers/clk/meson/gxbb-aoclk.c
index f2e0640a7f74..b3c90a17c0e0 100644
--- a/drivers/clk/meson/gxbb-aoclk.c
+++ b/drivers/clk/meson/gxbb-aoclk.c
@@ -70,7 +70,7 @@ static struct clk_regmap _name##_ao = {					\
 		.ops = &clk_regmap_gate_ops,				\
 		.parent_names = (const char *[]){ "clk81" },		\
 		.num_parents = 1,					\
-		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),	\
+		.flags = CLK_IGNORE_UNUSED,				\
 	},								\
 }
 
-- 
2.15.1
