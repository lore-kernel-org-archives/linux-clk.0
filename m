Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88B933CEB0;
	Thu, 20 Nov 2025 13:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763644560; cv=none; b=D4+jq5Tb8RsSu5kcGhx9sELJqIiUXWniSms8qa4aTtLfRHbDHhQSbhUZzNLOfVhyvsPzyRPmyHDtXwCpRdDImHUxgbp1eKgQwTHiJaG8lF/icHIvWFTHBKK4vYvO+EPr6n/AkVHMeif79wJ3sYCZoK0NTWPM7fcDi/a5U4t48n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763644560; c=relaxed/simple;
	bh=6xpttd36WKtetXe3TLfe39yIQ65ubw2+nD4vPw42ObU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p1OaXKo+ADqrhv0gfWYldHl4w6BRbsfl70uRXVX/KrpsyW5KXF2/4htK8RBjtUvWfOptmIbCUwS0voC+kmddKq39b3IQpyXE9Wj7WmzTg6N0I1obXZ09zuRZNlvfnhU2p2MJrnTxf25akIxTEb0AaTipd4uZiVhDDYZc+k7phFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=dauS815v; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="dauS815v"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0713422FD2;
	Thu, 20 Nov 2025 14:15:55 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WxLEOPIpJFEM; Thu, 20 Nov 2025 14:15:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1763644554; bh=6xpttd36WKtetXe3TLfe39yIQ65ubw2+nD4vPw42ObU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dauS815vMS2uVrKC/+1pYPMxbH5mEBEWihDJucOXtozNQkP4BM191pFxXMrBAf4wC
	 Bn1NWFEl5dyG7p5wGO79mDFzBbdjbDbm37fUpnXtA0TM1JkJsgHBCo162yBIdiOOW5
	 6f1GhtpW153JbBviEz/3nMC8+W1DH3qwB4zkrLHC7pu4kNgr8lyUzimoWB2cUwvPd6
	 dhsX7V31IaUQ/zbjdAHq8CYBkom9fMyv7GqD5FnZjdiHIK9gjG6k8CW3GJhnVtkjHf
	 qCc7Bhju5Q+sNvi0BJyxUgfEW1niaAqiyLICpV7VEoauupfhC+pDvVHxmztydSfGlT
	 6jYvFd/uUCWIg==
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Icenowy Zheng <uwu@icenowy.me>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH 4/7] clk: thead: th1520-ap: Support setting PLL rates
Date: Thu, 20 Nov 2025 13:14:13 +0000
Message-ID: <20251120131416.26236-5-ziyao@disroot.org>
In-Reply-To: <20251120131416.26236-1-ziyao@disroot.org>
References: <20251120131416.26236-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TH1520 ships several PLLs that could operate in either integer or
fractional mode. However, the TRM only lists a few configuration whose
stability is considered guaranteed.

Add a table-lookup rate determination logic to support PLL rate setting,
and fill up frequency-configuration tables for AP-subsystem PLLs.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 drivers/clk/thead/clk-th1520-ap.c | 142 ++++++++++++++++++++++++++++++
 1 file changed, 142 insertions(+)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index b820d47387bb..bf8e80c39a9e 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -22,6 +22,7 @@
 #define TH1520_PLL_REFDIV	GENMASK(5, 0)
 #define TH1520_PLL_BYPASS	BIT(30)
 #define TH1520_PLL_VCO_RST	BIT(29)
+#define TH1520_PLL_DACPD	BIT(25)
 #define TH1520_PLL_DSMPD	BIT(24)
 #define TH1520_PLL_FRAC		GENMASK(23, 0)
 #define TH1520_PLL_FRAC_BITS    24
@@ -72,9 +73,19 @@ struct ccu_div {
 	struct ccu_common	common;
 };
 
+struct ccu_pll_cfg {
+	unsigned long		freq;
+	u32			fbdiv;
+	u32			frac;
+	u32			postdiv1;
+	u32			postdiv2;
+};
+
 struct ccu_pll {
 	struct ccu_common	common;
 	u32			lock_sts_mask;
+	int			cfgnum;
+	const struct ccu_pll_cfg *cfgs;
 };
 
 #define TH_CCU_ARG(_shift, _width)					\
@@ -391,17 +402,102 @@ static unsigned long ccu_pll_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
+static const struct ccu_pll_cfg *ccu_pll_lookup_best_cfg(struct ccu_pll *pll,
+							 unsigned long rate)
+{
+	unsigned long best_delta = ULONG_MAX;
+	const struct ccu_pll_cfg *best_cfg;
+	int i;
+
+	for (i = 0; i < pll->cfgnum; i++) {
+		const struct ccu_pll_cfg *cfg = &pll->cfgs[i];
+		unsigned long delta;
+
+		delta = abs_diff(cfg->freq, rate);
+		if (delta < best_delta) {
+			best_delta	= delta;
+			best_cfg	= cfg;
+		}
+	}
+
+	return best_cfg;
+}
+
+static int ccu_pll_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
+{
+	struct ccu_pll *pll = hw_to_ccu_pll(hw);
+
+	req->rate = ccu_pll_lookup_best_cfg(pll, req->rate)->freq;
+
+	return 0;
+}
+
+static int ccu_pll_set_rate(struct clk_hw *hw, unsigned long rate,
+			    unsigned long parent_rate)
+{
+	struct ccu_pll *pll = hw_to_ccu_pll(hw);
+	const struct ccu_pll_cfg *cfg;
+
+	cfg = ccu_pll_lookup_best_cfg(pll, rate);
+
+	ccu_pll_disable(hw);
+
+	regmap_write(pll->common.map, pll->common.cfg0,
+		     FIELD_PREP(TH1520_PLL_REFDIV,	1)		|
+		     FIELD_PREP(TH1520_PLL_FBDIV,	cfg->fbdiv)	|
+		     FIELD_PREP(TH1520_PLL_POSTDIV1,	cfg->postdiv1)	|
+		     FIELD_PREP(TH1520_PLL_POSTDIV2,	cfg->postdiv2));
+
+	regmap_update_bits(pll->common.map, pll->common.cfg1,
+			   TH1520_PLL_DACPD | TH1520_PLL_DSMPD |
+			   TH1520_PLL_FRAC,
+			   cfg->frac ? cfg->frac :
+				TH1520_PLL_DACPD | TH1520_PLL_DSMPD);
+
+	return ccu_pll_enable(hw);
+}
+
 static const struct clk_ops clk_pll_ops = {
 	.disable	= ccu_pll_disable,
 	.enable		= ccu_pll_enable,
 	.is_enabled	= ccu_pll_is_enabled,
 	.recalc_rate	= ccu_pll_recalc_rate,
+	.determine_rate	= ccu_pll_determine_rate,
+	.set_rate	= ccu_pll_set_rate,
 };
 
 static const struct clk_parent_data osc_24m_clk[] = {
 	{ .index = 0 }
 };
 
+static const struct ccu_pll_cfg cpu_pll_cfgs[] = {
+	{ 125000000,	125,	0, 6, 4 },
+	{ 200000000,	125,	0, 5, 3 },
+	{ 300000000,	125,	0, 5, 2 },
+	{ 400000000,	100,	0, 3, 2 },
+	{ 500000000,	125,	0, 6, 1 },
+	{ 600000000,	125,	0, 5, 1 },
+	{ 702000000,	117,	0, 4, 1 },
+	{ 800000000,	100,	0, 3, 1 },
+	{ 900000000,	75,	0, 2, 1 },
+	{ 1000000000,	125,	0, 3, 1 },
+	{ 1104000000,	92,	0, 2, 1 },
+	{ 1200000000,	100,	0, 2, 1 },
+	{ 1296000000,	108,	0, 2, 1 },
+	{ 1404000000,	117,	0, 2, 1 },
+	{ 1500000000,	125,	0, 2, 1 },
+	{ 1608000000,	67,	0, 1, 1 },
+	{ 1704000000,	71,	0, 1, 1 },
+	{ 1800000000,	75,	0, 1, 1 },
+	{ 1896000000,	79,	0, 1, 1 },
+	{ 1992000000,	83,	0, 1, 1 },
+	{ 2112000000,	88,	0, 1, 1 },
+	{ 2208000000,	92,	0, 1, 1 },
+	{ 2304000000,	96,	0, 1, 1 },
+	{ 2400000000,	100,	0, 1, 1 },
+};
+
 static struct ccu_pll cpu_pll0_clk = {
 	.common		= {
 		.clkid		= CLK_CPU_PLL0,
@@ -413,6 +509,8 @@ static struct ccu_pll cpu_pll0_clk = {
 					      CLK_IS_CRITICAL),
 	},
 	.lock_sts_mask		= BIT(1),
+	.cfgnum			= ARRAY_SIZE(cpu_pll_cfgs),
+	.cfgs			= cpu_pll_cfgs,
 };
 
 static struct ccu_pll cpu_pll1_clk = {
@@ -426,6 +524,16 @@ static struct ccu_pll cpu_pll1_clk = {
 					      CLK_IS_CRITICAL),
 	},
 	.lock_sts_mask		= BIT(4),
+	.cfgnum			= ARRAY_SIZE(cpu_pll_cfgs),
+	.cfgs			= cpu_pll_cfgs,
+};
+
+static const struct ccu_pll_cfg gmac_pll_cfg = {
+	.freq		= 1000000000,
+	.fbdiv		= 125,
+	.frac		= 0,
+	.postdiv1	= 3,
+	.postdiv2	= 1,
 };
 
 static struct ccu_pll gmac_pll_clk = {
@@ -439,6 +547,8 @@ static struct ccu_pll gmac_pll_clk = {
 					      CLK_IS_CRITICAL),
 	},
 	.lock_sts_mask		= BIT(3),
+	.cfgnum			= 1,
+	.cfgs			= &gmac_pll_cfg,
 };
 
 static const struct clk_hw *gmac_pll_clk_parent[] = {
@@ -449,6 +559,14 @@ static const struct clk_parent_data gmac_pll_clk_pd[] = {
 	{ .hw = &gmac_pll_clk.common.hw }
 };
 
+static const struct ccu_pll_cfg video_pll_cfg = {
+	.freq		= 792000000,
+	.fbdiv		= 99,
+	.frac		= 0,
+	.postdiv1	= 3,
+	.postdiv2	= 1,
+};
+
 static struct ccu_pll video_pll_clk = {
 	.common		= {
 		.clkid		= CLK_VIDEO_PLL,
@@ -460,6 +578,8 @@ static struct ccu_pll video_pll_clk = {
 					      CLK_IS_CRITICAL),
 	},
 	.lock_sts_mask		= BIT(7),
+	.cfgnum			= 1,
+	.cfgs			= &video_pll_cfg,
 };
 
 static const struct clk_hw *video_pll_clk_parent[] = {
@@ -470,6 +590,14 @@ static const struct clk_parent_data video_pll_clk_pd[] = {
 	{ .hw = &video_pll_clk.common.hw }
 };
 
+static const struct ccu_pll_cfg dpu_pll_cfg = {
+	.freq		= 1188000000,
+	.fbdiv		= 99,
+	.frac		= 0,
+	.postdiv1	= 2,
+	.postdiv2	= 1,
+};
+
 static struct ccu_pll dpu0_pll_clk = {
 	.common		= {
 		.clkid		= CLK_DPU0_PLL,
@@ -481,6 +609,8 @@ static struct ccu_pll dpu0_pll_clk = {
 					      0),
 	},
 	.lock_sts_mask		= BIT(8),
+	.cfgnum			= 1,
+	.cfgs			= &dpu_pll_cfg,
 };
 
 static const struct clk_hw *dpu0_pll_clk_parent[] = {
@@ -498,12 +628,22 @@ static struct ccu_pll dpu1_pll_clk = {
 					      0),
 	},
 	.lock_sts_mask		= BIT(9),
+	.cfgnum			= 1,
+	.cfgs			= &dpu_pll_cfg,
 };
 
 static const struct clk_hw *dpu1_pll_clk_parent[] = {
 	&dpu1_pll_clk.common.hw
 };
 
+static const struct ccu_pll_cfg tee_pll_cfg = {
+	.freq		= 792000000,
+	.fbdiv		= 99,
+	.frac		= 0,
+	.postdiv1	= 3,
+	.postdiv2	= 1,
+};
+
 static struct ccu_pll tee_pll_clk = {
 	.common		= {
 		.clkid		= CLK_TEE_PLL,
@@ -515,6 +655,8 @@ static struct ccu_pll tee_pll_clk = {
 					      CLK_IS_CRITICAL),
 	},
 	.lock_sts_mask		= BIT(10),
+	.cfgnum			= 1,
+	.cfgs			= &tee_pll_cfg,
 };
 
 static const struct clk_parent_data c910_i0_parents[] = {
-- 
2.51.2

