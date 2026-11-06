Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793966346;
	b=tstSj9IToy/f5tNQVr1660CmpLBighto9GDFW+RvwWhTB1XVaOodYU8HKkKI45EpLiiC
	 njhHudk/sA0R6fVvZjFirY6eDVHkoK274xtnIzrfQ2M4IRP6LtVJBgmcxBHXU9mkAGqnH
	 xAfwaYBHcEpua/FZGIWOWT1G9VO1Nh6uMoSfUfAsJlJCPI57fAVt10h58X2OKWwlo4y/u
	 Tng54qUmxK/a83EFA0a1JOulIGQRvzIWDkScLbEjK8zmS3AftMXESWWsphKSLbhhm9KpT
	 W8/HFqdk+BbSHS82fi/6mM3WAL6Z5lcnA599zSG5sk1GiyjGbec4xrRp1vExi94tO3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WGW8qD+JMmv5f4+Iozi5uP2JfSMZ4/zLAzV9gW8MJ9c=;
	b=kqUy/ij3NKP+hIffqla198ZP+otXhiNFHlpxnDEydnphbnEAiyCd3UNECOL38QrqJcWc
	 B8gXC0wUqwQzTjvUXDR410Z+i632waP9s4EXhqRaITy6qL0+J6++ybFj1YPFRNYHE1wu3
	 5T9l0zB6fEwfTeaW1TqMr69iNZoO2e3n9HoUK5rVmB9Wd0Ye5QW+QYoBucP5uvsf0HwEO
	 mtLX/2O5OCfF87tMBn4XFRRpHfjlv6jp80953AE9asGrDzMNhsyroqiBS/8P9hod9jtPP
	 Xookn8qcbmgC4op+gwxk5xPVEGaTjRqKa8d1kTwDvB0o2RfWpSasH4/2xiW7x3esyyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ksjWc/xL";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73501606D818
	for <linux-clk@vger.kernel.org>; Fri,  6 Nov 2026 11:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73501606D818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ksjWc/xL
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so4598465e9.0
        for <linux-clk@vger.kernel.org>; Fri, 06 Nov 2026 03:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793966345; x=1794571145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WGW8qD+JMmv5f4+Iozi5uP2JfSMZ4/zLAzV9gW8MJ9c=;
        b=ksjWc/xLuwcNrgcBVFleerWYvoVfpdIIRX0YSPvH4MFuwO5QpwXDlsPDtTSSNsrYxD
         Y6SSt2hPYsquBibslngGQwC3s0B/Mh+7G5serEKfl5RiMFuCnIOlRKmAcxWg9yNVrW0a
         i8Od5P0snQxwZytdL1LtqzPKZitp8Zw0vBcnYUFqBWGRjiyzz2pgc/5BOPpuzFxNJzTQ
         7A9lKu7Qhg7NLzMFcIIsEz484omFKD4PfelvCx3m12WZ7lppCk+UhW+l3kf9HS5Vjwly
         CjFk/eHqoW3EcPeZhn5vDkeLrq0x+FdsLfEFoxDKhY6LqQkzU0ES3kV+SA70f7rH0egc
         1ywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793966345; x=1794571145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WGW8qD+JMmv5f4+Iozi5uP2JfSMZ4/zLAzV9gW8MJ9c=;
        b=uKmpy3YJcb/EjUDm3tK8Ys8db3nB5eXdbjO2Owy/tnnn+1onmjneX87+f32FmvGwa+
         enz9y9gfQlHB8QIo7R5aTkm+t5JChNXWfcStUcr5gZKuf8BgcXAFVNACLHxzkndgjhFn
         yxecVPfeaBNUUfICOOvv8T+jYB/azFONOePbyHepLhxWtbNF1n/GloqwVjhQbZAYZFqe
         zwMjgrHNGlOMs+YTPhIGzkK+ZEEHzVtzGZzCAPhS0HlzayaVivyN0MHnjusIEh9dYWon
         LQjQxY404fG1NOBSL7nXRDe9ltLwEDVbAwVl5Noe83SJKLJEEbebPsTwKAtwXPz7GlVB
         uHqg==
X-Forwarded-Encrypted: i=1; AKwUvBzvGmZWPIasXFGPL9YJJ8gaOeBWCKRDCpJDio7ckGGj6uHhByCCx5fGxu+7INeV3ukUBthKafF921Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JXFpRiP+YFgciHxfIXdiJRSMguazqSy9VHbDhn8cAwg6AcBDk
	NTVbTA/YQIZx4PvTP9dBH1vGG4efauLkp8+Wb5W0yfl2Xf+o4xgzLI9S
X-Gm-Gg: AYBFou3+TK038Bk7xxi2G9ewdl++bukhbcy8IwjZcg+FL2d7Kltk1boxKMShdld5oKm
	u6eFmUVnINopx3tGnR28HKQQEJPPOcr1UUO0rHren1FlIs8w+GAELp+qbIgKL7HiZwfA+Hve2MW
	riTXEc4e/xIGvSy+YTlUaJBjvqgRaB8CYPlmdTPXzKpdgrNadGcVHaH7BQRkh2hVyRkWiHA8Gqy
	s9LS2eN2i/+ZPqsz/yS/qMOc3oJIv3PoMRcYPFESEGJoug5Pb7LA0qE2KYOmpgZHLF8xUue8GKe
	kjgJ+OnmO0JI+q7q8i4+fopR7rcPCEqO4PSEQPWe/zr7gS3Bh0uxF9AujZ8fe3VqrPzaUXygLFs
	YLEsIi/7ZzPAM4IaWZSoSoFAHmlQeIzLgsy0POiO1dtrLLlqjgeR9vnB1HVFPO8VjoKTeZ3mBYB
	o9D/6WHOxFFM+ZXtLU8egpn8HwO0ix1EsuMEWFYyV+QfTMFbrqgHlo3It27l108NYZGtDaYdX+W
	nhs+MF5oU22SXnOdS1AScQ/icl/vYzaXGjahxG91Aff7We2ly0XWlINLxyV+plPImaPGSLl+w/0
	Ghheo+ba9YUtWr86s1+r08dQwPHRnDvmQBWiZmnEo2saVcWmIKnyo0Ex0JGFv9sqzQsvHKu5diG
	NZXAOlb6NZtJu3xpq58LSxDV5WbXA2LbrRQ==
X-Received: by 2002:a05:600c:a308:b0:4b7:6b0a:a2f6 with SMTP id 5b1f17b1804b1-4b76b0aa492mr6846155e9.21.1793966344650;
        Fri, 06 Nov 2026 03:59:04 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b76b5d52a7sm4849775e9.1.2026.11.06.03.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:59:04 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v11 3/5] clk: en7523: protect concurrent access to reset and PCI register
Date: Fri,  6 Nov 2026 12:58:48 +0100
Message-ID: <20261106115852.189098-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261106115852.189098-1-ansuelsmth@gmail.com>
References: <20261106115852.189098-1-ansuelsmth@gmail.com>
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

Use spinlock for concurrent access to reset and PCI register to catch case
when clock is enabled/disabled while a reset is also operated at the same
time.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 86 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 84 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 2baec734df9f..e534a5c91e61 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -577,44 +577,87 @@ static u32 en7523_get_div(const struct en_clk_desc *desc, u32 val)
 static int en7523_pci_is_enabled(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	struct device *dev = clk_hw_get_dev(hw);
+	struct en_clk_priv *priv;
+	unsigned long flags;
+	u32 val;
 
-	return !!(readl(cg->base + REG_PCI_CONTROL) & REG_PCI_CONTROL_REFCLK_EN1);
+	priv = dev_get_drvdata(dev);
+
+	spin_lock_irqsave(&priv->lock, flags);
+	val = readl(cg->base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
+	return !!(val & REG_PCI_CONTROL_REFCLK_EN1);
 }
 
 static int en7523_pci_prepare(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	struct device *dev = clk_hw_get_dev(hw);
 	void __iomem *np_base = cg->base;
+	struct en_clk_priv *priv;
+	unsigned long flags;
 	u32 val, mask;
 
+	priv = dev_get_drvdata(dev);
+
 	/* Need to pull device low before reset */
+	spin_lock_irqsave(&priv->lock, flags);
 	val = readl(np_base + REG_PCI_CONTROL);
 	val &= ~(REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT);
 	writel(val, np_base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
 	usleep_range(1000, 2000);
 
 	/* Enable PCIe port 1 */
+	spin_lock_irqsave(&priv->lock, flags);
+	val = readl(np_base + REG_PCI_CONTROL);
 	val |= REG_PCI_CONTROL_REFCLK_EN1;
 	writel(val, np_base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
 	usleep_range(1000, 2000);
 
 	/* Reset to default */
+	spin_lock_irqsave(&priv->lock, flags);
 	val = readl(np_base + REG_RESET_CONTROL1);
 	mask = REG_RESET_CONTROL_PCIE1 | REG_RESET_CONTROL_PCIE2 |
 	       REG_RESET_CONTROL_PCIEHB;
 	writel(val & ~mask, np_base + REG_RESET_CONTROL1);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
 	usleep_range(1000, 2000);
+
+	spin_lock_irqsave(&priv->lock, flags);
+	val = readl(np_base + REG_RESET_CONTROL1);
 	writel(val | mask, np_base + REG_RESET_CONTROL1);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
 	msleep(100);
+
+	spin_lock_irqsave(&priv->lock, flags);
+	val = readl(np_base + REG_RESET_CONTROL1);
 	writel(val & ~mask, np_base + REG_RESET_CONTROL1);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
 	usleep_range(5000, 10000);
 
 	/* Release device */
-	mask = REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT;
+	spin_lock_irqsave(&priv->lock, flags);
 	val = readl(np_base + REG_PCI_CONTROL);
+	mask = REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT;
 	writel(val & ~mask, np_base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
 	usleep_range(1000, 2000);
+
+	spin_lock_irqsave(&priv->lock, flags);
+	val = readl(np_base + REG_PCI_CONTROL);
 	writel(val | mask, np_base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
 	msleep(250);
 
 	return 0;
@@ -623,12 +666,19 @@ static int en7523_pci_prepare(struct clk_hw *hw)
 static void en7523_pci_unprepare(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	struct device *dev = clk_hw_get_dev(hw);
 	void __iomem *np_base = cg->base;
+	struct en_clk_priv *priv;
+	unsigned long flags;
 	u32 val;
 
+	priv = dev_get_drvdata(dev);
+
+	spin_lock_irqsave(&priv->lock, flags);
 	val = readl(np_base + REG_PCI_CONTROL);
 	val &= ~REG_PCI_CONTROL_REFCLK_EN1;
 	writel(val, np_base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&priv->lock, flags);
 }
 
 static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
@@ -660,22 +710,37 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 static int en7581_pci_is_enabled(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	struct device *dev = clk_hw_get_dev(hw);
+	struct en_clk_priv *priv;
+	unsigned long flags;
 	u32 val, mask;
 
+	priv = dev_get_drvdata(dev);
 	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
+
+	spin_lock_irqsave(&priv->lock, flags);
 	val = readl(cg->base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
 	return (val & mask) == mask;
 }
 
 static int en7581_pci_enable(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	struct device *dev = clk_hw_get_dev(hw);
 	void __iomem *np_base = cg->base;
+	struct en_clk_priv *priv;
+	unsigned long flags;
 	u32 val, mask;
 
+	priv = dev_get_drvdata(dev);
 	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
+
+	spin_lock_irqsave(&priv->lock, flags);
 	val = readl(np_base + REG_PCI_CONTROL);
 	writel(val | mask, np_base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&priv->lock, flags);
 
 	return 0;
 }
@@ -683,12 +748,20 @@ static int en7581_pci_enable(struct clk_hw *hw)
 static void en7581_pci_disable(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	struct device *dev = clk_hw_get_dev(hw);
 	void __iomem *np_base = cg->base;
+	struct en_clk_priv *priv;
+	unsigned long flags;
 	u32 val, mask;
 
+	priv = dev_get_drvdata(dev);
 	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
+
+	spin_lock_irqsave(&priv->lock, flags);
 	val = readl(np_base + REG_PCI_CONTROL);
 	writel(val & ~mask, np_base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
 	usleep_range(1000, 2000);
 }
 
@@ -788,21 +861,25 @@ static int en7523_reset_update(struct reset_controller_dev *rcdev,
 			       unsigned long id, bool assert)
 {
 	struct en_rst_data *rst_data = container_of(rcdev, struct en_rst_data, rcdev);
+	struct en_clk_priv *priv = dev_get_drvdata(rcdev->dev);
 	u32 offset = rst_data->bank_ofs[id / RST_NR_PER_BANK];
 	void __iomem *addr = rst_data->base + offset;
 	bool inverted = false;
+	unsigned long flags;
 	u32 val;
 
 	/* For PCIC reset logic is inverted, 0:assert 1:deassert */
 	if (offset == REG_NP_SCU_PCIC)
 		inverted = true;
 
+	spin_lock_irqsave(&priv->lock, flags);
 	val = readl(addr);
 	if (assert ^ inverted)
 		val |= BIT(id % RST_NR_PER_BANK);
 	else
 		val &= ~BIT(id % RST_NR_PER_BANK);
 	writel(val, addr);
+	spin_unlock_irqrestore(&priv->lock, flags);
 
 	return 0;
 }
@@ -823,16 +900,21 @@ static int en7523_reset_status(struct reset_controller_dev *rcdev,
 			       unsigned long id)
 {
 	struct en_rst_data *rst_data = container_of(rcdev, struct en_rst_data, rcdev);
+	struct en_clk_priv *priv = dev_get_drvdata(rcdev->dev);
 	u32 offset = rst_data->bank_ofs[id / RST_NR_PER_BANK];
 	void __iomem *addr = rst_data->base + offset;
 	bool inverted = false;
+	unsigned long flags;
 	u32 val;
 
 	/* For PCIC reset logic is inverted, 0:assert 1:deassert */
 	if (offset == REG_NP_SCU_PCIC)
 		inverted = true;
 
+	spin_lock_irqsave(&priv->lock, flags);
 	val = readl(addr) & BIT(id % RST_NR_PER_BANK);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
 	return inverted ? !val : !!val;
 }
 
-- 
2.55.0

