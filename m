Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D9A19F106
	for <linux-clk@vger.kernel.org>; Sat, 28 Sep 2024 08:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727512700; cv=none; b=fQ3FhH5N9OdU98Ncqn5Hqa3uE/gj+e6zuo2f3pXSJfNqsOonsTLGIwlo2RwEwM1sCwBww8Zpn621rqT5JiFRrKCLDRfMSJPIju/hlfyOaDBGCdwRbo/HWgQPKUF4ICSh8YGxW1Kr8q5UBIC8DJHiUFgm47ip3tlbdvSucoxXUsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727512700; c=relaxed/simple;
	bh=ZUYA+pWZpY2DRc3cAVwVXQSDu+K0xkkk/o8s2GO9A2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h9bj/JQOLCTNZmtUbpEmvaE83dvw4euiipECUH9VL2ZX+n7u0UuXiocPONkrkoIX1GfI+1cDyjZenUND+LNQeMG7UAQztywjUYqDK/EXVE86ZcQsarK3Y7sheL3jPYgDl8TeG7KzwXY11LA7MHjlKMhBLGFhvOh+Nlx+quhll/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=jg3P3Npd; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="jg3P3Npd"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37ce14ab7eeso282816f8f.2
        for <linux-clk@vger.kernel.org>; Sat, 28 Sep 2024 01:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1727512697; x=1728117497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k379zOY8JpOCRdB0yzVh9VgxfCdVDSaVvSc2yhV6i0U=;
        b=jg3P3NpdlmHYPvvObjwxajKsDUFTKm8Iqp292ScxLf+SPN538pXpTbu5o4NwNdHrbg
         NsYhxGbLocDg4WqtX037aiBjwte7DfrtrexoLNEL2+0es7UQbweCUSeDDcN5RHdm7lCa
         mCyo2ULwueN5WFC+w35Ciqcw7eX+Y8iUVqQjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727512697; x=1728117497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k379zOY8JpOCRdB0yzVh9VgxfCdVDSaVvSc2yhV6i0U=;
        b=JwI+2syFHRu/V7i6WcwAOlYKQ0x0Dbutmtzg/AlIIj2L2BVqCySrFpI5Ff9JtS2d/n
         fRFYj14gFkfznIuyGQW/Habrhj4kXzQXXICMKIklz7BayLGqvKX0JNuPmK1yYBXKhbL7
         yUL5xz95V2eK3v8KbIR2Gh0Tvdyy+6qOf1uxJvu78x17X8f5dkzE6SbOgomU8bzw97mF
         BtOOFDyn0LVQh5DQhp7o4MgNOldV2oZxEGgT3Of6oipNSTq9WwFytuKREkmU1v2iSvmN
         a4MenfMO7Oyprz8KTDPcCxSfyoXTk7oJ1Hevf+hU9iDa8GY/1UF/CowDj+JwORwO6+5a
         JUVw==
X-Forwarded-Encrypted: i=1; AJvYcCWFwljg5906uLPfzcXJxZzaos++R/qgaZtqBaQmwKjrcSzfRVTixT4/NxZpshu9/zXvRyIBJxKdX5k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7XJFKNvD+T95DTrcaUHOMVhjNXtfAqppiKQfJHuGaEMipG2Wc
	VZMcZTX7Jba1e3Q4Q2U54SS5AFg8CqAzJmJGVO7HCUPkY7TqvrlMu2RLRsuMOew=
X-Google-Smtp-Source: AGHT+IHCyQ8skwu32yu2SwDHwvsHGmAVmHkmWH0xMp/ynee+PdhG3tyDaW/28q4Wvdxhu/O3lEXDmQ==
X-Received: by 2002:adf:fa88:0:b0:37c:cce6:997d with SMTP id ffacd0b85a97d-37cd5a8c952mr5708720f8f.20.1727512697418;
        Sat, 28 Sep 2024 01:38:17 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-54-102-102.retail.telecomitalia.it. [79.54.102.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2947a48sm223679466b.118.2024.09.28.01.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Sep 2024 01:38:17 -0700 (PDT)
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
Subject: [PATCH 2/6] clk: imx: pll14xx: support spread spectrum clock generation
Date: Sat, 28 Sep 2024 10:37:50 +0200
Message-ID: <20240928083804.1073942-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240928083804.1073942-1-dario.binacchi@amarulasolutions.com>
References: <20240928083804.1073942-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds support for spread spectrum clock (SSC) generation for
the pll14xxx. The addition of the "imx_clk_hw_pll14xx_ssc" macro has
minimized the number of changes required to avoid compilation errors
following the addition of the SSC setup parameter to the
"imx_dev_clk_hw_pll14xx" macro used in the files clk-imx8m{m,n,p}.c.
The change to the clk-imx8mp-audiomix.c file prevents the patch from
causing a compilation error.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/clk/imx/clk-imx8mp-audiomix.c |   2 +-
 drivers/clk/imx/clk-pll14xx.c         | 102 +++++++++++++++++++++++++-
 drivers/clk/imx/clk.h                 |  24 +++++-
 3 files changed, 124 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-imx8mp-audiomix.c
index b2cb157703c5..bfcf2975c217 100644
--- a/drivers/clk/imx/clk-imx8mp-audiomix.c
+++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
@@ -365,7 +365,7 @@ static int clk_imx8mp_audiomix_probe(struct platform_device *pdev)
 	clk_hw_data->hws[IMX8MP_CLK_AUDIOMIX_SAI_PLL_REF_SEL] = hw;
 
 	hw = imx_dev_clk_hw_pll14xx(dev, "sai_pll", "sai_pll_ref_sel",
-				    base + 0x400, &imx_1443x_pll);
+				    base + 0x400, &imx_1443x_pll, NULL);
 	if (IS_ERR(hw)) {
 		ret = PTR_ERR(hw);
 		goto err_clk_register;
diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index d63564dbb12c..76014e243a57 100644
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
 
@@ -40,6 +46,7 @@ struct clk_pll14xx {
 	enum imx_pll14xx_type		type;
 	const struct imx_pll14xx_rate_table *rate_table;
 	int rate_count;
+	struct imx_pll14xx_ssc		ssc;
 };
 
 #define to_clk_pll14xx(_hw) container_of(_hw, struct clk_pll14xx, hw)
@@ -347,6 +354,27 @@ static int clk_pll1416x_set_rate(struct clk_hw *hw, unsigned long drate,
 	return 0;
 }
 
+static void clk_pll1443x_set_sscg(struct clk_hw *hw, unsigned long parent_rate,
+				  unsigned int pdiv, unsigned int mdiv)
+{
+	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
+	struct imx_pll14xx_ssc *ssc = &pll->ssc;
+	u32 sscg_ctrl = readl_relaxed(pll->base + SSCG_CTRL);
+
+	sscg_ctrl &=
+		~(SSCG_ENABLE | MFREQ_CTL_MASK | MRAT_CTL_MASK | SEL_PF_MASK);
+	if (ssc->enable) {
+		u32 mfr = parent_rate / (ssc->mod_freq * pdiv * (1 << 5));
+		u32 mrr = (ssc->mod_rate * mdiv * (1 << 6)) / (100 * mfr);
+
+		sscg_ctrl |= SSCG_ENABLE | FIELD_PREP(MFREQ_CTL_MASK, mfr) |
+			     FIELD_PREP(MRAT_CTL_MASK, mrr) |
+			     FIELD_PREP(SEL_PF_MASK, ssc->mod_type);
+	}
+
+	writel_relaxed(sscg_ctrl, pll->base + SSCG_CTRL);
+}
+
 static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 				 unsigned long prate)
 {
@@ -368,6 +396,9 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 		writel_relaxed(FIELD_PREP(KDIV_MASK, rate.kdiv),
 			       pll->base + DIV_CTL1);
 
+		if (pll->ssc.enable)
+			clk_pll1443x_set_sscg(hw, prate, rate.pdiv, rate.mdiv);
+
 		return 0;
 	}
 
@@ -408,6 +439,9 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 	gnrl_ctl &= ~BYPASS_MASK;
 	writel_relaxed(gnrl_ctl, pll->base + GNRL_CTL);
 
+	if (pll->ssc.enable)
+		clk_pll1443x_set_sscg(hw, prate, rate.pdiv, rate.mdiv);
+
 	return 0;
 }
 
@@ -487,7 +521,8 @@ static const struct clk_ops clk_pll1443x_ops = {
 
 struct clk_hw *imx_dev_clk_hw_pll14xx(struct device *dev, const char *name,
 				const char *parent_name, void __iomem *base,
-				const struct imx_pll14xx_clk *pll_clk)
+				const struct imx_pll14xx_clk *pll_clk,
+				const struct imx_pll14xx_ssc *ssc)
 {
 	struct clk_pll14xx *pll;
 	struct clk_hw *hw;
@@ -525,6 +560,8 @@ struct clk_hw *imx_dev_clk_hw_pll14xx(struct device *dev, const char *name,
 	pll->type = pll_clk->type;
 	pll->rate_table = pll_clk->rate_table;
 	pll->rate_count = pll_clk->rate_count;
+	if (ssc)
+		memcpy(&pll->ssc, ssc, sizeof(pll->ssc));
 
 	val = readl_relaxed(pll->base + GNRL_CTL);
 	val &= ~BYPASS_MASK;
@@ -542,3 +579,66 @@ struct clk_hw *imx_dev_clk_hw_pll14xx(struct device *dev, const char *name,
 	return hw;
 }
 EXPORT_SYMBOL_GPL(imx_dev_clk_hw_pll14xx);
+
+static enum imx_pll14xx_ssc_mod_type clk_pll14xx_ssc_mode(const char *name,
+							  enum imx_pll14xx_ssc_mod_type def)
+{
+	int i;
+	struct {
+		const char *name;
+		enum imx_pll14xx_ssc_mod_type id;
+	} mod_methods[] = {
+		{ .name = "down-spread", .id = IMX_PLL14XX_SSC_DOWN_SPREAD },
+		{ .name = "up-spread", .id = IMX_PLL14XX_SSC_UP_SPREAD },
+		{ .name = "center-spread", .id = IMX_PLL14XX_SSC_CENTER_SPREAD }
+	};
+
+	for (i = 0; i < ARRAY_SIZE(mod_methods); i++) {
+		if (!strcmp(name, mod_methods[i].name))
+			return mod_methods[i].id;
+	}
+
+	return def;
+}
+
+void imx_clk_pll14xx_get_ssc_conf(struct device_node *np, int pll_id,
+				  struct imx_pll14xx_ssc *ssc)
+{
+	int i, ret, offset, num_clks;
+	u32 clk_id, clk_cell_size;
+	const char *s;
+
+	if (!ssc)
+		return;
+
+	memset(ssc, 0, sizeof(*ssc));
+
+	num_clks = of_count_phandle_with_args(np, "fsl,ssc-clocks",
+					      "#clock-cells");
+	if (num_clks <= 0)
+		return;
+
+	ret = of_property_read_u32(np, "#clock-cells", &clk_cell_size);
+	if (ret)
+		return;
+
+	for (i = 0; i < num_clks; i++) {
+		offset = i * clk_cell_size + 1;
+		of_property_read_u32_index(np, "fsl,ssc-clocks", offset,
+					   &clk_id);
+		if (clk_id != pll_id)
+			continue;
+
+		of_property_read_u32_index(np, "fsl,ssc-modfreq-hz", i,
+					   &ssc->mod_freq);
+		of_property_read_u32_index(np, "fsl,ssc-modrate-percent", i,
+					   &ssc->mod_rate);
+		if (!of_property_read_string(np, "fsl,ssc-modmethod", &s))
+			ssc->mod_type = clk_pll14xx_ssc_mode(
+				s, IMX_PLL14XX_SSC_DOWN_SPREAD);
+
+		ssc->enable = true;
+		break;
+	}
+}
+EXPORT_SYMBOL_GPL(imx_clk_pll14xx_get_ssc_conf);
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index aa5202f284f3..8cbc75480569 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -62,6 +62,19 @@ struct imx_pll14xx_rate_table {
 	unsigned int kdiv;
 };
 
+enum imx_pll14xx_ssc_mod_type {
+	IMX_PLL14XX_SSC_DOWN_SPREAD,
+	IMX_PLL14XX_SSC_UP_SPREAD,
+	IMX_PLL14XX_SSC_CENTER_SPREAD,
+};
+
+struct imx_pll14xx_ssc {
+	bool enable;
+	unsigned int mod_freq;
+	unsigned int mod_rate;
+	enum imx_pll14xx_ssc_mod_type mod_type;
+};
+
 struct imx_pll14xx_clk {
 	enum imx_pll14xx_type type;
 	const struct imx_pll14xx_rate_table *rate_table;
@@ -222,11 +235,18 @@ extern struct imx_fracn_gppll_clk imx_fracn_gppll_integer;
 	__imx_clk_hw_divider(name, parent, reg, shift, width, flags)
 
 #define imx_clk_hw_pll14xx(name, parent_name, base, pll_clk) \
-	imx_dev_clk_hw_pll14xx(NULL, name, parent_name, base, pll_clk)
+	imx_dev_clk_hw_pll14xx(NULL, name, parent_name, base, pll_clk, NULL)
+
+#define imx_clk_hw_pll14xx_ssc(name, parent_name, base, pll_clk, ssc)	\
+	imx_dev_clk_hw_pll14xx(NULL, name, parent_name, base, pll_clk, ssc)
 
 struct clk_hw *imx_dev_clk_hw_pll14xx(struct device *dev, const char *name,
 				const char *parent_name, void __iomem *base,
-				const struct imx_pll14xx_clk *pll_clk);
+				const struct imx_pll14xx_clk *pll_clk,
+				const struct imx_pll14xx_ssc *ssc);
+
+void imx_clk_pll14xx_get_ssc_conf(struct device_node *np, int pll_id,
+				  struct imx_pll14xx_ssc *ssc);
 
 struct clk_hw *imx_clk_hw_pllv1(enum imx_pllv1_type type, const char *name,
 		const char *parent, void __iomem *base);
-- 
2.43.0

