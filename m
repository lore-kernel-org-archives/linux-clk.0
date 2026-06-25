Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2001374A04
	for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 21:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782424683; cv=none; b=f/kpDa9um+OLAfVcvqP0BTkZiQjMkrrym9GqZ8PsPHfSOx9J3TSVmlNoMdHO9PPUXBDYAYSosiQTh5kKT7O257wHM8bBSPEq4xH9bMKErqDU2fRqwTwdWVm1+36x9DWh2KwFzyUqWYpAgrU8sSPIh8rM9lj3sAaY5Hecto+dSjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782424683; c=relaxed/simple;
	bh=0ZSQQbQlHxoXzemDFX3axkGdUl2KuG/88n448GyArfI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BXmOQw/gRSB415pv9rX0S/71CD2TAuO48Fu908mhYmYQsXAEKOKWqFBrhQqwGQXykb0GQ/vivmPeHMcRRRyErcoGrcnkcdhFHMUfHm3y9cmgmcf0P1vZvojy+lanbjtlNdCbuqxu75ywPhVETZjWBLiMG6izV8u1HBbcMMA9sZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g8c6a+AE; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g8c6a+AE"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490b9318997so2552175e9.2
        for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 14:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782424680; x=1783029480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uZznG8nXpNdUsgio0AWCkV/jSav7ySTRqhFzl8X19lM=;
        b=g8c6a+AEwgFmJNfumZy6IJ+Gq32+4GbdUiffTFxpg6Of3Vxl4ANW+i7z4G7nwzt0o7
         Qq9VPRshMY9XDsKRc7+IMsjKkAog3zDVIfuxt3SzisNyDSr4xQp9NRuKIeq50bV00dcH
         9fSph73MAB1LAKbSiMC6xCav//9WGzO3L+p+VdyLfSSuam7i9J4r8jGWPOKGAm/ssaHo
         oSliPHKxyE8FXhJidC6ZVFU9XiVIszQXCA+xx7PIOSjDxCb7nSn4ks/7aHgr1nj2AMZD
         +RqMWfpkzQutaYt+fuhQPd2TZ3xferMwIFNdKxUv/slmMRbfD0JwEyoQ2q7W82b7t2KB
         OCrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782424680; x=1783029480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uZznG8nXpNdUsgio0AWCkV/jSav7ySTRqhFzl8X19lM=;
        b=HBe5lraE+JyEGj+sEdx6/3Axd5RbPgik5/Ye8titnWfRnOktpoaJs1HnEpMhn16E8K
         C1twShn7n6bVGl8ag/RkLLxDIe6kwruPRw8HMngndzIWvQaqgfZrQ6BotQ8LZYzteL5E
         KTP5tM2P2HYDas5pE3F8d28yxx8EfvXBF57GQzMMVcoBI0QdZzbkwaN5DBf9AjxtCc7m
         DJ3nQdOtDGE2SfvkV3bcP0MXWphlPLMRYRRtdl1UKhJYm7TIdCF3vNCws9qJDJRITRc6
         wyKD6nUW7wbLErm41pNLsYIYXdqhifKg+UoZrHezY/w5UIMdENyp/yMSR2inTddkOJ51
         0YKA==
X-Forwarded-Encrypted: i=1; AFNElJ87jWAYEGXZhVyamHpAx6dNkAp+XwEitr51HpXL5xf3pnmkfQkKkuZT/PQVTzuZD3bIP2lX3pf8EI8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTgEEhYP0HZihwlWPEkaGCWQJDH8xx/ylTKDQozTUawGf8AYG6
	fe0akk0aiyuXxGROribk/Bva90KVGYMsqp6H+dJHynih7o+bpsG3P6Yp
X-Gm-Gg: AfdE7cldw32jn2BWy/Z1bDry72oL9tP04sjSELIEPJ7BQ6lB0mVuCVLtO4BAoug605z
	ujwawwYAMVOFI+ML0uf5NkLzt44GotWmtgXmKuKhaS7iLxIxlqX770fI2KXNExwbC53Uia8pmmQ
	UMKHz1FQsD22+wjiQCEs9DoTQmEe1sJJ+fsy2PPYORaXOnCddsC3T06yLAVdeDCiKBQC9SGxguh
	eiINasWt9gtSadpaprFixj2UwKHJaAUHi8ZwDcsrhZb/pjnUsEr7RUfp7twEu3JQjHNn/UiBOEw
	0UYmU2jgKopvPVX836btVFbmrucrdsTbd8pOD1+oqkEB2BC94EcHyiDXRY9WMskD21bKxZ5Fs3e
	GVxqfl1/W1Y94O3DWhvMKlra9v0LM/s8gn+5HK1g6qrNFTzjwiyX4FtDl2LHtv6ANz7GqZYfnwJ
	nqsRFh2abXivZAnZA+3RtF/SGeR/OMBkqAWy0n/qee+vZoD8a+lCDB+2Nv9fz4y7tfV+F2YTvyI
	oSAMpTYjVjp
X-Received: by 2002:a05:600d:8444:20b0:492:1e7f:d41e with SMTP id 5b1f17b1804b1-4926685aa04mr49083755e9.10.1782424680236;
        Thu, 25 Jun 2026 14:58:00 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-80-183-219-152.pool80183.interbusiness.it. [80.183.219.152])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-492690988e0sm27339185e9.14.2026.06.25.14.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 14:57:59 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/4] clk: en7523: add support for dedicated PCIe PERSTOUT reset
Date: Thu, 25 Jun 2026 23:57:35 +0200
Message-ID: <20260625215741.3253212-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260625215741.3253212-1-ansuelsmth@gmail.com>
References: <20260625215741.3253212-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for resetting the PCIe lines with the PERSTOUT reset. These
special reset are controlled by the PCIC register and are specific to each
of the 3 PCIe lines.

Notice that reset logic is inverted for these bit where 0 is assert and 1
deassert. This is intenrally handled in the reset function.

PCI enable/disable are updated to drop PERSTOUT bits in favor dedicated
reset handling.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 1ab0e2eca5d3..a33cf2e1b76f 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -338,6 +338,7 @@ static const struct en_clk_desc en7581_base_clks[] = {
 static const u16 en7581_rst_ofs[] = {
 	REG_RST_CTRL2,
 	REG_RST_CTRL1,
+	REG_NP_SCU_PCIC,
 };
 
 static const u16 en751221_rst_ofs[] = {
@@ -450,6 +451,11 @@ static const u16 en7581_rst_map[] = {
 	[EN7581_CPU_TIMER_RST]		= RST_NR_PER_BANK + 28,
 	[EN7581_PCIE_HB_RST]		= RST_NR_PER_BANK + 29,
 	[EN7581_XPON_MAC_RST]		= RST_NR_PER_BANK + 31,
+
+	/* RST_PCIC */
+	[EN7581_PCIC_PERSTOUT0_RST]	= 2 * RST_NR_PER_BANK + 29,
+	[EN7581_PCIC_PERSTOUT1_RST]	= 2 * RST_NR_PER_BANK + 26,
+	[EN7581_PCIC_PERSTOUT2_RST]	= 2 * RST_NR_PER_BANK + 16,
 };
 
 static const u16 en751221_rst_map[] = {
@@ -635,9 +641,7 @@ static int en7581_pci_enable(struct clk_hw *hw)
 	void __iomem *np_base = cg->base;
 	u32 val, mask;
 
-	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1 |
-	       REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT2 |
-	       REG_PCI_CONTROL_PERSTOUT;
+	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
 	val = readl(np_base + REG_PCI_CONTROL);
 	writel(val | mask, np_base + REG_PCI_CONTROL);
 
@@ -650,9 +654,7 @@ static void en7581_pci_disable(struct clk_hw *hw)
 	void __iomem *np_base = cg->base;
 	u32 val, mask;
 
-	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1 |
-	       REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT2 |
-	       REG_PCI_CONTROL_PERSTOUT;
+	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
 	val = readl(np_base + REG_PCI_CONTROL);
 	writel(val & ~mask, np_base + REG_PCI_CONTROL);
 	usleep_range(1000, 2000);
@@ -754,14 +756,21 @@ static int en7523_reset_update(struct reset_controller_dev *rcdev,
 			       unsigned long id, bool assert)
 {
 	struct en_rst_data *rst_data = container_of(rcdev, struct en_rst_data, rcdev);
-	void __iomem *addr = rst_data->base + rst_data->bank_ofs[id / RST_NR_PER_BANK];
+	u32 offset = rst_data->bank_ofs[id / RST_NR_PER_BANK];
+	void __iomem *addr = rst_data->base + offset;
+	bool inverted = false;
 	u32 val;
 
+	/* For PCIC reset logic is inverted, 0:assert 1:deassert*/
+	if (offset == REG_NP_SCU_PCIC)
+		inverted = true;
+
 	val = readl(addr);
+	val &= ~BIT(id % RST_NR_PER_BANK);
 	if (assert)
-		val |= BIT(id % RST_NR_PER_BANK);
+		val |= inverted ? 0 : BIT(id % RST_NR_PER_BANK);
 	else
-		val &= ~BIT(id % RST_NR_PER_BANK);
+		val |= inverted ? BIT(id % RST_NR_PER_BANK) : 0;
 	writel(val, addr);
 
 	return 0;
-- 
2.53.0

