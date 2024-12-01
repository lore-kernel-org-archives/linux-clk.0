Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88261DE4ED
	for <linux-clk@vger.kernel.org>; Sun,  1 Dec 2024 17:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733075275; cv=none; b=C3tOQeKrTgBY7zqqIkdKt4jYXkAQIj7m3iaaqggd6DUZOecwfSKStl/qcOrsuRihdL+9A4+arFtB3hp52CT7nRkkq9ybFA2mXYwnMlrrvcp8phKUQw1b4+JOCkNFMFBLEdG8XFOXc90KTwNUjbIXAIULq0jIvF6Q2lhRP7V+fAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733075275; c=relaxed/simple;
	bh=aK/8juuW7QVGSAQiYHJPYDAyivzX/oyropbSi4Hokt8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LtOGTl/78EVPRqdPuBPlQUMjFZElY8PpdnSi1nWw6/G5iTmptjA+isgRL8GnD4imhZ9pWlSRAChdzsFPWlQv8fF0q9NrMGMpSKswnzySTGnopZ+gxFa4ZBWRuOCYptdK8sMuRuvJm2/fIZnWpGh0pDh1ZedvxbQPRHyViWak/mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=omUxwops; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="omUxwops"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d0c7c8cd6cso2437107a12.0
        for <linux-clk@vger.kernel.org>; Sun, 01 Dec 2024 09:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733075272; x=1733680072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KkX+s5EHVn/U/f89vXhboloGzSq+GXoMTZ4AsN/1EgI=;
        b=omUxwopsBn0yrIqi6RDjYpRR6NIx9PqTAnNW5A/ax9eJNg9qUkaU2VK18L1YymoEOV
         so/5DzRHdHq/QXd0KmmYDQ+JvLAbGOVt57jwIwuqvGIP84xuJanbeoDrNOjWb5Dgr+I4
         1cw0sxNlF1bEj+UufqcVvwuELH0tTmTGR6mDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733075272; x=1733680072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KkX+s5EHVn/U/f89vXhboloGzSq+GXoMTZ4AsN/1EgI=;
        b=bOPtl21QTxQa8kFfn8WKqnLsSZvNdRtuleL3oCVH+KVLCS+7bSHH3t9fxlu95leFRT
         m9LxqSAGUSVR9Qq4W4I/nf9ZeYxUDS31QCIQ6RDSpwNr/g5MOJvs9IcVmEog858GSNFb
         uR0LK105x1HODV18ge7lh7DCuBE8Ar0pLp3b4y43HOAN3hK+I2XaKvukhUffCjHzVffr
         H2ydJszj8+N2cVzIdQYcVVJha3Of2gucRKsAC9zcECp1X5YpKZWkE43kNa29IrtX7arD
         NiKWqUrua9LIwOO4Ai6durhzt+qj+WBjsPeLuFJ2c8CYOuq8NvW7TeBZvAsofrIxsruN
         yIJg==
X-Forwarded-Encrypted: i=1; AJvYcCW+yZ7DRlurs+NYLsNCyS10oIyrzOalIQHiUY1cUcyEnBSQfS7BP9q/XEmtDNMJXA7zwleywD6swBs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvAAIiE333+bzaXZG4/KU58l7sJPHXNQvldr1Y+biUuxzKqFxP
	K/RhaeTspIKq4qpRz/LQ7brX5nj8eFTXQ09BNzgJnfDlfeqm+QxcCkF+nlbWKRY=
X-Gm-Gg: ASbGncudvQiNl+0KOmKsSzrjzVIfYa8JCDdKP6rc7S7ex8YRDBog39uY3S+D9tl606C
	pXonCtPSGs1fP5Al5/gd9ZeIPD1SB82fpum+TXZOtRIX0VAZTVMN1m6PIBwBVOhKXJe9rz2VvCa
	bJNUlkFp4fnwSNtNm4ZjQjIU8EOUsVpdZDbAxu9ydelMMEiH6ObsJrZASQHs+YyZgsKZwYzsV3t
	j2Uuq2oRzL3zTMC2GbhYif9AsERXb03DcFy6uzrRlFrXAykgo/C/AfGu6KaVIFR5ku4HLZ1B8mr
	mGB+DlZDIyz7vVXCJ2wRNlfLsKdYMewb6pNKAkXVEv1zHJ5LLdCQ+sPeYSKBgappzHDP/N0rDpz
	Zw7iTjPadguP2RMQW
X-Google-Smtp-Source: AGHT+IF08jfHLRmXZ7Szt3i4A/3eiBp6wsc5YHFkMKK2MCTIzZC7tiGx6WvaEViBr4STlAAenUlT4g==
X-Received: by 2002:a17:907:9494:b0:aa5:63a0:5d97 with SMTP id a640c23a62f3a-aa5945cdbdcmr2003825166b.13.1733075272328;
        Sun, 01 Dec 2024 09:47:52 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a78esm415220066b.163.2024.12.01.09.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 09:47:51 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v4 17/18] clk: imx: pll14xx: support spread spectrum clock generation
Date: Sun,  1 Dec 2024 18:46:17 +0100
Message-ID: <20241201174639.742000-18-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
References: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for spread spectrum clock (SSC) generation to the pll14xxx
driver.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 drivers/clk/imx/clk-pll14xx.c | 127 ++++++++++++++++++++++++++++++++++
 drivers/clk/imx/clk.h         |  16 +++++
 2 files changed, 143 insertions(+)

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index d63564dbb12c..b07c59fd659a 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -20,6 +20,8 @@
 #define GNRL_CTL	0x0
 #define DIV_CTL0	0x4
 #define DIV_CTL1	0x8
+#define SSCG_CTRL	0xc
+
 #define LOCK_STATUS	BIT(31)
 #define LOCK_SEL_MASK	BIT(29)
 #define CLKE_MASK	BIT(11)
@@ -31,6 +33,10 @@
 #define KDIV_MASK	GENMASK(15, 0)
 #define KDIV_MIN	SHRT_MIN
 #define KDIV_MAX	SHRT_MAX
+#define SSCG_ENABLE	BIT(31)
+#define MFREQ_CTL_MASK	GENMASK(19, 12)
+#define MRAT_CTL_MASK	GENMASK(9, 4)
+#define SEL_PF_MASK	GENMASK(1, 0)
 
 #define LOCK_TIMEOUT_US		10000
 
@@ -40,6 +46,8 @@ struct clk_pll14xx {
 	enum imx_pll14xx_type		type;
 	const struct imx_pll14xx_rate_table *rate_table;
 	int rate_count;
+	bool                            ssc_enable;
+	struct imx_pll14xx_ssc		ssc_conf;
 };
 
 #define to_clk_pll14xx(_hw) container_of(_hw, struct clk_pll14xx, hw)
@@ -347,6 +355,27 @@ static int clk_pll1416x_set_rate(struct clk_hw *hw, unsigned long drate,
 	return 0;
 }
 
+static void clk_pll1443x_enable_ssc(struct clk_hw *hw, unsigned long parent_rate,
+				    unsigned int pdiv, unsigned int mdiv)
+{
+	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
+	struct imx_pll14xx_ssc *conf = &pll->ssc_conf;
+	u32 sscg_ctrl, mfr, mrr;
+
+	sscg_ctrl = readl_relaxed(pll->base + SSCG_CTRL);
+	sscg_ctrl &=
+		~(SSCG_ENABLE | MFREQ_CTL_MASK | MRAT_CTL_MASK | SEL_PF_MASK);
+
+	mfr = parent_rate / (conf->mod_freq * pdiv * (1 << 5));
+	mrr = (conf->mod_rate * mdiv * (1 << 6)) / (100 * mfr);
+
+	sscg_ctrl |= SSCG_ENABLE | FIELD_PREP(MFREQ_CTL_MASK, mfr) |
+		FIELD_PREP(MRAT_CTL_MASK, mrr) |
+		FIELD_PREP(SEL_PF_MASK, conf->mod_type);
+
+	writel_relaxed(sscg_ctrl, pll->base + SSCG_CTRL);
+}
+
 static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 				 unsigned long prate)
 {
@@ -368,6 +397,9 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 		writel_relaxed(FIELD_PREP(KDIV_MASK, rate.kdiv),
 			       pll->base + DIV_CTL1);
 
+		if (pll->ssc_enable)
+			clk_pll1443x_enable_ssc(hw, prate, rate.pdiv, rate.mdiv);
+
 		return 0;
 	}
 
@@ -408,6 +440,9 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 	gnrl_ctl &= ~BYPASS_MASK;
 	writel_relaxed(gnrl_ctl, pll->base + GNRL_CTL);
 
+	if (pll->ssc_enable)
+		clk_pll1443x_enable_ssc(hw, prate, rate.pdiv, rate.mdiv);
+
 	return 0;
 }
 
@@ -542,3 +577,95 @@ struct clk_hw *imx_dev_clk_hw_pll14xx(struct device *dev, const char *name,
 	return hw;
 }
 EXPORT_SYMBOL_GPL(imx_dev_clk_hw_pll14xx);
+
+void imx_clk_pll14xx_enable_ssc(struct clk_hw *hw, struct imx_pll14xx_ssc *conf)
+{
+	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
+
+	pll->ssc_enable = true;
+	memcpy(&pll->ssc_conf, conf, sizeof(pll->ssc_conf));
+}
+EXPORT_SYMBOL_GPL(imx_clk_pll14xx_enable_ssc);
+
+static int clk_pll14xx_ssc_mod_type(const char *name,
+				    enum imx_pll14xx_ssc_mod_type *mod_type)
+{
+	int i;
+	struct {
+		const char *name;
+		enum imx_pll14xx_ssc_mod_type id;
+	} mod_types[] = {
+		{ .name = "down-spread", .id = IMX_PLL14XX_SSC_DOWN_SPREAD },
+		{ .name = "up-spread", .id = IMX_PLL14XX_SSC_UP_SPREAD },
+		{ .name = "center-spread", .id = IMX_PLL14XX_SSC_CENTER_SPREAD }
+	};
+
+	pr_info("%s, name: %s\n", __func__, name);
+	for (i = 0; i < ARRAY_SIZE(mod_types); i++) {
+		if (!strcmp(name, mod_types[i].name)) {
+			*mod_type = mod_types[i].id;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
+int imx_clk_pll14xx_ssc_parse_dt(struct device_node *np, const char *pll_name,
+				 struct imx_pll14xx_ssc *conf)
+{
+	int i, ret, num_clks;
+	const char *s;
+
+	if (!conf)
+		return -EINVAL;
+
+	ret = of_property_count_strings(np, "clock-names");
+	if (ret < 0)
+		return ret;
+
+	num_clks = ret;
+	for (i = 0; i < num_clks; i++) {
+		ret = of_property_read_string_index(np, "clock-names", i, &s);
+		if (strcmp(pll_name, s))
+			continue;
+
+		ret = of_property_read_u32_index(np, "fsl,ssc-modfreq-hz", i,
+						 &conf->mod_freq);
+		if (ret)
+			return ret;
+
+		ret = of_property_read_u32_index(np, "fsl,ssc-modrate-percent", i,
+						 &conf->mod_rate);
+		if (ret) {
+			pr_err("missing fsl,ssc-modrate-percent property for %pOFn\n",
+			       np);
+			return ret;
+		}
+
+		ret = of_property_read_string_index(np, "fsl,ssc-modmethod", i, &s);
+		if (ret) {
+			pr_err("failed to get fsl,ssc-modmethod property for %pOFn\n",
+			       np);
+			return ret;
+		}
+
+		if (strlen(s) == 0)
+			return -ENODEV;
+
+		ret = clk_pll14xx_ssc_mod_type(s, &conf->mod_type);
+		if (ret) {
+			pr_err("wrong fsl,ssc-modmethod property for %pOFn\n", np);
+			return ret;
+
+		}
+
+		pr_debug("%s: mod_freq: %d, mod_rate: %d: mod_method: %s [%d]\n",
+			 __func__, conf->mod_freq, conf->mod_rate, s, conf->mod_type);
+
+		return 0;
+	}
+
+	return -ENODEV;
+}
+EXPORT_SYMBOL_GPL(imx_clk_pll14xx_ssc_parse_dt);
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index 6b6af26f4f1e..dad6e90c7dc0 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -69,6 +69,18 @@ struct imx_pll14xx_clk {
 	int flags;
 };
 
+enum imx_pll14xx_ssc_mod_type {
+	IMX_PLL14XX_SSC_DOWN_SPREAD,
+	IMX_PLL14XX_SSC_UP_SPREAD,
+	IMX_PLL14XX_SSC_CENTER_SPREAD,
+};
+
+struct imx_pll14xx_ssc {
+	unsigned int mod_freq;
+	unsigned int mod_rate;
+	enum imx_pll14xx_ssc_mod_type mod_type;
+};
+
 extern struct imx_pll14xx_clk imx_1416x_pll;
 extern struct imx_pll14xx_clk imx_1443x_pll;
 extern struct imx_pll14xx_clk imx_1443x_dram_pll;
@@ -493,4 +505,8 @@ struct clk_hw *imx_clk_gpr_mux(const char *name, const char *compatible,
 struct clk_hw *imx8m_anatop_get_clk_hw(int id);
 #endif
 
+void imx_clk_pll14xx_enable_ssc(struct clk_hw *hw, struct imx_pll14xx_ssc *conf);
+int imx_clk_pll14xx_ssc_parse_dt(struct device_node *np, const char *pll_name,
+				 struct imx_pll14xx_ssc *conf);
+
 #endif
-- 
2.43.0

