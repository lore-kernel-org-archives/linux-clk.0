Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61973B83E8
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 19:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784833317; cv=none; b=FHDaEWHRNdykIjWMXZzi/MJB4pucd35RqAg4uVDc+RVyteDxbEGXdHWJVWVjhYRoBGA3yNiZlOngPS/lF1LCP81a+EdF0wgTT+TpT9j1zFr09IezGktCvYoujE6LEJEw+ZCB2jp/RGSrRe8BR04kraYK4uIaZJlduRQB/IqyO1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784833317; c=relaxed/simple;
	bh=dxyVUOhyUCwKQI9L9T93o4SkWNAynjxH6x7zP/jwkdo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GlhH/nihZ2PJY6lfDcr2q5G2c3buJDAnvkgUmHxkKCMjMtzuuNnYBQRG8R4NyVDT3cGi+tah899uEqB5O73bvUa8Dec/E5Sua7Y479JbCJ3m0h4r3IsBndbTtEgWneHLH4XPZ/EcUAXtqQ7bD1mIsSXITtr2SNu8CkDStPaJl5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bU+cZsJh; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bU+cZsJh"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so886319f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 12:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784833312; x=1785438112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VbjSj1FJc/37XhN1xufw4wYZyGvnI/BuNwtSoHqxosQ=;
        b=bU+cZsJhDzFDZGSjDSJunT+vyrJ1au8u2X/xtyFjVFZQ64DgAg7VDRROtaQvfq2gpn
         X4CMkSMN6Z0tqAM9ItizSPsR5mPaNUk654TTSehDdN/0jzHyG1w5NlwFdispMQF93xt4
         hes74hzp4Ls42+VDBTQdDoaWMPN1KTGvvCT2VyeAsjJ72Ts64WGyR5Gi6kONGIPj+je9
         md/eZJCjQzZwj76TDWHvkbhMXMQwfz+EUBWbj6QAQcTHcqxiwxLuIP20bFilRXR4dMFu
         rvQSWkovTNIGNmhy9Agme77Q9SA/f/xss3+EZ7lPsoR7IoEWUbWeXSH4XMtkP9C63VGS
         7nlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784833312; x=1785438112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VbjSj1FJc/37XhN1xufw4wYZyGvnI/BuNwtSoHqxosQ=;
        b=kmwK5nctg7+vcYdrzgG5Fufj7r24IB9O1B8zpoaqHtzzSXhgFTda1GADg/wo7VIyKm
         wKvhdwq2/Jchy5QNdNRa2w/QN9uqtMxpHfhZU3m77NklLxWWlZCgHHIduYAmM0XLjYHN
         5tN+tiMmExUEo4d1EOfyDvP1tZ93UPQAcwQoT/0ha4FtbYLGXMkhHIdWLpJlLSQ5lEsw
         aIxPZx1k1XPQ9+O0sM62eJ1uwz/2qtELwzIs+3zs4RRYQ4AMKAffsLApIRfwb+TQeTyg
         uXY0d54s0aFUDdHu8+XbeCWlXcxGr4AaBA/njJ43IFcNSdp6Afj1d2HJNAkS52ZVRXbE
         krQw==
X-Forwarded-Encrypted: i=1; AHgh+RpUgI8uMEJ1zxY1qlpap5HTiUIxfTgkJuDOmsN+r0Othc06wavb8uVn60ZRWC36uYnleBsm5ZaXjNo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5f5QbMAAL3MyOQf4qqnpEh3z3NxUX5pCnkHdGPYETJLUvqt0k
	7snNdHSUbQeXAUaMWHspOqeof0pfvUq1OsOQlIKt3vV02dbYFiGGq+++
X-Gm-Gg: AR+sD133fevSVnIzrOCBWnNyMqe3omGaMeGsUP4Vt8Ry2uat0OxAoU1VUobjlVAN6ws
	zcugnMyXviix5GF/zSl1g3aBTLdLNH32yrRQ95aIg2wrEFkUgynR8nW5eOurBFyfFu8NSts0qwQ
	/MSv0cyVea/CLN4wGMtDN6yS/B5nLE8LNzQ8sclag7XdTRlHYFIX7FFQbXg48VwRhf0ALWPmxcZ
	JjCpvAosQG9lZLbxKeDs3QPnE9eGKNcC45OeApHO6gzjSRyRmsTFMWb2biw/A/juFkYETm4BIbh
	f9/RDAYzKpsSQUUaBVmKy0Q8znm96wCUlNzJ19mJz+S0aFL2gpBap4WmQ+NBMLryNCJQwZocB2i
	V4i1TanF9xw61Vft35Kz0aTh+JwPDZpQWgO3Tvo/ahhCM9RRpVi8eXPzYYxqPydQX/Bltu1K+GS
	bxlOtgU8GLI+3QcT3/pxVlPk1aDSb3aeNnnj6OG1Yh2E7Ks7fQrRJdUCaTrg2k4JRD
X-Received: by 2002:a05:6000:1849:b0:47f:7e7d:eb0 with SMTP id ffacd0b85a97d-47f8d71f831mr6174123f8f.19.1784833311710;
        Thu, 23 Jul 2026 12:01:51 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-3-249-180.retail.telecomitalia.it. [87.3.249.180])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5d9sm16912197f8f.5.2026.07.23.12.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 12:01:50 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 2/2] clk: en7523: add support for dedicated PCIe PERSTOUT reset
Date: Thu, 23 Jul 2026 21:01:31 +0200
Message-ID: <20260723190133.22577-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260723190133.22577-1-ansuelsmth@gmail.com>
References: <20260723190133.22577-1-ansuelsmth@gmail.com>
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

Contrary to the dedicated reset register where 0 deassert and 1 assert the
reset line for the related bit, for PCIe PERSTOUT reset in the PCIC
register, the deassert and assert value is swapped, with 1 for deassert and
0 for assert. (HW have these bit set as 1 by default after a cold boot)
This is internally handled in the reset function.

PCI enable/disable are updated to drop PERSTOUT bits in favor dedicated
reset handling.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 36 ++++++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 1ab0e2eca5d3..2f53e0b42ead 100644
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
@@ -754,11 +756,17 @@ static int en7523_reset_update(struct reset_controller_dev *rcdev,
 			       unsigned long id, bool assert)
 {
 	struct en_rst_data *rst_data = container_of(rcdev, struct en_rst_data, rcdev);
-	void __iomem *addr = rst_data->base + rst_data->bank_ofs[id / RST_NR_PER_BANK];
+	u32 offset = rst_data->bank_ofs[id / RST_NR_PER_BANK];
+	void __iomem *addr = rst_data->base + offset;
+	bool inverted = false;
 	u32 val;
 
+	/* For PCIC reset logic is inverted, 0:assert 1:deassert */
+	if (offset == REG_NP_SCU_PCIC)
+		inverted = true;
+
 	val = readl(addr);
-	if (assert)
+	if (assert ^ inverted)
 		val |= BIT(id % RST_NR_PER_BANK);
 	else
 		val &= ~BIT(id % RST_NR_PER_BANK);
@@ -783,9 +791,17 @@ static int en7523_reset_status(struct reset_controller_dev *rcdev,
 			       unsigned long id)
 {
 	struct en_rst_data *rst_data = container_of(rcdev, struct en_rst_data, rcdev);
-	void __iomem *addr = rst_data->base + rst_data->bank_ofs[id / RST_NR_PER_BANK];
+	u32 offset = rst_data->bank_ofs[id / RST_NR_PER_BANK];
+	void __iomem *addr = rst_data->base + offset;
+	bool inverted = false;
+	u32 val;
+
+	/* For PCIC reset logic is inverted, 0:assert 1:deassert */
+	if (offset == REG_NP_SCU_PCIC)
+		inverted = true;
 
-	return !!(readl(addr) & BIT(id % RST_NR_PER_BANK));
+	val = readl(addr) & BIT(id % RST_NR_PER_BANK);
+	return inverted ? !val : !!val;
 }
 
 static int en7523_reset_xlate(struct reset_controller_dev *rcdev,
-- 
2.53.0

