Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793726471;
	b=fut2nil4185z/r+PaYfnZIrf1fUlCeWk/67qF4r7m8yqf/z5IJ1o3U1rmBYDcOM1k8sl
	 Vml6yXX6ZPt4+oNa9THqtFhdhA/CRY/S531euTk8jSt7gJYA2P1zEkr9bV1wdFcGsc5SC
	 nWotinS78I0ke4z/aj9qKY2lDVKzRRH1DAtG8secMiAxh6Qxh+YPahNlozfpynlCnWt2R
	 TpEGLkcKWIeIdfodAjocwREpay6Zp6pXFktZu4nRabOzT7uj3az8Ug6HW2Do3mwfbhZwE
	 OBwzox7eLG0B1p9L/PZTjEcuAj+HoGdJhUwoZHfNBPpIotlkHkwHBO/pTC29b+gChZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793726471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=y82kaLlVdTMG/Dxoi+XgELgK4jbU4ivpOZ2fmcDfzkY=;
	b=oAJWG9oBWjucsPdK2Qhpe7+vSOkRishfI/oK+QVMdxsCJh56ckbWJjUA1MUax6VwnmYD
	 TdaJSAD6h4uf7Z+wL6lvhf1k0L6PuiRTzkCR1KJyTJeBeQVz2052v2ufz4kYF/Dkz+2iZ
	 XAgwvim+n2zdFmmILghLrNS7MCxyPEaX+CAqfS4FJirumoI7C9Sl/Tgx64dkBrHEbe1/5
	 xFLgPHREChh8+mD7k/DBa7f04bTgP6O8RyTUvbRopX0unaoSbVbcGf5FuKSeYbFX62qNW
	 SwBLs8JremYBO9nU0Xn5p3+sAdGlXWQeXndPHh17i6HY6qi+/UijEgVQ87Jwr6UJLBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ldQsDtoh;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06FF606D81B
	for <linux-clk@vger.kernel.org>; Tue,  3 Nov 2026 17:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F06FF606D81B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ldQsDtoh
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e4831c028so3906033f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 03 Nov 2026 09:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793726469; x=1794331269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y82kaLlVdTMG/Dxoi+XgELgK4jbU4ivpOZ2fmcDfzkY=;
        b=ldQsDtohDharnYy2z11zHwwe7rswcAqPfTfDw7574RAaaw8KeHx16iImp5eiMDf2pE
         upkLRmjleABpNwD91UV4XrPtrNf+nmTYgaPJkmAW2Q8vw3J++DQm+24OuVlGAAMWaaiP
         QQdC2+3YIJ17Zqwn9drO/Z+xvHgbuXPw4dPhXdnO4ot5K155EKEie7ysO9gHSV+TtJEP
         pX6g5lTX0j0O/P6V0IYGPIgjzdNbkiSmKuxyx+QUzo7HLM01KuSU2POBVFovBHu9qaM4
         fa8OT1SxUKvsK+cnxlU2FEUBT25RbO0e/FbReyIyinzPYyBNZqBezvrwBL5kTwUuEEz+
         LUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793726469; x=1794331269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y82kaLlVdTMG/Dxoi+XgELgK4jbU4ivpOZ2fmcDfzkY=;
        b=jxrgR8xGpFaSE8n03OP1riZv71sxvl3GYVrca9VUHitiWJigciiPhNd3ffuzfiYLDV
         ufhyFrqc/cbYgd5CxETCLUvT+d0fPDh2FVNOLVB7FUVjgM33yReGGG1YHdaY4uaRVInZ
         mj8XHeeCxW9FjN6CdW7bhSW6X5/9v4AybLEmcMiSQs+/0Wxb3f++uFtKB79UpQx5bnu6
         KtongbeC3mwwaFq/GxuZvr9D1v9GFou0FawU+huERmoqnvahRFBaTgbhHNBgnE9iHvL0
         JBooT19M5Zn1u9Xb/1K0CK3KdXrVhS1TX3fgt04VmFner4uEoeknD9iHTKEjHRxbAoOa
         7dew==
X-Forwarded-Encrypted: i=1; AKwUvByuFjA+QbFCqlWhUevd0DoArtVMucoQmO6aSlkMQ9pjFfJmiZNIFCg0nTUOk/eIWVmdNzhBYn8disc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9D+iAqZTuepRqN2S27E2J6mg3wz+CnRLYAlb6E1Ama7tJlTdhM
	je2AF1HHLMWGuv2IQWDY2DpnB96+tFfB3XQThwnoZ3lzdIpq04zTyvMh
X-Gm-Gg: AYBFou2V5hnwAI0V4vJMXvuGu5MQjIG7VJBJiTzOatSdn4oq5ot2LhzV9dLfYMdE74e
	ReEAroKB4fFz+pjkDR/dOvekN2ThrgFHepIQTdc8ZBxvkEujl6o1bqTSKyW6VJ4x1uLlR3XVPp9
	5LuqI0WCAbrNKkr2yOnu22GN1WGRWqWqtA1OtK8foLq/AoFWBC2vafHCRu8iDTd0KMxQJInxNty
	gvynExBL2LRWuP0nWi6E54nvK4w5ybtG5agus0TjzgxUDUXOoMAfJruH5PAKuO0yqZ0n/V4JWq4
	0eXdiVhRFWnrvEoFC42DvvDzbwxbfd6fBzg+6ii9uDALJ8q5hZC2btYqxcUm1oT7c73SGKiLUBz
	rf8pYgZR+YlprxreQEeg2yJ1LqGiDX3RSFiggfnTeM/FlshdJlTCt5xgePMUhDc+45cLNqJdj+V
	UAcFIkCIRKVTbOyScUKToaqW9ajI0k3UhnYOgC3hvbSmrT8ZxuKYQ0DTQyZaNK4M895QskJStDL
	RE7NapJXKfP7NYT0AmyMDmNr3w5H0H/rHjSOY/Czechr5UKFhM7YDS27VDGANSXcbXIwkZfN+67
	2nYXH+SOC0EAhFqIKg9IyST4/4MpwEdEl8rgSnNtZTKDJwetfipvCcoDoG0PqIViWpReQnaUZf/
	iecU5vthsm11akGD3Y8ZMXA4bdVSk3gBeDp44OEg=
X-Received: by 2002:a05:600c:674f:b0:4a2:1655:87db with SMTP id 5b1f17b1804b1-4ac1228a434mr330482525e9.0.1793726469286;
        Tue, 03 Nov 2026 09:21:09 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:8b77:19e1:26f7:89f2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac08b72579sm8800675e9.2.2026.11.03.09.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 09:21:08 -0800 (PST)
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
Subject: [PATCH 4/4] drm: renesas: rz-du: mipi_dsi: Add fallback CPG PLLDSI parameter search
Date: Tue,  3 Nov 2026 17:20:57 +0000
Message-ID: <20261103172057.617203-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

For each PLLDSI divider, rzv2h_dphy_check_instance() only considers the
CPG PLLDSI parameters with the smallest frequency error. If they do not
lead to a DSI PLL setting less than 0.5 Hz off the required HS clock,
the divider is skipped, even though a CPG setting with a slightly larger
error could work. Modes such as <mode, lanes, format> are therefore
rejected on RZ/V2H(P), RZ/V2N and RZ/G3E.

If no divider gives a usable pair, search again with
rzv2h_cpg_get_pll_pars_validate(), accepting CPG candidates up to 50 Hz
off the target whose DSI PLL setting is less than 0.5 Hz off the HS clock.
The first accepted pair is used, so the pixel clock may be slightly less
accurate, but the mode can be driven.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 85 ++++++++++++++++++-
 1 file changed, 83 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 682bbb339bef..c23c7f43a560 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -42,6 +42,9 @@ MODULE_IMPORT_NS("RZV2H_CPG");
 #define RZ_MIPI_DSI_FEATURE_16BPP	BIT(0)
 #define RZ_MIPI_DSI_FEATURE_PWRRDY	BIT(1)
 
+#define RZV2H_DSI_PLL_MAX_ERR_MILLIHZ		500
+#define RZV2H_CPG_PLLDSI_MAX_ERR_MILLIHZ	(50 * MILLI)
+
 struct rzg2l_mipi_dsi;
 
 struct rzg2l_mipi_dsi_hw_info {
@@ -76,6 +79,13 @@ struct rzv2h_dsi_mode_calc {
 	struct rzv2h_pll_div_pars cpg_dsi_div_parameters;
 };
 
+struct rzv2h_dsi_validator_context {
+	struct rzv2h_pll_pars *dsi_pars;
+	unsigned int lanes;
+	unsigned int bpp;
+	u8 base_divider;
+};
+
 struct rzg2l_mipi_dsi {
 	struct device *dev;
 	void __iomem *mmio;
@@ -675,6 +685,67 @@ static int rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_f
 	return 0;
 }
 
+static bool rzv2h_dsi_validate_pll_pars(const struct rzv2h_pll_pars *pars, void *context)
+{
+	struct rzv2h_dsi_validator_context *ctx = context;
+	u64 hsfreq_millihz;
+
+	/* Check error threshold for CPG PLL DSI */
+	if (abs(pars->error_millihz) > RZV2H_CPG_PLLDSI_MAX_ERR_MILLIHZ)
+		return false;
+
+	/* Calculate the required DSI frequency */
+	hsfreq_millihz = DIV_U64_ROUND_CLOSEST(pars->freq_millihz, ctx->base_divider);
+	hsfreq_millihz = DIV_ROUND_CLOSEST_ULL(hsfreq_millihz * ctx->bpp, ctx->lanes);
+
+	/* Find DSI PLL parameters */
+	if (!rzv2h_get_pll_pars(&rzv2h_plldsi_div_limits, ctx->dsi_pars, hsfreq_millihz))
+		return false;
+
+	/* Check DSI error threshold */
+	if (abs(ctx->dsi_pars->error_millihz) >= RZV2H_DSI_PLL_MAX_ERR_MILLIHZ)
+		return false;
+
+	return true;
+}
+
+static bool rzv2h_dsi_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
+					struct rzv2h_pll_div_pars *pars,
+					const u8 *table, u8 table_size, u64 freq_millihz,
+					unsigned int bpp, unsigned int lanes,
+					struct rzv2h_pll_pars *dsi_pars)
+{
+	struct rzv2h_pll_pars temp_dsi_pars;
+	struct rzv2h_dsi_validator_context ctx = {
+		.dsi_pars = &temp_dsi_pars,
+		.lanes = lanes,
+		.bpp = bpp,
+	};
+	struct rzv2h_pll_validator validator = {
+		.validate = rzv2h_dsi_validate_pll_pars,
+		.context = &ctx,
+	};
+	struct rzv2h_pll_div_pars p;
+
+	for (unsigned int i = 0; i < table_size; i++) {
+		ctx.base_divider = table[i];
+
+		if (!rzv2h_cpg_get_pll_pars_validate(limits, &p.pll,
+						     freq_millihz * table[i], &validator))
+			continue;
+
+		p.div.divider_value = table[i];
+		p.div.freq_millihz = DIV_U64_ROUND_CLOSEST(p.pll.freq_millihz, table[i]);
+		p.div.error_millihz = freq_millihz - p.div.freq_millihz;
+
+		*dsi_pars = temp_dsi_pars;
+		*pars = p;
+		return true;
+	}
+
+	return false;
+}
+
 static unsigned int rzv2h_dphy_check_instance(struct rzg2l_mipi_dsi *dsi,
 					      unsigned long mode_freq,
 					      unsigned int pll_instance)
@@ -718,8 +789,18 @@ static unsigned int rzv2h_dphy_check_instance(struct rzg2l_mipi_dsi *dsi,
 		}
 	}
 
-	if (!found_valid_parameters)
-		return MODE_CLOCK_RANGE;
+	if (!found_valid_parameters) {
+		parameters_found =
+			rzv2h_dsi_get_pll_divs_pars(dsi->info->cpg_plldsi.limits[pll_instance],
+						    &best_cpg_dsi_parameters,
+						    dsi->info->cpg_plldsi.table,
+						    dsi->info->cpg_plldsi.table_size,
+						    mode_freq_millihz,
+						    bpp, dsi->lanes,
+						    &best_dsi_parameters);
+		if (!parameters_found)
+			return MODE_CLOCK_RANGE;
+	}
 
 	memcpy(&dsi->mode_calc.dsi_parameters, &best_dsi_parameters,
 	       sizeof(best_dsi_parameters));
-- 
2.56.0

