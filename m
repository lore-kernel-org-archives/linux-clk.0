Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C4A37DE84
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 18:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786472862; cv=none; b=pD3bWzEfQ+sqmJeAdmRXdOXeBLzwzNjnhELS48k0z1F+h3Dimj14MQvFqhKJU+j6pCoVa9Y+IILsyMwkLdoA34t8Qt1bZbgvyURz21UlvxgS7n2t/QOyaWOYPf3p1E8uqsU/iRmzG900U21gDkxoabEiTNy80UAfQY+V7affc6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786472862; c=relaxed/simple;
	bh=9Nv0T7PmLLt1yaFTOZjH3Eon7P+JQiLx3ZHicyfn2xM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hT0mthyHl4kFaNMyQl0dDEii7XAGyKf8sGa+HWOeolwXBnXEILPX9eiRhNAbzZUGI/BHlAVSdmbsVd7Olhv+TLcZ0wI960a/x9Ws1dNGjqCoeD3y2jQgPfSDzxg9vzPgLu1CRAjKX187AsdbAZsoOHrR5IHkIHtjFtY1CFfjJkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mt3/drK+; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mt3/drK+"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4994c49f588so1808125e9.0
        for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 11:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786472855; x=1787077655; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IMaId/nEPBEaaif2cAIfydNYnIAkm3eEztoHvTlHwy0=;
        b=mt3/drK+jEPMiM9aJ2FqAgqyE6HLo+6OVxBS/E7KY+FFaOYCODRx040ma3OkKYazvQ
         nY9kUqcAwvtcE0lq8hFvNI83JYc+rVpALEgKCa87VegQ+ZWu2xW4/0jwsN7KFZmCOfSo
         zrqP9tDvap4jdS+0ysMIsClbVCBscXQDw8Du1+nk3S/AjaDS1z4pzcmTJb7Ysvim4wNJ
         S8HEEMn1OF4y7dSm/kLIrJbwK2xk7blwcXlQMAK0V03cuN4ZzzoJw20Z1UM3M9BCHvvr
         ONHN4abNOcat8JDw8LEVI5HvYEXrYM7BXZQ8MV7uwPD5Cqlll/va0N7Cbt6/ltWPksgN
         XVxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786472855; x=1787077655;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IMaId/nEPBEaaif2cAIfydNYnIAkm3eEztoHvTlHwy0=;
        b=cH2P03vWaPRegq6iNhY9hZ3DYpw9a8z+w+HCRAFFDCCCSeoODQsei8dbszE9MrC2gr
         llYMLgwAAhfilfjt1HarGDfHX1nMy/FmpOvOBk5kSW/L95iUvkFxwtD2DUYVJ+fbdrzU
         nmk2LUy1cb9Qfgi8UspUI1e4JeyVLzsqzVUY1MP3Dgx8jEHpyIK6cU6uuLJ4mHFZZUke
         05myJ5Kb/IijzZfsT+3pqBRGIvLFAok9Vmkh9dPNV9ZH2IU/iIVnixxKIVB3vqyHJfl0
         /t1gM0yt9klQlpcekOM+yFlzHVHYYOib56ZwXI0Pyqlr8+qw03osMnR1sLNBKu2mAaQz
         HUGg==
X-Forwarded-Encrypted: i=1; AHgh+RrVK6MmnTkiIFkkWOM0OFrGv3ekiZIfaGDHTa6aEmDyQH2FM/HhIeGJwc0x4eKudZdOf05KvKqFRKY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw628R2y+TmlL1WjvNw2vTpsSXjMfuXYeMjhRaI/k/4Dn3P+SXl
	9T10VfK6UiegX52iSuXoqv6hKZq2cFLVa4xP5FPG1h0ijm/Ah+QDqJFd
X-Gm-Gg: AR+sD12Io/KeIYMQ0Qoj/vz5xhPDHt9UKhDJNIjSbqrAnmQemIA/72A3af+8Ukzf86G
	KeAFLgyyTQY+XhaHSw4fQtNDaeNzFhqebsks2JLcTVjra9iN1d2amKcMnTET+p99brkzlmRsqyL
	SOqFnx9Hl9CgUNDp1kpvqOy+IgIa0Ozu/mkGiJZiYl0vEsGFEmtF6wuKAG9uC7ASL8h72Og1s1T
	nPJLYRxeOoxauVS2Vo1Ch1g90lZaqs5Ssu0BSIoHlv+LdsxULAngDtezGHIbfV/SosnqxU834EB
	bHGDr76o+TvNPeCmd0MYrCHryoQRLhIjaJEGANyBTQfnkOu3UMFXW9EjB8vJid9OyG6CJbchvw+
	+crspAvryzx9evjSBirzF5h7qA2n4J9s05CZQFQ9JJFCyriIKjxpsXxhnZLq9bUatGjJ6hE5cwW
	QxDci5ZA4yL6CS+5+GujWUJS6GGkTS6sw5ry+SFVlvEsb4t51ENR+UErw5n26wd1dzOUp+LwIf0
	DCHRaPVLWMH
X-Received: by 2002:a05:600c:a41:b0:495:5d6d:9cc1 with SMTP id 5b1f17b1804b1-4997a66e371mr30494055e9.0.1786472854780;
        Tue, 11 Aug 2026 11:27:34 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:935c:3ee:d543:9da1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997aac8c47sm12499385e9.15.2026.08.11.11.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 11:27:34 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 2/9] clk: renesas: rzg2l: Add PLL7 DSI clock support for RZ/G3L
Date: Tue, 11 Aug 2026 19:27:15 +0100
Message-ID: <20260811182729.360959-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811182729.360959-1-biju.das.jz@bp.renesas.com>
References: <20260811182729.360959-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add a new fractional PLL clock type (CLK_TYPE_G3L_PLLDSI) for the RZ/G3L
SoC's PLL7, which drives the DSI interface and requires a dedicated
parameter calculation and programming sequence distinct from other PLLs in
the RZ/G2L family.

PLL7 output frequency is determined by the formula:

  Ffdco = (NIR + NFR / 4096) * (Fosc / MR)
  Ffout = Ffdco / (1 << PR)

where:
  - Fosc = 24 MHz (oscillator input)
  - PR in [0, 4]   (post divider, power-of-two)
  - MR in [1, 12]  (input pre-divider)
  - NIR in [56, 375], NFR in [0, 4095] (integer and fractional parts)

The FDCO must fall within one of two valid ranges: 900–2000 MHz
(rangesel=0) or 2000–3000 MHz (rangesel=1).

The parameter search in rzg3l_dsi_get_pll_parameters_values() iterates
over all valid (MR, PR) combinations, filtering by the required FPFD range
of 8–16 MHz, then delegates to rzg3l_dsi_compute_pll_parameters() to find
the NIR/NFR pair that best approximates the requested rate. An exact match
returns immediately; otherwise the combination with the smallest absolute
frequency error is used.

Computed parameters are cached in pll7_dsi_params within pll_clk to
avoid redundant recalculation in determine_rate() when the requested
rate has not changed.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Dropped the macro CPG_PLL_CLK1_VAL and instead using FIELD_PREP 
   at all callsites.
 * output_nir updated with mul_u32_u32((p->nir + 1) * MILLI, fpfd) as
   p->nir is small.
 * output_nfr_range updated with mul_u32_u32(fpfd, MILLI)
 * nfr updated with div_s64  as div64_s64 is overkill
 * mul_u32_u32(p->nir + 1, 4096) computation reused in fdco and output.
 * Open-coded 64-by-32 division replaced with div_u64() 
---
 drivers/clk/renesas/rzg2l-cpg.c | 231 ++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h |   5 +
 2 files changed, 236 insertions(+)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 1660508d523a..9730ef67fbc6 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -73,6 +73,11 @@
 #define RZG3L_SDIV_DIV_DSI_A_WEN	BIT(16)
 #define RZG3L_SDIV_DIV_DSI_B_WEN	BIT(20)
 
+#define CPG_PLL_CLK1_DIV_NF	GENMASK(12, 1)
+#define CPG_PLL_CLK1_DIV_NI	GENMASK(21, 13)
+#define CPG_PLL_CLK1_DIV_M	GENMASK(25, 22)
+#define CPG_PLL_CLK1_DIV_P	GENMASK(28, 26)
+
 #define CLK_ON_R(reg)		(reg)
 #define CLK_MON_R(reg)		(0x180 + (reg))
 #define CLK_RST_R(reg)		(reg)
@@ -98,6 +103,26 @@
 #define PLL5_HSCLK_MIN		10000000
 #define PLL5_HSCLK_MAX		187500000
 
+#define RZG3L_OSC_CLK			(24 * MEGA)
+#define RZG3L_PLL7_FDCO_RANGE_0_MIN	(900 * MEGA)
+#define RZG3L_PLL7_FDCO_RANGE_0_MAX	(2000 * MEGA)
+#define RZG3L_PLL7_FDCO_RANGE_1_MIN	(2000 * MEGA)
+#define RZG3L_PLL7_FDCO_RANGE_1_MAX	(3000ULL * MEGA)
+#define RZG3L_PLL7_PR_MIN		(0)
+#define RZG3L_PLL7_PR_MAX		(4)
+#define RZG3L_PLL7_MR_MIN		(0)
+#define RZG3L_PLL7_MR_MAX		(11)
+#define RZG3L_PLL7_NIR_MIN		(55)
+#define RZG3L_PLL7_NIR_MAX		(374)
+#define RZG3L_PLL7_NFR_MIN		(0)
+#define RZG3L_PLL7_NFR_MAX		(4095)
+#define RZG3L_PLL7_NR_MIN		(56250)	 /* Multiplied value 56.25 * 1000 */
+#define RZG3L_PLL7_NR_MAX		(375000) /* Multiplied value 375 * 1000 */
+#define RZG3L_PLL7_MULT_MIN		(293)	 /* Multiplied value 0.293 * 1000 */
+#define RZG3L_PLL7_MULT_MAX		(375000) /* Multiplied value 375 * 1000 */
+#define RZG3L_PLL7_FSTD_DIV_MR_MIN	(8 * MEGA)
+#define RZG3L_PLL7_FSTD_DIV_MR_MAX	(16 * MEGA)
+
 /**
  * struct clk_hw_data - clock hardware data
  * @hw: clock hw
@@ -1208,6 +1233,15 @@ rzg2l_cpg_sipll5_register(const struct cpg_core_clk *core,
 	return clk_hw->clk;
 }
 
+/* RZ/G3L PLL7 parameters */
+struct rzg3l_plldsi_parameters {
+	s64 error_millihz;
+	u64 freq_millihz;
+	u16 nir, nfr;
+	u8 rangesel;
+	u8 pr, mr;
+};
+
 struct pll_clk {
 	struct clk_hw hw;
 	unsigned long default_rate;
@@ -1215,6 +1249,7 @@ struct pll_clk {
 	unsigned int type;
 	void __iomem *base;
 	struct rzg2l_cpg_priv *priv;
+	struct rzg3l_plldsi_parameters pll7_dsi_params;
 };
 
 #define to_pll(_hw)	container_of(_hw, struct pll_clk, hw)
@@ -1374,6 +1409,199 @@ static const struct clk_ops rzg3l_cpg_pll_ops = {
 	.recalc_rate = rzg3s_cpg_pll_clk_recalc_rate,
 };
 
+static inline bool
+rzg3l_dsi_compute_pll_parameters(struct rzg3l_plldsi_parameters *pars,
+				 struct rzg3l_plldsi_parameters *p,
+				 struct rzg3l_plldsi_parameters *best,
+				 u64 freq_millihz, u32 fpfd, u32 pr)
+{
+	for (p->nir = RZG3L_PLL7_NIR_MIN; p->nir <= RZG3L_PLL7_NIR_MAX; p->nir++) {
+		u64 output_nir, output_nfr_range;
+		s64 nfr, output_nfr;
+		u64 fdco, output;
+		u64 nr_div_mr_pr;
+
+		/*
+		 * The frequency generated by the PLL is calculated as follows:
+		 *
+		 * With:
+		 * Freq = Ffout = Ffdco / pr
+		 * input frequency(fstd) = 24MHz
+		 * fpfd = fstd / mr
+		 * nr = nir + nfr / 4096
+		 * Ffdco = nr * fpfd
+		 * Ffdco = (nir + (nfr / 4096)) * fpfd
+		 *
+		 * Freq can also be rewritten as:
+		 * Freq = Ffdco / pr
+		 *      = (nir * fpfd) / pr + ((nfr / 4096) * fpfd) / pr
+		 *      = output_nir + output_nfr
+		 *
+		 * Every parameter has been determined at this point, but nfr.
+		 * Considering that:
+		 * 0 <= nfr <= 4095
+		 * Then:
+		 * 0 <= (nfr / 4096) < 1
+		 * Therefore:
+		 * 0 <= output_nfr < fpfd / pr
+		 */
+
+		/* Compute output nir component (in mHz) */
+		output_nir = DIV_ROUND_CLOSEST_ULL(mul_u32_u32((p->nir + 1) * MILLI, fpfd), pr);
+		/* Compute range for output nfr (in mHz) */
+		output_nfr_range = DIV_ROUND_CLOSEST_ULL(mul_u32_u32(fpfd, MILLI), pr);
+		/* No point in continuing if we can't achieve the desired frequency */
+		if (freq_millihz < output_nir  || freq_millihz >= (output_nir + output_nfr_range))
+			continue;
+
+		/*
+		 * Compute the nfr component
+		 *
+		 * Since:
+		 * Freq = output_nir + output_nfr
+		 * Then:
+		 * output_nfr = Freq - output_nir
+		 *            = ((nfr / 4096) * fpfd) / pr
+		 * Therefore:
+		 * nfr = (output_nfr * 4096 * pr) / fpfd
+		 */
+		output_nfr = freq_millihz - output_nir;
+		nfr = div_s64(output_nfr * 4096 * pr, fpfd);
+		nfr = DIV_S64_ROUND_CLOSEST(nfr, 1000);
+
+		/* Validate nfr value within allowed limits */
+		if (nfr < RZG3L_PLL7_NFR_MIN || nfr > RZG3L_PLL7_NFR_MAX)
+			continue;
+
+		p->nfr = nfr;
+
+		/* Compute (Ffdco * 4096) */
+		output = mul_u32_u32(p->nir + 1, 4096);
+		fdco = (output + p->nfr) * fpfd;
+		if (fdco < (RZG3L_PLL7_FDCO_RANGE_0_MIN * 4096ULL) ||
+		    fdco > (RZG3L_PLL7_FDCO_RANGE_1_MAX * 4096ULL))
+			continue;
+
+		if (fdco <= (RZG3L_PLL7_FDCO_RANGE_0_MAX * 4096ULL))
+			p->rangesel = 0;
+		else
+			p->rangesel = 1;
+
+		/* compute the nr and magnify by 1000 */
+		output = mul_u32_u32(p->nir + 1, 4096);
+		output += p->nfr;
+		output *= 1000;
+		nr_div_mr_pr = div_u64(output, 4096);
+		if (nr_div_mr_pr < RZG3L_PLL7_NR_MIN || nr_div_mr_pr > RZG3L_PLL7_NR_MAX)
+			continue;
+
+		/* compute the magnified multipier = nr(magnified)/(mr *pr)  */
+		nr_div_mr_pr = div_u64(nr_div_mr_pr, (p->mr + 1) * pr);
+		if (nr_div_mr_pr < RZG3L_PLL7_MULT_MIN || nr_div_mr_pr > RZG3L_PLL7_MULT_MAX)
+			continue;
+
+		output *= RZG3L_OSC_CLK;
+		output = div_u64(output, (p->mr + 1) * pr * 4096);
+
+		p->error_millihz = freq_millihz - output;
+		p->freq_millihz = output;
+
+		/* If an exact match is found, return immediately */
+		if (p->error_millihz == 0) {
+			*pars = *p;
+			return true;
+		}
+
+		/* Update best match if error is smaller */
+		if (abs(p->error_millihz) < abs(best->error_millihz))
+			*best = *p;
+	}
+
+	return false;
+}
+
+static bool
+rzg3l_dsi_get_pll_parameters_values(struct rzg3l_plldsi_parameters *pars,
+				    u64 freq_millihz)
+{
+	struct rzg3l_plldsi_parameters p, best;
+
+	/* Initialize best error to maximum possible value */
+	best.error_millihz = S64_MAX;
+	p.error_millihz = S64_MAX;
+	for (p.mr = RZG3L_PLL7_MR_MIN; p.mr <= RZG3L_PLL7_MR_MAX; p.mr++) {
+		u32 fpfd = RZG3L_OSC_CLK / (p.mr + 1);
+
+		if (fpfd > RZG3L_PLL7_FSTD_DIV_MR_MAX || fpfd < RZG3L_PLL7_FSTD_DIV_MR_MIN)
+			continue;
+
+		for (p.pr = RZG3L_PLL7_PR_MIN; p.pr <= RZG3L_PLL7_PR_MAX; p.pr++)
+			if (rzg3l_dsi_compute_pll_parameters(pars, &p, &best,
+							     freq_millihz, fpfd, 1 << p.pr))
+				return true;
+	}
+
+	/* If no valid parameters were found, return false */
+	if (best.error_millihz == S64_MAX)
+		return false;
+
+	*pars = best;
+	return true;
+}
+
+static int rzg3l_cpg_plldsi_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
+{
+	struct pll_clk *pll_clk = to_pll(hw);
+	struct rzg2l_cpg_priv *priv = pll_clk->priv;
+	struct rzg3l_plldsi_parameters *pll7_dsi_params = &pll_clk->pll7_dsi_params;
+	u64 rate_millihz;
+
+	rate_millihz = mul_u32_u32(req->rate, MILLI);
+	if (rate_millihz == pll7_dsi_params->error_millihz + pll7_dsi_params->freq_millihz)
+		goto exit_determine_rate;
+
+	if (!rzg3l_dsi_get_pll_parameters_values(pll7_dsi_params, rate_millihz)) {
+		dev_err(priv->dev, "failed %s for req->rate: %lu\n", __func__, req->rate);
+		return -EINVAL;
+	}
+
+exit_determine_rate:
+	req->rate = DIV_ROUND_CLOSEST_ULL(pll7_dsi_params->freq_millihz, MILLI);
+	return 0;
+}
+
+static int rzg3l_cpg_plldsi_set_rate(struct clk_hw *hw, unsigned long rate,
+				     unsigned long parent_rate)
+{
+	struct pll_clk *pll_clk = to_pll(hw);
+	struct rzg3l_plldsi_parameters *dsi_dividers = &pll_clk->pll7_dsi_params;
+	u32 val;
+
+	/* Put PLL into standby mode */
+	rzg3l_cpg_pll_clk_endisable(hw, false);
+
+	/* Output clock setting 1 */
+	val = FIELD_PREP(CPG_PLL_CLK1_DIV_P, dsi_dividers->pr) |
+	      FIELD_PREP(CPG_PLL_CLK1_DIV_M, dsi_dividers->mr) |
+	      FIELD_PREP(CPG_PLL_CLK1_DIV_NI, dsi_dividers->nir) |
+	      FIELD_PREP(CPG_PLL_CLK1_DIV_NF, dsi_dividers->nfr) |
+	      dsi_dividers->rangesel;
+	writel(val, pll_clk->base + CPG_PLL_CLK1_OFFSET(pll_clk->conf));
+
+	/* Put PLL to normal mode */
+	rzg3l_cpg_pll_clk_endisable(hw, true);
+
+	return 0;
+};
+
+static const struct clk_ops rzg3l_cpg_plldsi_ops = {
+	.recalc_rate = rzg3s_cpg_pll_clk_recalc_rate,
+	.determine_rate = rzg3l_cpg_plldsi_determine_rate,
+	.set_rate = rzg3l_cpg_plldsi_set_rate,
+	.is_enabled = rzg3l_cpg_pll_clk_is_enabled,
+	.enable = rzg3l_cpg_pll_clk_enable,
+};
+
 static struct clk
 *rzg2l_cpg_clk_src_twocell_get(struct of_phandle_args *clkspec,
 			       void *data)
@@ -1487,6 +1715,9 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
 	case CLK_TYPE_G3L_DSI_DIV:
 		clk = rzg3l_cpg_dsi_div_clk_register(core, priv);
 		break;
+	case CLK_TYPE_G3L_PLLDSI:
+		clk = rzg2l_cpg_pll_clk_register(core, priv, &rzg3l_cpg_plldsi_ops);
+		break;
 	default:
 		goto fail;
 	}
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 24642a089b6c..41e8f389c566 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -142,6 +142,9 @@ enum clk_types {
 	/* Clock for DSI divider */
 	CLK_TYPE_DSI_DIV,
 
+	/* Clock for G3L DSI PLL */
+	CLK_TYPE_G3L_PLLDSI,
+
 	/* Clock for G3L DSI divider */
 	CLK_TYPE_G3L_DSI_DIV,
 };
@@ -206,6 +209,8 @@ enum clk_types {
 #define DEF_G3L_DSI_DIV(_name, _id, _parent, _conf) \
 	DEF_TYPE(_name, _id, CLK_TYPE_G3L_DSI_DIV, .parent = _parent, .conf = _conf, \
 		 .flag = CLK_SET_RATE_PARENT)
+#define DEF_G3L_PLLDSI(_name, _id, _parent, _conf) \
+	DEF_TYPE(_name, _id, CLK_TYPE_G3L_PLLDSI, .parent = _parent, .conf = _conf)
 
 /**
  * struct rzg2l_mod_clk - Module Clocks definitions
-- 
2.43.0

