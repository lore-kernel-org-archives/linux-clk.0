Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2647A364044
	for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 18:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781806800; cv=none; b=p0hxlvc59KjPpV1CbkZ1fKgwx8t/6Vba23XhM6NbitP2KfhtQg1BY5o+FTTC3C91yzctmiz8VfGdMeeiFpo3HYs/FzZKNWjOeZ4R/O3vSj4ToUAsVpQ7YzdwqED7ot89jPrQ8bLTk6B65zeAUmZbSnqraaECJQQA+BH9gSHYmE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781806800; c=relaxed/simple;
	bh=1b2oxbsjTwiPKYPOqLSADHUiDXwH6v59WxBO3nikucE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q9cxz79F9fjettRsC6YxayGCJ90irxZn+5iuqSGKJ4i1ZXY1SMlIhCKlr+cQPTLXJ9ZT82XDGjyZC5a26Z53vcVxU6JkK8+hbpX+hG/M/1RPBGAoZVyg+KvNwjjblKXx3v0bjwlIlz2Kh72xeT2p0QbcHxxTarr9AW+JYrsreE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mOfynGVh; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mOfynGVh"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490aaeabdb4so7476275e9.1
        for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 11:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781806795; x=1782411595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9gCPRaGwbqVrTlAOrWL3rxO7f4G7fUT3yWTbsLCIAA=;
        b=mOfynGVh07/lIVZGsEHAqyQ7DHqR5Vd50QenQdabLEP67pQWbf1USHxGQKFXBkQwkh
         WlRA3fC/CktZjNyXHp3tSpCpnJ7Zp7P1m7UaTOJ4JZOf7YbchqMWWBUOZwo9ac9FJmxi
         VCsvj64MN1gro/7+SV96YT1pMUZRoKA79oqkHlZwptonMoyTFUdPiajX0OpZpJ5wO3D2
         /N9WrhAF6MNXtPOKsdvuo0wVxzApYNABREOwqW9C63XnZft2MRcjJXwbDuDxSIiAhTRT
         snM3doi0IVKm0YlChtZAx59BJV0ZVhQVFGrHoI1Gy377BnjOyw8+lS3MIVHppvYgV8W+
         fwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781806795; x=1782411595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z9gCPRaGwbqVrTlAOrWL3rxO7f4G7fUT3yWTbsLCIAA=;
        b=DAnQNkw3Y/DvCOKmZRyko+7N56vXxhUMPxkP1ydYvyHuv79t2DEnuNW3Pr4OlrPVJj
         7W5gi+Qxdt22ywnwtiRo/wehGEZXRpQ+7J8BVecHXl7j6zU7HRpMHTOqk+ZaK/xOvg7q
         5Ioztz+x4uN6LBle3mqcQhICK13Dn3YU0WOrKBP4WQz4p2Y7t9xr6lCgbOmG31PCP6H+
         V44us9ORgEPqh+T1/0sc7cT/9SNt5aZNXXtjfh/DkpTScY7fwef8AD3r5a96JuXEZkxa
         ucz33LiXLhn9xTIeCAGTabzhmjm4q9ATsa1k4l+HjowOLvHcKJnqvNaRVOgzibZ2Jyyv
         LzEw==
X-Forwarded-Encrypted: i=1; AFNElJ9BmwWU/nbCJBI6n5dIlbPGikS/PRgA79q4+2mAYZB2LKkxFEVIFellvKjhWElh5S4UHggs3dLXo9g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi1RlvL+EmXFqUeF/BDyGLY4uJYqhnwrVf3ihzdtVYJ9GFM9b+
	6BObgCTCLECfS+T6osRnQ86602YXA/q/NkGocX9sBFFoB5qSGcPYf2ud
X-Gm-Gg: AfdE7cls8mFQksjWrtcwtgeEmNmZ4DUvZ/9Q72F3is0clpaehZyRzku6WO7dNDaOGf9
	xHPLkptvswhchd51aVFguH8JZw3o7Bvr7wq/R7jBZYXb8as5TmnsnBfiYzxQQ1aJ2O52nidOKPU
	G7+hkrj4BoGqJjkxFvvHXqr8uixZ6y4YGHtXUWOE2X9d43PnFS5XaVa2KlGec0jmz9YQBbBXO8v
	HCn1ILZTJMQ01c3BWJUUbT4m0C/r/GZFJF7L2bJTDTNWAe/TiXJChUHOY4VHW625EjvNXwvJ13m
	kD7CL8z9YDdEhgCmW58Pt9psxtNtqYTT7fnvs2sK11m4K+iVWQifsX6Ma80Bh1MCAlwSokIH7SC
	BHBv56S0gVldCA+5oj7zrjpbnFZcFUItbspqMN3wFdKTAXfR6cd5D3nTLYRtt6NnQ8MgfC9RbfQ
	PDhaev76/VQcf9jxkpIKFlb66XkJgO6MEzTyv2cycPWn4MxHykudwzQOJ64ZpfSEBC6Ty4E3+z6
	1b2BLbz0xGrp0xIOGWKdIvXcq8=
X-Received: by 2002:a05:600c:2b17:b0:490:ab8b:1bb3 with SMTP id 5b1f17b1804b1-4923f5791d1mr8910245e9.18.1781806795483;
        Thu, 18 Jun 2026 11:19:55 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3bf7:d534:a488:f67d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-465090c42e1sm869435f8f.11.2026.06.18.11.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 11:19:55 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 4/5] clk: renesas: Extract RZ/V2H PLL calculation helpers into shared library
Date: Thu, 18 Jun 2026 19:19:48 +0100
Message-ID: <20260618181949.3036280-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618181949.3036280-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260618181949.3036280-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Move the RZ/V2H PLL and divider parameter calculation helpers from
rzv2h-cpg.c into a new reusable library.

Introduce the CLK_RZV2H_CPG_LIB Kconfig symbol and add
rzv2h-cpg-lib.c to host the PLL parameter search algorithms currently
implemented by rzv2h_get_pll_pars() and rzv2h_get_pll_divs_pars().
Export the helpers as rzv2h_cpg_get_pll_pars() and
rzv2h_cpg_get_pll_divs_pars() for use by other drivers.

Update the public clock header to expose the new interfaces and provide
compatibility aliases for the existing helper names, avoiding build
breakage for current users while allowing future conversions to the new
API.

This prepares for reuse of the PLL and divider calculation logic by
other Renesas clock drivers, including upcoming RZ/T2H and RZ/N2H CPG
support, without duplicating the implementation.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- Added macros for rzv2h_get_pll_pars and rzv2h_get_pll_divs_pars

v2->v3:
- Added export.h include in rzv2h-cpg-lib.c.

v1->v2:
- New patch
---
 drivers/clk/renesas/Kconfig         |   4 +
 drivers/clk/renesas/Makefile        |   1 +
 drivers/clk/renesas/rzv2h-cpg-lib.c | 217 ++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.c     | 203 --------------------------
 include/linux/clk/renesas.h         |  29 ++--
 5 files changed, 238 insertions(+), 216 deletions(-)
 create mode 100644 drivers/clk/renesas/rzv2h-cpg-lib.c

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 0203ecbb3882..7659550b8566 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -260,8 +260,12 @@ config CLK_RZG2L
 
 config CLK_RZV2H
 	bool "RZ/{G3E,V2H(P)} family clock support" if COMPILE_TEST
+	select CLK_RZV2H_CPG_LIB
 	select RESET_CONTROLLER
 
+config CLK_RZV2H_CPG_LIB
+	bool "RZV2H CPG library functions" if COMPILE_TEST
+
 config CLK_RENESAS_VBATTB
 	tristate "Renesas VBATTB clock controller"
 	depends on ARCH_RZG2L || COMPILE_TEST
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index bd2bed91ab29..ac790e56034b 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -52,6 +52,7 @@ obj-$(CONFIG_CLK_RCAR_GEN3_CPG)		+= rcar-gen3-cpg.o
 obj-$(CONFIG_CLK_RCAR_GEN4_CPG)		+= rcar-gen4-cpg.o
 obj-$(CONFIG_CLK_RCAR_USB2_CLOCK_SEL)	+= rcar-usb2-clock-sel.o
 obj-$(CONFIG_CLK_RZG2L)			+= rzg2l-cpg.o
+obj-$(CONFIG_CLK_RZV2H_CPG_LIB)		+= rzv2h-cpg-lib.o
 obj-$(CONFIG_CLK_RZV2H)			+= rzv2h-cpg.o
 
 # Generic
diff --git a/drivers/clk/renesas/rzv2h-cpg-lib.c b/drivers/clk/renesas/rzv2h-cpg-lib.c
new file mode 100644
index 000000000000..124239c7327e
--- /dev/null
+++ b/drivers/clk/renesas/rzv2h-cpg-lib.c
@@ -0,0 +1,217 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RZV2H CPG Library. This library provides common functions to calculate
+ * PLL parameters for the RZV2H SoC.
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ *
+ */
+
+#include <linux/clk/renesas.h>
+#include <linux/export.h>
+#include <linux/math.h>
+#include <linux/types.h>
+#include <linux/units.h>
+
+/**
+ * rzv2h_cpg_get_pll_pars - Finds the best combination of PLL parameters
+ * for a given frequency.
+ *
+ * @limits: Pointer to the structure containing the limits for the PLL parameters
+ * @pars: Pointer to the structure where the best calculated PLL parameters values
+ * will be stored
+ * @freq_millihz: Target output frequency in millihertz
+ *
+ * This function calculates the best set of PLL parameters (M, K, P, S) to achieve
+ * the desired frequency.
+ * There is no direct formula to calculate the PLL parameters, as it's an open
+ * system of equations, therefore this function uses an iterative approach to
+ * determine the best solution. The best solution is one that minimizes the error
+ * (desired frequency - actual frequency).
+ *
+ * Return: true if a valid set of parameters values is found, false otherwise.
+ */
+bool rzv2h_cpg_get_pll_pars(const struct rzv2h_pll_limits *limits,
+			    struct rzv2h_pll_pars *pars, u64 freq_millihz)
+{
+	unsigned long input_fref = limits->input_fref ?: (24 * MEGA);
+	u64 fout_min_millihz = mul_u32_u32(limits->fout.min, MILLI);
+	u64 fout_max_millihz = mul_u32_u32(limits->fout.max, MILLI);
+	struct rzv2h_pll_pars p, best;
+
+	if (freq_millihz > fout_max_millihz ||
+	    freq_millihz < fout_min_millihz)
+		return false;
+
+	/* Initialize best error to maximum possible value */
+	best.error_millihz = S64_MAX;
+
+	for (p.p = limits->p.min; p.p <= limits->p.max; p.p++) {
+		u32 fref = input_fref / p.p;
+		u16 divider;
+
+		for (divider = 1 << limits->s.min, p.s = limits->s.min;
+			p.s <= limits->s.max; p.s++, divider <<= 1) {
+			for (p.m = limits->m.min; p.m <= limits->m.max; p.m++) {
+				u64 output_m, output_k_range;
+				s64 pll_k, output_k;
+				u64 fvco, output;
+
+				/*
+				 * The frequency generated by the PLL + divider
+				 * is calculated as follows:
+				 *
+				 * With:
+				 * Freq = Ffout = Ffvco / 2^(pll_s)
+				 * Ffvco = (pll_m + (pll_k / 65536)) * Ffref
+				 * Ffref = 24MHz / pll_p
+				 *
+				 * Freq can also be rewritten as:
+				 * Freq = Ffvco / 2^(pll_s)
+				 *      = ((pll_m + (pll_k / 65536)) * Ffref) / 2^(pll_s)
+				 *      = (pll_m * Ffref) / 2^(pll_s) + ((pll_k / 65536) * Ffref) / 2^(pll_s)
+				 *      = output_m + output_k
+				 *
+				 * Every parameter has been determined at this
+				 * point, but pll_k.
+				 *
+				 * Considering that:
+				 * limits->k.min <= pll_k <= limits->k.max
+				 * Then:
+				 * -0.5 <= (pll_k / 65536) < 0.5
+				 * Therefore:
+				 * -Ffref / (2 * 2^(pll_s)) <= output_k < Ffref / (2 * 2^(pll_s))
+				 */
+
+				/* Compute output M component (in mHz) */
+				output_m = DIV_ROUND_CLOSEST_ULL(mul_u32_u32(p.m, fref) * MILLI,
+								 divider);
+				/* Compute range for output K (in mHz) */
+				output_k_range = DIV_ROUND_CLOSEST_ULL(mul_u32_u32(fref, MILLI),
+								       2 * divider);
+				/*
+				 * No point in continuing if we can't achieve
+				 * the desired frequency
+				 */
+				if (freq_millihz <  (output_m - output_k_range) ||
+				    freq_millihz >= (output_m + output_k_range)) {
+					continue;
+				}
+
+				/*
+				 * Compute the K component
+				 *
+				 * Since:
+				 * Freq = output_m + output_k
+				 * Then:
+				 * output_k = Freq - output_m
+				 *          = ((pll_k / 65536) * Ffref) / 2^(pll_s)
+				 * Therefore:
+				 * pll_k = (output_k * 65536 * 2^(pll_s)) / Ffref
+				 */
+				output_k = freq_millihz - output_m;
+				pll_k = div_s64(output_k * 65536ULL * divider,
+						fref);
+				pll_k = DIV_S64_ROUND_CLOSEST(pll_k, MILLI);
+
+				/* Validate K value within allowed limits */
+				if (pll_k < limits->k.min ||
+				    pll_k > limits->k.max)
+					continue;
+
+				p.k = pll_k;
+
+				/* Compute (Ffvco * 65536) */
+				fvco = mul_u32_u32(p.m * 65536 + p.k, fref);
+				if (fvco < mul_u32_u32(limits->fvco.min, 65536) ||
+				    fvco > mul_u32_u32(limits->fvco.max, 65536))
+					continue;
+
+				/* PLL_M component of (output * 65536 * PLL_P) */
+				output = mul_u32_u32(p.m * 65536, input_fref);
+				/* PLL_K component of (output * 65536 * PLL_P) */
+				output += p.k * input_fref;
+				/* Make it in mHz */
+				output *= MILLI;
+				output = DIV_U64_ROUND_CLOSEST(output, 65536 * p.p * divider);
+
+				/* Check output frequency against limits */
+				if (output < fout_min_millihz ||
+				    output > fout_max_millihz)
+					continue;
+
+				p.error_millihz = freq_millihz - output;
+				p.freq_millihz = output;
+
+				/* If an exact match is found, return immediately */
+				if (p.error_millihz == 0) {
+					*pars = p;
+					return true;
+				}
+
+				/* Update best match if error is smaller */
+				if (abs(best.error_millihz) > abs(p.error_millihz))
+					best = p;
+			}
+		}
+	}
+
+	/* If no valid parameters were found, return false */
+	if (best.error_millihz == S64_MAX)
+		return false;
+
+	*pars = best;
+	return true;
+}
+EXPORT_SYMBOL_NS_GPL(rzv2h_cpg_get_pll_pars, "RZV2H_CPG");
+
+/*
+ * rzv2h_cpg_get_pll_divs_pars - Finds the best combination of PLL parameters
+ * and divider value for a given frequency.
+ *
+ * @limits: Pointer to the structure containing the limits for the PLL parameters
+ * @pars: Pointer to the structure where the best calculated PLL parameters and
+ * divider values will be stored
+ * @table: Pointer to the array of valid divider values
+ * @table_size: Size of the divider values array
+ * @freq_millihz: Target output frequency in millihertz
+ *
+ * This function calculates the best set of PLL parameters (M, K, P, S) and divider
+ * value to achieve the desired frequency. See rzv2h_cpg_get_pll_pars() for more
+ * details on how the PLL parameters are calculated.
+ *
+ * freq_millihz is the desired frequency generated by the PLL followed by a
+ * a gear.
+ */
+bool rzv2h_cpg_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
+				 struct rzv2h_pll_div_pars *pars,
+				 const u8 *table, u8 table_size, u64 freq_millihz)
+{
+	struct rzv2h_pll_div_pars p, best;
+
+	best.div.error_millihz = S64_MAX;
+	p.div.error_millihz = S64_MAX;
+	for (unsigned int i = 0; i < table_size; i++) {
+		if (!rzv2h_cpg_get_pll_pars(limits, &p.pll, freq_millihz * table[i]))
+			continue;
+
+		p.div.divider_value = table[i];
+		p.div.freq_millihz = DIV_U64_ROUND_CLOSEST(p.pll.freq_millihz, table[i]);
+		p.div.error_millihz = freq_millihz - p.div.freq_millihz;
+
+		if (p.div.error_millihz == 0) {
+			*pars = p;
+			return true;
+		}
+
+		if (abs(best.div.error_millihz) > abs(p.div.error_millihz))
+			best = p;
+	}
+
+	if (best.div.error_millihz == S64_MAX)
+		return false;
+
+	*pars = best;
+	return true;
+}
+EXPORT_SYMBOL_NS_GPL(rzv2h_cpg_get_pll_divs_pars, "RZV2H_CPG");
diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index fff89f2bdc0b..738dfafc6d9c 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -220,209 +220,6 @@ struct rzv2h_plldsi_div_clk {
 
 #define RZV2H_MAX_DIV_TABLES		(16)
 
-/**
- * rzv2h_get_pll_pars - Finds the best combination of PLL parameters
- * for a given frequency.
- *
- * @limits: Pointer to the structure containing the limits for the PLL parameters
- * @pars: Pointer to the structure where the best calculated PLL parameters values
- * will be stored
- * @freq_millihz: Target output frequency in millihertz
- *
- * This function calculates the best set of PLL parameters (M, K, P, S) to achieve
- * the desired frequency.
- * There is no direct formula to calculate the PLL parameters, as it's an open
- * system of equations, therefore this function uses an iterative approach to
- * determine the best solution. The best solution is one that minimizes the error
- * (desired frequency - actual frequency).
- *
- * Return: true if a valid set of parameters values is found, false otherwise.
- */
-bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
-			struct rzv2h_pll_pars *pars, u64 freq_millihz)
-{
-	unsigned long input_fref = limits->input_fref ?: (24 * MEGA);
-	u64 fout_min_millihz = mul_u32_u32(limits->fout.min, MILLI);
-	u64 fout_max_millihz = mul_u32_u32(limits->fout.max, MILLI);
-	struct rzv2h_pll_pars p, best;
-
-	if (freq_millihz > fout_max_millihz ||
-	    freq_millihz < fout_min_millihz)
-		return false;
-
-	/* Initialize best error to maximum possible value */
-	best.error_millihz = S64_MAX;
-
-	for (p.p = limits->p.min; p.p <= limits->p.max; p.p++) {
-		u32 fref = input_fref / p.p;
-		u16 divider;
-
-		for (divider = 1 << limits->s.min, p.s = limits->s.min;
-			p.s <= limits->s.max; p.s++, divider <<= 1) {
-			for (p.m = limits->m.min; p.m <= limits->m.max; p.m++) {
-				u64 output_m, output_k_range;
-				s64 pll_k, output_k;
-				u64 fvco, output;
-
-				/*
-				 * The frequency generated by the PLL + divider
-				 * is calculated as follows:
-				 *
-				 * With:
-				 * Freq = Ffout = Ffvco / 2^(pll_s)
-				 * Ffvco = (pll_m + (pll_k / 65536)) * Ffref
-				 * Ffref = 24MHz / pll_p
-				 *
-				 * Freq can also be rewritten as:
-				 * Freq = Ffvco / 2^(pll_s)
-				 *      = ((pll_m + (pll_k / 65536)) * Ffref) / 2^(pll_s)
-				 *      = (pll_m * Ffref) / 2^(pll_s) + ((pll_k / 65536) * Ffref) / 2^(pll_s)
-				 *      = output_m + output_k
-				 *
-				 * Every parameter has been determined at this
-				 * point, but pll_k.
-				 *
-				 * Considering that:
-				 * limits->k.min <= pll_k <= limits->k.max
-				 * Then:
-				 * -0.5 <= (pll_k / 65536) < 0.5
-				 * Therefore:
-				 * -Ffref / (2 * 2^(pll_s)) <= output_k < Ffref / (2 * 2^(pll_s))
-				 */
-
-				/* Compute output M component (in mHz) */
-				output_m = DIV_ROUND_CLOSEST_ULL(mul_u32_u32(p.m, fref) * MILLI,
-								 divider);
-				/* Compute range for output K (in mHz) */
-				output_k_range = DIV_ROUND_CLOSEST_ULL(mul_u32_u32(fref, MILLI),
-								       2 * divider);
-				/*
-				 * No point in continuing if we can't achieve
-				 * the desired frequency
-				 */
-				if (freq_millihz <  (output_m - output_k_range) ||
-				    freq_millihz >= (output_m + output_k_range)) {
-					continue;
-				}
-
-				/*
-				 * Compute the K component
-				 *
-				 * Since:
-				 * Freq = output_m + output_k
-				 * Then:
-				 * output_k = Freq - output_m
-				 *          = ((pll_k / 65536) * Ffref) / 2^(pll_s)
-				 * Therefore:
-				 * pll_k = (output_k * 65536 * 2^(pll_s)) / Ffref
-				 */
-				output_k = freq_millihz - output_m;
-				pll_k = div_s64(output_k * 65536ULL * divider,
-						fref);
-				pll_k = DIV_S64_ROUND_CLOSEST(pll_k, MILLI);
-
-				/* Validate K value within allowed limits */
-				if (pll_k < limits->k.min ||
-				    pll_k > limits->k.max)
-					continue;
-
-				p.k = pll_k;
-
-				/* Compute (Ffvco * 65536) */
-				fvco = mul_u32_u32(p.m * 65536 + p.k, fref);
-				if (fvco < mul_u32_u32(limits->fvco.min, 65536) ||
-				    fvco > mul_u32_u32(limits->fvco.max, 65536))
-					continue;
-
-				/* PLL_M component of (output * 65536 * PLL_P) */
-				output = mul_u32_u32(p.m * 65536, input_fref);
-				/* PLL_K component of (output * 65536 * PLL_P) */
-				output += p.k * input_fref;
-				/* Make it in mHz */
-				output *= MILLI;
-				output = DIV_U64_ROUND_CLOSEST(output, 65536 * p.p * divider);
-
-				/* Check output frequency against limits */
-				if (output < fout_min_millihz ||
-				    output > fout_max_millihz)
-					continue;
-
-				p.error_millihz = freq_millihz - output;
-				p.freq_millihz = output;
-
-				/* If an exact match is found, return immediately */
-				if (p.error_millihz == 0) {
-					*pars = p;
-					return true;
-				}
-
-				/* Update best match if error is smaller */
-				if (abs(best.error_millihz) > abs(p.error_millihz))
-					best = p;
-			}
-		}
-	}
-
-	/* If no valid parameters were found, return false */
-	if (best.error_millihz == S64_MAX)
-		return false;
-
-	*pars = best;
-	return true;
-}
-EXPORT_SYMBOL_NS_GPL(rzv2h_get_pll_pars, "RZV2H_CPG");
-
-/*
- * rzv2h_get_pll_divs_pars - Finds the best combination of PLL parameters
- * and divider value for a given frequency.
- *
- * @limits: Pointer to the structure containing the limits for the PLL parameters
- * @pars: Pointer to the structure where the best calculated PLL parameters and
- * divider values will be stored
- * @table: Pointer to the array of valid divider values
- * @table_size: Size of the divider values array
- * @freq_millihz: Target output frequency in millihertz
- *
- * This function calculates the best set of PLL parameters (M, K, P, S) and divider
- * value to achieve the desired frequency. See rzv2h_get_pll_pars() for more details
- * on how the PLL parameters are calculated.
- *
- * freq_millihz is the desired frequency generated by the PLL followed by a
- * a gear.
- */
-bool rzv2h_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
-			     struct rzv2h_pll_div_pars *pars,
-			     const u8 *table, u8 table_size, u64 freq_millihz)
-{
-	struct rzv2h_pll_div_pars p, best;
-
-	best.div.error_millihz = S64_MAX;
-	p.div.error_millihz = S64_MAX;
-	for (unsigned int i = 0; i < table_size; i++) {
-		if (!rzv2h_get_pll_pars(limits, &p.pll, freq_millihz * table[i]))
-			continue;
-
-		p.div.divider_value = table[i];
-		p.div.freq_millihz = DIV_U64_ROUND_CLOSEST(p.pll.freq_millihz, table[i]);
-		p.div.error_millihz = freq_millihz - p.div.freq_millihz;
-
-		if (p.div.error_millihz == 0) {
-			*pars = p;
-			return true;
-		}
-
-		if (abs(best.div.error_millihz) > abs(p.div.error_millihz))
-			best = p;
-	}
-
-	if (best.div.error_millihz == S64_MAX)
-		return false;
-
-	*pars = best;
-	return true;
-}
-EXPORT_SYMBOL_NS_GPL(rzv2h_get_pll_divs_pars, "RZV2H_CPG");
-
 /**
  * struct rzv2h_plldsi_mux_clk - PLL DSI MUX clock
  *
diff --git a/include/linux/clk/renesas.h b/include/linux/clk/renesas.h
index 798bb0b54bab..c9495558cd5c 100644
--- a/include/linux/clk/renesas.h
+++ b/include/linux/clk/renesas.h
@@ -189,28 +189,31 @@ struct rzv2h_pll_div_pars {
 		.k = { .min = -32768, .max = 32767 },			\
 	}								\
 
-#ifdef CONFIG_CLK_RZV2H
-bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
-			struct rzv2h_pll_pars *pars, u64 freq_millihz);
+#ifdef CONFIG_CLK_RZV2H_CPG_LIB
+bool rzv2h_cpg_get_pll_pars(const struct rzv2h_pll_limits *limits,
+			    struct rzv2h_pll_pars *pars, u64 freq_millihz);
 
-bool rzv2h_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
-			     struct rzv2h_pll_div_pars *pars,
-			     const u8 *table, u8 table_size, u64 freq_millihz);
+bool rzv2h_cpg_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
+				 struct rzv2h_pll_div_pars *pars,
+				 const u8 *table, u8 table_size, u64 freq_millihz);
 #else
-static inline bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
-				      struct rzv2h_pll_pars *pars,
-				      u64 freq_millihz)
+static inline bool rzv2h_cpg_get_pll_pars(const struct rzv2h_pll_limits *limits,
+					  struct rzv2h_pll_pars *pars,
+					  u64 freq_millihz)
 {
 	return false;
 }
 
-static inline bool rzv2h_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
-					   struct rzv2h_pll_div_pars *pars,
-					   const u8 *table, u8 table_size,
-					   u64 freq_millihz)
+static inline bool rzv2h_cpg_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
+					       struct rzv2h_pll_div_pars *pars,
+					       const u8 *table, u8 table_size,
+					       u64 freq_millihz)
 {
 	return false;
 }
 #endif
 
+#define rzv2h_get_pll_pars	rzv2h_cpg_get_pll_pars
+#define rzv2h_get_pll_divs_pars	rzv2h_cpg_get_pll_divs_pars
+
 #endif
-- 
2.54.0

