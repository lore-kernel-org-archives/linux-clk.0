Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D294724729A
	for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 10:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009187; cv=none; b=mDF2b/5GwBqeJRhRWKfixOF56X+C5bsqYPAJ6GTSYEHiBfRdj8zLGXznd3M0BMJa9FvPHoG8IA5TBCHEvHlIeCkwnBkrPMbpy3RmNpcff0iwvwSjSGOl00Nlfj8LSXN8BPQg1SRBXLrpfJwze09G3dBWmr6P/9ak/j7AsGQVq1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009187; c=relaxed/simple;
	bh=yXMvUcI9UJOVWK6FV4N0kjaxLM7bkmRdgBXzTjBcUVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gJ9KtNS/mFuxh9/HObFgH1b15uY9Aev1wP6xjZZYtMzHnbS/NAymFXT3PjmfmrY7gZvvfi+iTaj98AEFBJ6NScMfwBvf05BRHLTtEiPj+A9TiXjM9KpLRg+MyrqNR3jWY3pKpjqUNgDBqnC/SNdCI22xN49l1UHhpGi1n8k/mI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=nZNmPM0b; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="nZNmPM0b"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-acec5b99052so325039866b.1
        for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 03:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1746009184; x=1746613984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Xu0lwXfHypam6aFf6MDeNeMIOVtEqILdYrrYMjhy+Y=;
        b=nZNmPM0bCYZoKKVt2njn4UV/Q5KlMvktieOUDuXK/xt4HgyCYgomnZ1e6UfGdMzEF4
         GW6G4+7NZ2lMLHA3STlzOrkTfFURcq5fKc2N0WCOOY3Hy59b6UT91F/orn5ONZBVfdb4
         VcGF3gFvXH+cKrKNffaEnQATb+TU3z1GIn7OslsIkoX2BbM9UNyO3yjg2wnnq+Vk8hBw
         6tHtMt6VUFIWe6XKXxsnPa+br6/6zP08yrnT7l/eG6HVAqDSh03D04qZSbgdaynDek9H
         +zDS8gHJ9EINmn1XYuh6kBW/Nv09o7orAQqrHP7wsfLQIjJ1TNuIcmRZKJdhif46KMSD
         TZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746009184; x=1746613984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Xu0lwXfHypam6aFf6MDeNeMIOVtEqILdYrrYMjhy+Y=;
        b=Vw/E1g6k0jMuta+rpWHRDSR0oK8VifkHLzr1zx8duC718cBVQw48iNU/xdvrUaLCwX
         YwjwAbU/+gaTaiGrcJzIthGLXzdJOpXpxXDWBBy3ZNEYlFMiDaxiuH8d39z1z5h8vNNF
         y56hMOG5BBCNhbwYtuy3syXdQA0sWAu/jcnPhPXH2IH6046ZmNJ04OCw7oBoIkNYMZa2
         vyMIITBpVmPEi4apWq9gRNNc8AF1f+RFzsxQ5Qf+lcUaNfIxujUhDcwrEiOm8xYZPkxz
         r7uCum3IuXHd5bfR78SxdRQ7O9UPGv/2ypTR8KBdtT+T5nqNTYJY0UxbitJPFeeGIMa5
         2XiQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6C+KYoTKAELgVjkgWH4TDEizHqUCW7OK+dWdpOaTtiyT8Dw7ZfmUOE3vcmy7U4lZwx3ZuWH601g8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvOAh6mdmZ74zoGrit3vwRfKTI0871I173+e6s5yrFNRYPh71N
	AkhJj0c04gB4VXpN7DNfe5vgJkfUrxYfmEeOZaRui4/bigTR6tSeTPrHcj4lW7w=
X-Gm-Gg: ASbGnctPW+Km3WV6lf5Ry1xsjngCOzgC1XHCILFZUITy8F9IKMovNQph9JlouuppHY2
	w6YqUCJmDEwL3ozm1Mn56qzOAi3CRVe7mTOTSwmUnxPEuVQBOzBgxb2m2rTDZSSIDxqC3d3p7VF
	BgXWv58XUZf7NFyCgR9ETtnqRsBsO1/FGcoajFUgcKJsdrcsq7n4dt22/N6Eb6OCqjdlm3ahXft
	k1gXKEjmTiFKKb/Yh0pS0I5k6pBZnbXhgnrKNWQkllUV5jVJ7JqS66gZ5Q+ifhpLp4S/BsPQN/w
	wQJWiH6uNWHBaC0TqjfsGqCgIGjyTlyrPsm5kC/Bezr4KkAnOpWgPUPjFj+llcVw+5p+n1w=
X-Google-Smtp-Source: AGHT+IEiP6Vgn86q0Y+9iOsEDH1SApC/mbVRMzQBBXjANsWv64cM9/IPsj3x7m/5obY5CmIm9XqGUw==
X-Received: by 2002:a17:907:9805:b0:ac3:422a:76dc with SMTP id a640c23a62f3a-acedc65297fmr255856866b.34.1746009184102;
        Wed, 30 Apr 2025 03:33:04 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed6af86sm909390366b.133.2025.04.30.03.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 03:33:03 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	saravanak@google.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 2/8] clk: renesas: r9a08g045: Add clocks, resets and power domain support for the PCIe
Date: Wed, 30 Apr 2025 13:32:30 +0300
Message-ID: <20250430103236.3511989-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add clocks, resets and power domains for the PCIe IP available on the
Renesas RZ/G3S SoC. The clkl1pm clock is required for PCIe link power
management (PM) control and should be enabled based on the state of the
CLKREQ# pin. Therefore, mark it as a no_pm clock to allow the PCIe driver
to manage it during link PM transitions.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g045-cpg.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index 4035f3443598..33219164a19a 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -243,6 +243,8 @@ static const struct rzg2l_mod_clk r9a08g045_mod_clks[] = {
 	DEF_MOD("adc_adclk",		R9A08G045_ADC_ADCLK, R9A08G045_CLK_TSU, 0x5a8, 0),
 	DEF_MOD("adc_pclk",		R9A08G045_ADC_PCLK, R9A08G045_CLK_TSU, 0x5a8, 1),
 	DEF_MOD("tsu_pclk",		R9A08G045_TSU_PCLK, R9A08G045_CLK_TSU, 0x5ac, 0),
+	DEF_MOD("pci_aclk",		R9A08G045_PCI_ACLK, R9A08G045_CLK_M0, 0x608, 0),
+	DEF_MOD("pci_clk1pm",		R9A08G045_PCI_CLKL1PM, R9A08G045_CLK_ZT, 0x608, 1),
 	DEF_MOD("vbat_bclk",		R9A08G045_VBAT_BCLK, R9A08G045_OSCCLK, 0x614, 0),
 };
 
@@ -282,6 +284,13 @@ static const struct rzg2l_reset r9a08g045_resets[] = {
 	DEF_RST(R9A08G045_ADC_PRESETN, 0x8a8, 0),
 	DEF_RST(R9A08G045_ADC_ADRST_N, 0x8a8, 1),
 	DEF_RST(R9A08G045_TSU_PRESETN, 0x8ac, 0),
+	DEF_RST(R9A08G045_PCI_ARESETN, 0x908, 0),
+	DEF_RST(R9A08G045_PCI_RST_B, 0x908, 1),
+	DEF_RST(R9A08G045_PCI_RST_GP_B, 0x908, 2),
+	DEF_RST(R9A08G045_PCI_RST_PS_B, 0x908, 3),
+	DEF_RST(R9A08G045_PCI_RST_RSM_B, 0x908, 4),
+	DEF_RST(R9A08G045_PCI_RST_CFG_B, 0x908, 5),
+	DEF_RST(R9A08G045_PCI_RST_LOAD_B, 0x908, 6),
 	DEF_RST(R9A08G045_VBAT_BRESETN, 0x914, 0),
 };
 
@@ -358,6 +367,8 @@ static const struct rzg2l_cpg_pm_domain_init_data r9a08g045_pm_domains[] = {
 				DEF_REG_CONF(CPG_BUS_MCPU2_MSTOP, BIT(14)), 0),
 	DEF_PD("tsu",		R9A08G045_PD_TSU,
 				DEF_REG_CONF(CPG_BUS_MCPU2_MSTOP, BIT(15)), 0),
+	DEF_PD("pci",		R9A08G045_PD_PCI,
+				DEF_REG_CONF(CPG_BUS_PERI_COM_MSTOP, BIT(10)), 0),
 	DEF_PD("vbat",		R9A08G045_PD_VBAT,
 				DEF_REG_CONF(CPG_BUS_MCPU3_MSTOP, BIT(8)),
 				GENPD_FLAG_ALWAYS_ON),
@@ -365,6 +376,10 @@ static const struct rzg2l_cpg_pm_domain_init_data r9a08g045_pm_domains[] = {
 				DEF_REG_CONF(CPG_BUS_MCPU3_MSTOP, BIT(7)), 0),
 };
 
+static const unsigned int r9a08g045_no_pm_mod_clks[] = {
+	MOD_CLK_BASE + R9A08G045_PCI_CLKL1PM,
+};
+
 const struct rzg2l_cpg_info r9a08g045_cpg_info = {
 	/* Core Clocks */
 	.core_clks = r9a08g045_core_clks,
@@ -381,6 +396,10 @@ const struct rzg2l_cpg_info r9a08g045_cpg_info = {
 	.num_mod_clks = ARRAY_SIZE(r9a08g045_mod_clks),
 	.num_hw_mod_clks = R9A08G045_VBAT_BCLK + 1,
 
+	/* No PM modules Clocks */
+	.no_pm_mod_clks = r9a08g045_no_pm_mod_clks,
+	.num_no_pm_mod_clks = ARRAY_SIZE(r9a08g045_no_pm_mod_clks),
+
 	/* Resets */
 	.resets = r9a08g045_resets,
 	.num_resets = R9A08G045_VBAT_BRESETN + 1, /* Last reset ID + 1 */
-- 
2.43.0

