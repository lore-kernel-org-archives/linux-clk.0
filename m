Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795296477;
	b=Zru7Zrgafcr82GpMZSI0/VC7gZMVDTVavC+dk+brWP6h+Tcfp9+xOq9qGWBbqGsp0Cpy
	 f5dOKOoaB+cLDOp98AVIb2IgqHa/kFZg+hL5ejjHfmpmcKI2ze5/pmUhCC43ww9G4Q74c
	 JQQZlqeKQdnx/oNKPnQBflmf2SnN6tJrGWvqgvua1iPVLZZfocWolKML5RZHW1JciThKZ
	 JrwaKXfclMgYY0ZPpT5pFmH06kDn8o4G4riXr/+da2X2QNJruLuq6GjbI63ctNvIYJdV9
	 I3qZZfEue0/mUUqCOI2BvdARprLIK0OrwVdI3g90Eqj/ja74FIQVhF/A85yXQCe4Xxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bPyMEKgEFHdHS3jAlTK9RnmnWtg9i78hA1hMJdT4cSA=;
	b=U0lSCShmzUOLE3tRqk9KljOsyBmG6gPbsbzUtivxln7loxAMYaBirQBJdwYmIsA82ZY7
	 6X3UroM4/VFzL/4eP1yVBuhUNH7gagplSb6ejDp22WQ19+4cQPTSg2vrj/mVocMjlH6sc
	 1q1xFg+MThRIJ+p+6AnSD9QVLtPjOj20PVve4ItKNDu0N94Xh2iH8n84FAkLDDC+5fJok
	 t+6wx3BtItZ6Cr/0QDlXGIrBTH4W891VWDN2AcBcohv1zKS6CmX4VWdd9KgShmlnQMlrP
	 SGeOucctFm7/lunLK4wUCJ0f3R+VpCzNorGA5ZTdXacVracCYR24mLwakNSbEV/ZyqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nO4QnoUR;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09213606A335
	for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 21:27:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09213606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nO4QnoUR
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so21850645e9.1
        for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 13:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795296475; x=1795901275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bPyMEKgEFHdHS3jAlTK9RnmnWtg9i78hA1hMJdT4cSA=;
        b=nO4QnoURM0p05+PcDkufepKHoZT7l1C+SOuRKiUyo7uVLO5+m+zLlffBNefNr6fH4L
         9G4Zz91l4lA0e0N1k7RCRAYybFWnv1QztUO4JfhQWQ20c9Rk7/VKbVXgH24WupRLST96
         JmKF3wGnRezV/a53SRk3Ie5vnbo/Bx113DBY0yr53jQE5n9a66lnji5zl5e6kPrNVSFe
         Ion9R8cOQ03TJhMPoBeJkrmBRO31BjFCAUfANiS3E5E+Az5AJye4bmF9tND7N830skvY
         wZLa5tZdEgWo4P32GUoVNo9dnts9p7F5sC5LYtK5FCS77zBJ+RmH456eU9FtzZrbMwe9
         eTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296475; x=1795901275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bPyMEKgEFHdHS3jAlTK9RnmnWtg9i78hA1hMJdT4cSA=;
        b=U7EM6s91Y0kn+wgqctFD4xun5fNVjUdcsQFpyr8cbeZ1bnp3VRCOdRfRsuTMUS4cya
         Xty7rXD5ZWOLwXM4/OSzGieCN2a+05hdSbnonOqcftFQN8kE+4UonGY9As1tPoUPDVch
         mGfa94m4asEjKdd5Y2IeISH7U8JTBlym/7gWm/fM5zzR1ArpWVZQe8PXN2geVE9nbO4D
         Jd1Af0U3gI7fvzUs7XYLb1Rps8Q915v+N4RCJ/4VyqKGN6mlOaQlYR1T15euy7HO/hx0
         GKmcMoxqCUomPwLDadxc4UDk4cpnaSvYmFjgilo6tChaYAPABhIics5iIlOZJQeDa4qM
         J/rQ==
X-Forwarded-Encrypted: i=1; AL+hErGX4PHG7600koVnb/prJw04ivfxIjSlTVG5OAUfGWuofjIowdeLPHE3WAeSRcC/V4t+oY/9R5HJjU4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DnL/T7Rqgtrbnr5ZAtAGKPrroGQl/+0F+Ig9uBn1JOVX5HSc/
	RSIHjuY/6zO9/vI4AhC65eiFkpr0V0wJGX1von3LTO/z8DSLvETp7B9F
X-Gm-Gg: AZFdTZdPEyy0ILIFZk0FIyv48pBARzKlEIL9Fmgxvn1/F4R0M248/epKxrrs5ZkBJu6
	bW29YsVgfCs57rXm9RYX/vSQm0sqKYJv/1BohhhIj77vq8uR/IdAa6k3Hvj7dtQJGY0wIX7SIt8
	a+P16oVsvkAltZqh1Hkal9Y1TTGKYNzp0YelVwVMDcOdkdUo7JYYfWcOogb6KV0DBPG91KBWO5j
	XXfwbnFrJ3z5nMxADy1WDwsjHqPLw8mIBUVsHJ+wEuyHqquW2ZyfZxgNwNtmy4CRk7gmLV9gpjt
	6Y213xsU1Lap8mGZAmymBTUhWrUdmeGJBZPzpLKdPHdKPm5iYUt9JRTJTIjU7uLoBQwPyzG/iVc
	fceMoOGa3YLlmk9jd78D2OjjHssHKXeARo4m0st5E+t7kGLo5VVcWHdMLnNtOwkdZBgJdhjK0AG
	orriETVA9sNqHzyEcFee/EkfXymc6GDn2TXrsb7bcSbfb7xrO22/2Ndz8sUvHMTPlfi59t1W2z5
	TPcvDRfoGF9ZnYilz1ciAbSs5mcZ/hct2gxfdZKqxm1TsggHtxPIbd6d6iLzCKwu3eywdgSDFLh
	q2kBtE/71DEc5p8/fw5OVRal48mLQOq5CJzU20fYQbBS7yY9DblBdGAIs76cgr/6VtpiYp79+jk
	jkc4eYiABMdq/tvpfkASNlwvJss/cTsMPP8PM4NLdsrcXAcBn/B0=
X-Received: by 2002:a05:600c:c173:b0:4a1:fba8:b13d with SMTP id 5b1f17b1804b1-4bb8881d00cmr154697005e9.9.1795296475433;
        Sat, 21 Nov 2026 13:27:55 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-87-17-253-173.retail.telecomitalia.it. [87.17.253.173])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b3a7sm255668955e9.3.2026.11.21.13.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:27:55 -0800 (PST)
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
Subject: [PATCH v15 3/5] clk: en7523: protect concurrent access to reset and PCI register
Date: Sat, 21 Nov 2026 22:27:33 +0100
Message-ID: <20261121212738.170775-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261121212738.170775-1-ansuelsmth@gmail.com>
References: <20261121212738.170775-1-ansuelsmth@gmail.com>
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
time. This is needed as register are shared for both clock and reset
operation and rmw operation require protection against writing inconsistent
data.

Some minor rework was needed for PCI unprepare case to permit calling it
before clk_hw_register and reference the global spinlock.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 104 ++++++++++++++++++++++++++++++---------
 1 file changed, 82 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 9e92586f207c..12a43562929b 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -150,6 +150,7 @@ struct en_clk_soc_data {
 	const struct clk_ops pcie_ops;
 	int (*hw_init)(struct platform_device *pdev,
 		       struct clk_hw_onecell_data *clk_data);
+	void (*pci_unprepare)(struct device *dev, struct en_clk_gate *cg);
 };
 
 static const u32 gsw_base[] = { 400000000, 500000000 };
@@ -584,53 +585,95 @@ static int en7523_pci_is_enabled(struct clk_hw *hw)
 static int en7523_pci_prepare(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	struct device *dev = clk_hw_get_dev(hw);
 	void __iomem *np_base = cg->base;
+	struct en_clk_priv *priv;
 	u32 val, mask;
 
+	priv = dev_get_drvdata(dev);
+
 	/* Need to pull device low before reset */
-	val = readl(np_base + REG_PCI_CONTROL);
-	val &= ~(REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT);
-	writel(val, np_base + REG_PCI_CONTROL);
+	scoped_guard(spinlock_irqsave, &priv->lock) {
+		val = readl(np_base + REG_PCI_CONTROL);
+		val &= ~(REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT);
+		writel(val, np_base + REG_PCI_CONTROL);
+	}
+
 	usleep_range(1000, 2000);
 
 	/* Enable PCIe port 1 */
-	val |= REG_PCI_CONTROL_REFCLK_EN1;
-	writel(val, np_base + REG_PCI_CONTROL);
+	scoped_guard(spinlock_irqsave, &priv->lock) {
+		val = readl(np_base + REG_PCI_CONTROL);
+		val |= REG_PCI_CONTROL_REFCLK_EN1;
+		writel(val, np_base + REG_PCI_CONTROL);
+	}
+
 	usleep_range(1000, 2000);
 
 	/* Reset to default */
-	val = readl(np_base + REG_RESET_CONTROL1);
-	mask = REG_RESET_CONTROL_PCIE1 | REG_RESET_CONTROL_PCIE2 |
-	       REG_RESET_CONTROL_PCIEHB;
-	writel(val & ~mask, np_base + REG_RESET_CONTROL1);
+	scoped_guard(spinlock_irqsave, &priv->lock) {
+		val = readl(np_base + REG_RESET_CONTROL1);
+		mask = REG_RESET_CONTROL_PCIE1 | REG_RESET_CONTROL_PCIE2 |
+		REG_RESET_CONTROL_PCIEHB;
+		writel(val & ~mask, np_base + REG_RESET_CONTROL1);
+	}
+
 	usleep_range(1000, 2000);
-	writel(val | mask, np_base + REG_RESET_CONTROL1);
+
+	scoped_guard(spinlock_irqsave, &priv->lock) {
+		val = readl(np_base + REG_RESET_CONTROL1);
+		writel(val | mask, np_base + REG_RESET_CONTROL1);
+	}
+
 	msleep(100);
-	writel(val & ~mask, np_base + REG_RESET_CONTROL1);
+
+	scoped_guard(spinlock_irqsave, &priv->lock) {
+		val = readl(np_base + REG_RESET_CONTROL1);
+		writel(val & ~mask, np_base + REG_RESET_CONTROL1);
+	}
+
 	usleep_range(5000, 10000);
 
 	/* Release device */
-	mask = REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT;
-	val = readl(np_base + REG_PCI_CONTROL);
-	writel(val & ~mask, np_base + REG_PCI_CONTROL);
+	scoped_guard(spinlock_irqsave, &priv->lock) {
+		val = readl(np_base + REG_PCI_CONTROL);
+		mask = REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT;
+		writel(val & ~mask, np_base + REG_PCI_CONTROL);
+	}
+
 	usleep_range(1000, 2000);
-	writel(val | mask, np_base + REG_PCI_CONTROL);
+
+	scoped_guard(spinlock_irqsave, &priv->lock) {
+		val = readl(np_base + REG_PCI_CONTROL);
+		writel(val | mask, np_base + REG_PCI_CONTROL);
+	}
+
 	msleep(250);
 
 	return 0;
 }
 
-static void en7523_pci_unprepare(struct clk_hw *hw)
+static void __en7523_pci_unprepare(struct device *dev, struct en_clk_gate *cg)
 {
-	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	struct en_clk_priv *priv = dev_get_drvdata(dev);
 	void __iomem *np_base = cg->base;
 	u32 val;
 
+	guard(spinlock_irqsave)(&priv->lock);
+
 	val = readl(np_base + REG_PCI_CONTROL);
 	val &= ~REG_PCI_CONTROL_REFCLK_EN1;
 	writel(val, np_base + REG_PCI_CONTROL);
 }
 
+static void en7523_pci_unprepare(struct clk_hw *hw)
+{
+	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	struct device *dev = clk_hw_get_dev(hw);
+
+	__en7523_pci_unprepare(dev, cg);
+}
+
 static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 					       void __iomem *np_base)
 {
@@ -648,8 +691,8 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 	cg->base = np_base;
 	cg->hw.init = &init;
 
-	if (init.ops->unprepare)
-		init.ops->unprepare(&cg->hw);
+	if (soc_data->pci_unprepare)
+		soc_data->pci_unprepare(dev, cg);
 
 	if (devm_clk_hw_register(dev, &cg->hw))
 		return NULL;
@@ -670,10 +713,16 @@ static int en7581_pci_is_enabled(struct clk_hw *hw)
 static int en7581_pci_enable(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	struct device *dev = clk_hw_get_dev(hw);
 	void __iomem *np_base = cg->base;
+	struct en_clk_priv *priv;
 	u32 val, mask;
 
+	priv = dev_get_drvdata(dev);
 	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
+
+	guard(spinlock_irqsave)(&priv->lock);
+
 	val = readl(np_base + REG_PCI_CONTROL);
 	writel(val | mask, np_base + REG_PCI_CONTROL);
 
@@ -683,10 +732,16 @@ static int en7581_pci_enable(struct clk_hw *hw)
 static void en7581_pci_disable(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	struct device *dev = clk_hw_get_dev(hw);
 	void __iomem *np_base = cg->base;
+	struct en_clk_priv *priv;
 	u32 val, mask;
 
+	priv = dev_get_drvdata(dev);
 	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
+
+	guard(spinlock_irqsave)(&priv->lock);
+
 	val = readl(np_base + REG_PCI_CONTROL);
 	writel(val & ~mask, np_base + REG_PCI_CONTROL);
 }
@@ -787,11 +842,14 @@ static int en7523_reset_update(struct reset_controller_dev *rcdev,
 			       unsigned long id, bool assert)
 {
 	struct en_rst_data *rst_data = container_of(rcdev, struct en_rst_data, rcdev);
+	struct en_clk_priv *priv = dev_get_drvdata(rcdev->dev);
 	u32 offset = rst_data->bank_ofs[id / RST_NR_PER_BANK];
 	void __iomem *addr = rst_data->base + offset;
 	bool inverted = false;
 	u32 val;
 
+	guard(spinlock_irqsave)(&priv->lock);
+
 	/* For PCIC reset logic is inverted, 0:assert 1:deassert */
 	if (offset == REG_NP_SCU_PCIC)
 		inverted = true;
@@ -832,6 +890,7 @@ static int en7523_reset_status(struct reset_controller_dev *rcdev,
 		inverted = true;
 
 	val = readl(addr) & BIT(id % RST_NR_PER_BANK);
+
 	return inverted ? !val : !!val;
 }
 
@@ -883,7 +942,6 @@ static int en7581_serdes_phy_set_mode(struct phy *phy, enum phy_mode mode,
 	struct en_serdes_phy_instance *instance = phy_get_drvdata(phy);
 	struct en_clk_priv *priv = dev_get_drvdata(phy->dev.parent);
 	u32 reg, mask, sel, val;
-	unsigned long flags;
 
 	switch (instance->serdes_port) {
 	case AIROHA_SCU_SERDES_PCIE1:
@@ -970,12 +1028,12 @@ static int en7581_serdes_phy_set_mode(struct phy *phy, enum phy_mode mode,
 		return -EINVAL;
 	}
 
-	spin_lock_irqsave(&priv->lock, flags);
+	guard(spinlock_irqsave)(&priv->lock);
+
 	val = readl(priv->base + reg);
 	val &= ~mask;
 	val |= sel;
 	writel(val, priv->base + reg);
-	spin_unlock_irqrestore(&priv->lock, flags);
 
 	return 0;
 }
@@ -1220,6 +1278,7 @@ static const struct en_clk_soc_data en7523_data = {
 		.unprepare = en7523_pci_unprepare,
 	},
 	.hw_init = en7523_clk_hw_init,
+	.pci_unprepare = __en7523_pci_unprepare,
 };
 
 static const struct en_clk_soc_data en7581_data = {
@@ -1241,6 +1300,7 @@ static const struct en_clk_soc_data en751221_data = {
 		.unprepare = en7523_pci_unprepare,
 	},
 	.hw_init = en751221_clk_hw_init,
+	.pci_unprepare = __en7523_pci_unprepare,
 };
 
 static const struct of_device_id of_match_clk_en7523[] = {
-- 
2.55.0

