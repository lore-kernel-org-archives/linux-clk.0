Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCF52C0261;
	Sat,  3 Jan 2026 07:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767426346; cv=none; b=j+HvVZ0QBqa4anPM1uozun2qoNEnrl4c7jLQJxWEXFNUrdVEaJ/RHtySLbzNSmLD78i4Qxv1XL6sl3M5BaOqlaGIAINqbuOO41ei6+fwxYbronDb6nDQAE+nQKwqih1l3z7TcUwycKaD8lL+0iFc9UMWzCuJkgyYKSfh4HL5X6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767426346; c=relaxed/simple;
	bh=Smomv6SOV1OffCyyPZMY4Ci3QlqIqP6lSFBa9YgXFJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZSf5cJ1XTf2op2WR+meO7dXrcQz+pf5X3OheDCen6X2buehpmM3dsnZI14qv1U/jJM43/+UqzvESnCh2r7xysP0VbhGAzSlu75WFGWCi0gtwV8CR0X4kxU2ZKnSEd0rCYHzchkTLZvpXalo7o6BGG+/ktO9q827bH/Gsfgd25Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 418E8341E5F;
	Sat, 03 Jan 2026 07:45:37 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sat, 03 Jan 2026 15:44:18 +0800
Subject: [PATCH v4 3/5] clk: spacemit: ccu_pll: add plla type clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260103-k3-clk-v4-3-4cccba2360f0@gentoo.org>
References: <20260103-k3-clk-v4-0-4cccba2360f0@gentoo.org>
In-Reply-To: <20260103-k3-clk-v4-0-4cccba2360f0@gentoo.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Haylen Chu <heylenay@4d2.org>, Guodong Xu <guodong@riscstar.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Yao Zi <me@ziyao.cc>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8636; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=Smomv6SOV1OffCyyPZMY4Ci3QlqIqP6lSFBa9YgXFJg=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpWMkGZrtKWvjR3f7u0jCdCGmy3Q5d4eiFDdTbp
 ksqHXJzZLuJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaVjJBhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3evg//W3BMbtVuRSu/7aD1VZKwePr4Krv2Pxbr0gZ8Z2R8x728s4yvPmgfY
 sZCC9+uNKqkATFhGNuOnpiTkves+7xkJv06v5yalt+2ix/+Q97Kyc35p5t9s0M6snBib/Fapv44
 UZAwqopydv1X0WfeRa5nZamcE5rpjRbnmj5oocWv+rmFj3NpPUCF0HIRdbyeL+o0dvo2U0FdLqW
 rdvOxN1NdZiKnv4x1YtgXB2FO7dslLYZDqDDW/9VlPt1A8dVFG/cvMcvy6ia1FLhOi/oqw3sInV
 VKhDzgz0IrXvZ8wj0gJ8Iyplmz5W+88TII2CAlyXVsb3JJJby4W8Te+hS/3U5smQa4b4klq3hCV
 BNll2NWXcdVuJ7/Ps8Nw12kZtfHzctXMT+lg/ogZWlqkoD7bOSxlv1ndqgS9wIwGoeT0DnNv31c
 LcB9fvLha098UPa52rQH3mGe1xtuStaTgnnWAlZEjT+LqCHvDug+VXn8RdDkT68eHI7CIMB2JXW
 mpDfqPWqcqTUvi3dYDYga9h1a8pkvoVsOEEbHg53EllF5aGRQH46iRpkIziNDPsSRt5m2im+o//
 brcWLVJRY0ivmVhTT9is1tetQBx/0Z4CYW7Xa7HjlD88VUyFpSeUVYstLrt2UT8mPWItojbTX1i
 Mpz0fda+LK5nFLrHmuOqIXZcBTcobg=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Introduce a new clock PLLA for SpacemiT's K3 SoC which has a different
register layout comparing to previous PPL type. And, It is configured
by swcr1, swcr3 and swcr2 BIT[15:8].

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 drivers/clk/spacemit/ccu_common.h |   1 +
 drivers/clk/spacemit/ccu_pll.c    | 118 ++++++++++++++++++++++++++++++++++++++
 drivers/clk/spacemit/ccu_pll.h    |  57 ++++++++++++++----
 3 files changed, 166 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/spacemit/ccu_common.h b/drivers/clk/spacemit/ccu_common.h
index 7ae244b5eace..8691698e007d 100644
--- a/drivers/clk/spacemit/ccu_common.h
+++ b/drivers/clk/spacemit/ccu_common.h
@@ -26,6 +26,7 @@ struct ccu_common {
 		/* For PLL */
 		struct {
 			u32 reg_swcr1;
+			u32 reg_swcr2;
 			u32 reg_swcr3;
 		};
 	};
diff --git a/drivers/clk/spacemit/ccu_pll.c b/drivers/clk/spacemit/ccu_pll.c
index 76d0244873d8..d4066a0ed452 100644
--- a/drivers/clk/spacemit/ccu_pll.c
+++ b/drivers/clk/spacemit/ccu_pll.c
@@ -17,6 +17,9 @@
 #define PLL_SWCR3_EN		((u32)BIT(31))
 #define PLL_SWCR3_MASK		GENMASK(30, 0)
 
+#define PLLA_SWCR2_EN		((u32)BIT(16))
+#define PLLA_SWCR2_MASK		GENMASK(15, 8)
+
 static const struct ccu_pll_rate_tbl *ccu_pll_lookup_best_rate(struct ccu_pll *pll,
 							       unsigned long rate)
 {
@@ -148,6 +151,110 @@ static int ccu_pll_init(struct clk_hw *hw)
 	return 0;
 }
 
+static const struct ccu_pll_rate_tbl *ccu_plla_lookup_matched_entry(struct ccu_pll *pll)
+{
+	struct ccu_pll_config *config = &pll->config;
+	const struct ccu_pll_rate_tbl *entry;
+	u32 i, swcr1, swcr2, swcr3;
+
+	swcr1 = ccu_read(&pll->common, swcr1);
+	swcr2 = ccu_read(&pll->common, swcr2);
+	swcr2 &= PLLA_SWCR2_MASK;
+	swcr3 = ccu_read(&pll->common, swcr3);
+
+	for (i = 0; i < config->tbl_num; i++) {
+		entry = &config->rate_tbl[i];
+
+		if (swcr1 == entry->swcr1 &&
+		    swcr2 == entry->swcr2 &&
+		    swcr3 == entry->swcr3)
+			return entry;
+	}
+
+	return NULL;
+}
+
+static void ccu_plla_update_param(struct ccu_pll *pll, const struct ccu_pll_rate_tbl *entry)
+{
+	struct ccu_common *common = &pll->common;
+
+	regmap_write(common->regmap, common->reg_swcr1, entry->swcr1);
+	regmap_write(common->regmap, common->reg_swcr3, entry->swcr3);
+	ccu_update(common, swcr2, PLLA_SWCR2_MASK, entry->swcr2);
+}
+
+static int ccu_plla_is_enabled(struct clk_hw *hw)
+{
+	struct ccu_common *common = hw_to_ccu_common(hw);
+
+	return ccu_read(common, swcr2) & PLLA_SWCR2_EN;
+}
+
+static int ccu_plla_enable(struct clk_hw *hw)
+{
+	struct ccu_pll *pll = hw_to_ccu_pll(hw);
+	struct ccu_common *common = &pll->common;
+	unsigned int tmp;
+
+	ccu_update(common, swcr2, PLLA_SWCR2_EN, PLLA_SWCR2_EN);
+
+	/* check lock status */
+	return regmap_read_poll_timeout_atomic(common->lock_regmap,
+					       pll->config.reg_lock,
+					       tmp,
+					       tmp & pll->config.mask_lock,
+					       PLL_DELAY_US, PLL_TIMEOUT_US);
+}
+
+static void ccu_plla_disable(struct clk_hw *hw)
+{
+	struct ccu_common *common = hw_to_ccu_common(hw);
+
+	ccu_update(common, swcr2, PLLA_SWCR2_EN, 0);
+}
+
+/*
+ * PLLAs must be gated before changing rate, which is ensured by
+ * flag CLK_SET_RATE_GATE.
+ */
+static int ccu_plla_set_rate(struct clk_hw *hw, unsigned long rate,
+			     unsigned long parent_rate)
+{
+	struct ccu_pll *pll = hw_to_ccu_pll(hw);
+	const struct ccu_pll_rate_tbl *entry;
+
+	entry = ccu_pll_lookup_best_rate(pll, rate);
+	ccu_plla_update_param(pll, entry);
+
+	return 0;
+}
+
+static unsigned long ccu_plla_recalc_rate(struct clk_hw *hw,
+					  unsigned long parent_rate)
+{
+	struct ccu_pll *pll = hw_to_ccu_pll(hw);
+	const struct ccu_pll_rate_tbl *entry;
+
+	entry = ccu_plla_lookup_matched_entry(pll);
+
+	WARN_ON_ONCE(!entry);
+
+	return entry ? entry->rate : 0;
+}
+
+static int ccu_plla_init(struct clk_hw *hw)
+{
+	struct ccu_pll *pll = hw_to_ccu_pll(hw);
+
+	if (ccu_plla_lookup_matched_entry(pll))
+		return 0;
+
+	ccu_plla_disable(hw);
+	ccu_plla_update_param(pll, &pll->config.rate_tbl[0]);
+
+	return 0;
+}
+
 const struct clk_ops spacemit_ccu_pll_ops = {
 	.init		= ccu_pll_init,
 	.enable		= ccu_pll_enable,
@@ -158,3 +265,14 @@ const struct clk_ops spacemit_ccu_pll_ops = {
 	.is_enabled	= ccu_pll_is_enabled,
 };
 EXPORT_SYMBOL_NS_GPL(spacemit_ccu_pll_ops, "CLK_SPACEMIT");
+
+const struct clk_ops spacemit_ccu_plla_ops = {
+	.init		= ccu_plla_init,
+	.enable		= ccu_plla_enable,
+	.disable	= ccu_plla_disable,
+	.set_rate	= ccu_plla_set_rate,
+	.recalc_rate	= ccu_plla_recalc_rate,
+	.determine_rate	= ccu_pll_determine_rate,
+	.is_enabled	= ccu_plla_is_enabled,
+};
+EXPORT_SYMBOL_NS_GPL(spacemit_ccu_plla_ops, "CLK_SPACEMIT");
diff --git a/drivers/clk/spacemit/ccu_pll.h b/drivers/clk/spacemit/ccu_pll.h
index 0592f4c3068c..e41db5c97c1a 100644
--- a/drivers/clk/spacemit/ccu_pll.h
+++ b/drivers/clk/spacemit/ccu_pll.h
@@ -16,14 +16,31 @@
  * configuration.
  *
  * @rate:	PLL rate
- * @swcr1:	Register value of PLLX_SW1_CTRL (PLLx_SWCR1).
- * @swcr3:	Register value of the PLLx_SW3_CTRL's lowest 31 bits of
- *		PLLx_SW3_CTRL (PLLx_SWCR3). This highest bit is for enabling
- *		the PLL and not contained in this field.
+ * @swcr1:	Value of register PLLx_SW1_CTRL.
+ * @swcr2:	Value of register PLLAx_SW2_CTRL.
+ * @swcr3:	value of register PLLx_SW3_CTRL.
+ *
+ * See below tables for the register used in PPL/PPLA clocks
+ *
+ * Regular PLL type
+ *  | Enable | swcr3 | PLLx_SW3_CTRL - BIT[31]    |
+ *  -----------------------------------------------
+ *  | Config | swcr1 | PLLx_SW1_CTRL - BIT[31:0]  |
+ *  |        | swcr2 | Not used                   |
+ *  |        | swcr3 | PLLx_SW3_CTRL - BIT[30:0]  |
+ *
+ * Special PLL type A
+ *  | Enable | swcr2 | PLLAx_SW2_CTRL - BIT[16]   |
+ *  -----------------------------------------------
+ *  | Config | swcr1 | PLLAx_SW1_CTRL - BIT[31:0] |
+ *  |        | swcr2 | PLLAx_SW2_CTRL - BIT[15:8] |
+ *  |        | swcr3 | PLLAx_SW3_CTRL - BIT[31:0] |
+ *
  */
 struct ccu_pll_rate_tbl {
 	unsigned long rate;
 	u32 swcr1;
+	u32 swcr2;
 	u32 swcr3;
 };
 
@@ -36,11 +53,19 @@ struct ccu_pll_config {
 
 #define CCU_PLL_RATE(_rate, _swcr1, _swcr3) \
 	{									\
-		.rate	= _rate,							\
+		.rate	= _rate,						\
 		.swcr1	= _swcr1,						\
 		.swcr3	= _swcr3,						\
 	}
 
+#define CCU_PLLA_RATE(_rate, _swcr1, _swcr2, _swcr3) \
+	{									\
+		.rate	= _rate,						\
+		.swcr1	= _swcr1,						\
+		.swcr2	= _swcr2,						\
+		.swcr3	= _swcr3,						\
+	}
+
 struct ccu_pll {
 	struct ccu_common	common;
 	struct ccu_pll_config	config;
@@ -54,26 +79,37 @@ struct ccu_pll {
 		.mask_lock	= (_mask_lock),					\
 	}
 
-#define CCU_PLL_HWINIT(_name, _flags)						\
+#define CCU_PLL_COMMON_HWINIT(_name, _ops, _flags)				\
 	(&(struct clk_init_data) {						\
 		.name		= #_name,					\
-		.ops		= &spacemit_ccu_pll_ops,			\
+		.ops		= _ops,						\
 		.parent_data	= &(struct clk_parent_data) { .index = 0 },	\
 		.num_parents	= 1,						\
 		.flags		= _flags,					\
 	})
 
-#define CCU_PLL_DEFINE(_name, _table, _reg_swcr1, _reg_swcr3, _reg_lock,	\
-		       _mask_lock, _flags)					\
+#define CCU_PLL_X_DEFINE(_name, _table, _reg_swcr1, _reg_swcr2, _reg_swcr3,	\
+		       _reg_lock, _mask_lock, _ops, _flags)			\
 static struct ccu_pll _name = {							\
 	.config	= CCU_PLL_CONFIG(_table, _reg_lock, _mask_lock),		\
 	.common = {								\
 		.reg_swcr1	= _reg_swcr1,					\
+		.reg_swcr2	= _reg_swcr2,					\
 		.reg_swcr3	= _reg_swcr3,					\
-		.hw.init	= CCU_PLL_HWINIT(_name, _flags)			\
+		.hw.init	= CCU_PLL_COMMON_HWINIT(_name, _ops, _flags)	\
 	}									\
 }
 
+#define CCU_PLL_DEFINE(_name, _table, _reg_swcr1, _reg_swcr3, _reg_lock,	\
+		       _mask_lock, _flags)					\
+	CCU_PLL_X_DEFINE(_name, _table, _reg_swcr1, 0, _reg_swcr3,		\
+		       _reg_lock, _mask_lock, &spacemit_ccu_pll_ops, _flags)
+
+#define CCU_PLLA_DEFINE(_name, _table, _reg_swcr1, _reg_swcr2, _reg_swcr3,	\
+		       _reg_lock, _mask_lock, _flags)				\
+	CCU_PLL_X_DEFINE(_name, _table, _reg_swcr1, _reg_swcr2, _reg_swcr3,	\
+		       _reg_lock, _mask_lock, &spacemit_ccu_plla_ops, _flags)
+
 static inline struct ccu_pll *hw_to_ccu_pll(struct clk_hw *hw)
 {
 	struct ccu_common *common = hw_to_ccu_common(hw);
@@ -82,5 +118,6 @@ static inline struct ccu_pll *hw_to_ccu_pll(struct clk_hw *hw)
 }
 
 extern const struct clk_ops spacemit_ccu_pll_ops;
+extern const struct clk_ops spacemit_ccu_plla_ops;
 
 #endif

-- 
2.52.0

