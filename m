Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2D6394495
	for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 11:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774523216; cv=none; b=VqSEXp68zMz97zabUokHW8dbQMUR8BsPQu3k+Gh8+GkKouo1Owadl70FQl+dpMekQrHcCI9joEMok7pI90KzGGC52P6D7l2bqOo5GNc7HTYPcISZ0soDOJLGQ/3dL7bNajNZursspdTwQV1cB0utFOtLvAlHcYpGDqP5NKLlhSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774523216; c=relaxed/simple;
	bh=co7rXgDnT/w4Ap6PiwmZi0IGFiRdpgCUmdEpRRfs0hY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OA9cotY6BGC7JEldVW6Hz6tRg0n9M1dCjhhM/9gXHr9xx/GW54r7RIYwEgDs2V89wbY66nyQkd/+TEoGeJaSLNkM9rdlbLl/BWb7Uk4LHL8Q2IIXGkMq0J6z/3XmfwJzFYQJUCoZ16UVLeZ/fcld3DD2yJbDLHdXtzYcJQD9Rwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vllvi5eL; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vllvi5eL"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43b871dd06eso478109f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 04:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774523213; x=1775128013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmJLD6yDl9DwW4fpRodfTgAD4yfVC04s+fwYnNHcIfc=;
        b=Vllvi5eLUgSZw1SWblAVVQuDFYrCSdpSXOTzVPgm4Ovepo0yBq5FkB97mX83mmq826
         P5Zlo16q4nDp+vTW4L5MeGKrukQDP75KHPwqzpn/1iqRCCM99u/Tc477Caq1YyN9pH9J
         NIzM1NkklcHlqTK+pdQWemNXlZk/CD7Eww+wCOfGWJLUnmey4wwFSns8MOFme6Evw2qQ
         ZAHTkkYJElCRMULeC1P8U/j2bsYjHXN22KnsRIUBYKYlNiwcv5vzHG3sw53NxoeKjSIg
         MWRtsA7stOWMDP2vGC1jTrv0GfXrMvJID0wm+z4s6FTUsGN6HGqIkzq+bMp2mS5qa42K
         59YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774523213; x=1775128013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mmJLD6yDl9DwW4fpRodfTgAD4yfVC04s+fwYnNHcIfc=;
        b=bn4s5U/RzfNSrwukQJRndflZYK0kaZZNaDijf6lDTeT38PYTXBXlcPtXeGT6Nqy2/t
         Nsy+xiqd6RAftdOjaavuiXwPEgh3lngLNV+3MabIpDUCAYHBfyiSeQNdiatpkaNFn0ox
         l+LCH6KaOglKCYlFlFfpQM3pzF5BpqnDBo51T9wzR1Fa6aUEPkdpqjgIqGFQHBSlNtFw
         zPDDTwua406bEk3+NWL01J0d0+zfpOJ1jeQs6SvHPaZDmhqofrtNobiXaqS141/sQgJU
         od0Q33yOv5RzY/3dOo2/z8h+wZet67q5lK/JgkBjvxikq56w4+o3YYYQTHUw9so1QdKC
         oGuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvNaRUYR5U7ByX+90mSMLrFyn76qfTfuGpO6PGACr+8nXVp19G8cxZp7m3uEcQjVut+6d3WyTLdKI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEu+/MyaOesxk3Es6r7F8Ni5ecOp7oXnrvsgjkHoo0OsdI+q+y
	czFaCkUPWUTrQlm7XMri/5kZQBAcuhxgnTm6ig4ag6iBUM3P+1YbLivb
X-Gm-Gg: ATEYQzy2wInODgA/wYDhkFjKvBQAtBx1tbGi+RAx5Qb7r9UIxSWwYGdkONb4ZFc34qG
	DvkOzOIvYQW/Od3UQ/31DG1Ad7e/x4qJAidfOl4SByrrgbocb9JS0KwxY9lLi35POE+LMElF3MX
	0o4KIjQYppR8x4B37fUeGFFhI0NfN1Sy5O3hHbkJ0z3UTMwcop8VsrTn3fGvu7KYqJpdP5xvJ8L
	RPjElh9fNKWfQTSG7XKBbMxFq7zTUK/yELu6ODsB26ZDQ5nSByST5MXp/jwW8bSFyLaQmiEQ0Wj
	QNjjmWBqdIrPFKiWu7r1zGV0jDHqGjqXf+ggIVlAY6y4dtPA2QRYToruXeySJ8LYm2SnbQDYyWJ
	OV9hDn3iwHgAPggmzBehZtr/JAy1ue/6zh60vClvMMHtsTWP0NZWNAhAadA6scKzCXxzzvWje3c
	XzQi0F9rZVUbcwEITCdqgyLN6h3swlAC5vbBdYRzGrUzYYA3l6
X-Received: by 2002:a05:6000:4287:b0:43b:634d:1a9e with SMTP id ffacd0b85a97d-43b889c505fmr10874901f8f.15.1774523213290;
        Thu, 26 Mar 2026 04:06:53 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:377f:9a3e:6c94:560d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9194311asm8626084f8f.10.2026.03.26.04.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 04:06:52 -0700 (PDT)
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
Subject: [PATCH v5 2/4] clk: renesas: rzg2l: Add support for enabling PLLs
Date: Thu, 26 Mar 2026 11:06:36 +0000
Message-ID: <20260326110648.29389-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326110648.29389-1-biju.das.jz@bp.renesas.com>
References: <20260326110648.29389-1-biju.das.jz@bp.renesas.com>
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
---
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
index 910c16a369a5..e9a1ae80fa29 100644
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
+	/* ensure PLL is in normal/stanby mode */
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

