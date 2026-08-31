Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B48E4B146D
	for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 15:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788191296; cv=none; b=OJjswHairsERxYAReUQt9D9TeapIccsTTnGgeXs/IvGi9z0CNKInAb6Fp9ZYvL7QEMo2esqZH3NmXbTr7cI5TiNYYCe8frCt9JuH7IG1aKNu2uURh6PO/goh8eQ1OPcoKTNq+pOYXRPFEtmronnIKXzAa2kJ/yEHuH/ECpfb/7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788191296; c=relaxed/simple;
	bh=nlCxMmVRBCR3ngQYUpa889Txd4ozU/oUdzTV9qa2+co=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mSK6QM/MKkRMtpIW71NDyL76QxeF1c68BKDbc/cpjFhdcpFAD8dUY2GhhyzYRHLFMc4zPSdheHFiMbgEe4w/f6Njyy/PAP05BptKcxRdy5uQH2NKi0veceokk3FmX2yqDgb5ful15v6EhVUGRGDsaOHG8Widj3LH2QLcNGhEMZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Qw646jz+; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Qw646jz+"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso33978545e9.1
        for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 08:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788191293; x=1788796093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N/h+0+I7fXQ52AgonO29/UsUwGiBzhMLYBL0Aiheh2c=;
        b=Qw646jz+crJXQ6yvrlj4JposB8/HeHVHfrDVxra1ACErzPvEHogqmurN0nYWpxFTe5
         eMPNOaCN1ODkhN0rYTPGiMDfe5/K32YrvGc2Qdf3xPLc9ILkea5BTBaidAcrJe42w6c8
         qCSdl/sUehz+j36hFGbtwJEi1n3/+MTYTdffM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788191293; x=1788796093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N/h+0+I7fXQ52AgonO29/UsUwGiBzhMLYBL0Aiheh2c=;
        b=akwdxL9h/6AzEaNfP/09wxxn3wJeiPA7IfAqjPEvvg02jp2k3VKX573Zk2NuUVcYav
         m3RJw4o6sf0OYp1LpvMqgC8r8z5uwEBmOxWJ3dK8WT0nfHnlLRqgDQStHmwe18hfVhuO
         GXSol1dokLecOS4k2bIyMTcaE5Qkgp98ISPAxbyaV9cK0wp+fUERcCmp3HLlsih9ybdy
         2Bf/PH5TAVSf/HLd5G3DAORWH8BBb6RXhUgKbKD8lbl1BgO1DVO6VfxTOt02n2ITbWjB
         MN8xj+r5Wfg3abGHMpYRvc8zoRBGCqS9stOMYZTy8SYtk/elpDeD3i3ndj2dXYJ8LIxw
         m4gQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp0l81Vwo6M8OSXo0ZUiRF7WJMCdqrapHU3icbOWZDGi3IoYPRkdA6D/CQNEz/pWW5km35jDGfV+ew=@vger.kernel.org
X-Gm-Message-State: AFuF++kBcPmCFaE1JoQwYvtDaNRF2yTmyyXtaImo06cj7rUUsGfcWaCM
	gU7Mh8nbuqP1zQZ4BZDNXSSbBquqPBOiMNDc0i3xl4iAUO4vMg86bHD8xEyGE3w+ZhU=
X-Gm-Gg: AR+sD10n8MWgAbTSWlk32kktLrMrWlRjcs89Q1F3TgOya2Kn3UL9GINTBOcol1D03/H
	WWnGkpvr1XirjhrZdsCBKhurvjw01aIJR/YSJbIlQXlhszTNCj2TA+w8IgZi9khpYfS9KLYoiS0
	g48DM4RF+3MD1aH4MVTTbWVp+FgIJST7pIi44vT/u1gpr8kOZtduYR3Gy6x3jqLlwxjvMo7m4d/
	mebybK7FA7TBUryo7tjJOtFIHvqfhXk8a/96QfYF/9a3razbnzJeCcQ37aksVL0kurrcSJsSydG
	YysrKl3SUaqOqYaAai6+loo2ZAbBPRct/Vy2W/0Y9i/rSZz/uBopvDyVZMX9rWSTVm5ygjxv9nb
	h/ax9WXjTSTsJgp3y5dv/b9POtqGWRY67VLstaffNbhsUGIoPUWvM5ySxAzLSAh3zGawwu84CBZ
	2xXwzfu6Sc8A3g6EV7tbLZLK+WlgBfxpZ++o6MoJYTdW5Ftby5I2V4+hijjHTBp5bKTU9Iieja4
	AKCXGus7OWuawX9DYkBnIGLqR4Ijv6nSzp1oTA9dDLLMu09dtLuaH9g8zy0jaP8CGdKMY/Mlz6r
	12LToJOmIWDN7ydiuP4yucKlr/VWxvAqVitSc4EoGdLgLvhfAt3w0kWkS7B/
X-Received: by 2002:a05:600c:4e01:b0:49c:cedc:768a with SMTP id 5b1f17b1804b1-49ccedc76a1mr324658675e9.16.1788191293295;
        Mon, 31 Aug 2026 08:48:13 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-87-9-102-148.retail.telecomitalia.it. [87.9.102.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9269f1b6sm220191845e9.4.2026.08.31.08.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:48:11 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v10 1/1] clk: imx: pll14xx: support spread spectrum clock generation
Date: Mon, 31 Aug 2026 17:27:01 +0200
Message-ID: <20260831154752.15401-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831154752.15401-1-dario.binacchi@amarulasolutions.com>
References: <20260831154752.15401-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for spread spectrum clock (SSC) generation to the pll14xx
driver.

Tested on the video PLL of i.MX8MN and i.MX8MP based boards.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v10:
- Drop 'Reviewed-by' tag of Peng Fan.
- Adapt the driver to the new infrastructure. Implement the
  set_spread_spectrum() and get the modulation parameters from
  struct clk_spread_spectrum.

Changes in v9:
- Add 'Reviewed-by' tag of Peng Fan.

 drivers/clk/imx/clk-pll14xx.c | 58 +++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index b6f1cc9f5700..27a637847f57 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -5,6 +5,7 @@
 
 #define pr_fmt(fmt) "pll14xx: " fmt
 
+#include <dt-bindings/clock/clock.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/clk-provider.h>
@@ -22,6 +23,8 @@
 #define GNRL_CTL	0x0
 #define DIV_CTL0	0x4
 #define DIV_CTL1	0x8
+#define SSCG_CTRL	0xc
+
 #define LOCK_STATUS	BIT(31)
 #define LOCK_SEL_MASK	BIT(29)
 #define CLKE_MASK	BIT(11)
@@ -33,6 +36,13 @@
 #define KDIV_MASK	GENMASK(15, 0)
 #define KDIV_MIN	SHRT_MIN
 #define KDIV_MAX	SHRT_MAX
+#define SSCG_ENABLE	BIT(31)
+#define MFREQ_CTL_MASK	GENMASK(19, 12)
+#define MRAT_CTL_MASK	GENMASK(9, 4)
+#define SEL_PF_DOWN_SPREAD	0
+#define SEL_PF_UP_SPREAD	1
+#define SEL_PF_CENTER_SPREAD	2
+#define SEL_PF_MASK	GENMASK(1, 0)
 
 #define LOCK_TIMEOUT_US		10000
 
@@ -44,6 +54,7 @@ struct clk_pll14xx {
 	int rate_count;
 	s16 delta_k;
 	spinlock_t lock;
+	struct clk_spread_spectrum ss_conf;
 };
 
 #define to_clk_pll14xx(_hw) container_of(_hw, struct clk_pll14xx, hw)
@@ -366,6 +377,37 @@ static int clk_pll1416x_set_rate(struct clk_hw *hw, unsigned long drate,
 	return 0;
 }
 
+static void __clk_pll1443x_set_spread_spectrum(struct clk_hw *hw,
+					       unsigned long parent_rate,
+					       unsigned int pdiv,
+					       unsigned int mdiv)
+{
+	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
+	struct clk_spread_spectrum *conf = &pll->ss_conf;
+	u32 sscg_ctrl, mfr, mrr, sel_pf;
+
+	if (conf->method == CLK_SSC_CENTER_SPREAD)
+		sel_pf = SEL_PF_CENTER_SPREAD;
+	else if (conf->method == CLK_SSC_UP_SPREAD)
+		sel_pf = SEL_PF_UP_SPREAD;
+	else if (conf->method == CLK_SSC_DOWN_SPREAD)
+		sel_pf = SEL_PF_DOWN_SPREAD;
+	else
+		return;
+
+	sscg_ctrl = readl_relaxed(pll->base + SSCG_CTRL);
+	sscg_ctrl &= ~(SSCG_ENABLE | MFREQ_CTL_MASK | MRAT_CTL_MASK | SEL_PF_MASK);
+
+	mfr = parent_rate / (conf->modfreq_hz * pdiv * BIT(5));
+	mrr = (conf->spread_bp * mdiv * BIT(6)) / (10000 * mfr);
+
+	sscg_ctrl |= SSCG_ENABLE | FIELD_PREP(MFREQ_CTL_MASK, mfr) |
+		FIELD_PREP(MRAT_CTL_MASK, mrr) |
+		FIELD_PREP(SEL_PF_MASK, sel_pf);
+
+	writel_relaxed(sscg_ctrl, pll->base + SSCG_CTRL);
+}
+
 static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 				 unsigned long prate)
 {
@@ -390,6 +432,9 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 		writel_relaxed(FIELD_PREP(KDIV_MASK, rate.kdiv),
 			       pll->base + DIV_CTL1);
 
+		__clk_pll1443x_set_spread_spectrum(hw, prate, rate.pdiv,
+						   rate.mdiv);
+
 		spin_unlock_irqrestore(&pll->lock, flags);
 
 		return 0;
@@ -411,6 +456,8 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 
 	writel_relaxed(FIELD_PREP(KDIV_MASK, rate.kdiv), pll->base + DIV_CTL1);
 
+	__clk_pll1443x_set_spread_spectrum(hw, prate, rate.pdiv, rate.mdiv);
+
 	spin_unlock_irqrestore(&pll->lock, flags);
 
 	/*
@@ -437,6 +484,16 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 	return 0;
 }
 
+static int clk_pll1443x_set_spread_spectrum(struct clk_hw *hw,
+					    const struct clk_spread_spectrum *ss_conf)
+{
+	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
+
+	memcpy(&pll->ss_conf, ss_conf, sizeof(pll->ss_conf));
+
+	return 0;
+}
+
 static int clk_pll14xx_prepare(struct clk_hw *hw)
 {
 	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
@@ -509,6 +566,7 @@ static const struct clk_ops clk_pll1443x_ops = {
 	.recalc_rate	= clk_pll14xx_recalc_rate,
 	.determine_rate = clk_pll1443x_determine_rate,
 	.set_rate	= clk_pll1443x_set_rate,
+	.set_spread_spectrum = clk_pll1443x_set_spread_spectrum,
 };
 
 struct clk_hw *imx_dev_clk_hw_pll14xx(struct device *dev, const char *name,
-- 
2.43.0

