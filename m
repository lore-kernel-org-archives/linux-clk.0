Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88E03AEB2C
	for <linux-clk@vger.kernel.org>; Sat, 27 Jun 2026 12:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782562506; cv=none; b=Jhodoxy591QLQ/mU9JrCeiMQLTil2VTjlI6tnqPZImBsaYc8v6TRlh/f17XkNkyC4loMboYiCH9OiiZCFmi1OwAUPwHCAGe/WfI3WAYzztFgBcUfK5vhSGSmP0rEU9IkPgoRslzoM3FbGvFV2eoq7pLft7HrHu7SvtnTqdosMO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782562506; c=relaxed/simple;
	bh=eCjKiSsxMp3e7aAVuQZl2wQDtfBKEbKNnbzvbF592Vo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fYIIwFxnrDFUQLQUKo0+gMuPOhuNS4CXNvmPXVMzPsc6pCLUZJzmRwI6OFlvB3AiJvzYYuwRJnIgul1V3avijN24buCAsPZGbGQvnqSSD+JjCL+4YB3yNpj75+jFwZJCfhKpBjKA4YJQUPgC+5lOGOSPiAhM31YZJP2TiWm7/UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=onW1Zxnj; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="onW1Zxnj"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490b3637b90so11677435e9.3
        for <linux-clk@vger.kernel.org>; Sat, 27 Jun 2026 05:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782562503; x=1783167303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oqp269fPqkkP0y4F1qhxEIUZdEYzw+E7N13spqrG24g=;
        b=onW1Zxnjm/SHXdOCYYr6ERHsg7Rk+AgzfZYKu4plkq53gY2BLFHuJvcJBJWVgmx/zk
         0d/kugJjjyUB4v93iZAym7b0a6+rhei0GiMzX39Nwdj1XonRP1MnPG8BrxdDjCA3lDQt
         hepg+i0cjKdFHhLKr9FQQWGpgNmsoPbl/c7cho6lUeg1WorVvse5mREJ0pp3lmZsy8Ku
         GKIvAQVH0HlemKHaCI9by24aPHlDyA2TMTxkbTeIo0QF9/hxY/rNjTTzbs1yT/a10tU5
         T2riE+ZgvAc/owUZ6vrtUlAmJy0dehC626IivVI9Wwo6Tin+jhEC6q7zu8Z05j7VqkRg
         jijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782562503; x=1783167303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Oqp269fPqkkP0y4F1qhxEIUZdEYzw+E7N13spqrG24g=;
        b=lsFj0wJIpxqgZ+LaNO3CRdulFplSHhNGQSlPVjrSGgnF2+AqGu47f5eckAS0lY7jib
         3NjaUHxE41OenPJNBBbAqG5EIP+ydtlq/1oTFQFUdsEG918aEZ/SBeKDbaaWJEFuVFt4
         K2N5//B1Qo2jku62CyhvfDR9z/AOfF9crjKnYRpFkLYDUCqalqt8u3NwD2xHkHwRfd3e
         xZjAoo4R7wQxXpMD/7jG3xcM1iZYuJVKAS2yR9HsnqsNzEANdjB5Tf5ABc68j97DsdoR
         RG2OCuWMiagx482A7h5gC9ww/1j6mrQ48Tdc3kv/7RdyqusRt2p+w0p8NpuW5hdxX2VU
         OXcQ==
X-Forwarded-Encrypted: i=1; AFNElJ8iAZFsrVKsYUmY95hqfAT7UdOfzaSi0QfWOyZjxOVYzr1x+lnYHKsdXqfrw7cN1WWTyonIrHcDMQs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+5oc2O9YqWPHZmtSnqaaJhy9sc16yT0KBrADqOohR0oxFAUuP
	k0yurUnVPircw5KKe6wFe08VrHNHJoXV2bLnUF7zEqyiucNhU43W71u9a9JwVC5D
X-Gm-Gg: AfdE7cmxLnqp6bk2KTcJ/I7IkU1Tv2gEsL4hCS7lnhH6jCTWfEEdDGpg/HS8h0v7opt
	o7O1ZFrwuSmNxfhoNOBVYgqkjvPidVsrMYNYE9UlRM16PLpUl26dxRRHi2Ge7+S+N+w1JAJCBc0
	CLp+GJn/l9RsBqUa9ZgD3xmHfjfm45vg5q2CbVg5+MSPzRKeaqr49iB8d6yGinUAJC/wBPTJ1tE
	pTOcrXKvFfG4/6IIiiAAxVKul8okAXKRH4FQQo4+tjtIwUGcWerji6HyZQay6Sq3VfLqROX4GgL
	4PnyCeZvmZrnv7mnF/DERmj+egD+Ooz9V3Unhwx6Dcmp9Y/a58Eun9mGRQ1vSJS4omqpSjXW137
	lkws/yaxlqrO1dxcbkm/WZ2SbaZ/r8XWyozNzz7vU8iLiGshCcj2kn7OIVgM0Mah/mUABKshZB6
	5AjTiVOdQBdTW7iojE5VcxBRdnOWucvWlw7jrigvx/R9sbgS85vhzplUypKGrlHw==
X-Received: by 2002:a05:600c:4fd6:b0:490:be14:bfda with SMTP id 5b1f17b1804b1-4926684a3cbmr149652815e9.6.1782562502910;
        Sat, 27 Jun 2026 05:15:02 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-89-195.ip49.fastwebnet.it. [93.34.89.195])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49269002511sm149028265e9.8.2026.06.27.05.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 05:15:02 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
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
Subject: [PATCH v3 2/4] clk: en7523: add support for dedicated PCIe PERSTOUT reset
Date: Sat, 27 Jun 2026 14:14:43 +0200
Message-ID: <20260627121450.3529133-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260627121450.3529133-1-ansuelsmth@gmail.com>
References: <20260627121450.3529133-1-ansuelsmth@gmail.com>
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
 drivers/clk/clk-en7523.c | 39 ++++++++++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 1ab0e2eca5d3..c9b21d9bf2f3 100644
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
@@ -783,9 +792,17 @@ static int en7523_reset_status(struct reset_controller_dev *rcdev,
 			       unsigned long id)
 {
 	struct en_rst_data *rst_data = container_of(rcdev, struct en_rst_data, rcdev);
-	void __iomem *addr = rst_data->base + rst_data->bank_ofs[id / RST_NR_PER_BANK];
+	u32 offset = rst_data->bank_ofs[id / RST_NR_PER_BANK];
+	void __iomem *addr = rst_data->base + offset;
+	bool inverted = false;
+	u32 val;
+
+	/* For PCIC reset logic is inverted, 0:assert 1:deassert*/
+	if (offset == REG_NP_SCU_PCIC)
+		inverted = true;
 
-	return !!(readl(addr) & BIT(id % RST_NR_PER_BANK));
+	val = readl(addr) & BIT(id % RST_NR_PER_BANK);
+	return inverted ? !val : !!val;
 }
 
 static int en7523_reset_xlate(struct reset_controller_dev *rcdev,
-- 
2.53.0

