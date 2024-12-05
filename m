Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D013D20E009
	for <linux-clk@vger.kernel.org>; Thu,  5 Dec 2024 11:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733397613; cv=none; b=L9SUJo/dNt9FKBAOO+/oLumK8M+yaO0ev0XtOAmUjGH6KREdoMXxuHw/J5MevAEwKW8/Jx4vxzAz61KDE6kZybSm2OdRi3jZ9gAV1lApSHHOXUfykpE6KN6isgFgYTdqI0/kjdr7pVZbwowfLWxogSWB2BvmZbyjTv5jxLoafAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733397613; c=relaxed/simple;
	bh=C28qiRIhgggIkHGiQGnACEeZ3glgf31j1uHkFfZhVqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hJ9Mq+eP813Sro70LN+9dzPFFTypXFbNWb+ObFHse3FVyo6h8xVB5Ai5dIJLDQMGhsWZ2B7KV2NhUAzPOvv6mSxFuleTX1deCeZi6q2bmhqDTk5ABRTljQcjFPeuEpUdPNNhIRhbbt/YLOk3QgoiAfM+i4+5nD2XJYZoCsUhw1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=L5gRzGLN; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="L5gRzGLN"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aa530a94c0eso155635566b.2
        for <linux-clk@vger.kernel.org>; Thu, 05 Dec 2024 03:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733397610; x=1734002410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RMocBLcHro+o7F7SOdKyuWq3E4fYkgXCw+gmS/pjce4=;
        b=L5gRzGLNbwrfI+E4p3LlQddHu87idU9lHNrsawjfKMb8KKCdfcHoMnYz62akX+kaiI
         rEfbCvT8Mqhz2uF3eU4HeF15sCB/DFkR1dpefsKzRA0of8I9DFnIDx8znBbtAJSSGFWV
         NolsaV7m02Yz+JyQutYUXFxg2uqYHvcpa3Sg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733397610; x=1734002410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RMocBLcHro+o7F7SOdKyuWq3E4fYkgXCw+gmS/pjce4=;
        b=FFEUehQdBoJ6gk1T9qze2MplDHJLogn90eWREgbJk78/17SD6zYTzBuYSZSqLAeJNP
         aQRAEP8OnTofOUfHxTqVPzH7lwrx8mvyUM0Z2sznHweAUUyeYREWd8CiHxaiVzf7DUWK
         XwTbrjiPRCi/6Gu2WA+ee39wH3vuFb1wQ4yPUMZZOQiF0ajGOam8+XEmdwnOHURbvu2m
         8S4tz0MpLkMvWeEy0gbowPaeJQqZdFDCo80dm8vP8yIeUdFJdk09kyoW0uOg85za6ox/
         rycfbiw0z8F/2B6kaFQ0FFmaYhvzp0skROsb6k0iG6rq8BmmXD8lDwslE+4JF7GkC4a/
         VaFw==
X-Forwarded-Encrypted: i=1; AJvYcCWYfGpPeHVuz0eIHwSpxtZoT65VSwsG+DLP62fED3ZDDeLG2fR6oI0hrhYK2kfjlYcY3p3yJxWqEvM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqcJrPHa68ReKJCBK7X7WWi4MYGj5CASZDBKY8PjkfwsLtpSLp
	PtpTW6nfUihlHr2fSASgD0frVaXVpCueZMYrPzRpGyVmnYa39iKLW9LrZp8GLDA=
X-Gm-Gg: ASbGncvgs7Vkp1UZBL9THVK4RNjeS6qs0/QTKY3+cTf3Lge1Lx6IoJ89FyLC5iscvBp
	yTPc8T8Rl6ouNuFR1Agt6ljBBwvkRjB49SwdtX4mZ74WEixjJxOK9U3lkDMzDb3O9Mf3o8rhtpH
	x9dHiZJdA+4A9zPotyRfU2CJU1kkqQEaIA1etcllcxjOLpez7wTSVvmVnnQ8heC00mzpqeUYOKK
	Ic3fVD/Ef0YsvtzyUj5aqTWxIh8xn7x4MSypi61BOnkTJRdjWvOvLFBXUGWFIbYocjY3WcVTHad
	8v2yBwzjFJF7Kp1gLURD/+3yDAL85HOxyWdNR218bLslwA==
X-Google-Smtp-Source: AGHT+IHv/Fr64yXiEsAqy/lH7qJb40cD7p0U+/rHAj8ItetqNUW7tmK2NTCHhIBQ/5FLqjRqUTU12A==
X-Received: by 2002:a17:907:3a57:b0:aa6:2cfc:3157 with SMTP id a640c23a62f3a-aa62cfc4dffmr74669566b.33.1733397610192;
        Thu, 05 Dec 2024 03:20:10 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eedcd0sm77505266b.87.2024.12.05.03.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 03:20:09 -0800 (PST)
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
Subject: [PATCH v5 19/20] clk: imx: pll14xx: support spread spectrum clock generation
Date: Thu,  5 Dec 2024 12:17:54 +0100
Message-ID: <20241205111939.1796244-20-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
References: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
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

 drivers/clk/imx/clk-pll14xx.c | 126 ++++++++++++++++++++++++++++++++++
 drivers/clk/imx/clk.h         |  16 +++++
 2 files changed, 142 insertions(+)

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index d63564dbb12c..1e66c3bb230d 100644
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
 
@@ -542,3 +577,94 @@ struct clk_hw *imx_dev_clk_hw_pll14xx(struct device *dev, const char *name,
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
index 52055fda3058..edd28b78b115 100644
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
@@ -494,4 +506,8 @@ struct clk_hw *imx_clk_gpr_mux(const char *name, const char *compatible,
 struct clk_hw *imx8m_anatop_get_clk_hw(int id);
 #endif
 
+void imx_clk_pll14xx_enable_ssc(struct clk_hw *hw, struct imx_pll14xx_ssc *conf);
+int imx_clk_pll14xx_ssc_parse_dt(struct device_node *np, const char *pll_name,
+				 struct imx_pll14xx_ssc *conf);
+
 #endif
-- 
2.43.0

