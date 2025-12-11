Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BF823AE62;
	Thu, 11 Dec 2025 01:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765416054; cv=none; b=NU675L2kNy5AdkHBE/Hz7ZFRigf53B+z22hMbfPBldJGgeenbt/HjSVEPCaOUIwDO+81dOsM3f8k+SGl9MT1IEHyij+l9kWix7fh41gdv5N2ha/uvGtziQuMx/AkLQ6GFU+5UdKvi1744iThbOShTClYoFgMxy9i9DcOMRwjAjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765416054; c=relaxed/simple;
	bh=oGWXfyJnPWcF3dlR96yzHMSBaRG+g7GFYcKswASXJ6k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MaT9h/EsQOFYG5kNSkGFzT2MBSBrBkBy3eVH9m29hhJIy7JpRrMPKW043t0wpEsAslyeTGs0UwIbAxC1iSpwfPd8IN6KdZhdLPMRemzSQrbOemeYmd9CJAsjUtLfxfdAqz4EHDzV8sUSuYxIGjefgOwv7xg6xP4W8E8jYk4AnTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 8EF5A34076D;
	Thu, 11 Dec 2025 01:20:47 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Thu, 11 Dec 2025 09:19:43 +0800
Subject: [PATCH RFC 3/4] clk: spacemit: ccu_pll: add plla type clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-k3-clk-v1-3-8ee47c70c5bc@gentoo.org>
References: <20251211-k3-clk-v1-0-8ee47c70c5bc@gentoo.org>
In-Reply-To: <20251211-k3-clk-v1-0-8ee47c70c5bc@gentoo.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Haylen Chu <heylenay@4d2.org>, Inochi Amaoto <inochiama@gmail.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8557; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=oGWXfyJnPWcF3dlR96yzHMSBaRG+g7GFYcKswASXJ6k=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpOhxbmzaEPjc5weE57HTD1TUoF2zKZnefqXe//
 BC4UeA6HNOJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaTocWxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3CGQ/+NsCNIQSshLAkf1i/np9s5HgzjC2tDBTTCUPg+Vg6ituHRblAl4LSp
 cD4Uz99fUiPWp9r8siMczyhTO9dEhC4JBcQd+yLgveVjM/Oqo69YS8T9lUJpuktpdXVN8DsQvtv
 0NAD2EgWbnlioBYR7+EAGmAML1gEJpoBo3oBRqW15HMI9aoGFBD6VBCXDNUkFe2tnvta6hXoUG+
 /dDfNu4yK4kBScLX+PHkhDsraoC9bEFckWrotEwFPbhBZpXVMkf+Agj/f2i5yX/856uUbkpwYI/
 RvjHjEgN0qLqKj1h/klb8uhsKFGMNFdL9mvWt20OYe2zqICtbKY9Wh8l8B9QNeHZ6fkSJIk317H
 BW8d5ylvPpHwv7eG7wzLEgx43M7/0SbK+cGPVGfIEruozsuBL8Zf2fhowRdPKGYwzZfLhPHbG7w
 xcBuzy8EBSi0IhqJDsTsvA+ZPABn3nuaFCMF2Cb/ktYwgcxzo9ye0JoxRMDtXLhHwh5neCneznO
 RcYavnrIUWG8igpW1bmy3CoS+cQeqOu9jd9oMxs30REQSzW1Oz19Suz0yK3VTa0/rbE3mNwg17o
 cOXPT0x9ElR9D3Y2tDTP1UC7AJlpsTUNxdd/AV6n3NF6ASdymO0+0BdIjTrJx3gzTxIDb8qAfk+
 no2bJ3crlNm873y6QvO+OkoVF/KdFk=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Introduce a new clock PLLA for SpacemiT's K3 SoC which has a different
register layout comparing to previous PPL type. And, It is configured
by swcr1, swcr3 and swcr2 BIT[15:8].

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 drivers/clk/spacemit/ccu_common.h |   1 +
 drivers/clk/spacemit/ccu_pll.c    | 117 ++++++++++++++++++++++++++++++++++++++
 drivers/clk/spacemit/ccu_pll.h    |  57 +++++++++++++++----
 3 files changed, 165 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/spacemit/ccu_common.h b/drivers/clk/spacemit/ccu_common.h
index da72f3836e0b..4ebd01ec9f21 100644
--- a/drivers/clk/spacemit/ccu_common.h
+++ b/drivers/clk/spacemit/ccu_common.h
@@ -24,6 +24,7 @@ struct ccu_common {
 		/* For PLL */
 		struct {
 			u32 reg_swcr1;
+			u32 reg_swcr2;
 			u32 reg_swcr3;
 		};
 	};
diff --git a/drivers/clk/spacemit/ccu_pll.c b/drivers/clk/spacemit/ccu_pll.c
index d92f0dae65a4..517bb3215239 100644
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
@@ -157,3 +264,13 @@ const struct clk_ops spacemit_ccu_pll_ops = {
 	.determine_rate = ccu_pll_determine_rate,
 	.is_enabled	= ccu_pll_is_enabled,
 };
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
2.51.0

