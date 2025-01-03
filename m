Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554B71FAC25
	for <linux-clk@vger.kernel.org>; Fri,  3 Jan 2025 16:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735922964; cv=none; b=ics3NNq70Yq/+GLLEQysDZ/jxetL2JhfeP1UPZKgARwwCHuW0r1o/cmp9KYImp7SriZmZbyJX/RQoBQjGwOvbf4DtdBx47taY3SaORbo6/JcYH53w06FTZbQCgjSaLvXsx0nOcoMXcmzTV5TUq8PUuBSQqXmfONjR0IOqooQMIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735922964; c=relaxed/simple;
	bh=uVe044tSzn+iBY3oWxbYQnnkPgvXI2BHBiYgjVWZHnk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VANiybmlA9le0wnQTB67ek878D03rr8FKfYXjryQXa53aegeSzk+UHoCkxuT94Qtmfa6oe3Y6HT/fSAkI249j8wvtFda0tgEq/aoTocQCFT/o8iH1KGJD2wIX1yPf/vG4AI1VyA47KEgxHmimFZVdd5r0sG0j2zUV6rFBS51c4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=WbgHWyey; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="WbgHWyey"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aa68b513abcso2309745966b.0
        for <linux-clk@vger.kernel.org>; Fri, 03 Jan 2025 08:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1735922961; x=1736527761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f+fdv+kWy/ao4qfObA3tHqnlkpS/1mTWNa+BlMy47LU=;
        b=WbgHWyeyT9v5N8AtFrN7XhXaO1Ls48XxM8I78PDcS13oziMeEBXZRDR/3NpfTfPl0T
         dqoFRcBFvG10Mf7291A4pw9Wux0sUz1vZBEJxf8j3QlI3/OG96RdWCF/e7WgPymk0ej8
         7G/LEO5mCubNEWeAeuau4LlLCbmT/RpjiPE19WGKbF4GDUgTrX5ZfSAEf+pN30Gnt8FR
         cg4tsgaoGjO3gpq2ik2a5WayrZTLZ3aJmsmQAiBAQnOHbAEnsZ3wV+vBCZqz2lvkeRnw
         MwhTd3jeY94Yn6CG8TsSm+tS2x/kVx+4NolZMzFIcKvL8bsjcW7KBlHwt5knleMaSEPR
         cZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735922961; x=1736527761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f+fdv+kWy/ao4qfObA3tHqnlkpS/1mTWNa+BlMy47LU=;
        b=iFRrd5a1D5ucw8Yyc1uqwhKdSsXdi9y1rSy6BupH++5ZIhfBpe1Fmyr+hOHmxLHnhK
         aRmEkBsYs0yqnJHjjNAz4/5HvMJxWE+EMaxCBc+WjywgonWBOpVWfvxYh2c7827GmM55
         Rs3EsN8T91HILWaqrbRILl5uZxOGYPFU5iEfu+ashld9sSKxo8PzcI0O1g5ifPf1hb0Z
         GWRtqFrI9KnIJS9ymSk3COTfMY6lXb5zbqkOjqUoeSRH0vGdb2BiWEiyl846tSsxEUEO
         3MVtRq9/YJKDUcbq+AmPi6P+mzN2FT3CWM3cWgnJQrQepF1ngVXbnrWeCXKxykMe+m6n
         I++w==
X-Forwarded-Encrypted: i=1; AJvYcCWt628X6jtI8CrWVXBc6XEQXQKOtDHecerwpIISKS25nNTz8nJaphciz138r1JHsrA847p2tXU6TuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjRQ4PWjcisCIbfyR70FpxNET9cy9+KRSQtyat6fL/KWSiQrbc
	kaDM4KKibp7pqL5SKbIpSqD9pJDEyFrwkuT7NSJ90byZcVnd5a76EawqQMhQgq8=
X-Gm-Gg: ASbGnct3Kr+qi4kW8CnuDyBSfrucWQhv2uvFl7D6Ydo/EKhs3pAifgAiwgMDhcTsPs6
	lTTmqjoWrV59Bl7WNhmBMSyVsTyq0mqKgVpbX/HD6fO9lIFL8aqbf1FcmJahWEL4Qn8zWK1Y1Js
	1hgUS3IZyqnYYS9Dchl7K03FTTWy4KGtySSXWvVRbTG65vLuRTPukCCf+dQD66r/vchD6N5wflL
	Ehf1YaYRRHALhpPkGbK8hnkOIZh9x08JRzA5kFFTlB8pJ2uvj1AcWWLWmv3TnwZ6CwfZdGg1ZgE
	j/+pZPfpIj4=
X-Google-Smtp-Source: AGHT+IFg0hLfHcpxcKd+nJuxWf8zDpM3DGdyBuqGxtSTywmzbjqc02ILv+2l6LzMZ0B0UQkQZ3JVww==
X-Received: by 2002:a17:906:4fd5:b0:aa6:b473:ea4c with SMTP id a640c23a62f3a-aac28748b3dmr4872244066b.10.1735922960625;
        Fri, 03 Jan 2025 08:49:20 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe4971sm1937601466b.107.2025.01.03.08.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 08:49:20 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH] clk: renesas: r8a08g045: Check the source of the CPU PLL settings
Date: Fri,  3 Jan 2025 18:48:34 +0200
Message-ID: <20250103164834.1778090-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

On the RZ/G3S SoC, the CPU PLL settings can be set and retrieved through
the CPG_PLL1_CLK1 and CPG_PLL1_CLK2 registers. However, these settings are
applied only when CPG_PLL1_SETTING.SEL_PLL1 is set to 0. Otherwise, the
CPU PLL operates at the default frequency of 1.1 GHz. This patch adds
support to the PLL driver to return the 1.1 GHz frequency when the CPU PLL
is configured with the default frequency.

Fixes: 01eabef547e6 ("clk: renesas: rzg2l: Add support for RZ/G3S PLL")
Fixes: de60a3ebe410 ("clk: renesas: Add minimal boot support for RZ/G3S SoC")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g045-cpg.c |  5 +++--
 drivers/clk/renesas/rzg2l-cpg.c     |  8 ++++++++
 drivers/clk/renesas/rzg2l-cpg.h     | 10 +++++++---
 3 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index 0e7e3bf05b52..df962d88c66e 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -51,7 +51,7 @@
 #define G3S_SEL_SDHI2		SEL_PLL_PACK(G3S_CPG_SDHI_DSEL, 8, 2)
 
 /* PLL 1/4/6 configuration registers macro. */
-#define G3S_PLL146_CONF(clk1, clk2)	((clk1) << 22 | (clk2) << 12)
+#define G3S_PLL146_CONF(clk1, clk2, settings)	((clk1) << 22 | (clk2) << 12 | (settings))
 
 #define DEF_G3S_MUX(_name, _id, _conf, _parent_names, _mux_flags, _clk_flags) \
 	DEF_TYPE(_name, _id, CLK_TYPE_MUX, .conf = (_conf), \
@@ -134,7 +134,8 @@ static const struct cpg_core_clk r9a08g045_core_clks[] __initconst = {
 
 	/* Internal Core Clocks */
 	DEF_FIXED(".osc_div1000", CLK_OSC_DIV1000, CLK_EXTAL, 1, 1000),
-	DEF_G3S_PLL(".pll1", CLK_PLL1, CLK_EXTAL, G3S_PLL146_CONF(0x4, 0x8)),
+	DEF_G3S_PLL(".pll1", CLK_PLL1, CLK_EXTAL, G3S_PLL146_CONF(0x4, 0x8, 0x100),
+		    1100000000UL),
 	DEF_FIXED(".pll2", CLK_PLL2, CLK_EXTAL, 200, 3),
 	DEF_FIXED(".pll3", CLK_PLL3, CLK_EXTAL, 200, 3),
 	DEF_FIXED(".pll4", CLK_PLL4, CLK_EXTAL, 100, 3),
diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index ddf722ca79eb..b52a93973b11 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -51,6 +51,7 @@
 #define RZG3S_DIV_M		GENMASK(25, 22)
 #define RZG3S_DIV_NI		GENMASK(21, 13)
 #define RZG3S_DIV_NF		GENMASK(12, 1)
+#define RZG3S_SEL_PLL		BIT(0)
 
 #define CLK_ON_R(reg)		(reg)
 #define CLK_MON_R(reg)		(0x180 + (reg))
@@ -60,6 +61,7 @@
 #define GET_REG_OFFSET(val)		((val >> 20) & 0xfff)
 #define GET_REG_SAMPLL_CLK1(val)	((val >> 22) & 0xfff)
 #define GET_REG_SAMPLL_CLK2(val)	((val >> 12) & 0xfff)
+#define GET_REG_SAMPLL_SETTINGS(val)	((val) & 0xfff)
 
 #define CPG_WEN_BIT		BIT(16)
 
@@ -943,6 +945,7 @@ rzg2l_cpg_sipll5_register(const struct cpg_core_clk *core,
 
 struct pll_clk {
 	struct clk_hw hw;
+	unsigned long default_rate;
 	unsigned int conf;
 	unsigned int type;
 	void __iomem *base;
@@ -986,6 +989,10 @@ static unsigned long rzg3s_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
 	if (pll_clk->type != CLK_TYPE_G3S_PLL)
 		return parent_rate;
 
+	val = readl(priv->base + GET_REG_SAMPLL_SETTINGS(pll_clk->conf));
+	if (val & RZG3S_SEL_PLL)
+		return pll_clk->default_rate;
+
 	val = readl(priv->base + GET_REG_SAMPLL_CLK1(pll_clk->conf));
 
 	pr = 1 << FIELD_GET(RZG3S_DIV_P, val);
@@ -1038,6 +1045,7 @@ rzg2l_cpg_pll_clk_register(const struct cpg_core_clk *core,
 	pll_clk->base = priv->base;
 	pll_clk->priv = priv;
 	pll_clk->type = core->type;
+	pll_clk->default_rate = core->default_rate;
 
 	ret = devm_clk_hw_register(dev, &pll_clk->hw);
 	if (ret)
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 881a89b5a710..b74c94a16986 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -102,7 +102,10 @@ struct cpg_core_clk {
 	const struct clk_div_table *dtable;
 	const u32 *mtable;
 	const unsigned long invalid_rate;
-	const unsigned long max_rate;
+	union {
+		const unsigned long max_rate;
+		const unsigned long default_rate;
+	};
 	const char * const *parent_names;
 	notifier_fn_t notifier;
 	u32 flag;
@@ -144,8 +147,9 @@ enum clk_types {
 	DEF_TYPE(_name, _id, _type, .parent = _parent)
 #define DEF_SAMPLL(_name, _id, _parent, _conf) \
 	DEF_TYPE(_name, _id, CLK_TYPE_SAM_PLL, .parent = _parent, .conf = _conf)
-#define DEF_G3S_PLL(_name, _id, _parent, _conf) \
-	DEF_TYPE(_name, _id, CLK_TYPE_G3S_PLL, .parent = _parent, .conf = _conf)
+#define DEF_G3S_PLL(_name, _id, _parent, _conf, _default_rate) \
+	DEF_TYPE(_name, _id, CLK_TYPE_G3S_PLL, .parent = _parent, .conf = _conf, \
+		 .default_rate = _default_rate)
 #define DEF_INPUT(_name, _id) \
 	DEF_TYPE(_name, _id, CLK_TYPE_IN)
 #define DEF_FIXED(_name, _id, _parent, _mult, _div) \
-- 
2.43.0

