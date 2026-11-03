Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793726470;
	b=h4t2GtSFLj0k67YeXGD6HPA1GuvzJVyxoSPdiiig6KVD3pcHILUZGXR31x0wpO5GSAaD
	 TrPBPEuYeWHWHPy9WVVelWYoXZFzGnBzj8VGbOhtoX2gi05MRrF9gR+yDmegAQU4JRR9E
	 Z5BalqMcxyD7Ha1aStvZIYh+/Lr4LUmoI3SyTru9Mu101iRIHdPV8Rp79AIBP41b5sQyy
	 fipjSDDC2uMDlVzYctoo0HCiqEgyr6u7rzK2KoYE7bqZYEso0GZsN9qYW3X0i4+oN0ahL
	 Z2RRCJLoy9XN0bhOqTZq1LnIQzuo2rQxndkys8lNS3nKuzspMZG62hnrq8ZWaGI7JBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793726470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=roOiO3ldaNsjLxe0CYehd5v8rGn8f4LGIVU12eUR/M4=;
	b=rPl7C7TeaAH2meyLhqh7F4fBsrPV/aL7jEtDU+xqSsPyXG2cHj4Swah8qN+ug1SxZqJ9
	 AgMDW1zSWPqEUP74wcbDLpvTnVlItXmTbeOWpZFUrX1imH4v5MOunfi8ZRNDq2iSIyAAx
	 ahpy9HRmvkR84CZYAiTOavNuJuwGfiQvfqrXYJQv85CMj0SsFsgv7dgtnMxfkrOTTafyM
	 tw6rgjfn4nS/tsGW16/8ViTNo/9TILB8qcGzo8FFi52Ap7qtIdNlCdnvlQHvC1e5SwMki
	 CH1WKLZWvqSDNnkDnCQxRR/ttoAaab3eC2e+iaBLGaQZ9NKBb0O6WWjuL0N1Ir7tkTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TpUukxdp;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DD2606D809
	for <linux-clk@vger.kernel.org>; Tue,  3 Nov 2026 17:21:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13DD2606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TpUukxdp
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a214af2076so34181295e9.0
        for <linux-clk@vger.kernel.org>; Tue, 03 Nov 2026 09:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793726468; x=1794331268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=roOiO3ldaNsjLxe0CYehd5v8rGn8f4LGIVU12eUR/M4=;
        b=TpUukxdpYG9assmBfrFi6axTBVe0+dFXxNmwZX1d7X+jav48mhN8CnCEJao7E1aP4W
         USBKunWX0det+kHvEuGFSWSm85lB87LU4ju+qZvA6raej1Jymy8lJmihDqADTGiz8Jy2
         fzLh4wEOHyPgx4RO+iJgQK63tG47iAZxN+KkjC1730rPonzcI+Tkx94wt4POeALJDiJr
         WxKwvWwLkRvR66uD7qXOCd3kvAYRrUacUHnEp9xLue9W2JnL8EWKtFm80QO+btwwsfR8
         IuzvDDX4YgeIvcBnqINQiCpYdABloPP97/aIVdl7SqsZX/w5i//jrrZIaJ2XLOYx5Z5J
         DKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793726468; x=1794331268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=roOiO3ldaNsjLxe0CYehd5v8rGn8f4LGIVU12eUR/M4=;
        b=AxQp51+tm8Cynng/Ty3OEQD2KB8N5a9KyavTSvNi2XYh4DgkZT4GYAYHDCoFhoQ9Cg
         45MQoRwF72+PcBINZQwNVCDaWYJZS74iNkTOygtgQ0uqsyfP80zckh5iCsZzDLFa95kj
         cifKordQDioGTfwtIYyuqeMtqPlxjC5445XSejPdPmlrsxah6DAyM4I8kPcwE37n4+zU
         3AGIZdOH0QJP7438pYnewWKOhLRZpi7hoQnF6Oju1JGdRr94YdxdRY5Kdw2Z7hD+ddpr
         w414R1lmXv/0hE2/pNUUxJB6B17G6Cau69q7PzQT2W5HKa3CJmUo8xEXgg1+yOp9d7yy
         UfMg==
X-Forwarded-Encrypted: i=1; AKwUvBwa7AXhnqt5uEgm3ScvNpcxu4/SSVda3uve+F2AtMfL8fU+1i7JYgKckzAKqeUSYE9i555TYGnp700=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Zyfa/gMXpKvzi7Ra1IwHn59C8qKhwlSdZOknh9qRnuxNGgQ5O
	3eA5wsHNpTSdxObKPJ9+AzeosRegFfuybgxvEXj110EksCPEdRLcVqJM
X-Gm-Gg: AYBFou0siz7rjtGH4vTU790jH5oaBisgk7YEe5YWljB9FLuBiA8ugKOdpJ9yybIeznE
	bPFTgi4p2U80p9lUNv8qR8iA6WSCwai7TITsFmAQz2T62oXF3qfzLfHHqAUf7J+Z67aZcQZopCh
	pb2ct2nrUmReXQel8nMO2Eh91Cx5Er9TlXeEEq9Oy77m8+4kw358xspJxhR1gXBcekNBl+xWtyF
	fw427CPeA4Qm/6gpjIfmklkgl6vcO7BVKDHiFH5DENwGsJYhvkSJEAYDu5eUWE63y0646QzIrmf
	ydS1VgTaiSS2jZBXZANsndsXUGDuWdEjeZQ6kHmdqtmgVHswd6Joo8BXOxuBaScClO8c9X8TO6Y
	qUwso3AvL6dyjSw4vq2XDBCf9NphpYDy8+64taT6k43PXg4xHANilZzKsfGQ2ppCW0/JOfgAvqT
	KH1y3/9csALXCy0Cdcvj3XzbH5dWmxl0Og7c0QQI1eApctryIML61KBLHZvUpd8VC5REdy1lzzf
	sRrwi7FeX0IoESoz4dyOax98SKpbpoOSX744wZOYv4FXssuQSbkcqQLDt3MkHSkCe8DJJQH7+sB
	iz+erVEr/nBurMooIiCcAvN1ByWUP9bRGrPU3Jl9YqC0jQW+d7TrnFMQ+syrGl0O9k3lT7YOJ3p
	uu84vnYtUC9YNQ1rJzNbBF8RAfwJEa8ggGGPo9Ho=
X-Received: by 2002:a05:600c:811a:b0:4a6:b49f:9ae5 with SMTP id 5b1f17b1804b1-4ac18e5dac8mr287441665e9.34.1793726468458;
        Tue, 03 Nov 2026 09:21:08 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:8b77:19e1:26f7:89f2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac08b72579sm8800675e9.2.2026.11.03.09.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 09:21:07 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH 3/4] drm: renesas: rz-du: mipi_dsi: Improve DSI PLL parameter selection and cache results
Date: Tue,  3 Nov 2026 17:20:56 +0000
Message-ID: <20261103172057.617203-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103172057.617203-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261103172057.617203-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Mode validation searched the divider table once, kept the best CPG match
and only then checked the DSI PLL. A divider losing on CPG error alone
was never tried against it, so reachable modes were rejected.

Evaluate each divider on its own and keep the one with the smallest DSI
PLL error, handing it to the CPG via rzv2h_cpg_cache_pll_pars(). The
search also takes the PLLDSI instance as an argument and records it,
walking the instances described by the new num_limits field.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 87 ++++++++++++++-----
 1 file changed, 66 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 5b257f5adf06..682bbb339bef 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -12,6 +12,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+#include <linux/limits.h>
 #include <linux/math.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -55,6 +56,7 @@ struct rzg2l_mipi_dsi_hw_info {
 		const struct rzv2h_pll_limits **limits;
 		const u8 *table;
 		const u8 table_size;
+		const u8 num_limits;
 	} cpg_plldsi;
 	const struct rzg2l_mipi_dsi_timings *dsi_global_timings;
 	unsigned int num_dsi_global_timings;
@@ -69,7 +71,9 @@ struct rzg2l_mipi_dsi_hw_info {
 
 struct rzv2h_dsi_mode_calc {
 	unsigned long mode_freq_khz;
+	unsigned int pll_instance;
 	struct rzv2h_pll_pars dsi_parameters;
+	struct rzv2h_pll_div_pars cpg_dsi_div_parameters;
 };
 
 struct rzg2l_mipi_dsi {
@@ -671,43 +675,83 @@ static int rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_f
 	return 0;
 }
 
-static unsigned int rzv2h_dphy_mode_clk_check(struct rzg2l_mipi_dsi *dsi,
-					      unsigned long mode_freq)
+static unsigned int rzv2h_dphy_check_instance(struct rzg2l_mipi_dsi *dsi,
+					      unsigned long mode_freq,
+					      unsigned int pll_instance)
 {
 	u64 hsfreq_millihz, mode_freq_hz, mode_freq_millihz;
+	struct rzv2h_pll_div_pars best_cpg_dsi_parameters;
 	struct rzv2h_pll_div_pars cpg_dsi_parameters;
+	struct rzv2h_pll_pars best_dsi_parameters;
 	struct rzv2h_pll_pars dsi_parameters;
+	bool found_valid_parameters = false;
 	bool parameters_found;
-	unsigned int bpp;
+	unsigned int bpp, i;
 
+	best_dsi_parameters.error_millihz = S64_MAX;
 	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
 	mode_freq_hz = mul_u32_u32(mode_freq, KILO);
 	mode_freq_millihz = mode_freq_hz * MILLI;
-	parameters_found =
-		rzv2h_get_pll_divs_pars(dsi->info->cpg_plldsi.limits[0],
-					&cpg_dsi_parameters,
-					dsi->info->cpg_plldsi.table,
-					dsi->info->cpg_plldsi.table_size,
-					mode_freq_millihz);
-	if (!parameters_found)
-		return MODE_CLOCK_RANGE;
-
-	hsfreq_millihz = DIV_ROUND_CLOSEST_ULL(cpg_dsi_parameters.div.freq_millihz * bpp,
-					       dsi->lanes);
-	parameters_found = rzv2h_get_pll_pars(&rzv2h_plldsi_div_limits,
-					      &dsi_parameters, hsfreq_millihz);
-	if (!parameters_found)
-		return MODE_CLOCK_RANGE;
+	for (i = 0; i < dsi->info->cpg_plldsi.table_size; i++) {
+		parameters_found =
+			rzv2h_get_pll_divs_pars(dsi->info->cpg_plldsi.limits[pll_instance],
+						&cpg_dsi_parameters,
+						&dsi->info->cpg_plldsi.table[i], 1,
+						mode_freq_millihz);
+		if (!parameters_found)
+			continue;
+
+		hsfreq_millihz = DIV_ROUND_CLOSEST_ULL(cpg_dsi_parameters.div.freq_millihz * bpp,
+						       dsi->lanes);
+		parameters_found = rzv2h_get_pll_pars(&rzv2h_plldsi_div_limits,
+						      &dsi_parameters, hsfreq_millihz);
+		if (!parameters_found)
+			continue;
+
+		if (abs(dsi_parameters.error_millihz) >= 500)
+			continue;
+
+		if (abs(best_dsi_parameters.error_millihz) > abs(dsi_parameters.error_millihz)) {
+			best_cpg_dsi_parameters = cpg_dsi_parameters;
+			best_dsi_parameters = dsi_parameters;
+			found_valid_parameters = true;
+		}
+	}
 
-	if (abs(dsi_parameters.error_millihz) >= 500)
+	if (!found_valid_parameters)
 		return MODE_CLOCK_RANGE;
 
-	memcpy(&dsi->mode_calc.dsi_parameters, &dsi_parameters, sizeof(dsi_parameters));
+	memcpy(&dsi->mode_calc.dsi_parameters, &best_dsi_parameters,
+	       sizeof(best_dsi_parameters));
+	memcpy(&dsi->mode_calc.cpg_dsi_div_parameters, &best_cpg_dsi_parameters,
+	       sizeof(best_cpg_dsi_parameters));
 	dsi->mode_calc.mode_freq_khz = mode_freq;
+	dsi->mode_calc.pll_instance = pll_instance;
+
+	rzv2h_cpg_cache_pll_pars(best_cpg_dsi_parameters, pll_instance);
 
 	return MODE_OK;
 }
 
+static unsigned int rzv2h_dphy_mode_clk_check(struct rzg2l_mipi_dsi *dsi,
+					      unsigned long mode_freq)
+{
+	bool found = false;
+	unsigned int i;
+
+	/*
+	 * Check every instance instead of stopping at the first match, as
+	 * rzv2h_dphy_check_instance() hands the parameters it computes over to
+	 * the CPG, which needs them for whichever PLLDSI ends up feeding the
+	 * encoder.
+	 */
+	for (i = 0; i < dsi->info->cpg_plldsi.num_limits; i++)
+		if (rzv2h_dphy_check_instance(dsi, mode_freq, i) == MODE_OK)
+			found = true;
+
+	return found ? MODE_OK : MODE_CLOCK_RANGE;
+}
+
 static int rzv2h_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_freq,
 				u64 *hsfreq_millihz)
 {
@@ -715,7 +759,7 @@ static int rzv2h_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_f
 	unsigned long status;
 
 	if (dsi->mode_calc.mode_freq_khz != mode_freq) {
-		status = rzv2h_dphy_mode_clk_check(dsi, mode_freq);
+		status = rzv2h_dphy_check_instance(dsi, mode_freq, 0);
 		if (status != MODE_OK) {
 			dev_err(dsi->dev, "No PLL parameters found for mode clk %lu\n",
 				mode_freq);
@@ -1647,6 +1691,7 @@ static const struct rzg2l_mipi_dsi_hw_info rzv2h_mipi_dsi_info = {
 	.dphy_mode_clk_check = rzv2h_dphy_mode_clk_check,
 	.dphy_conf_clks = rzv2h_dphy_conf_clks,
 	.cpg_plldsi.limits = rzv2h_plldsi_limits,
+	.cpg_plldsi.num_limits = ARRAY_SIZE(rzv2h_plldsi_limits),
 	.cpg_plldsi.table = rzv2h_cpg_div_table,
 	.cpg_plldsi.table_size = ARRAY_SIZE(rzv2h_cpg_div_table),
 	.phy_reg_offset = 0x10000,
-- 
2.56.0

