Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E781FBEAB
	for <linux-clk@vger.kernel.org>; Fri,  3 Jan 2025 16:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735922313; cv=none; b=Bc9nP8xeYZPWOcvNNArw02SLclwyf3y1Mcv7Ag88+KJKXxx1J/FVmUT8ONeE/syKE+rECsGHuxj0cW7ajs/46rHDN8B/5O3ybMw8dYLV38FmVISJXoy3mumMcppD6W955N/f15ABS+naMsV4aSXNrchQ2k5cha7fJdqYVAbkq4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735922313; c=relaxed/simple;
	bh=rKeDJdkJUvYXPSfCRoD0lCN7VYkcnSZTWQUumgyTv/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F9ZfsiBsz7OYD3td7CWeg/wbE3RITtP8CXAg9POp/rhzFO6gMi5cYRBOR7VXG9KM7XT3Tb2BlVq9+6tkyr5QAILfOy3BaUAvEfKoaJowCVvqe26qVatrS/kUifcr+py1O3e/Hs0YJKSEdCvWKcoh6I1DRav8OlmBZrclFjaAvv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=k/gZQEJt; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="k/gZQEJt"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aa689a37dd4so1954128866b.3
        for <linux-clk@vger.kernel.org>; Fri, 03 Jan 2025 08:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1735922310; x=1736527110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRfd2J8GP5C8knwZHf/66JpMVkPptrjLbcLPhoT3Dxw=;
        b=k/gZQEJtA+7erqO0VL71gsC9OEB1TUiEe3Dx7ue0FuvNGsZOnEH0+ZryT0kxWczm8M
         XELKmsV1Yjn1bbdjBx/x9anoTcTS8VfmLBMr6+h9Iexrh8iUkih3EwGEZjC8cf0q7BsN
         BpyyqxWZtwlFPs34r//r+6q/y8nNQ3qyV75hW4OrFjzkNmhivEXyasDqwtLkkhPgyilC
         +T0ZbO/EKcuZ2ee41u6udGg2IPQWKmzYgOoLC6OUPBiYKO/wRo0LB/wWudPdtxHZQV03
         YSCKCdEKHXpmPhuVE8gPUMatpoQrgMjZv19Cna20WSqBMOw9zcsrWvqNHgX7bZXJq8Mx
         n/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735922310; x=1736527110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uRfd2J8GP5C8knwZHf/66JpMVkPptrjLbcLPhoT3Dxw=;
        b=w/SW6VmR7Eegksr/9fKY6SEDqxEWfLiqXb11Fuicb8TJ2R3f0a/9ZIzfdjt/2Xtsf6
         NQu5VdH14gV3zQGybJk53p4n0b7TJgEf9Tonbu3f2netLRs90flw+LYviECSfQ80Fi03
         8lRoSJ+UX9mueOzmuGyvYiWRSm1WRntDtPYDCIA52ln6t/qwvzONRSKrszBcuGev+vg6
         X0v8XTXK9URg6/o59WbeQ8DK9s9FRxOzXHfyV6YBjjF4ue7b2FS66UTErgOcTS5kNq3y
         qsc5+4GiyAU+pB/WnGalW5QQEJMrik56k/hhh8ZOqM1nIW/WdZ9kv8Lntoh1PIqf5sYQ
         2Slw==
X-Forwarded-Encrypted: i=1; AJvYcCXD4vq5vMeSPnyVVIWNzz0DgfDFlOjBjjibtDN24+LYAiZkzIChZkcvfzQYf7qMPegLD5Tx05onuHs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz5X0a06xCrzLll+ADO5kyBtn3lrSJRlP7BgPSj9I4rOKhq6xj
	moodeDTCindFG/z7SSVYhnNN8rfyeXLx3SVUXFb6ZaF7jtfUdbDKBbeBvKr2/sI=
X-Gm-Gg: ASbGnctC8a3/HCuVxwTpOwXOB7kXQAnxY1+6hwI7/Joq0TgHYQELEYNl0zGcrBqYMu7
	CzK17aOT/wPFD7DhIbWtttgIJ3ZZaL8nhg7m1s3APIw1qecjpP+ahWF+C3Bb9TxZM5lIXUYc8kn
	r1mo5uy2nlXun7s4NzBKdLty63l7C7L2wzZawTPobbmYL5iTlr2tOIdKgP2ZhCEYkjrk2lGecIN
	iIcUwbRZqsTENK8iH9ijSdjJbZYpApW0XaNjj8B6H/OwX9Fa0cfO/+OW0N3SYymaUUtd34+d1m7
	Qn/xxpg664g=
X-Google-Smtp-Source: AGHT+IEDncREyuqiaeFdEZrch8doNfoioGsr8GniNw17HEMgfl8Mb5jP1IALi9TIgf4Be+b+F0vcRQ==
X-Received: by 2002:a17:907:944f:b0:aac:439:10ce with SMTP id a640c23a62f3a-aac2ba3c11amr5503329166b.27.1735922310189;
        Fri, 03 Jan 2025 08:38:30 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e8953b6sm1932984066b.65.2025.01.03.08.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 08:38:29 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	ulf.hansson@linaro.org
Cc: claudiu.beznea@tuxon.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 1/6] clk: renesas: r9a08g045: Add clocks, resets and power domain support for the TSU IP
Date: Fri,  3 Jan 2025 18:38:00 +0200
Message-ID: <20250103163805.1775705-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add clocks, resets and power domains for the TSU IP available on the
Renesas RZ/G3S SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g045-cpg.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index 0e7e3bf05b52..bc44e08e7eb9 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -241,6 +241,7 @@ static const struct rzg2l_mod_clk r9a08g045_mod_clks[] = {
 	DEF_MOD("gpio_hclk",		R9A08G045_GPIO_HCLK, R9A08G045_OSCCLK, 0x598, 0),
 	DEF_MOD("adc_adclk",		R9A08G045_ADC_ADCLK, R9A08G045_CLK_TSU, 0x5a8, 0),
 	DEF_MOD("adc_pclk",		R9A08G045_ADC_PCLK, R9A08G045_CLK_TSU, 0x5a8, 1),
+	DEF_MOD("tsu_pclk",		R9A08G045_TSU_PCLK, R9A08G045_CLK_TSU, 0x5ac, 0),
 	DEF_MOD("vbat_bclk",		R9A08G045_VBAT_BCLK, R9A08G045_OSCCLK, 0x614, 0),
 };
 
@@ -279,6 +280,7 @@ static const struct rzg2l_reset r9a08g045_resets[] = {
 	DEF_RST(R9A08G045_GPIO_SPARE_RESETN, 0x898, 2),
 	DEF_RST(R9A08G045_ADC_PRESETN, 0x8a8, 0),
 	DEF_RST(R9A08G045_ADC_ADRST_N, 0x8a8, 1),
+	DEF_RST(R9A08G045_TSU_PRESETN, 0x8ac, 0),
 	DEF_RST(R9A08G045_VBAT_BRESETN, 0x914, 0),
 };
 
@@ -353,6 +355,8 @@ static const struct rzg2l_cpg_pm_domain_init_data r9a08g045_pm_domains[] = {
 				DEF_REG_CONF(CPG_BUS_MCPU3_MSTOP, BIT(4)), 0),
 	DEF_PD("adc",		R9A08G045_PD_ADC,
 				DEF_REG_CONF(CPG_BUS_MCPU2_MSTOP, BIT(14)), 0),
+	DEF_PD("tsu",		R9A08G045_PD_TSU,
+				DEF_REG_CONF(CPG_BUS_MCPU2_MSTOP, BIT(15)), 0),
 	DEF_PD("vbat",		R9A08G045_PD_VBAT,
 				DEF_REG_CONF(CPG_BUS_MCPU3_MSTOP, BIT(8)),
 				GENPD_FLAG_ALWAYS_ON),
-- 
2.43.0

