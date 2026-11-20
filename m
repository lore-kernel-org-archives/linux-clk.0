Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795217765;
	b=pavG9bN/KYArRKF4TZ4pSc8ZUDnK0T5dJ//e4m52DAIRs7as+yxs+hV4TlUgEq0SJ6xP
	 UJ7BCqfYcjhOXkUzPiVXU80hjqzovjos2LSCDfndmx4l55hHRfmZAL7hjDIZwOh8kmHsy
	 bptzF7HYRWsf3WtdSrT+tblrgk8/HSJxsbp36SjyMZGBFZkHQJq0oPhnOEIdFh9Nxxl1x
	 KYwWQkFt95/O0+41zCr0GhAn8uWO251ZPwnuMIWpeC4sqvbt7EfO70qd8usrVeN9Wnfvd
	 E3y7gmv0YlfxUalWbr7301af1sVmnwPOJcWfWNTowgsO6f7904TbjFWfsyTXUi+Yysg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795217765;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bPyMEKgEFHdHS3jAlTK9RnmnWtg9i78hA1hMJdT4cSA=;
	b=3RbMLtsYeGvFaae8WhT6hxYnxKIjew57DGdI/dsKpPPHsCSxQuHZDlQCYtcLGUvUYbUm
	 6kv6gdcMfuswDVRRlBAY0NHl24g9fJuu/1nRKpP9SA9r8s4js+MVCtW/dpbqJZiAsSatr
	 nnhlajNttiDMHGelIcpkTGIIVjyYSeZBvgd4tXPyWFx6tFA1AcE4ugrWFYYQGo418tYab
	 XiK8HSYIIV3AvZ14vdHqGcp8Sh1c9AYJV09AsNowbsjSDQ0rseFKPyecaOkNhKRF2UWri
	 DpaTkgwHcZ7YfiQrDVMAHNkbY4h+pv8GXp3746UMkWuD7XGIfJlp5P/h8/iSCg+4Ukg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JICh0oiL;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B59960A2626
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 23:35:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B59960A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JICh0oiL
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so12574565e9.2
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 15:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795217753; x=1795822553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bPyMEKgEFHdHS3jAlTK9RnmnWtg9i78hA1hMJdT4cSA=;
        b=JICh0oiLuLKeDUeXgHkuo/ATYfH9UeM5W+C+VaM0DaxZcYpYqPWZXOAKQkuoGhyg6/
         DFUYN1w5fYelaZa2Yi1D6y4GTEPJ6f7me6goQ+9xcECxszUfRJoNekh9c8YOhOIxYMFt
         qQKo5tGZVxn5Mm514cXjQf8Xp8YifDnqWwe0QLumBM08gMhP99WY0npNGo8QICsP88jq
         UxJ8hhoyoKgCyUDRWGwzOz/k0zorzB0AUo78s17Z9AjUwHuu2zE/q8MrCJrAX3ZtFmHR
         iln9JbYG+bKu2yQoxZkHSih+BC0KFCNRUEZ8E15mbJUo35l9GFB+WYIC+ILbeXb1ihvm
         NMLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795217753; x=1795822553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bPyMEKgEFHdHS3jAlTK9RnmnWtg9i78hA1hMJdT4cSA=;
        b=FQTqBcehI9ReTSwvW0z+fQr2EaIo0Y0T6f7mudiUS0O/RljEmqe5HjX6d/36fuXvUd
         oCPsvCxw4QBz528tYgq5NxWiL+StVMucNg9uwt4PqG1zlMWckKptSYaPrFnA5MVXW2TU
         xosni2kU4bo6tOr8VP5XKzJICGaeR5ChKQm4ht1boXnCQhy6eoMr9TDf4U4Q815aIOUU
         ymiRzYHq8W6+9sp9osX5RqFzemNvDHcFaQhF3tv3DHpwLKSX+swvJw+1MGL+wyhyOwsJ
         fejSDje4R2JmyZqgR3YbGUbQYzlw77c6241rbd3WM73rjbGTSUNLBNcMSRdbbhjrQX4F
         BWjw==
X-Forwarded-Encrypted: i=1; AL+hErHZ0TmohBQixYi65riRYyPmb3arMlbTGRfdEEKh0f7oTCZ3OyMB7L6+Yc5r5BJb/mmhCYaK5/bFpx0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uQCwT+pJwx1JX4PmWKiXqWvquiFJbcVqNPJXuDBZUnPAD8bcw
	hZsvk8MdwieTWqtF7dXNeKbT/OT9ABycQw4GLk+nejaCziDbkUwKkpNd
X-Gm-Gg: AYBFou2PEmn8ugIg/z7gjXLpGS/0A65wmBfm331zu93W+1zdRtok3EdAIVdgx6ac9lO
	akcG4mq1KZxCk1tAHHHwUjzZWDIEfq56kpRPYOLrcuphBlaHhBrZGKCO9U775qDfzip44C/wo4f
	VLhiYXlcbfX76V8IdkZMmePBUvFsxEFzp9qNUjYLof9tqSK8KcbQznzc8xS3GDaMjgjtLfKkbLo
	PvUAx27tfjb6yZ9R8f7Bx5l12BovJazf81URgQF3Per/AKPEK7IoBzpEP9aYGkw198IAcDZyplh
	Fg1M5DCOuqB/AUodYvmEmdVpX+ePzKAY3re1R6dBWRfCTIekqZlvZBpku+2XOn5ecfCeBvR9spM
	8GfSlA8cDjR3Co5hqGtzR4d0oeVnVk1Dz9cxM4hUz/s3fl+XwDji3PpepiHoP03pTCaYEsFK9la
	abufJm9jNeBt8ObsBJQPiZI8zq3IG9DR6kp+fXiasyDS00OYMwQIx5jWViB23iLMRKxA66nETEL
	ZYK5IVtY+D2Nl7FpDkN7ZkmmfuuCU4elkg+GN1hRJKkOBPR6alPrzNOM0HEtdmWrST/hOZEgp51
	vn2ECP8ddk68s+jwO6k8pT0pvoox5bksijZ6ktdVp/Y63z+/yRt93wb47OZktDUADkStetgMZW6
	z7Grc48iSoEqwQBEm2d+oR3AbRsnTGUWpsu/AQrEKyYj+4sTJVGqA
X-Received: by 2002:a05:600c:46cc:b0:4bb:6f41:399f with SMTP id 5b1f17b1804b1-4bb888236a3mr104254995e9.24.1795217752822;
        Fri, 20 Nov 2026 15:35:52 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-95-234-253-103.retail.telecomitalia.it. [95.234.253.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm8672390f8f.53.2026.11.20.15.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:35:51 -0800 (PST)
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
Subject: [PATCH v14 3/5] clk: en7523: protect concurrent access to reset and PCI register
Date: Sat, 21 Nov 2026 00:35:31 +0100
Message-ID: <20261120233535.164885-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261120233535.164885-1-ansuelsmth@gmail.com>
References: <20261120233535.164885-1-ansuelsmth@gmail.com>
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

