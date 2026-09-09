Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC9E56C62C
	for <linux-clk@vger.kernel.org>; Wed,  9 Sep 2026 14:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788962930; cv=none; b=IiA4F9pI2eM3wqAQnI/52ZrKoJu+f8GbWDKa1Tq7iuZ2toSf4n4zBMjsu7FpoBdwJa+N2s6pVRmwR4JqGi2YBdaQyQkwCLV7L/UlFsz/X6DTsyGIx3QFK9zCbkec6v/9jDixhcflBXbfBFeUHcU4dzEOX6mam/GuWXBwoAIeQ/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788962930; c=relaxed/simple;
	bh=kc1jhhPV4B4H0LLHv+h5hMvCUxZcLg+g4PDrVyRqrPI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F4H+5uCKtR5iyPfwpahyGdTIuDAwFPyITaw8AKHnvkjNubVzVZQPr1dbxbsPdPG/8T7WjdmZB8H/TJ4Jec2z/K+gxjbKn+Gy6mIFDT+f0t1/y1/eA7kYX3mTunK2uL9IMjBUKkwHr0BTwOC6b+YhOA56sv6IaQs+xsjKyXOyAVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=g8KHUdjV; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="g8KHUdjV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788962846;
	bh=4KXL1mV8nBn/Eb2PorgwoF3U40pxXFOZNDMCd5izesM=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=g8KHUdjVDuOfUxOBOXErU3yyJIIxucq3G+gj6W4UbfBM9BX/QMUjwExtaM6jdvQyI
	 qpOW8AgtcVHgQWTpJxQ3p4/9bOHXAIOsk/mT+4Y75BAjjig+DY6KreTfpbsHh2AIIc
	 eBvkyAotvuvCCysO8v1zqAJZ8ZHpjp75J+cG3Y+Y=
X-QQ-mid: esmtpsz10t1788962845tfb88b909
X-QQ-Originating-IP: P2oj2hlnzIUEVvUpdJUJoTz8U+V2gQJgQslq5KARWGA=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 09 Sep 2026 22:07:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4345606267829825780
EX-QQ-RecipientCnt: 12
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 09 Sep 2026 22:07:03 +0800
Subject: [PATCH 3/5] clk: spacemit: describe CPU clock dividers and shared
 PLL muxes
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-spacemit-pll-init-v1-3-b3065ad5a4ac@linux.spacemit.com>
References: <20260909-spacemit-pll-init-v1-0-b3065ad5a4ac@linux.spacemit.com>
In-Reply-To: <20260909-spacemit-pll-init-v1-0-b3065ad5a4ac@linux.spacemit.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Yixun Lan <dlan@kernel.org>, 
 Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Haylen Chu <heylenay@4d2.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10418;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=kc1jhhPV4B4H0LLHv+h5hMvCUxZcLg+g4PDrVyRqrPI=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFkLMzg95s0qfLmwLkm4eK1vUjPrJUnHXq85V92ruNylD
 +85VmjUUcrCIMbFICumyNL9gGdbgU+UbYFAoS/MHFYmkCEMXJwCMBH9uQz/Hc9eOpLNHCXAEfzk
 THHtpIdFSSErNzwrXugcr+qv/Pg9DyPD1mTXwgimF5VZe5N7F/jf3r9G48YSBva6WwoBZ0Kk1p5
 iAQA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NvQA7Qmxqa0SXw7ePriwEopLVx4lOmYpoZ3Cwl8eBnrnHd9XFsj5xrDh
	5b3klVwVi2Tf140/Ib7MbxzsJfF77n2wmIRpHkSL0/JI/h4o5tSbCSVJ5S1JsO7t+vrTHCS
	tBjgb1Xumx37BgJfTXWqRCDHGgX+87Ukq1smbA30FUh4xXaxvmg0hXzpatpv0tLG7SLPSZu
	OpYOnjDjJpxCk3UGiCRxkkfhH1W9neUxewAU1p/412MOivqx8LFPgza3ODcWRTLSAfiSI74
	fiKgD0ceM1wNUuuzCzIhMrvceop0Alr3M4ynliCmFIIolxCAq0doMoy0xn6pGxWEWLOrKh8
	piI6vvJ/qN6/3PZRsLm7rKfWFj5C0Ip3rx1fNecsJnxhyrzs3YbOdgbY47i3POIiKsvy8Zv
	UWaPMDyyA90Yq8x//0nDGHHhLgnNvG1q6XQpk12pvcvSl5h+t5Xu7kpUwPESXHqAp84AvKO
	y1K1oq29+pgBb1boXWWBcISDOj9UrRVxlqfcqsb/nbhW8WZ/rMc9dVaQ04NzRFVxDK5joQ8
	dPYm5nsNx2h6+sdIems4eJvYDPxo4euW0J5on6WdsbixkGoRf/PG3yyDH88tOkII30t+we2
	biaFZC3i2rTrY1uzWpPo+tuht6NRloEIrSSKWA/QPTJbmyRyRxnvxl25u2B2dhL+Pb9WrAY
	BLgzvapPv6enPJsqsobg516EHEbtM7Ibnw/pchAe1qbdhc8/nIFtD6gsBQ0DhKu+I0ho+fj
	ZD9DWJYIEHgc2fWk3/R5xD+3OQAua2TPurpzI6HnFFGy9aaBXYf8zYCIcMTMNWVTVHCb2X0
	j43AFc7h8x4rR04f6q4oV668RUf73AE8RWk2yUP9hnbX9CWwS4KbcTMSJITqUSRSj+peihK
	TneYn/XPymFUKYMGHL8aM0rhsAer+zUuLpDAY9ZRplw9N2A+QrRHfZQPERvjcMVE8A6peNM
	zj38xn5/4Tq1I7OB1zO6mv6MGejd5SGUVpj3NszsWKqCj3Y4YKLB92H9YERd99jTAMzanLy
	5nP+EfaW7OhI9C3yCw7nW5aSfzufwIO9ws9OIROghLqUMZSg8mMTYqyI94qBiGqspVGgvkw
	iEE2RXT10Qkop4E4d1lf+5s0TGteNIjRIi+rpkQ9yWmg+sWQy0OHdRpIZu+IthvOROwGHH4
	G6Wz2tE/zsUN/xJPboJ0x9wDS/oJqTYZduA9
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

The K1 CPU clocks have a core divider, while K3 CPU clocks bypass theirs
for some sources. K3 also allows C1/C3 to share the C0/C2 PLLs. Omitting
these details from the clock model can give CCF an incorrect rate or
parent.

Model the dividers, K3 bypass conditions and shared parents. Register
the sharing muxes as internal clocks without adding DT clock IDs.
Exclude K3 selector 4 from the modeled parents to match BSP policy.

Fixes: 1b72c59db0ad ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
Fixes: e371a77255b8 ("clk: spacemit: k3: add the clock tree")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/clk/spacemit/ccu-k1.c     |  8 +++----
 drivers/clk/spacemit/ccu-k3.c     | 47 +++++++++++++++++++++++++++------------
 drivers/clk/spacemit/ccu_common.c | 12 ++++++++++
 drivers/clk/spacemit/ccu_common.h |  2 ++
 drivers/clk/spacemit/ccu_mix.c    | 10 ++++++++-
 drivers/clk/spacemit/ccu_mix.h    | 18 +++++++++++++++
 6 files changed, 78 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index dee14d25f75d4..40cc96c4ee876 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -391,8 +391,8 @@ static const struct clk_parent_data cpu_c0_clk_parents[] = {
 	CCU_PARENT_HW(pll2_d3),
 	CCU_PARENT_HW(cpu_c0_hi_clk),
 };
-CCU_MUX_FC_DEFINE(cpu_c0_core_clk, cpu_c0_clk_parents, APMU_CPU_C0_CLK_CTRL, BIT(12), 0, 3,
-		  CLK_IS_CRITICAL);
+CCU_MUX_DIV_FC_DEFINE(cpu_c0_core_clk, cpu_c0_clk_parents, APMU_CPU_C0_CLK_CTRL,
+		      3, 3, BIT(12), 0, 3, CLK_IS_CRITICAL);
 CCU_DIV_DEFINE(cpu_c0_ace_clk, CCU_PARENT_HW(cpu_c0_core_clk), APMU_CPU_C0_CLK_CTRL, 6, 3,
 	       CLK_IS_CRITICAL);
 CCU_DIV_DEFINE(cpu_c0_tcm_clk, CCU_PARENT_HW(cpu_c0_core_clk), APMU_CPU_C0_CLK_CTRL, 9, 3,
@@ -413,8 +413,8 @@ static const struct clk_parent_data cpu_c1_clk_parents[] = {
 	CCU_PARENT_HW(pll2_d3),
 	CCU_PARENT_HW(cpu_c1_hi_clk),
 };
-CCU_MUX_FC_DEFINE(cpu_c1_core_clk, cpu_c1_clk_parents, APMU_CPU_C1_CLK_CTRL, BIT(12), 0, 3,
-		  CLK_IS_CRITICAL);
+CCU_MUX_DIV_FC_DEFINE(cpu_c1_core_clk, cpu_c1_clk_parents, APMU_CPU_C1_CLK_CTRL,
+		      3, 3, BIT(12), 0, 3, CLK_IS_CRITICAL);
 CCU_DIV_DEFINE(cpu_c1_ace_clk, CCU_PARENT_HW(cpu_c1_core_clk), APMU_CPU_C1_CLK_CTRL, 6, 3,
 	       CLK_IS_CRITICAL);
 
diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.c
index 92b930d5ff305..2f0bd74f7da4d 100644
--- a/drivers/clk/spacemit/ccu-k3.c
+++ b/drivers/clk/spacemit/ccu-k3.c
@@ -587,52 +587,64 @@ static const struct clk_parent_data cpu_c0_clk_parents[] = {
 	CCU_PARENT_HW(pll1_d5_491p52),
 	CCU_PARENT_HW(pll1_d4_614p4),
 	CCU_PARENT_HW(pll2_d3),
-	CCU_PARENT_HW(pll3_d2),
+	{ .index = -1 }, /* Leave selector 4 unmodeled, as in the BSP. */
 	CCU_PARENT_HW(pll1_d2_1228p8),
 	CCU_PARENT_HW(pll2_d2),
 	CCU_PARENT_HW(pll3_d1),
 };
-CCU_MUX_DIV_FC_DEFINE(cpu_c0_core_clk, cpu_c0_clk_parents, APMU_CPU_C0_CLK_CTRL,
-		      3, 3, BIT(12), 0, 3, CLK_IS_CRITICAL);
+CCU_MUX_DIV_BYPASS_FC_DEFINE(cpu_c0_core_clk, cpu_c0_clk_parents, APMU_CPU_C0_CLK_CTRL,
+			     3, 3, BIT(12), 0, 3, CLK_IS_CRITICAL, GENMASK(7, 4));
+
+static const struct clk_parent_data cpu_c1_pll_src_parents[] = {
+	CCU_PARENT_HW(pll4_d1),
+	CCU_PARENT_HW(pll3_d1),
+};
+CCU_MUX_DEFINE(cpu_c1_pll_src, cpu_c1_pll_src_parents, APMU_CPU_C1_CLK_CTRL, 13, 1, 0);
 
 static const struct clk_parent_data cpu_c1_clk_parents[] = {
 	CCU_PARENT_HW(pll1_d3_819p2),
 	CCU_PARENT_HW(pll1_d5_491p52),
 	CCU_PARENT_HW(pll1_d4_614p4),
 	CCU_PARENT_HW(pll2_d3),
-	CCU_PARENT_HW(pll4_d2),
+	{ .index = -1 }, /* Leave selector 4 unmodeled, as in the BSP. */
 	CCU_PARENT_HW(pll1_d2_1228p8),
 	CCU_PARENT_HW(pll2_d2),
-	CCU_PARENT_HW(pll4_d1),
+	CCU_PARENT_HW(cpu_c1_pll_src),
 };
-CCU_MUX_DIV_FC_DEFINE(cpu_c1_core_clk, cpu_c1_clk_parents, APMU_CPU_C1_CLK_CTRL,
-		      3, 3, BIT(12), 0, 3, CLK_IS_CRITICAL);
+CCU_MUX_DIV_BYPASS_FC_DEFINE(cpu_c1_core_clk, cpu_c1_clk_parents, APMU_CPU_C1_CLK_CTRL,
+			     3, 3, BIT(12), 0, 3, CLK_IS_CRITICAL, GENMASK(7, 4));
 
 static const struct clk_parent_data cpu_c2_clk_parents[] = {
 	CCU_PARENT_HW(pll1_d3_819p2),
 	CCU_PARENT_HW(pll1_d5_491p52),
 	CCU_PARENT_HW(pll1_d4_614p4),
 	CCU_PARENT_HW(pll2_d3),
-	CCU_PARENT_HW(pll5_d2),
+	{ .index = -1 }, /* Leave selector 4 unmodeled, as in the BSP. */
 	CCU_PARENT_HW(pll1_d2_1228p8),
 	CCU_PARENT_HW(pll2_d2),
 	CCU_PARENT_HW(pll5_d1),
 };
-CCU_MUX_DIV_FC_DEFINE(cpu_c2_core_clk, cpu_c2_clk_parents, APMU_CPU_C2_CLK_CTRL,
-		      3, 3, BIT(12), 0, 3, CLK_IS_CRITICAL);
+CCU_MUX_DIV_BYPASS_FC_DEFINE(cpu_c2_core_clk, cpu_c2_clk_parents, APMU_CPU_C2_CLK_CTRL,
+			     3, 3, BIT(12), 0, 3, CLK_IS_CRITICAL, GENMASK(7, 4));
+
+static const struct clk_parent_data cpu_c3_pll_src_parents[] = {
+	CCU_PARENT_HW(pll8_d1),
+	CCU_PARENT_HW(pll5_d1),
+};
+CCU_MUX_DEFINE(cpu_c3_pll_src, cpu_c3_pll_src_parents, APMU_CPU_C3_CLK_CTRL, 13, 1, 0);
 
 static const struct clk_parent_data cpu_c3_clk_parents[] = {
 	CCU_PARENT_HW(pll1_d3_819p2),
 	CCU_PARENT_HW(pll1_d5_491p52),
 	CCU_PARENT_HW(pll1_d4_614p4),
 	CCU_PARENT_HW(pll2_d3),
-	CCU_PARENT_HW(pll8_d2),
+	{ .index = -1 }, /* Leave selector 4 unmodeled, as in the BSP. */
 	CCU_PARENT_HW(pll1_d2_1228p8),
 	CCU_PARENT_HW(pll2_d2),
-	CCU_PARENT_HW(pll8_d1),
+	CCU_PARENT_HW(cpu_c3_pll_src),
 };
-CCU_MUX_DIV_FC_DEFINE(cpu_c3_core_clk, cpu_c3_clk_parents, APMU_CPU_C3_CLK_CTRL,
-		      3, 3, BIT(12), 0, 3, CLK_IS_CRITICAL);
+CCU_MUX_DIV_BYPASS_FC_DEFINE(cpu_c3_core_clk, cpu_c3_clk_parents, APMU_CPU_C3_CLK_CTRL,
+			     3, 3, BIT(12), 0, 3, CLK_IS_CRITICAL, GENMASK(7, 4));
 
 static const struct clk_parent_data ccic2phy_parents[] = {
 	CCU_PARENT_HW(pll1_d24_102p4),
@@ -1447,10 +1459,17 @@ static struct clk_hw *k3_ccu_apmu_hws[] = {
 	[CLK_APMU_ISIM_VCLK3]		= &isim_vclk_out3.common.hw,
 };
 
+static struct clk_hw *k3_ccu_apmu_internal_hws[] = {
+	&cpu_c1_pll_src.common.hw,
+	&cpu_c3_pll_src.common.hw,
+};
+
 static const struct spacemit_ccu_data k3_ccu_apmu_data = {
 	.reset_name	= "k3-apmu-reset",
 	.hws		= k3_ccu_apmu_hws,
 	.num		= ARRAY_SIZE(k3_ccu_apmu_hws),
+	.internal_hws	= k3_ccu_apmu_internal_hws,
+	.num_internal	= ARRAY_SIZE(k3_ccu_apmu_internal_hws),
 };
 
 static struct clk_hw *k3_ccu_dciu_hws[] = {
diff --git a/drivers/clk/spacemit/ccu_common.c b/drivers/clk/spacemit/ccu_common.c
index 8696bb9cba2d8..759da6988ca78 100644
--- a/drivers/clk/spacemit/ccu_common.c
+++ b/drivers/clk/spacemit/ccu_common.c
@@ -30,6 +30,18 @@ static int spacemit_ccu_register(struct device *dev,
 
 	clk_data->num = data->num;
 
+	/* Internal muxes have no binding IDs but must precede their children. */
+	for (i = 0; i < data->num_internal; i++) {
+		struct clk_hw *hw = data->internal_hws[i];
+		struct ccu_common *common = hw_to_ccu_common(hw);
+
+		common->regmap = regmap;
+		common->lock_regmap = lock_regmap;
+		ret = devm_clk_hw_register(dev, hw);
+		if (ret)
+			return ret;
+	}
+
 	for (i = 0; i < data->num; i++) {
 		struct clk_hw *hw = data->hws[i];
 		struct ccu_common *common;
diff --git a/drivers/clk/spacemit/ccu_common.h b/drivers/clk/spacemit/ccu_common.h
index 8691698e007d9..659dc68ab902a 100644
--- a/drivers/clk/spacemit/ccu_common.h
+++ b/drivers/clk/spacemit/ccu_common.h
@@ -43,6 +43,8 @@ struct spacemit_ccu_data {
 	const char *reset_name;
 	struct clk_hw **hws;
 	size_t num;
+	struct clk_hw **internal_hws;
+	size_t num_internal;
 };
 
 #define ccu_read(c, reg)						\
diff --git a/drivers/clk/spacemit/ccu_mix.c b/drivers/clk/spacemit/ccu_mix.c
index da3c5685d4f65..68596b9fa5b8f 100644
--- a/drivers/clk/spacemit/ccu_mix.c
+++ b/drivers/clk/spacemit/ccu_mix.c
@@ -13,6 +13,8 @@
 #define MIX_FC_TIMEOUT_US	10000
 #define MIX_FC_DELAY_US		5
 
+static u8 ccu_mux_get_parent(struct clk_hw *hw);
+
 static void ccu_gate_disable(struct clk_hw *hw)
 {
 	struct ccu_mix *mix = hw_to_ccu_mix(hw);
@@ -57,6 +59,9 @@ static unsigned long ccu_div_recalc_rate(struct clk_hw *hw,
 	struct ccu_div_config *div = &mix->div;
 	unsigned long val;
 
+	if (div->bypass & BIT(ccu_mux_get_parent(hw)))
+		return parent_rate;
+
 	val = ccu_read(&mix->common, ctrl) >> div->shift;
 	val &= (1 << div->width) - 1;
 
@@ -113,7 +118,7 @@ ccu_mix_calc_best_rate(struct clk_hw *hw, unsigned long rate,
 	for (int i = 0; i < parent_num; i++) {
 		struct clk_hw *parent = clk_hw_get_parent_by_index(hw, i);
 		unsigned long parent_rate;
-		u32 div_max = 1 << div->width;
+		u32 div_max = div->bypass & BIT(i) ? 1 : 1 << div->width;
 
 		if (!parent)
 			continue;
@@ -163,6 +168,9 @@ static int ccu_mix_set_rate(struct clk_hw *hw, unsigned long rate,
 	u32 current_div, target_div = 0, mask;
 	unsigned long best_delta = ULONG_MAX;
 
+	if (div->bypass & BIT(ccu_mux_get_parent(hw)))
+		return rate == parent_rate ? 0 : -EINVAL;
+
 	/* set_rate must use the parent selected by CCF, not search other parents. */
 	for (u32 i = 1; i <= BIT(div->width); i++) {
 		unsigned long divided = DIV_ROUND_UP_ULL(parent_rate, i);
diff --git a/drivers/clk/spacemit/ccu_mix.h b/drivers/clk/spacemit/ccu_mix.h
index dbba9bf49b3bd..ac88c282d660a 100644
--- a/drivers/clk/spacemit/ccu_mix.h
+++ b/drivers/clk/spacemit/ccu_mix.h
@@ -36,6 +36,8 @@ struct ccu_mux_config {
 struct ccu_div_config {
 	u8 shift;
 	u8 width;
+	/* Parent indices which bypass the divider; zero means no bypass. */
+	u32 bypass;
 };
 
 struct ccu_mix {
@@ -203,6 +205,22 @@ static struct ccu_mix _name = {							\
 	},									\
 }
 
+#define CCU_MUX_DIV_BYPASS_FC_DEFINE(_name, _parents, _reg_ctrl,		\
+				     _mshift, _mwidth, _mask_fc,		\
+				     _muxshift, _muxwidth, _flags,		\
+				     _bypass)					\
+static struct ccu_mix _name = {							\
+	.div	= { .shift = _mshift, .width = _mwidth, .bypass = _bypass },	\
+	.mux	= CCU_MUX_INIT(_muxshift, _muxwidth),				\
+	.common = {								\
+		.reg_ctrl	= _reg_ctrl,					\
+		.reg_fc		= _reg_ctrl,					\
+		.mask_fc	= _mask_fc,					\
+		CCU_MIX_INITHW_PARENTS(_name, _parents,				\
+				       spacemit_ccu_mux_div_ops, _flags),	\
+	},									\
+}
+
 #define CCU_MUX_FC_DEFINE(_name, _parents, _reg_ctrl, _mask_fc,	_muxshift,	\
 			  _muxwidth, _flags)					\
 static struct ccu_mix _name = {							\

-- 
2.55.0

