Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0C42054E0
	for <linux-clk@vger.kernel.org>; Thu,  9 Jan 2025 21:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736457565; cv=none; b=GvCZfNU/LTeZzv/6GQRHT06rn2MxBhuI1T3jPAofHDPSBveTcMpJfIsrUvIKF+60x8YCXLL5XpyVH2Namc5Dc+CJ+WmksOxs4NkzEw3rpKuZbdAIz9j4MLGROWWMrrikouEnC//jB51B7+nCS5U92a6Y9DmLWelcOKu+He5DGMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736457565; c=relaxed/simple;
	bh=EoKKi+Z60KmqjOEZJ9LNBHGoycV+Fglx9GgRLT+IXzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NPPrG1qkwCULYSNXnoIWMJmJFR7c8UjrdGjUtn4/hotNv9sBlCiT9js1KlPYDUOzyq+K1lQUu0gZ3d6nR3d01zC3YRH3diMkRiZkdiE8UHG8x+wtcUR/5mGpdxDW7QvgVd+pt5NPl2MGFcj++BCEL3W3m5pNat48yR4/LpE1EGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=d9znHasW; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="d9znHasW"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d41848901bso2560454a12.0
        for <linux-clk@vger.kernel.org>; Thu, 09 Jan 2025 13:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1736457562; x=1737062362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJ26hgnRMCLZPTXr7KLkVyqRMMqeBIF3e9Y1qTU0tFU=;
        b=d9znHasWVC8PXqb6XKegRj8Hd/M8KprBB7+YbnFTB/xXvRaN/QCs57qFczQQ9PYj5v
         t2cSALZ7oD7FVW9EqywxnSrRgHMLCr7aYpv6UWHaLavab254OSbex8XWe0OVUFZ1H9P6
         D07Un31kP7NAy44HODflppFTFVm8m5LHknfWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736457562; x=1737062362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iJ26hgnRMCLZPTXr7KLkVyqRMMqeBIF3e9Y1qTU0tFU=;
        b=MRomjddi6wpm2/3fyj73OrVFRI/OQn8A21wxbOUTSHGipauAG0vFVccQZPohwH9gsc
         R/IpPwH7oyRQLP8LkwR887yrc4U4xf/LfIbbP40tBERn3iBtrmsvgv12G77GKFOIxkzs
         IixhIjnFU7Flpr2t9kGnyXwW68l8YoFlHlvzFeQ8yg22zqbADdAfNCWETyxCsKXB91uz
         LrJG/hiyVc7yWWW1U0HJe138X5eO8fm59kL2pTTCfWI4VVRrH4Ddxav7oqMBkmhVpxya
         a0x2tW1EXT/zeOILt8dLVg071//FG/Kg0i1ywWijTtLdwhwaL9RdVa5iTEco316PNMpa
         cBoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOr5qiyN7N1PJoGquJ9mbN66mwrHnI8qQRUoMfwoiO7f/qEuGS4ZU06etA4jpByRIuXJukl6ZcGnQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVBsJFr2pogSevL2bet856nuglCuj+O3Gy8QbE4Cl25fR4c4nl
	goyTbyN9HHHE2yxefW/AzjQENyVpSycDT1ZmElSJ4Inqk9TKTEUXdHDFdNE+qmPOQz/tlj3ZXws
	U
X-Gm-Gg: ASbGncsSg0Aj91r55EixedQ99pz2uWyWvv+NiEFv5/CzZ1tEPCY+Vui+XQs1RDPlWbt
	ysLWNg1bZwhMpPLMdq5H0U+C3K3cNvq1FUkKZADXhKuyPj+FDJAZWWND2K0m+JwfMP7x8MhFuiF
	ROE3sYmYY5V/BpdYQ0/xcjanSxYAsxMUEyGYhYiEItwVqDpSDLEyVszf4QjJEqptZJWrqBM9b4t
	DE4tSSWk5dDk35rrNNBmZ1nYBqBvF9lRR9u75fpPQZ5bcbSEa7yBhc1iInc0JsnITiUbHZxlbbj
	KA54JDW906gDDiJZnHWppwcaORgCR4Ki1KYkX9squHDbdqXXtQ1x3rHT47VvIc4951Lbdmcwl7G
	TBYu+aMfVqN9w5PTc2w==
X-Google-Smtp-Source: AGHT+IEZ3Pmwpnwcw8QBt1dN5e19AnUypwazIVJ9R+ER6Nu6NohOMhjMnT0yJVMOQm16EeoH5knA9A==
X-Received: by 2002:a05:6402:40cc:b0:5d0:d328:3a43 with SMTP id 4fb4d7f45d1cf-5d98a24a72fmr3294628a12.6.1736457562307;
        Thu, 09 Jan 2025 13:19:22 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-41-6-15.retail.telecomitalia.it. [79.41.6.15])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9900c4b56sm925567a12.32.2025.01.09.13.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 13:19:22 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v2 4/4] clk: stm32f4: support spread spectrum clock generation
Date: Thu,  9 Jan 2025 22:18:31 +0100
Message-ID: <20250109211908.1553072-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250109211908.1553072-1-dario.binacchi@amarulasolutions.com>
References: <20250109211908.1553072-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support spread spectrum clock generation for the main PLL, the only one
for which this functionality is available.

Tested on the STM32F469I-DISCO board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Fixup patches:
  2/6 dt-bindings: reset: st,stm32-rcc: update reference due to rename
  3/6 dt-bindings: clock: stm32fx: update reference due to rename
  to
  1/6 dt-bindings: clock: convert stm32 rcc bindings to json-schema
- Changes to dt-bindings: clock: convert stm32 rcc bindings to json-schema
- Changes to dt-bindings: clock: st,stm32-rcc: support spread spectrum clocking

 drivers/clk/clk-stm32f4.c | 143 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 140 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
index db1c56c8d54f..6c80c0dbb0a3 100644
--- a/drivers/clk/clk-stm32f4.c
+++ b/drivers/clk/clk-stm32f4.c
@@ -35,6 +35,7 @@
 #define STM32F4_RCC_APB2ENR		0x44
 #define STM32F4_RCC_BDCR		0x70
 #define STM32F4_RCC_CSR			0x74
+#define STM32F4_RCC_SSCGR		0x80
 #define STM32F4_RCC_PLLI2SCFGR		0x84
 #define STM32F4_RCC_PLLSAICFGR		0x88
 #define STM32F4_RCC_DCKCFGR		0x8c
@@ -42,6 +43,12 @@
 
 #define STM32F4_RCC_PLLCFGR_N_MASK	GENMASK(14, 6)
 
+#define STM32F4_RCC_SSCGR_SSCGEN	BIT(31)
+#define STM32F4_RCC_SSCGR_SPREADSEL	BIT(30)
+#define STM32F4_RCC_SSCGR_RESERVED_MASK	GENMASK(29, 28)
+#define STM32F4_RCC_SSCGR_INCSTEP_MASK	GENMASK(27, 13)
+#define STM32F4_RCC_SSCGR_MODPER_MASK	GENMASK(12, 0)
+
 #define NONE -1
 #define NO_IDX  NONE
 #define NO_MUX  NONE
@@ -512,6 +519,17 @@ static const struct clk_div_table pll_divr_table[] = {
 	{ 2, 2 }, { 3, 3 }, { 4, 4 }, { 5, 5 }, { 6, 6 }, { 7, 7 }, { 0 }
 };
 
+enum stm32f4_pll_ssc_mod_type {
+	STM32F4_PLL_SSC_CENTER_SPREAD,
+	STM32F4_PLL_SSC_DOWN_SPREAD,
+};
+
+struct stm32f4_pll_ssc {
+	unsigned int mod_freq;
+	unsigned int mod_depth;
+	enum stm32f4_pll_ssc_mod_type mod_type;
+};
+
 struct stm32f4_pll {
 	spinlock_t *lock;
 	struct	clk_gate gate;
@@ -519,6 +537,8 @@ struct stm32f4_pll {
 	u8 bit_rdy_idx;
 	u8 status;
 	u8 n_start;
+	bool ssc_enable;
+	struct stm32f4_pll_ssc ssc_conf;
 };
 
 #define to_stm32f4_pll(_gate) container_of(_gate, struct stm32f4_pll, gate)
@@ -541,6 +561,7 @@ struct stm32f4_vco_data {
 	u8 offset;
 	u8 bit_idx;
 	u8 bit_rdy_idx;
+	bool sscg;
 };
 
 static const struct stm32f4_vco_data  vco_data[] = {
@@ -661,6 +682,34 @@ static long stm32f4_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 	return *prate * n;
 }
 
+static void stm32f4_pll_set_ssc(struct clk_hw *hw, unsigned long parent_rate,
+				unsigned int ndiv)
+{
+	struct clk_gate *gate = to_clk_gate(hw);
+	struct stm32f4_pll *pll = to_stm32f4_pll(gate);
+	struct stm32f4_pll_ssc *ssc = &pll->ssc_conf;
+	u32 modeper, incstep;
+	u32 sscgr;
+
+	sscgr = readl(base + STM32F4_RCC_SSCGR);
+	/* reserved field must be kept at reset value */
+	sscgr &= STM32F4_RCC_SSCGR_RESERVED_MASK;
+
+	modeper = DIV_ROUND_CLOSEST(parent_rate, 4 * ssc->mod_freq);
+	incstep = DIV_ROUND_CLOSEST(((1 << 15) - 1) * ssc->mod_depth * ndiv,
+				    5 * 10000 * modeper);
+	sscgr |= STM32F4_RCC_SSCGR_SSCGEN |
+		FIELD_PREP(STM32F4_RCC_SSCGR_INCSTEP_MASK, incstep) |
+		FIELD_PREP(STM32F4_RCC_SSCGR_MODPER_MASK, modeper);
+
+	if (ssc->mod_type)
+		sscgr |= STM32F4_RCC_SSCGR_SPREADSEL;
+
+	pr_debug("%s: pll: %s: modeper: %d, incstep: %d, sscgr: 0x%08x\n",
+		 __func__, clk_hw_get_name(hw), modeper, incstep, sscgr);
+	writel(sscgr, base + STM32F4_RCC_SSCGR);
+}
+
 static int stm32f4_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 				unsigned long parent_rate)
 {
@@ -683,6 +732,9 @@ static int stm32f4_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	writel(val, base + pll->offset);
 
+	if (pll->ssc_enable)
+		stm32f4_pll_set_ssc(hw, parent_rate, n);
+
 	if (pll_state)
 		stm32f4_pll_enable(hw);
 
@@ -788,6 +840,87 @@ static struct clk_hw *clk_register_pll_div(const char *name,
 	return hw;
 }
 
+static int stm32f4_pll_init_ssc(struct clk_hw *hw, struct stm32f4_pll_ssc *conf)
+{
+	struct clk_gate *gate = to_clk_gate(hw);
+	struct stm32f4_pll *pll = to_stm32f4_pll(gate);
+	struct clk_hw *parent;
+	unsigned long parent_rate;
+	int pll_state;
+	unsigned long n, val;
+
+	parent = clk_hw_get_parent(hw);
+	if (!parent) {
+		pr_err("%s: failed to get clock parent\n", __func__);
+		return -ENODEV;
+	}
+
+	parent_rate = clk_hw_get_rate(parent);
+
+	pll->ssc_enable = true;
+	memcpy(&pll->ssc_conf, conf, sizeof(pll->ssc_conf));
+
+	pll_state = stm32f4_pll_is_enabled(hw);
+
+	if (pll_state)
+		stm32f4_pll_disable(hw);
+
+	val = readl(base + pll->offset);
+	n = FIELD_GET(STM32F4_RCC_PLLCFGR_N_MASK, val);
+
+	pr_debug("%s: pll: %s, parent: %s, parent-rate: %lu, n: %lu\n",
+		 __func__, clk_hw_get_name(hw), clk_hw_get_name(parent),
+		 parent_rate, n);
+
+	stm32f4_pll_set_ssc(hw, parent_rate, n);
+
+	if (pll_state)
+		stm32f4_pll_enable(hw);
+
+	return 0;
+}
+
+static int stm32f4_pll_ssc_parse_dt(struct device_node *np,
+				    struct stm32f4_pll_ssc *conf)
+{
+	int ret;
+	const char *s;
+
+	if (!conf)
+		return -EINVAL;
+
+	ret = of_property_read_u32(np, "st,ssc-modfreq-hz", &conf->mod_freq);
+	if (ret)
+		return ret;
+
+	ret = of_property_read_u32(np, "st,ssc-moddepth-permyriad",
+				   &conf->mod_depth);
+	if (ret) {
+		pr_err("%pOF: missing st,ssc-moddepth-permyriad\n", np);
+		return ret;
+	}
+
+	ret = of_property_read_string(np, "st,ssc-modmethod", &s);
+	if (ret) {
+		pr_err("%pOF: missing st,ssc-modmethod\n", np);
+		return ret;
+	}
+
+	if (!strcmp(s, "down-spread")) {
+		conf->mod_type = STM32F4_PLL_SSC_DOWN_SPREAD;
+	} else if (!strcmp(s, "center-spread")) {
+		conf->mod_type = STM32F4_PLL_SSC_CENTER_SPREAD;
+	} else {
+		pr_err("%pOF: wrong value (%s) for fsl,ssc-modmethod\n", np, s);
+		return -EINVAL;
+	}
+
+	pr_debug("%pOF: SSCG settings: mod_freq: %d, mod_depth: %d mod_method: %s [%d]\n",
+		 np, conf->mod_freq, conf->mod_depth, s, conf->mod_type);
+
+	return 0;
+}
+
 static struct clk_hw *stm32f4_rcc_register_pll(const char *pllsrc,
 		const struct stm32f4_pll_data *data,  spinlock_t *lock)
 {
@@ -1695,7 +1828,8 @@ static void __init stm32f4_rcc_init(struct device_node *np)
 	const struct of_device_id *match;
 	const struct stm32f4_clk_data *data;
 	unsigned long pllm;
-	struct clk_hw *pll_src_hw;
+	struct clk_hw *pll_src_hw, *pll_vco_hw;
+	struct stm32f4_pll_ssc ssc_conf;
 
 	base = of_iomap(np, 0);
 	if (!base) {
@@ -1754,8 +1888,8 @@ static void __init stm32f4_rcc_init(struct device_node *np)
 	clk_hw_register_fixed_factor(NULL, "vco_in", pll_src,
 				     0, 1, pllm);
 
-	stm32f4_rcc_register_pll("vco_in", &data->pll_data[0],
-			&stm32f4_clk_lock);
+	pll_vco_hw = stm32f4_rcc_register_pll("vco_in", &data->pll_data[0],
+					      &stm32f4_clk_lock);
 
 	clks[PLL_VCO_I2S] = stm32f4_rcc_register_pll("vco_in",
 			&data->pll_data[1], &stm32f4_clk_lock);
@@ -1900,6 +2034,9 @@ static void __init stm32f4_rcc_init(struct device_node *np)
 
 	of_clk_add_hw_provider(np, stm32f4_rcc_lookup_clk, NULL);
 
+	if (!stm32f4_pll_ssc_parse_dt(np, &ssc_conf))
+		stm32f4_pll_init_ssc(pll_vco_hw, &ssc_conf);
+
 	return;
 fail:
 	kfree(clks);
-- 
2.43.0

