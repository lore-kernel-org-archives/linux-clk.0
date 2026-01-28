Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67636352928
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 12:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769605141; cv=none; b=g904M1fym7CMe4bbI1WiLyp+S7Ec9iC1fsKVyI8JPY99E5AO1T/PHnJTf5LAbH/PjHCHDkbTPo/s7Je2zH7/wzIe/logHScxLiZxvT/QzH4SktO5AgHng1jNdVLt1BNpcZGJaI8ZntUxytDi4jlb1lRn9VOkmnS6fLrtHpSGHQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769605141; c=relaxed/simple;
	bh=XSXioNiG+OkEK6iktUUMrIsQb5EMIn7hR7qlSCuM+mY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pA3Sn7tfo+MkkuMj0v2k9nxUxlnaV8Y7HkARrwvTmQ5mEZQ+XMeFVtTjKyQ5R/UL8GbVXm3vovXTiYjjV5LC9d3hmjfryZUWJuCYBpRk0jQlRd9oQokD5IUdZae4SnHz9d2uK9bSFIZePyfzaNg2qMv8PMX4MmsVllaMEd704P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eAdRPxBh; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eAdRPxBh"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b872f1c31f1so934992366b.0
        for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 04:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769605138; x=1770209938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HRw+fMDNdkwtzs+5O+A8YzRtTI6ZfbBfoMkR3D19YyU=;
        b=eAdRPxBhFSU3qFimBAvdTEIXZwvHvmlNM7zkuJvIM+Q57cYAJAiPbSvE5Bh6wmiIW2
         sMLl2Nhq2/KZxhraiPMNcodeR5JzopD2gvlY73/ONFWclV5Xz09fnOsyIJ0IL9spu9Mv
         5SYZl00VLgl3iU82TCEY8WuwM/9Ac6p9WrenyBzg88QD9I1asslXC3NWOPvqKjHxKwcC
         5RzpbQ/hB2lP9HDXzpOt/4L/AWjSXKZ724gliJiSLWgvyyByJtoaHyuQgr4GykPEsgnL
         2dFXc956zVoT+Jb7fZUCrXvRAQVJecLBtKQ59cRS/OSRWzSJcwpnFQvnwOTVbgxDqUB3
         zJzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769605138; x=1770209938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HRw+fMDNdkwtzs+5O+A8YzRtTI6ZfbBfoMkR3D19YyU=;
        b=QyC/q3hGrbKxyvk3XQakTesHHn/VqG+rMILNPvrWuwGgPmNutot3ghNMOSPYKKa/SL
         vgFYcOIUP2c51UFXrELH4QehkxJKR4wJirMa/4PrqnHMR6f3EU2VWVaBzIseP23Uzn5M
         3/dBOIVWJ/TkJTyPhtuVOqUjFIct7v6iOt+uNhJrmiIglD4JYhvFgrEf8BgaJwQsArov
         Y5dQSZ9MThK7SYYxwE6i3D8CR9uWywCuRSRAYWtgf57ttiUB1wLE3BZOw+8uJ6y3x6I9
         6CzjZw7pgkTfHhlcAZPJsG229hDGf5AqUh5LKKCTvH0TFsD7/19FB+whrQy2NaukIrDp
         2Cjw==
X-Forwarded-Encrypted: i=1; AJvYcCXSploVLMqzaKjzunldfOTaH6KnQ56Y0+6FKTipZbU8WfrhbFtmNl8uwWZ2vEM3JyvRN5m/kyz/R8M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3dNEZwKP+1QXjIhzsNf+SiAwC+psWxRfP0J5odfROCqDe+3mk
	F3OewACzjBmYBUqEe0BUEAA0Ywd0Mk021fb5wT/eEfhHMNDkHj8Cukwn
X-Gm-Gg: AZuq6aJfQEK9snXCmbdTmkLRC+J7XNwo72xcdSysrNeMkF/ffvczlINuhPGzeGsVpGC
	uZu3vzNj1BlgAptcqXOHqly4u/C3WWIv4dQUUbYq5Pf6Y7SsWnnI5j0LbHkG76g9HKCea5FD7Qh
	YkX/SGkDl2fq/2YXTronwytk5ADboyhdMeJAsugHj4U45RbMOLd7j9qoA2tT4GvK8cytfER19Fr
	KDT9AAc8MZtlSnFOLjC4NsZ9Cwga2ypfBWDgH+LLOqcydiYpMzmO0lBTDrKH3V1ElYjLHNcfQML
	36sFeqPBnmT9Z5WD25QF6OLaQD26Crl0I740MJT9uxbtQqPHw8fmEMzjhnpDrfseJy5r+ZPYwoM
	KKcsk7a+s7617+pQylVRegeO4/u+RQW/hqY58HMQxZLOtBMY5un3+4SKEbbZ7vd7Dwopimb1QFo
	veHqkt28rSwN2zmQx3l7sT2vpTteXT69Ghu6nYuQXCRxQIAA==
X-Received: by 2002:a17:907:97c8:b0:b87:778b:89ba with SMTP id a640c23a62f3a-b8dab2fde55mr356214466b.39.1769605137603;
        Wed, 28 Jan 2026 04:58:57 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e29d:6e0e:72c1:d15d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf2f3e26sm123344966b.67.2026.01.28.04.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 04:58:57 -0800 (PST)
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
Subject: [PATCH net-next 4/8] clk: renesas: rzg2l: Add support for enabling PLLs
Date: Wed, 28 Jan 2026 12:58:41 +0000
Message-ID: <20260128125850.425264-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128125850.425264-1-biju.das.jz@bp.renesas.com>
References: <20260128125850.425264-1-biju.das.jz@bp.renesas.com>
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
 drivers/clk/renesas/rzg2l-cpg.c | 67 +++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h |  4 ++
 2 files changed, 71 insertions(+)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index ee92d07c6ff7..dfb36e6e6a7b 100644
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
@@ -1181,6 +1188,63 @@ rzg2l_cpg_pll_clk_register(const struct cpg_core_clk *core,
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
@@ -1264,6 +1328,9 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
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

