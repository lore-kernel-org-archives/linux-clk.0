Return-Path: <maxime.ripard@free-electrons.com>
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Chen-Yu Tsai <wens@csie.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mylene Josserand <mylene.josserand@free-electrons.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v3 4/8] clk: sunxi-ng: mux: Add mux table macro
Date: Thu,  8 Sep 2016 11:48:39 +0200
Message-Id: <20160908094843.14710-5-maxime.ripard@free-electrons.com>
In-Reply-To: <20160908094843.14710-1-maxime.ripard@free-electrons.com>
References: <20160908094843.14710-1-maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

Add a new macro to declare muxes based on a table and a gate.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Acked-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/clk/sunxi-ng/ccu_mux.h | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_mux.h b/drivers/clk/sunxi-ng/ccu_mux.h
index f5123a1a6603..47aba3a48245 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.h
+++ b/drivers/clk/sunxi-ng/ccu_mux.h
@@ -43,9 +43,12 @@ struct ccu_mux {
 	struct ccu_common	common;
 };
 
-#define SUNXI_CCU_MUX(_struct, _name, _parents, _reg, _shift, _width, _flags) \
+#define SUNXI_CCU_MUX_TABLE_WITH_GATE(_struct, _name, _parents, _table,	\
+				     _reg, _shift, _width, _gate,	\
+				     _flags)				\
 	struct ccu_mux _struct = {					\
-		.mux	= _SUNXI_CCU_MUX(_shift, _width),		\
+		.enable	= _gate,					\
+		.mux	= _SUNXI_CCU_MUX_TABLE(_shift, _width, _table),	\
 		.common	= {						\
 			.reg		= _reg,				\
 			.hw.init	= CLK_HW_INIT_PARENTS(_name,	\
@@ -57,17 +60,14 @@ struct ccu_mux {
 
 #define SUNXI_CCU_MUX_WITH_GATE(_struct, _name, _parents, _reg,		\
 				_shift, _width, _gate, _flags)		\
-	struct ccu_mux _struct = {					\
-		.enable	= _gate,					\
-		.mux	= _SUNXI_CCU_MUX(_shift, _width),		\
-		.common	= {						\
-			.reg		= _reg,				\
-			.hw.init	= CLK_HW_INIT_PARENTS(_name,	\
-							      _parents, \
-							      &ccu_mux_ops, \
-							      _flags),	\
-		}							\
-	}
+	SUNXI_CCU_MUX_TABLE_WITH_GATE(_struct, _name, _parents, NULL,	\
+				      _reg, _shift, _width, _gate,	\
+				      _flags)
+
+#define SUNXI_CCU_MUX(_struct, _name, _parents, _reg, _shift, _width,	\
+		      _flags)						\
+	SUNXI_CCU_MUX_TABLE_WITH_GATE(_struct, _name, _parents, NULL,	\
+				      _reg, _shift, _width, 0, _flags)
 
 static inline struct ccu_mux *hw_to_ccu_mux(struct clk_hw *hw)
 {
-- 
2.9.3
