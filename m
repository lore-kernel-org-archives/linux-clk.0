Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45C122A813
	for <linux-clk@vger.kernel.org>; Fri, 30 May 2025 11:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748603992; cv=none; b=jamOlE2sWX1yru3s8AFIf4bSpgpD/BoGawbVqogGOk8EzyNIo5YAYM9mHzMTkCyVvgDEt7jV+BuQONmZM0keppiKQpSitRL7XgX/ELZf/PGhIxkl/1XarDewGdTDbQ4jUYTVztNtf525gFJtqqy9qoDzk3i66yD1pYBxfktniyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748603992; c=relaxed/simple;
	bh=Ah7Z+DsWBX06w3bVvtMO0K5BDNvk6TjZ7R8qbml2dpM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tGwBnibUqNXDNoFNEgVHBxLxdbbLRT5G8YTE2WF+kCIrZsBq+AFT4qqm8j9HKR02+X4m7A1DG4bk1wyxRtH2P4rOMfKRLnPngLMxOXCRKK1jQrYH5PSA7Qr38AWY6M7a4h6MNadJ5dJPTpzPzwkA7K53ThTn/ZybcMZuR10pEfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=DjpVjCES; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="DjpVjCES"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so1965407f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 30 May 2025 04:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1748603988; x=1749208788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJ/+G+AC3goiMLAvY8TZZVygk03XZkoKHyxtdwV9Bko=;
        b=DjpVjCESWVc0Bd1YTeQkSuYLD6nXwsQyhHj0r20Nam4ljGqxhIFc/xaH3O4lnlEgTI
         eWLS7i+0uGEnmpQFva5kbbmlnGXt+WB4ktVk3s/Xq190MupoyXKkWBQNposG8m6xfId+
         ggHGPu1iK1SxLp5KvSCcjHhpLoR6C340WgEsek4oxWJTnUP5lP8IeNQ7EHsfx8w81x2a
         3eB+aGjk6rD/zOQzk9Wpse1wu5lxlwyBAfC5NJ1RdQyGp2NK+oyZ7jeEfY6BpGR4CXWb
         eXgtuYxaAai4JHU0Zn4H2LjHBx55aZelEZF+i1nXotaHW9TvOZb+69UKSWf3OH32JTqQ
         aJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748603988; x=1749208788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FJ/+G+AC3goiMLAvY8TZZVygk03XZkoKHyxtdwV9Bko=;
        b=AZHCiS6gpt4WYUivlT+9UjxmUGVgG2Wkdokld1+uCKgl5RrfUnNKr+zYdEolxR1XTd
         jMmRwchh9+9zTvueFrxJSN1gShGJvn2qx+n8yMcWFoFZfmjBrcSQjJ7D0gTvoRYWoVmn
         +jLRz+R7ls8lC94WK6gHk9kNNeko0f3prey3kfSjg8Mfk07qGAxoaeD2q8n+3XRPNxV9
         lV4g7YJgUze+Lq867HqY+dDbXaEKCeesw+psl78YVyViyFTzPYSO+M7gOr/NidFRIBcf
         LmrP8keZ0SeUFwprhEsw4c2xRMgPkXaNsaEXPLeWjUtgGztKxbPJZxc2b1SofT96bFaL
         +KQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMsUIBdpny0bmyDVxB6g+u+C3qvbILX0IsRgXsYyZnFzHQYfhZcIuLBOe2J0N3ZdnncUHNhf6lWbE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwehZvhnrKWjgIn6H696n5lNeZvGGsDlh90TxT9Ra/m9BZ540lH
	Lf3jrzxik/H8sG8Tl8EileikoKiTKPqiWTx8cQjRMtxlE5LT1+daj53xtoo+dsHhxG8=
X-Gm-Gg: ASbGncuoOzBiH0piY1wJeyigKxSgOv4rXkk8tnKqsJU0JzBLpzMNL3WWaRdDrFFVw61
	1vcsfVyjbOC55NPcsJvchQLT+jcJ3x6EtyHNn2Iqkvaq4+bwf/oyrmo0o63N/BfWyX+RpY8JCez
	qg4FV2S/B8SxXSUytxpt5daYD7m9hbP2szi9RfvgEWq2vcM1F1I/9KWSyC4T7qAij/eT468eBzH
	53fbMOFPCu0uZURwMvB6JN6kXBmRkmOzOAUMxF9DUOv/zSOI2WLpfHVY1vcGEID7ILDA5YNJ7/9
	XF344b0QU4DoXAvszoxWvOfZgONyHHtWnDkovDkwEo2VBAtxuMNyk9caHhLupqbnZt5ReU8Eda8
	9JhQq/g==
X-Google-Smtp-Source: AGHT+IHmpme3ASdZjXhpIgvfrfPC8BzS2kR2b9/W6J51HT2LhURSK9ofZ+2PJlI42CY77vECWpRGwg==
X-Received: by 2002:a05:6000:4029:b0:3a4:da0e:517a with SMTP id ffacd0b85a97d-3a4eedb8a81mr6645254f8f.23.1748603987781;
        Fri, 30 May 2025 04:19:47 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450dc818f27sm3986435e9.18.2025.05.30.04.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 04:19:47 -0700 (PDT)
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
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	john.madieu.xa@bp.renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 2/8] clk: renesas: r9a08g045: Add clocks, resets and power domain support for the PCIe
Date: Fri, 30 May 2025 14:19:11 +0300
Message-ID: <20250530111917.1495023-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530111917.1495023-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250530111917.1495023-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v2:
- none

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

