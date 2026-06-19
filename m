Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81CC3BFAF7
	for <linux-clk@vger.kernel.org>; Fri, 19 Jun 2026 16:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781887238; cv=none; b=aPMQibVOjoaBeY2mBHzLstzVXD1tpOF3MLOsdSAj5i8mQx5UmTSi7o78JlH1imLDps3416QbIALFIfWbyP8GQgzt3+d3u4+KP60jHHELpInQYXWf0/Dw+lWifnEb7V+TILxP/hZAlBiCoZDm9vIJsFHkabyyVtlqFrMbj9Yfm3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781887238; c=relaxed/simple;
	bh=2w1Xxi9sBH6FLa7KdnuZdXiZJUJnv3i7wSZBQNO3/aE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M8T7uOLVK+XQKZ0XWOtPx8BYZZfqj7CpR88oaNglXwZcLe1kki14Jhy2CL+anw738eE+gNIcRMtpwSk+rP6pMKmydJ0seI49vkvwc9fe3uvxIkjqjoes3J+9qDOzMZVf/jMCzbbl6Ijo1fivRXXHpKXpKdDcjzQIupnRgz00vGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M/A9d1wu; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M/A9d1wu"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso30299565e9.2
        for <linux-clk@vger.kernel.org>; Fri, 19 Jun 2026 09:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781887235; x=1782492035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79oNhBfri5tfdb/3IkQ+JvdN63dBYLB0KMrUXVuy5Yk=;
        b=M/A9d1wu6oMvpXsvTxtt1UUIWqMnU0tEn7yl/21QY6wjhbXct8ltWUYLx4uC/4jfZS
         R6gc91OfQWqJ+jjpFBCqrSBIHGMAQN0+OR89eMqUf/ZOnbFikRbbhkxDAmSgxPMUl0Eb
         AuhwtJSjgRNrFb1Rrb7gGEix/GgaYTqaXdQmniV+RlKQLrVxId3vI1Qwa+sJxS9fMGXq
         ReY2EmiFijeVe7ry3mP8D2k8TGKovZhUlUQFcbp6nGOPEKC7rQye/MKxQaKAcKwHf2XJ
         8/qkbVX1SAXVK0D++Wj6bvWpZPe2IwiHeg6dbTfcWFnVpzclVgOmkKkFn6FT/6OcKE1F
         rDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781887235; x=1782492035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=79oNhBfri5tfdb/3IkQ+JvdN63dBYLB0KMrUXVuy5Yk=;
        b=rtZJ0J8r9CZy0tRVqyZ6nfeH8gB8GNK2VVBLebM/6aT3ZwpilTyI/2N1NFWIGjM/Um
         1A1e5teMlm9IE4OsbzD/xYX17L0Uh+ZYC9NstM3tefOGhKPsFPRqh+PDRyEopKotvREW
         Zd9yTUOOCG5YpJeM8KIBvS+cHbJY620zRnBjMIjIuQa1ZrONaKL9PbC47MNI6NyWH/vd
         lN8bZBy9N0NPQfQLo/z00h+hJuvM0se1eg/sHziSA1oyoIEOzRSbLHtJoEnYnFI/+Ss2
         6YwTIsN+jFETK7qDb0Y2PqocAgZEfJAb91rDfLugvzJq/cnCji8sv7B3Fm/3DsB+e8Lm
         1LPA==
X-Forwarded-Encrypted: i=1; AFNElJ8zSeSP+lEHyJICeUeYXcgBQJVHW8FRegv1S/HmhSL55qcDl+toE+IBHZ9SfJPq0FJRGHEw8sU7dt4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2AcxaXNbALuUiueq4xaYgutHlE4hkW7Ppo5OolAhNVPffJc6z
	I6NWR6HoSQNeMFhpQs+VNuxe4PvlaY0J3x3MuYVC6U2K4WWDZqZidyhd
X-Gm-Gg: AfdE7ckyZItggRdawqbKIGFUgbLbZyb0/BhsxZkYPrkZP5LAs4hUyiEdc0UGOrCnXJR
	dht8es4bjMZiUGMINsiiYnoB8ZITOu1uwHZO2oEp+VECPGoxuzlNvmCoSbzZX3xhGIGxilPj6b2
	5Rkf6UMNTdFNQV+de6uzP7ojpFp6zAV3IqF04xFZUR+15GIcU++qkBsKOAHD1UyAbuVxl5fHJoN
	llpiVnokM/Xwr8CfS05YUvikMOZv9pxCemT78QX2eDV6AauXZnXZCJ3a7t3Qg484S/OhZGrBjmd
	pPtnYc0witjE24yn6ExzyJHTMNMSEqJ6NTs4SR0Lr1ClvobvgU0u2gAQytyraWkdWzzhevkEAmd
	s5NuFdzg7+EIGbM2iBqD4HpLeasRp1iGsjlSDMAUSGv43jl/3d7ojwiB0wV5Qp/sCvWESHtdnRY
	NObZp2aRLgFeSw1SJO8sqFCLZvIaE2GpONKmhmlg==
X-Received: by 2002:a05:600c:3e87:b0:492:46c2:f5b4 with SMTP id 5b1f17b1804b1-49246c2f68fmr25946235e9.32.1781887235236;
        Fri, 19 Jun 2026 09:40:35 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:b387:a6c7:e8fd:bca5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46667221de7sm261621f8f.33.2026.06.19.09.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 09:40:34 -0700 (PDT)
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
Subject: [PATCH 2/6] clk: renesas: rzg2l: Add PLL7 DSI clock support for RZ/G3L
Date: Fri, 19 Jun 2026 17:40:22 +0100
Message-ID: <20260619164030.380098-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619164030.380098-1-biju.das.jz@bp.renesas.com>
References: <20260619164030.380098-1-biju.das.jz@bp.renesas.com>
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
 drivers/clk/renesas/rzg2l-cpg.c | 227 ++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h |   5 +
 2 files changed, 232 insertions(+)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index a60b1d99458e..83c9f393c832 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -67,6 +67,10 @@
 #define CPG_PLL_MON_OFFSET(x)		(CPG_PLL_STBY_OFFSET(x) + 0xc)
 #define CPG_PLL_MON_LOCK		BIT(4)
 #define CPG_PLL_MON_RESETB		BIT(0)
+#define CPG_PLL_CLK1_VAL(p, m, ni, nf, sel)	(FIELD_PREP(GENMASK(28, 26), p)  | \
+						 FIELD_PREP(GENMASK(25, 22), m)  | \
+						 FIELD_PREP(GENMASK(21, 13), ni) | \
+						 FIELD_PREP(GENMASK(12, 1), nf)  | (sel))
 
 #define RZG3L_SDIV_DIV_DSI_A_WEN	BIT(16)
 #define RZG3L_SDIV_DIV_DSI_B_WEN	BIT(20)
@@ -96,6 +100,26 @@
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
@@ -1202,6 +1226,15 @@ rzg2l_cpg_sipll5_register(const struct cpg_core_clk *core,
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
@@ -1209,6 +1242,7 @@ struct pll_clk {
 	unsigned int type;
 	void __iomem *base;
 	struct rzg2l_cpg_priv *priv;
+	struct rzg3l_plldsi_parameters pll7_dsi_params;
 };
 
 #define to_pll(_hw)	container_of(_hw, struct pll_clk, hw)
@@ -1368,6 +1402,196 @@ static const struct clk_ops rzg3l_cpg_pll_ops = {
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
+		output_nir = DIV_ROUND_CLOSEST_ULL((p->nir + 1) * 1ULL * fpfd * MILLI, pr);
+		/* Compute range for output nfr (in mHz) */
+		output_nfr_range = DIV_ROUND_CLOSEST_ULL(fpfd * 1ULL * MILLI, pr);
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
+		nfr = div64_s64(output_nfr * 4096ULL * pr, fpfd);
+		nfr = DIV_S64_ROUND_CLOSEST(nfr, 1000);
+
+		/* Validate nfr value within allowed limits */
+		if (nfr < RZG3L_PLL7_NFR_MIN || nfr > RZG3L_PLL7_NFR_MAX)
+			continue;
+
+		p->nfr = nfr;
+
+		/* Compute (Ffdco * 4096) */
+		fdco = (((p->nir + 1) * 4096ULL) + p->nfr) * fpfd;
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
+		output = mul_u32_u32((p->nir + 1), 4096);
+		output += p->nfr;
+		output *= 1000;
+		nr_div_mr_pr = output / 4096;
+		if (nr_div_mr_pr < RZG3L_PLL7_NR_MIN || nr_div_mr_pr > RZG3L_PLL7_NR_MAX)
+			continue;
+
+		/* compute the magnified multipier = nr(magnified)/(mr *pr)  */
+		nr_div_mr_pr /= (p->mr + 1) * pr;
+		if (nr_div_mr_pr < RZG3L_PLL7_MULT_MIN || nr_div_mr_pr > RZG3L_PLL7_MULT_MAX)
+			continue;
+
+		output *= RZG3L_OSC_CLK;
+		output /= (p->mr + 1) * pr * 4096;
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
+	val = CPG_PLL_CLK1_VAL(dsi_dividers->pr, dsi_dividers->mr,
+			       dsi_dividers->nir, dsi_dividers->nfr,
+			       dsi_dividers->rangesel);
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
@@ -1481,6 +1705,9 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
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

