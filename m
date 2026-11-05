Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880690;
	b=5XeUcIT/pCsylisx/UjaJbeQACSoIlsE8Pw88kvX+Zkooa1F+sSYmSygqpnoH7vjCyYT
	 dxZp2fyRANEYoNvMjIuDL+wDSbnxdFfSRiWfITxj0gNtISG2zrP/7W+D9VeFO6eg0I/LF
	 mFhbMr3FgyGqSp0dSpgLI/oc4699uYxm4Un5+UMp0XkNE0nzc5+PC157iREDwKjp4WwXs
	 ZTJ7RlY8I5EWE9tbH52n8VJo+HmVAWEi9fZOnZvTlJkNN5BJv7vscV7QaWg2/7DQuHsje
	 Ac7sNSBHQJ7wKw6jQ0td/JnUz8Nnp/AXKfkYMeIk64kUHE6Mmfbp7jcjSJtTUYpiVww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NK/khkk0YHVKOYK9Egb+wYboRXW4TUYyNVtUBHR24As=;
	b=1k5jXOJxMgUsHlCuas+a5oiRvypngKCucSfuJnLoZDyJgibrCAZxk9MpVoxz8lzFeqXL
	 31tJ0BAVWTyqtdBh4JwvxXK1PQzk9N5Uc68VwiogAlLEDr+gt3P5ZndJf8wEJI7irziRp
	 Ia2yfwKlBmYmFZBz22R7lMxE9NSMyKX71quACZ0LflelsrJC8CIMO8FSF09SHCTa9ZM4u
	 +W9nBjNpIXQlP+QgkxvlrMKfaLW2b/gAYDuJ1HVE6zSgZvMom/fQk3v+3dosnl3kucMb3
	 oH6tzdjyb+6QVF6Ge71mOzP3FtYKuUonXbw9AHoVPVClQ7bLv0h8n++uJAW2XqeWZjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="eFLj/20d";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1383F606EEB6
	for <linux-clk@vger.kernel.org>; Thu,  5 Nov 2026 12:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1383F606EEB6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eFLj/20d
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so16853775e9.0
        for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2026 04:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793880688; x=1794485488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NK/khkk0YHVKOYK9Egb+wYboRXW4TUYyNVtUBHR24As=;
        b=eFLj/20d7E2DhTKN1/H5dQL1wAaW9l7kKU6DASPZtMSkPfQLdjdW/L3oEmftPW9Cp0
         C1FgeYN+0EzLmsuISaxp8bX2yTUGV206JdTNp0BuhQOWr+Q8Yj2ByOpwWIG2ICpR+mpH
         S3366mmWA8dx6qknIV+vy8PU9LtO3O3S4A+cbKhUMIHjUgKybRco89YSjlHBfuoolVY8
         iEAYvjOIzOhZjSb+ni/HmnWnecUmT8Be8c5gNEqbUGizu+TMzY28h3Z7ueILKap7hkUo
         oXUwyVw0HPOKz1vWfAHoJ8myDCcsOzLisrTGf0KFcGiQBvHA1tehDWR/B9/sFEE4LbCL
         6eaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880688; x=1794485488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NK/khkk0YHVKOYK9Egb+wYboRXW4TUYyNVtUBHR24As=;
        b=s7lEbMERWO4ROwc7k6PzRN8ZAfqwGcTFtNVvZ9YVaGduR6C+a6FSP3IGtBpU3Tlq9A
         25a+sqBeF/bMCNNj0I3BD8CrJ/zwOCH3CtsrqvK7jkr+cIfHjW10wol2uIefy7TZd5fr
         WuAjaEBEgZKN921eNjHHtUsWIe6hoqlmecs3eH+YWS6P7+JstD9RmTmjF7LKgqIQPcrY
         Ale/eE4NdY2Nx1xWKETMw0g4Tuqw3RkIsi10Aw0YGlU+Xd6eljiw7hFEbV/tQAGXCQtD
         251xfqwzgyW+2hpjDefxi9z4x01425mTF65wDCUJ24bkjlZQRHhazA2J5vfx1o+DZbt0
         HGZw==
X-Forwarded-Encrypted: i=1; AKwUvBxhnffqW4U6Ad0waE1KdNQzSq6Y/yaxPu0bpD2PBv3wNa+81ppVw3IxkxvwltLLHuyOGZFC8wy+xH8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TXs3eYc7ttTLS8IJ6YgENKeerDeI6iGQzstsCus34xo4CeOIJ
	xKSbyYX1AKiLyKAMChTAG1gRBW1FsxodTyV3qSUo09B+nmwaDdXJD1f/
X-Gm-Gg: AYBFou3TVUt1ZSCMXHy+wedR3atLYwRfHKxTpipe6zC5q8yBrIzIV6b6/4mfrrXqHlS
	I8akVgi2Kcgt+9vIKiFGkvCYOdktxvL7ohg+j0LRgVHn+R4sGBtLsYMj0enLI/gMN7Y73CVSrNT
	bCNkFjqLEmCIIvH5AgsxGW2YGtIWGoAG5D2d5Eoi/qyvIiN6t1sOrpSUNZ3jU+popn58CEV0dpP
	upNm6UkvBTJG6dae4F50KxSEP978ZNeUdm7RNqJ30H9ptN6DohEZ2iFSmBmLftmsaCb0vczjMIc
	4Mqz3sXmqxLmaWuKKp7C58Vi+3sAp3bserOZMZLsQUJk3CeVnyWs9heW+GHfdZDt+sGhHik5E4a
	qSLWKDTfRgARQunb8RPH75oqfnXMTEbjF2rgS3ldYH0WPw5MQFZr6iIVtlxMiI+hw7DByAmYQvY
	n5bhcLzqm2L5ca72LsxpqMDYPp0IlP2h72AtDVA/A81pHgvb1B/jLg11D8toZ3H5EWvJEG63oJk
	CtA4ki61g0wnnLhkHuTCfAer4lxxa+zf8Sk8cN/+/Etx5Sg5fEg8SDG6ROYROe2Cqp6EICh4hcY
	x7FBpgmMkAidi16XO1pRbrOOV5RkHT9jYncZlBYA9KStyZSaiNymkhtu5VJz2I9+vRmPqCLDUcv
	hTGkXi6SboqkDBsVuWCij4ziX
X-Received: by 2002:a05:600c:8b0a:b0:4a2:e0c:2b0a with SMTP id 5b1f17b1804b1-4ac1709a200mr433001995e9.16.1793880688427;
        Thu, 05 Nov 2026 04:11:28 -0800 (PST)
Received: from Ansuel-XPS24.lan (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b56f02386bsm58869885e9.7.2026.11.05.04.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:11:28 -0800 (PST)
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
Subject: [PATCH v10 3/5] clk: en7523: protect concurrent access to reset and PCI register
Date: Thu,  5 Nov 2026 13:10:56 +0100
Message-ID: <20261105121059.11201-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105121059.11201-1-ansuelsmth@gmail.com>
References: <20261105121059.11201-1-ansuelsmth@gmail.com>
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
 drivers/clk/clk-en7523.c | 66 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 65 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 2baec734df9f..c05d0bfa2340 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -123,6 +123,8 @@ struct en_clk_desc {
 
 struct en_clk_gate {
 	void __iomem *base;
+	/* protect SCU register */
+	spinlock_t lock;
 	struct clk_hw hw;
 };
 
@@ -130,6 +132,8 @@ struct en_rst_data {
 	const u16 *bank_ofs;
 	const u16 *idx_map;
 	void __iomem *base;
+	/* protect SCU register */
+	spinlock_t lock;
 	struct reset_controller_dev rcdev;
 };
 
@@ -577,44 +581,78 @@ static u32 en7523_get_div(const struct en_clk_desc *desc, u32 val)
 static int en7523_pci_is_enabled(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	unsigned long flags;
+	u32 val;
+
+	spin_lock_irqsave(&cg->lock, flags);
+	val = readl(cg->base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&cg->lock, flags);
 
-	return !!(readl(cg->base + REG_PCI_CONTROL) & REG_PCI_CONTROL_REFCLK_EN1);
+	return !!(val & REG_PCI_CONTROL_REFCLK_EN1);
 }
 
 static int en7523_pci_prepare(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
 	void __iomem *np_base = cg->base;
+	unsigned long flags;
 	u32 val, mask;
 
 	/* Need to pull device low before reset */
+	spin_lock_irqsave(&cg->lock, flags);
 	val = readl(np_base + REG_PCI_CONTROL);
 	val &= ~(REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT);
 	writel(val, np_base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&cg->lock, flags);
+
 	usleep_range(1000, 2000);
 
 	/* Enable PCIe port 1 */
+	spin_lock_irqsave(&cg->lock, flags);
 	val |= REG_PCI_CONTROL_REFCLK_EN1;
 	writel(val, np_base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&cg->lock, flags);
+
 	usleep_range(1000, 2000);
 
 	/* Reset to default */
+	spin_lock_irqsave(&cg->lock, flags);
 	val = readl(np_base + REG_RESET_CONTROL1);
 	mask = REG_RESET_CONTROL_PCIE1 | REG_RESET_CONTROL_PCIE2 |
 	       REG_RESET_CONTROL_PCIEHB;
 	writel(val & ~mask, np_base + REG_RESET_CONTROL1);
+	spin_unlock_irqrestore(&cg->lock, flags);
+
 	usleep_range(1000, 2000);
+
+	spin_lock_irqsave(&cg->lock, flags);
+	val = readl(np_base + REG_RESET_CONTROL1);
 	writel(val | mask, np_base + REG_RESET_CONTROL1);
+	spin_unlock_irqrestore(&cg->lock, flags);
+
 	msleep(100);
+
+	spin_lock_irqsave(&cg->lock, flags);
+	val = readl(np_base + REG_RESET_CONTROL1);
 	writel(val & ~mask, np_base + REG_RESET_CONTROL1);
+	spin_unlock_irqrestore(&cg->lock, flags);
+
 	usleep_range(5000, 10000);
 
 	/* Release device */
+	spin_lock_irqsave(&cg->lock, flags);
 	mask = REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT;
 	val = readl(np_base + REG_PCI_CONTROL);
 	writel(val & ~mask, np_base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&cg->lock, flags);
+
 	usleep_range(1000, 2000);
+
+	spin_lock_irqsave(&cg->lock, flags);
+	val = readl(np_base + REG_PCI_CONTROL);
 	writel(val | mask, np_base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&cg->lock, flags);
+
 	msleep(250);
 
 	return 0;
@@ -624,11 +662,14 @@ static void en7523_pci_unprepare(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
 	void __iomem *np_base = cg->base;
+	unsigned long flags;
 	u32 val;
 
+	spin_lock_irqsave(&cg->lock, flags);
 	val = readl(np_base + REG_PCI_CONTROL);
 	val &= ~REG_PCI_CONTROL_REFCLK_EN1;
 	writel(val, np_base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&cg->lock, flags);
 }
 
 static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
@@ -646,6 +687,7 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 		return NULL;
 
 	cg->base = np_base;
+	spin_lock_init(&cg->lock);
 	cg->hw.init = &init;
 
 	if (init.ops->unprepare)
@@ -660,10 +702,15 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 static int en7581_pci_is_enabled(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	unsigned long flags;
 	u32 val, mask;
 
 	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
+
+	spin_lock_irqsave(&cg->lock, flags);
 	val = readl(cg->base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&cg->lock, flags);
+
 	return (val & mask) == mask;
 }
 
@@ -671,11 +718,15 @@ static int en7581_pci_enable(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
 	void __iomem *np_base = cg->base;
+	unsigned long flags;
 	u32 val, mask;
 
 	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
+
+	spin_lock_irqsave(&cg->lock, flags);
 	val = readl(np_base + REG_PCI_CONTROL);
 	writel(val | mask, np_base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&cg->lock, flags);
 
 	return 0;
 }
@@ -684,11 +735,16 @@ static void en7581_pci_disable(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
 	void __iomem *np_base = cg->base;
+	unsigned long flags;
 	u32 val, mask;
 
 	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
+
+	spin_lock_irqsave(&cg->lock, flags);
 	val = readl(np_base + REG_PCI_CONTROL);
 	writel(val & ~mask, np_base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&cg->lock, flags);
+
 	usleep_range(1000, 2000);
 }
 
@@ -791,18 +847,21 @@ static int en7523_reset_update(struct reset_controller_dev *rcdev,
 	u32 offset = rst_data->bank_ofs[id / RST_NR_PER_BANK];
 	void __iomem *addr = rst_data->base + offset;
 	bool inverted = false;
+	unsigned long flags;
 	u32 val;
 
 	/* For PCIC reset logic is inverted, 0:assert 1:deassert */
 	if (offset == REG_NP_SCU_PCIC)
 		inverted = true;
 
+	spin_lock_irqsave(&rst_data->lock, flags);
 	val = readl(addr);
 	if (assert ^ inverted)
 		val |= BIT(id % RST_NR_PER_BANK);
 	else
 		val &= ~BIT(id % RST_NR_PER_BANK);
 	writel(val, addr);
+	spin_unlock_irqrestore(&rst_data->lock, flags);
 
 	return 0;
 }
@@ -826,13 +885,17 @@ static int en7523_reset_status(struct reset_controller_dev *rcdev,
 	u32 offset = rst_data->bank_ofs[id / RST_NR_PER_BANK];
 	void __iomem *addr = rst_data->base + offset;
 	bool inverted = false;
+	unsigned long flags;
 	u32 val;
 
 	/* For PCIC reset logic is inverted, 0:assert 1:deassert */
 	if (offset == REG_NP_SCU_PCIC)
 		inverted = true;
 
+	spin_lock_irqsave(&rst_data->lock, flags);
 	val = readl(addr) & BIT(id % RST_NR_PER_BANK);
+	spin_unlock_irqrestore(&rst_data->lock, flags);
+
 	return inverted ? !val : !!val;
 }
 
@@ -866,6 +929,7 @@ static int en7581_reset_register(struct device *dev, void __iomem *base,
 	rst_data->bank_ofs = rst_reg_ofs;
 	rst_data->idx_map = rst_map;
 	rst_data->base = base;
+	spin_lock_init(&rst_data->lock);
 
 	rst_data->rcdev.nr_resets = nr_resets;
 	rst_data->rcdev.of_xlate = en7523_reset_xlate;
-- 
2.55.0

