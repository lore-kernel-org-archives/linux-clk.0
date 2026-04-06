Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD40D39DBE9;
	Mon,  6 Apr 2026 21:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775512323; cv=none; b=K7vMgNarepK7vNucP3NnojN1R3Wau62EKQoBn+bTNogL4SnQiTV5pYqTk1Aq+KSTp5HUVPGch6UVU621rDn4aca5lL7rewJ7nH0XQ3KvgpzAP+lHOmkteu+OursOQbegWISTsjcAQV3Iu3LQ8ZVy+QpqwGmskoBNkxLTGAemMx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775512323; c=relaxed/simple;
	bh=VicEFKkoWeaAJKKgt7G2HexfpGFGFzTxONQw6xZEZLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xseks1eZKE7sot4xDDaPVJvxl74SV7+9lfkT51Yj5nK0XpFqQ/gFC0P2AYV1bFddaXQwu9Y7rmeVKyiMP0NuMDBbpo4wQc556sNtFqDrPOf+qlAP3ysfqy4bjW7b0F/Cl9Yy0mtrkwLiAHGOZNnUfAWzQWh5+CLsUmyyubUqZGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=RYTTN8vQ; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="RYTTN8vQ"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6479F1132DF;
	Mon,  6 Apr 2026 23:51:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1775512319; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=nQnPJgtQblSY4u4mWRORRnEurcnKBDLQ3F5xVaVMRhM=;
	b=RYTTN8vQU2qAhsmTS1TqGdS6WsaMiv4vgFYcpJ/V8mEv8lTeDKDjUc/6cX4zP9NQuXz7Rc
	zgGUSUBQX2qRJ2XvV+Dvs7kzt1H0Q8jB1x99tHzdXPIg5jBSS0Q+Vh7xRr7kX79B5i0fx/
	iYvY/GmBDIYjTGralYLAlYTZpKL/2VpJ0kK+VH60cXRk4A0Kap5Bk7/0FBZ2K6iDG1JaVb
	/MnFa6DS/MI6IdOl0Y/XYn6X9mYAWiCmS1VA5I3x04l8INpnSjpnypJQzhpfAx6CANm4rt
	uE3WY0C0CJ/Dc3G9VUqilMbT+QoR9bi6hlYjBNcoGCrR+aNtyDoud2kE1giCqA==
From: Marek Vasut <marex@nabladev.com>
To: linux-clk@vger.kernel.org
Cc: Marek Vasut <marex@nabladev.com>,
	Brian Masney <bmasney@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Michael Walle <michael@walle.cc>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/6] clk: fsl-sai: Extract clock setup into fsl_sai_clk_register()
Date: Mon,  6 Apr 2026 23:49:45 +0200
Message-ID: <20260406215150.176599-5-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406215150.176599-1-marex@nabladev.com>
References: <20260406215150.176599-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Create helper function fsl_sai_clk_register() to set up and register
SAI clock. Rename BCLK specific struct fsl_sai_clk members with bclk_
prefix. Use of_node_full_name(dev->of_node) and clock name to register
uniquely named clock. This is done in preparation for the follow up
patch, which adds MCLK support.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Brian Masney <bmasney@redhat.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Michael Walle <michael@walle.cc>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
V4: New patch
---
 drivers/clk/clk-fsl-sai.c | 78 ++++++++++++++++++++++++++-------------
 1 file changed, 53 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/clk-fsl-sai.c b/drivers/clk/clk-fsl-sai.c
index 2a68e32c3167b..7ec9a4f22735c 100644
--- a/drivers/clk/clk-fsl-sai.c
+++ b/drivers/clk/clk-fsl-sai.c
@@ -21,8 +21,9 @@
 #define CR2_DIV_WIDTH	8
 
 struct fsl_sai_clk {
-	struct clk_divider div;
-	struct clk_gate gate;
+	struct clk_divider bclk_div;
+	struct clk_gate bclk_gate;
+	struct clk_hw *bclk_hw;
 	spinlock_t lock;
 };
 
@@ -30,15 +31,57 @@ struct fsl_sai_data {
 	unsigned int	offset;	/* Register offset */
 };
 
+static int fsl_sai_clk_register(struct device *dev, void __iomem *base,
+				spinlock_t *lock, struct clk_divider *div,
+				struct clk_gate *gate, struct clk_hw **hw,
+				const int gate_bit, const int dir_bit,
+				const int div_reg, char *name)
+{
+	const struct fsl_sai_data *data = device_get_match_data(dev);
+	struct clk_parent_data pdata = { .index = 0 };
+	struct clk_hw *chw;
+	char *cname;
+
+	gate->reg = base + data->offset + I2S_CSR;
+	gate->bit_idx = gate_bit;
+	gate->lock = lock;
+
+	div->reg = base + div_reg;
+	div->shift = CR2_DIV_SHIFT;
+	div->width = CR2_DIV_WIDTH;
+	div->lock = lock;
+
+	cname = devm_kasprintf(dev, GFP_KERNEL, "%s.%s",
+			       of_node_full_name(dev->of_node), name);
+	if (!cname)
+		return -ENOMEM;
+
+	chw = devm_clk_hw_register_composite_pdata(dev, cname,
+						   &pdata, 1, NULL, NULL,
+						   &div->hw,
+						   &clk_divider_ops,
+						   &gate->hw,
+						   &clk_gate_ops,
+						   CLK_SET_RATE_GATE);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+
+	*hw = chw;
+
+	/* Set clock direction */
+	writel(dir_bit, base + div_reg);
+
+	return 0;
+}
+
 static int fsl_sai_clk_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	const struct fsl_sai_data *data = device_get_match_data(dev);
 	struct fsl_sai_clk *sai_clk;
-	struct clk_parent_data pdata = { .index = 0 };
 	struct clk *clk_bus;
 	void __iomem *base;
-	struct clk_hw *hw;
+	int ret;
 
 	sai_clk = devm_kzalloc(dev, sizeof(*sai_clk), GFP_KERNEL);
 	if (!sai_clk)
@@ -54,27 +97,12 @@ static int fsl_sai_clk_probe(struct platform_device *pdev)
 
 	spin_lock_init(&sai_clk->lock);
 
-	sai_clk->gate.reg = base + data->offset + I2S_CSR;
-	sai_clk->gate.bit_idx = CSR_BCE_BIT;
-	sai_clk->gate.lock = &sai_clk->lock;
-
-	sai_clk->div.reg = base + data->offset + I2S_CR2;
-	sai_clk->div.shift = CR2_DIV_SHIFT;
-	sai_clk->div.width = CR2_DIV_WIDTH;
-	sai_clk->div.lock = &sai_clk->lock;
-
-	/* set clock direction, we are the BCLK master */
-	writel(CR2_BCD, base + data->offset + I2S_CR2);
-
-	hw = devm_clk_hw_register_composite_pdata(dev, dev->of_node->name,
-						  &pdata, 1, NULL, NULL,
-						  &sai_clk->div.hw,
-						  &clk_divider_ops,
-						  &sai_clk->gate.hw,
-						  &clk_gate_ops,
-						  CLK_SET_RATE_GATE);
-	if (IS_ERR(hw))
-		return PTR_ERR(hw);
+	ret = fsl_sai_clk_register(dev, base, &sai_clk->lock,
+				   &sai_clk->bclk_div, &sai_clk->bclk_gate,
+				   &sai_clk->bclk_hw, CSR_BCE_BIT, CR2_BCD,
+				   data->offset + I2S_CR2, "BCLK");
+	if (ret)
+		return ret;
 
 	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, hw);
 }
-- 
2.53.0

