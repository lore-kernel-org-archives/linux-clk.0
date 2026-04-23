Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908FE2F2607
	for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 13:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776952261; cv=none; b=rXXey+QwIS45eFNufY+rIoHIHHjS+y2kQzgIU++gKKqr5scIMOLqgBKcNREDeSUyDkfFBDp+ZWL6bMzNxQOM4ZpI/pfiwNvQm9R4argLQt1wVZRZDQw2rVgAZV0Q1MK88bm1XaVrLtEA6nkWntUIyWD0YctNJI2/QgT7S6L0+jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776952261; c=relaxed/simple;
	bh=rJwxxdAHYTOkwC6ejBPFSKCPExyZshmx+fdptqSaa6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GaMs0sOBDM8gV+kYpjJSiTwjKmHxS2PQqcol+n5hv8jf5OOQ7hLSNg33sxKvJ2WokENJiBLK7Usk5yzwzYxuyLdDPyd6ZiW2pzPOCMdvJ5SXBTZb+sO9tNwJqpzmOmAjhKta/3qZC95uBVTkXMsJ9b1ZlegRW17VREqMlw7k4uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VbO5NOZa; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VbO5NOZa"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so65441565e9.0
        for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 06:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776952255; x=1777557055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UV076pPTBI35+Ifj/9Qen6QjnrSg3SZMeVHb6HNEkR8=;
        b=VbO5NOZa963JsQepImqgBBnZCI68GuO02nY0FbKbXrnyV3Iy3ppH/f75oT8gUo/aNK
         8Ivc1L7l/E285yBC0ZrpQLJSwPCF7TX2FkSqwi5hf+jzSip1Nbvi4SbeglGXS3QwKvaJ
         RUQggtSNlmyJyp2kJAMzU6bNuuI7oj3WYFaU1hOIdo/ianDjGvNKAmI1yxXfGkoo22/6
         YvBa1jeqNi2dZYXlKI+ZBrGaF0YIvE3T3BB8xH2Bc3ASNERO448eMzvttq4ar4MDyX4f
         6aj3v8wVx2Mb2z/Nqqnp/NyR3jz5vs6Lau8aDSdeI8/u3rIoKcWezcdRKG/YQHJZhcwV
         zKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776952255; x=1777557055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UV076pPTBI35+Ifj/9Qen6QjnrSg3SZMeVHb6HNEkR8=;
        b=nz9uSPgzKVKbzO5GepW5e6SnJ2SmpQHbDql2bx2M/WYE4ZI1UFvNJM7ijAUfbX3N3M
         714WJJNIZtQ61F3FstLJ0UcgdbUdDneBN82hcX7flLqhxr/TVnUOnpqtmYPleYgtSWlH
         9oe2NwqkjUDhimp7MyNz+oDxddoqTEPvJOSpkp7r+r1TtaFswM1f/ZXAALkR4q+q3WUm
         EHz1AwUx2CgUpGQ+LlSdB2CraPZmtiL2OYN5/Qoafnsd6e+B35S3wyaNESQ2vJqTt1QD
         DSB/R7ae7P1HndaaQriZ8wOQo7JAKZhZCwJC+iPVTaPwKcNc+wY6U2D9LWEPRAO9pu8/
         HarA==
X-Forwarded-Encrypted: i=1; AFNElJ+Co2/FVzm9ZsPmsDXPjv45/2/PNSGd286bXd3qXfxukNSzUQZqkWGIVnIa4hR65X81tzHByt/MG10=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDhwLFTu0Jd6/7sB4WebXAuXYyjTUaNVP9tPOV/9x3KEy14aud
	WvMAWzDdWT8XBcoxMwmu6vBIfCpPHD2GHeawTcYbwB0q8PEv+oZuSQ42
X-Gm-Gg: AeBDieuF/AUd8YQEddkZu80pZ2hQ0H/qsOYWQs6hcGpidGk+rZMRctq3cSTFq91IOUf
	3xEEP4fd1MsoQWfcSCHTzpLCpyu2KfO+tRD+xaLLeBpsUWndwcgT+77HNJQSNdyqfbvlFv6tmEm
	snCHwZ2A6IOYEdLagSDvDPsXApK77kF8G/4C3uU2sxr7ppAvg+sOaea5MkbTmeYE4H5lWMef1BE
	xtIZcr7KeiwuedFrWbzKnypLAmAXME9NiLKcWAVXRnt6XEwDPkYOo3E3DccSd8xgg/2yGQlVB9u
	0ii68TVYD6HOfadb78SrIHVMGE1UMzVhVgqot6lJaz3E7EEZxT6YbLxpLwaZGGIQqo9d9Sn95iu
	3kxaNTGjuPevtjRREfIVeHkrT4/ebTUY6tTZFQxk+RVUncUwAMm9XKPRTrovj3pO2OaKWEdMFWf
	LUO4WeSHtjyl2K57OFL3wRAp4GH/K96idlBO+EfgRueQMlajMwoiXXAd4YCRk=
X-Received: by 2002:a05:600c:c0d5:b0:488:c683:be89 with SMTP id 5b1f17b1804b1-488fb74dffemr301364445e9.9.1776952255226;
        Thu, 23 Apr 2026 06:50:55 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:c2c5:eec8:9509:382e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a52583fe7sm228134335e9.13.2026.04.23.06.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 06:50:54 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v6 1/3] clk: renesas: rzg2l: Add support for enabling PLLs
Date: Thu, 23 Apr 2026 14:50:45 +0100
Message-ID: <20260423135050.238400-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423135050.238400-1-biju.das.jz@bp.renesas.com>
References: <20260423135050.238400-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for enabling PLL clocks in the RZ/G3L CPG driver to turn off
some PLLs, if they are not in use(eg: PLL6, PLL7)

Introduce `is_enabled` and `enable` callbacks to handle PLL state
transitions. With the `enable` callback, PLL will be turned ON only when
the PLL consumer device is enabled; otherwise, it will remain off. Define
new macros for PLL standby and monitor registers to facilitate this
process.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v5->v6:
 * Fixed the typo in comment stanby->standby.
 * Collected the tag.
v4->v5:
 * Rebased to initial boot series.
v3->v4:
 * No change
v2->v3:
 * No change
v1->v2:
 * No change
---
 drivers/clk/renesas/rzg2l-cpg.c | 67 +++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h |  4 ++
 2 files changed, 71 insertions(+)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 910c16a369a5..f98b6eb4f501 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -58,6 +58,13 @@
 #define RZG3S_DIV_NF		GENMASK(12, 1)
 #define RZG3S_SEL_PLL		BIT(0)
 
+#define RZG3L_PLL_STBY_OFFSET(x)	(GET_REG_SAMPLL_CLK1(x) - 0x4)
+#define RZG3L_PLL_STBY_RESETB		BIT(0)
+#define RZG3L_PLL_STBY_RESETB_WEN	BIT(16)
+#define RZG3L_PLL_MON_OFFSET(x)		(GET_REG_SAMPLL_CLK1(x) + 0x8)
+#define RZG3L_PLL_MON_RESETB		BIT(0)
+#define RZG3L_PLL_MON_LOCK		BIT(4)
+
 #define CLK_ON_R(reg)		(reg)
 #define CLK_MON_R(reg)		(0x180 + (reg))
 #define CLK_RST_R(reg)		(reg)
@@ -1175,6 +1182,63 @@ rzg2l_cpg_pll_clk_register(const struct cpg_core_clk *core,
 	return pll_clk->hw.clk;
 }
 
+static int rzg3l_cpg_pll_clk_is_enabled(struct clk_hw *hw)
+{
+	struct pll_clk *pll_clk = to_pll(hw);
+	struct rzg2l_cpg_priv *priv = pll_clk->priv;
+	u32 val = readl(priv->base + RZG3L_PLL_MON_OFFSET(pll_clk->conf));
+	u32 mon_val = RZG3L_PLL_MON_RESETB | RZG3L_PLL_MON_LOCK;
+
+	/* Ensure both RESETB and LOCK bits are set */
+	return (mon_val == (val & mon_val));
+}
+
+static int rzg3l_cpg_pll_clk_endisable(struct clk_hw *hw, bool enable)
+{
+	struct pll_clk *pll_clk = to_pll(hw);
+	struct rzg2l_cpg_priv *priv = pll_clk->priv;
+	u32 stby_offset, mon_offset;
+	u32 val, mon_val;
+	int ret;
+
+	stby_offset = RZG3L_PLL_STBY_OFFSET(pll_clk->conf);
+	mon_offset = RZG3L_PLL_MON_OFFSET(pll_clk->conf);
+
+	if (enable) {
+		val = RZG3L_PLL_STBY_RESETB_WEN | RZG3L_PLL_STBY_RESETB;
+		mon_val = RZG3L_PLL_MON_RESETB | RZG3L_PLL_MON_LOCK;
+	} else {
+		val = RZG3L_PLL_STBY_RESETB_WEN;
+		mon_val = 0;
+	}
+
+	writel(val, priv->base + stby_offset);
+
+	/* ensure PLL is in normal/standby mode */
+	ret = readl_poll_timeout_atomic(priv->base + mon_offset, val, mon_val ==
+					(val & (RZG3L_PLL_MON_RESETB | RZG3L_PLL_MON_LOCK)),
+					10, 100);
+	if (ret)
+		dev_err(priv->dev, "Failed to %s PLL 0x%x/%pC\n", enable ?
+			"enable" : "disable", stby_offset, hw->clk);
+
+	return ret;
+}
+
+static int rzg3l_cpg_pll_clk_enable(struct clk_hw *hw)
+{
+	if (rzg3l_cpg_pll_clk_is_enabled(hw))
+		return 0;
+
+	return rzg3l_cpg_pll_clk_endisable(hw, true);
+}
+
+static const struct clk_ops rzg3l_cpg_pll_ops = {
+	.is_enabled = rzg3l_cpg_pll_clk_is_enabled,
+	.enable = rzg3l_cpg_pll_clk_enable,
+	.recalc_rate = rzg3s_cpg_pll_clk_recalc_rate,
+};
+
 static struct clk
 *rzg2l_cpg_clk_src_twocell_get(struct of_phandle_args *clkspec,
 			       void *data)
@@ -1258,6 +1322,9 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
 	case CLK_TYPE_SAM_PLL:
 		clk = rzg2l_cpg_pll_clk_register(core, priv, &rzg2l_cpg_pll_ops);
 		break;
+	case CLK_TYPE_G3L_PLL:
+		clk = rzg2l_cpg_pll_clk_register(core, priv, &rzg3l_cpg_pll_ops);
+		break;
 	case CLK_TYPE_G3S_PLL:
 		clk = rzg2l_cpg_pll_clk_register(core, priv, &rzg3s_cpg_pll_ops);
 		break;
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 10baf9e71a6e..ebd612d117c0 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -123,6 +123,7 @@ enum clk_types {
 	CLK_TYPE_IN,		/* External Clock Input */
 	CLK_TYPE_FF,		/* Fixed Factor Clock */
 	CLK_TYPE_SAM_PLL,
+	CLK_TYPE_G3L_PLL,
 	CLK_TYPE_G3S_PLL,
 
 	/* Clock with divider */
@@ -152,6 +153,9 @@ enum clk_types {
 	DEF_TYPE(_name, _id, _type, .parent = _parent)
 #define DEF_SAMPLL(_name, _id, _parent, _conf) \
 	DEF_TYPE(_name, _id, CLK_TYPE_SAM_PLL, .parent = _parent, .conf = _conf)
+#define DEF_G3L_PLL(_name, _id, _parent, _conf, _default_rate) \
+	DEF_TYPE(_name, _id, CLK_TYPE_G3L_PLL, .parent = _parent, .conf = _conf, \
+		 .default_rate = _default_rate)
 #define DEF_G3S_PLL(_name, _id, _parent, _conf, _default_rate) \
 	DEF_TYPE(_name, _id, CLK_TYPE_G3S_PLL, .parent = _parent, .conf = _conf, \
 		 .default_rate = _default_rate)
-- 
2.43.0

