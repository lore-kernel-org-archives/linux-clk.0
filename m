Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A58D1CDFAC
	for <linux-clk@vger.kernel.org>; Sun,  5 Jan 2025 18:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736100948; cv=none; b=CATsE8XqKFXsRr2QsZ5/D7xO3Y41WB4ocMpv6XWClpwGygkI1ZG52CVJaMxZrPH7Xhuc8E53nK4u/KT2rrt06qc7eJ9YfUO951lN+l256uH6I7uNtNQ48oWGMszs0Menvr/ZjpywQJft0ltL1Y331sYePD/d8tqX6joOXw2rwV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736100948; c=relaxed/simple;
	bh=D3sK7YbjOg6v1dIHt2H3xYhrp59wINI5DGiX1I55/0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=twby5hUIYMJe1yjS+V+XhjH5PY6KD9icGYBs50qmpFou1bQyD8Nr60gf1HfyOcaY+6m9e7U41Ptsu+JNvqAGIClpxDAyIC4wteXYwHQyjjUNmcVc//QohZBSUA3oWaBjzVQCbJn9hi4CQnEl2bh3MMxHIMQwr/HSoj5CGenUEms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=ZBonKFcT; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ZBonKFcT"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aa696d3901bso1731278866b.1
        for <linux-clk@vger.kernel.org>; Sun, 05 Jan 2025 10:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1736100942; x=1736705742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYt+s6fkrUpxe5XF17lxHByzQRCB3AxfRzKWTwCyBC0=;
        b=ZBonKFcT0UXlEz2PZYdnbgbzSHeKsngeKY2YdyUIPtQ+YVF6SLaizOxIEYeKWxbcSo
         jbO/UB0l09LaHb42kC7aKRamqM68oHVSeZhM4VdNxUDgPrymm9BpjUW+UOF49txGf1Gk
         Rt7yK7vlpnlnRPK8KfgcjkfEy4eP6e1qaTYGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736100942; x=1736705742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CYt+s6fkrUpxe5XF17lxHByzQRCB3AxfRzKWTwCyBC0=;
        b=UmFiaDiGvnPjrcq3b6x3xciOzXKU4X23OAIPSXeWK8QmxsOLhdtbPapLrh+ydqb9Gc
         YA+fLHgGY3mc44EzNbbTX57o2i1EQZP5fNSdLJHvlaAEslMjM3HIfnj+S89LbJpOm4bz
         UiKBg94yB9NZVBL811cIM499w54jNV7o8Rmx/zndEObeAHsTqPCotLhLOnApGQjWtfZQ
         piUmqaT8EKfY2CuKJ/jxveUcX5S5rmCKBqBHAOmS0SdKsgNBVq8deMMqlyxktfgUZXIY
         7ey3vYxkepNemIW3dgzRHrnSJeRN5p2LPOYbTrGIlhsGfh81NIOkBNtFFIkx1vmGA3pa
         5osg==
X-Forwarded-Encrypted: i=1; AJvYcCUQpuDmkPvqwIKnX2EPAVp9DtQ3s88LRlN9lKYaVjyoC+SvXwAdnDidjcjxzcgu64fOQR9EOoXa1dM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPdjOZSttBoLxf4XhtqObCDRR60gRBQkgq99qbWMsp2VoVB8mc
	LPBrZQ/7RpeeXzgpIccX4HUHRbJfFGtXbKYbDZpPpkbGDmmiYtjw+bLtbWkPoSA=
X-Gm-Gg: ASbGncuF4eWMzIZhlqjLWgQ4T/c5EHhWK8CNxINY/vd8zaiYoELZJ4uAlLJ7k2D5qnA
	5UOfmWOYXqVUzFhbczjLAZhjhh48/nblPya8VejXv4dgPr0d6Hum6Kf6lj5xs5hq2jme9uZlgUh
	LOTQzTFLIIKHeT3BL9OdtMQHTFohFyvplu8VyFlMahzsXLPmx2xTh863CQiI/EXiBQKFAoe4Ur1
	OxaQqArlffNrmiZfARfnjdLmiOtSGRHJo45JiwOaWOPmNSkDizcmNpeUBfoRieCGKCxeTmnnQ47
	q3HZm9ZublvMzSw0ZCDvzAL1+Ki9ZxuxRE/AVBBuE/zcFZAy8NPyGdakU5RhMivd5ZpWIaXPQgA
	zs2MZAVVyG/V/HCQeFQ==
X-Google-Smtp-Source: AGHT+IHKfniWL7KIZr5UBchy8RdTJDMipbRucCKrppnn1VBJEdWfGEKF6uqo/1J4HGrc00eEihpFhA==
X-Received: by 2002:a17:907:7e86:b0:aaf:ada2:181e with SMTP id a640c23a62f3a-aafada219d8mr879413566b.26.1736100942566;
        Sun, 05 Jan 2025 10:15:42 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-41-6-15.retail.telecomitalia.it. [79.41.6.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f178sm2138185066b.38.2025.01.05.10.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 10:15:42 -0800 (PST)
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
Subject: [PATCH 6/6] clk: stm32f4: support spread spectrum clock generation
Date: Sun,  5 Jan 2025 19:14:18 +0100
Message-ID: <20250105181525.1370822-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105181525.1370822-1-dario.binacchi@amarulasolutions.com>
References: <20250105181525.1370822-1-dario.binacchi@amarulasolutions.com>
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

