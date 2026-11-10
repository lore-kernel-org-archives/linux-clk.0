Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794269293;
	b=zvhkZsndb1i7fjwWJcomZ5guavjWk9QTmVwm9LKvrnKhKdxZ0XiWB9wazqZDVSK3XIVU
	 sV9ycKR48f0NYipczWfSQkqlDQ3jZDg9v2CrQPQVkOzI6uH3XFNmlZLNQ/gXqsrIT8UzD
	 W5qcu0qKeT5afFpPbaa1qTAvG0epkEnvV89t6T2eeC6Q317w6SWqYPIDyqyQxr4h6hqli
	 b7eY2TMJrW9SfVeDsJMTqiQKtWXWoRMIYH9SI+EwWPeFdstNFOxVr6ZG7C1wZRXTBhHUk
	 /iakRVa9kCD/P/smcbOQ2Xru/ieTNd81M7HKdaj3HSDoqMSRy7fc/jIL4//FfDXYgBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ewqj6SMrT6ZA2m3A8wgPZDVY8siTBIkdJJu9k7eROps=;
	b=azs3ggBG+j92fbdON5uFVW/dAGt0T3FalJYm19bvPv19yZxxRFn7fQJp8MJd9cTTAO99
	 ac09heV71WaoKS6svjwl2o4maimfz3sO7vt8pWIXdW31Gx6/JA+oDuz4+Rfn9ZFFAo5Us
	 u9V2D/QGsEsUozoXATRqDyks+6AbrjgQTD5OIkdKBlP63xRnzKGyj6dQZHiLodr28OnUZ
	 AUJI091mMp3j0qojPJty0087ZAmV213kGVUXdSFTsRk6bUJ+OCVSH11MQMpalOQ9MXjDG
	 H7OKUMLaSdkXY6iMSv+gmvfq5S2Bf7u14JDAvPq9PL+xF5PWsH5Wa7/0F4zWa+OcqHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hwSUK4rN;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5589606A338
	for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 00:08:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5589606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hwSUK4rN
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-492f0a1b685so972183f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2026 16:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794269291; x=1794874091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ewqj6SMrT6ZA2m3A8wgPZDVY8siTBIkdJJu9k7eROps=;
        b=hwSUK4rNAGZ73sCJlc6rwb6eOhCxxJj7cOsocztbRWma8jXy1wcd+o480dgymCIs7R
         2YP4d0+YDlzzZQ18B8z+JuvZnBxMUIwsT6+t3BgoQ5YlhomNnbuv74j51paUojhJMMsD
         AOZZ33rZZrKAlxdE9QRJw0aP1YK1AbWXZVr962pDGvzcNFXY+bUY7Ad0g4uSzUPHfQ1m
         bkn1opwaDx4z2EPiLJSHFu7brp3sXvRZaS9nAeDYTY/AJEDnIyzCtf096AOPnYwCgyY0
         RyrYAGMIRnr3+zkKKxqRAgMBOf0lnVjUCeCmKxOTJxJJDHoDysGxA5HC21qwr0kmm17/
         zdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794269291; x=1794874091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ewqj6SMrT6ZA2m3A8wgPZDVY8siTBIkdJJu9k7eROps=;
        b=mwbQ0crYG69Sfrl4rlvw3TFofxR14qYsXs2wSOPAGYhm2534MlQTZKKs9LLAdXtc1x
         POoZ9NEKztQ43WXjz//7t2RulXaDc7w162KhhXrDc151LIC7qtw1xcI4QL+/wcbnBMe4
         ipF80A3Rl8moK7aWYx+49j/GEcbyTBeVOXC9SWHIsrf1yD3psyNcvQb8GrR3j1pvYrha
         O4aj16hgq47LVNIyQqEEqX0luORw70+cBO9daw8p9HeZzmQ8JyDybtDtdFil6stszStw
         ZAnaZ/rho7WimIU+QxvAAEbb2w9rgtomFIXGGfWFHZ0kwL73PbNabKIQiPUN1foFU9Pc
         SsPA==
X-Forwarded-Encrypted: i=1; AL+hErHAdqrBC71iCL2RlX0CAVjI24bHeEscw2iSr6HMRdFvN5+6r6gvqx7K4Yq1OltnzHnzmk6bZM4xXHs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tfUoalz5aMGUZHfBV+6dGz6E+0MrILyJF0I3NaXVkc4mhO3ie
	4ZGC2s06Lkxy2najX1v5IocnY6a9zuICq7P3Et3BYrFvqznNk2crOZnG
X-Gm-Gg: AYBFou35MT5+ILbGpBaI8bmJEhEjiXPzesJVIL+iqp1UBvgGOAPznGGEmMNdkY3u5Or
	ErHERkcuEka7EGl7fZN9Lb1tt5tMRDUZAy//+H6G6rndypFu3MZ5XKhdabaxOZNz5OOODewHTGa
	vYncdoXq6VeFxS5c/+BA2/XskGGBkZeiniEfKGvjPNJQmYRB3vYHpyFVi6f+jbtmSntL3pXCTGv
	cyfNJo/TPaH8g/xcplQA07DoSZhB9NAjQkpjkAlfhwFZGSgXj9T3gNMf5U5l0+vEnU/jlIR1rPB
	qJXv5XFmpJsPlMhVnYQBigBKGRetWO7Tgp+gE25LXjKgElPgLm5y38OJVKZCmCGmmQlyQw1NRop
	Kj8GEF/OV9eO+h1WeCVLE5JYABf+CuIAANaXnPdLmCm997UJMCVC8Y424HC8zTehAMt8ilMO8Ql
	EApFHnuC4pJLuZJLiwwg6izNItF+bs5kkDBe1Yh3WOW1ex52sFMQKwEYzoHB/E6C7YW/uSGS0fZ
	Ve8AXOudVv/oVnQ237qoBBBNB3NjIPh2nCpUQWi6lSfBJg6R5AMVW0TB7gppgax8wGLDn6AnHuY
	QjWQdxwSbWy6UWVw9LIZpSl53UJM/NLluL/eS2tGPdR/GhZTDgPcGbnn2Y0hnQXhmtfecMKrHHl
	TkBoxI0zAEtNwob/ZXvwHhHENfChrYsiPYmINQC49gfVdmLmsPA==
X-Received: by 2002:a05:6000:4617:b0:491:6a7:b4ac with SMTP id ffacd0b85a97d-4983133e4a6mr1408396f8f.56.1794269291276;
        Mon, 09 Nov 2026 16:08:11 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-30.retail.telecomitalia.it. [212.171.11.30])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-498363df7a5sm1704703f8f.37.2026.11.09.16.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:08:10 -0800 (PST)
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
Subject: [PATCH v12 3/5] clk: en7523: protect concurrent access to reset and PCI register
Date: Tue, 10 Nov 2026 01:07:48 +0100
Message-ID: <20261110000753.508-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261110000753.508-1-ansuelsmth@gmail.com>
References: <20261110000753.508-1-ansuelsmth@gmail.com>
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

Some minor rework was needed for PCI unprepare case to permit calling it
before clk_hw_register and reference the global spinlock.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 101 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 95 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 2baec734df9f..fbe10e4c3693 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -150,6 +150,7 @@ struct en_clk_soc_data {
 	const struct clk_ops pcie_ops;
 	int (*hw_init)(struct platform_device *pdev,
 		       struct clk_hw_onecell_data *clk_data);
+	void (*pci_unprepare)(struct device *dev, struct en_clk_gate *cg);
 };
 
 static const u32 gsw_base[] = { 400000000, 500000000 };
@@ -577,58 +578,112 @@ static u32 en7523_get_div(const struct en_clk_desc *desc, u32 val)
 static int en7523_pci_is_enabled(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	struct device *dev = clk_hw_get_dev(hw);
+	struct en_clk_priv *priv;
+	unsigned long flags;
+	u32 val;
+
+	priv = dev_get_drvdata(dev);
+
+	spin_lock_irqsave(&priv->lock, flags);
+	val = readl(cg->base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&priv->lock, flags);
 
-	return !!(readl(cg->base + REG_PCI_CONTROL) & REG_PCI_CONTROL_REFCLK_EN1);
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
 }
 
-static void en7523_pci_unprepare(struct clk_hw *hw)
+static void __en7523_pci_unprepare(struct device *dev, struct en_clk_gate *cg)
 {
-	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	struct en_clk_priv *priv = dev_get_drvdata(dev);
 	void __iomem *np_base = cg->base;
+	unsigned long flags;
 	u32 val;
 
+	spin_lock_irqsave(&priv->lock, flags);
 	val = readl(np_base + REG_PCI_CONTROL);
 	val &= ~REG_PCI_CONTROL_REFCLK_EN1;
 	writel(val, np_base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&priv->lock, flags);
+}
+
+static void en7523_pci_unprepare(struct clk_hw *hw)
+{
+	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	struct device *dev = clk_hw_get_dev(hw);
+
+	__en7523_pci_unprepare(dev, cg);
 }
 
 static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
@@ -648,8 +703,8 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 	cg->base = np_base;
 	cg->hw.init = &init;
 
-	if (init.ops->unprepare)
-		init.ops->unprepare(&cg->hw);
+	if (soc_data->pci_unprepare)
+		soc_data->pci_unprepare(dev, cg);
 
 	if (devm_clk_hw_register(dev, &cg->hw))
 		return NULL;
@@ -660,22 +715,37 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
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
@@ -683,12 +753,20 @@ static int en7581_pci_enable(struct clk_hw *hw)
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
 
@@ -788,21 +866,25 @@ static int en7523_reset_update(struct reset_controller_dev *rcdev,
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
@@ -823,16 +905,21 @@ static int en7523_reset_status(struct reset_controller_dev *rcdev,
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
 
@@ -1223,6 +1310,7 @@ static const struct en_clk_soc_data en7523_data = {
 		.unprepare = en7523_pci_unprepare,
 	},
 	.hw_init = en7523_clk_hw_init,
+	.pci_unprepare = __en7523_pci_unprepare,
 };
 
 static const struct en_clk_soc_data en7581_data = {
@@ -1244,6 +1332,7 @@ static const struct en_clk_soc_data en751221_data = {
 		.unprepare = en7523_pci_unprepare,
 	},
 	.hw_init = en751221_clk_hw_init,
+	.pci_unprepare = __en7523_pci_unprepare,
 };
 
 static const struct of_device_id of_match_clk_en7523[] = {
-- 
2.55.0

