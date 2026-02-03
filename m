Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D135A32F757
	for <linux-clk@vger.kernel.org>; Tue,  3 Feb 2026 11:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770116549; cv=none; b=Kw8orSXzTaGFHh6aXLs6frPs0w78r2Q03QxJyoYLQMYpEWAJmFKBvDxBOlmfHMaZTODvrj0S5y9Gp9CfFxCGLtTHmqmsSWbYh1QCS32Yvb22AMPkiL2+AsLHiOyNm+7LN2qXpULKnILvYf+58Cmen/jVTbX4DLW23NoK3C0er5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770116549; c=relaxed/simple;
	bh=nEqdBKz4VECTzqwClXZN5WqVryPx/I7ErTRAmroET1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gAVzMDZhvHbUYMKueb4skozsR6H0tAzRZ9mO6mGAei8GnbYyAaGcMrvlFTgbAaA2ZBq/QqncebhrAhw7ZCs+yuHkXrIkZdHMI8hHu7FYYiEowy+zGMwQM68n7+VGbHNvQK3RnHr1oaZ5PryE7uOGMhjTf/8wtVjle5ngIMV4TeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lKnhzpF2; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lKnhzpF2"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4801ea9bafdso24250355e9.3
        for <linux-clk@vger.kernel.org>; Tue, 03 Feb 2026 03:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770116546; x=1770721346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wOhOjnDFHcw5y9HMijd81gXYk/b2guKR+KyKpVfgXFM=;
        b=lKnhzpF2eD5JMzcFRZM05etRyz4jMX5EmcmFM44YcPKfWKTMjj/zYqB+ileTnTVHSY
         PTX8rdf50C9Aiuj+17BUnBTTYsvs9S6COXuWgZCOpC8BOuL/OroJpCyjdMtFvQEHb5Tb
         fiBR2bPpUEbDaMXsp74otk+p6fr39h26sKTjIOFAJXO3G1/p2QW4zGGhbpCfiiwN8GRQ
         owVhNC0KbcAtmQ47+aLRRI+3HD7b4ChX2ByiuLiHfUn2AntRrD5r2jaeTxnpn5QEub0Z
         z2T7Hy0MBqTBS+nmHo/CFntCfnVJnVoVGir4vRH3W4iaYwjXWUth+9JQDB//DBvt9Rzb
         zclw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770116546; x=1770721346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wOhOjnDFHcw5y9HMijd81gXYk/b2guKR+KyKpVfgXFM=;
        b=oRWsEQsNKQ9EstEl8KSCt1JUoRfuqp8r57Zd9l6MlsEVg9DSiNAfBhhJDq/lJe4T0J
         kPS99e1G+lTYg0Vgwa1VaZSuYZ1oQ66qlvLtD6dvNf3rq0upxL4z5H2G54jQKr7hkfJW
         X2mP+ZvM6kCOfkjgw29xW8xk3Skj18eNdri75BPFNMLVtlYIOCi0dn77RlhKUGgI2f1S
         gKor9o7eRu3bpnxPHlNHnGoTj7mgdGjlkclB4oJay78RmDprYG+fNvxaEOAFX4RMU7oh
         uhwJwZ8ZfKz8PRl0hPk5qP+PciJr/SrX6ivDVlqdI0CH+r4BI02TEei1mL5AVTLsC99x
         E8/A==
X-Forwarded-Encrypted: i=1; AJvYcCVeF0TDaa8tqerEDZHk/2uZ1QuAxiMWAYp2axD8wfyRcJ6ZrjTMmMebSIVaG8ya8sU0RqeQ9J2JodI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+W5hU349opbOCu3CLMFCZQCmmfDhtAnK7dpCkrve64b5ut8rN
	xZ22ILpe5bLtIRZp+3sAu3nIYu8wd96rSYJevEWBVYIrbjUQloaCDOzr
X-Gm-Gg: AZuq6aJLbmzkt2E81pQsmNnfZEzZFeKto0ajHh/v4mYmFBPk9P854CoJhYsTQgFP6w2
	jHIFOzsM8GaG6DXDyzTTeIJtbsTIxqLn+BCDpP4KBMmdHwh8bmUTUaxOtsTp11K6ldKvrYLfLNN
	Z7rVcYqs/4gTnudTj6l1I2i1FZhDmECgMUQ9SPc81o/zikT9gfWI/AWZa3jBcN4gVFMeHeJWpEU
	z25mM07n8WkXf28gGZctRDhRIO1/OuP0YSjwWYGtt/qm9bQfXO/FxJXRd/GCT253nFvka1uov74
	BatPjqVfKdQ0eEKbS1beX/PkY4ILKrSdJYJZ0+ZiquUA1wtnut8XpVJnlMyhRmHAi1lwLdv4YDW
	yjcjjFFt5TVuvERsJ9LHuhhV9e+VMQwl09HF2iTQPB7npO35Q57KygQYd1AuneWcUP5EOIkCgEz
	drcIeY+nuajieKOmyLSjBvzGoSK8Wt
X-Received: by 2002:a05:600c:b99:b0:47a:8154:33e3 with SMTP id 5b1f17b1804b1-482db49a483mr192887165e9.28.1770116546128;
        Tue, 03 Feb 2026 03:02:26 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:9cd9:f748:166d:55fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e132356dsm54110495f8f.33.2026.02.03.03.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 03:02:24 -0800 (PST)
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
Subject: [PATCH v3 2/4] clk: renesas: rzg2l: Add support for enabling PLLs
Date: Tue,  3 Feb 2026 11:02:13 +0000
Message-ID: <20260203110220.265748-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203110220.265748-1-biju.das.jz@bp.renesas.com>
References: <20260203110220.265748-1-biju.das.jz@bp.renesas.com>
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
v2->v3:
 * No change
v1->v2:
 * No change
---
 drivers/clk/renesas/rzg2l-cpg.c | 67 +++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h |  4 ++
 2 files changed, 71 insertions(+)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 945e31c8f161..7e569a7c8fc2 100644
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
index 1db413bb433d..7de4cb7af1cc 100644
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

