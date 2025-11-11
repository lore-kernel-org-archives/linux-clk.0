Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575BC36B059
	for <linux-clk@vger.kernel.org>; Tue, 11 Nov 2025 15:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762876596; cv=none; b=dn0jvjs+KtgAR52UNCPSe0si1O2ti+JLlcyAMn0sNNVSAbh0+xkoLR5senjhjY5tXhxlTMsm+zoh2PJBJ3yoklG3N4jX+qnordOiUt4Vs2vl4Qdkn0CYfeVfjzoTveTfvhhM6iHIm70gcY1KxnmtDrwK4ecB5dTDORpaHGkMi2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762876596; c=relaxed/simple;
	bh=XVTIKGDo9ThWVGg8qcTaNRRTvL4SJHb9lTtxpWqTLR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oDEpxcnUJwqVzUvqKh1VUOpYYXrVwsEp5e4TEwPYuGYhFWuV9mFLWRHdxB8uuhcXjX32gdFa9gkrOa+EBTppnyKe5ZUmFdQ3SonKOkdQR5mU1e9ptcjGgQcg29SwkFUbW/MJebGjyghNY4DeUoC1niXGoq3tUXYoldP0vOWaj5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SY1oZ1N6; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SY1oZ1N6"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47778704516so14385345e9.3
        for <linux-clk@vger.kernel.org>; Tue, 11 Nov 2025 07:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762876593; x=1763481393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pskgOVcQzGBDwVn3zzaWjuy3GbH8LGu28I4+iALHLrM=;
        b=SY1oZ1N6fAUVuuKYBYIkAaIgjOut1rWEmwS0XeF2FjfIDTBjMH019fwwgxiPMDCJlY
         k+Kg5cCezOowMoH4XcqARP6tzSlDp7W78MbLh9t0L2SkWPgAQ5yz4VDD7mP/1vqKIHFW
         8VQrFlSmW0sVAAjM6RbyCsVHZYv0XznXAsTB7FJozipH6oFVb0yqqBo7e6OO+nO5cvkb
         dIq3k5otIGg/fYJnD4Rdrivd6hHDr6LQtu8uPy4idInQLGMxCQfBMaCFLtbVQT0e/5D5
         LJHSAiL+dfu/Q2Vhf/YCy3Pbr5GSKJ9W4vaxyQZoe/upBfvV0Yx6iFnOcFeSuwvn+GsY
         i9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762876593; x=1763481393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pskgOVcQzGBDwVn3zzaWjuy3GbH8LGu28I4+iALHLrM=;
        b=mEj2mnhv7+annzORPc0YdkKeVNvfIpVoAap7j7TtytfrEHhdBWv3dV30yqRnyAmDNG
         cBWpwoEIv9BYAj9E1oF52cx3Jf0Mwh/6IBDYqwPie6uaqIRD1wLxkopmC9X5UHPfyiYH
         6dY0hoQcVXtJuMQhWyRzlVAZQoyG+qeu1oBd5IDSSdNEN1qITcJ0MR9ybSXxFu9+yfwU
         7Gafio6+XMl5c/wkqmV/HYEllpHn6Ml0Mo3vJZTbXIIPReMexY8UD8VYqX0xbdtmL8r9
         Melv12y7JY9mygeMmD/SOKg2/G/4lgJTnCJlCksl1K8PbAfexig9oyey2ckO/VF/tDPv
         lTQw==
X-Forwarded-Encrypted: i=1; AJvYcCUXQ9b7FreiBxBDCa/rHn0r8zrlwQFxK8dbrUUjEz3rVOJqxz7dGhloppR1stmel4E+n9dZPCVjhSM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyce+MFY7RfeuL0ySdGCKiuxL5i9SkdupxMxG5qr5SclN0ORl3Q
	B6+OPMZB17qhDrPs4h7BDifWBsuXLCk0dueHU/lb6kG4Ksz5fx4ef423
X-Gm-Gg: ASbGncsdrLhAltLlumVy5PwDMOlHlbkrYp/LfGSQHZPN0rnFHbIj2ALavOI9InVhb7Q
	HFj1lpG+FZ+qZfNhiu3DbQ+BRpzye/fBeJuDNkZeAdtSNYT3Bl85TBVZ4W2KuJtpigpfmACXsSH
	5NjWBh6b1kiCxvvlcW/Vv9VN/0SEWJeVIsBfkNtYgiirGCsBYgGc+GB8Bc8oyegXv8lAkROsQxB
	QVZLiCaiqZnux99kdXrfzFAshPE2E0oo1PL/x3Uafd20bv81WE96iVP7vG97KZIvckCQbK0XzDo
	vlJbbpfPqsGSHRqJbTfTGiijgrxBKlbMckIqCNGfSgji1sHkxwuQXHzXT97hJ3TyXpldOUoO36g
	AcawY/9qJtRzccgjnt/lTVB135pZjZkbqlqr01M6cfX0hxZsiSCjKmGzfDsy5MmqIWkXmyErJH5
	9sE94BNKOleU88oYSUbyCa3Hs9fynQEftv4tdj74Ue
X-Google-Smtp-Source: AGHT+IGNg1qYMZqiG3WtGb0ldIMecp9uKwNT0ppjRrCM4YhFq4IcRBoJvBHU+lPwykx7FsAHAwE8Tw==
X-Received: by 2002:a05:6000:26ce:b0:42b:4219:269 with SMTP id ffacd0b85a97d-42b42190643mr4381837f8f.41.1762876592349;
        Tue, 11 Nov 2025 07:56:32 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42abe63e13csm28676766f8f.19.2025.11.11.07.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 07:56:31 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v4 2/5] clk: en7523: generalize register clocks function
Date: Tue, 11 Nov 2025 16:56:18 +0100
Message-ID: <20251111155623.9024-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251111155623.9024-1-ansuelsmth@gmail.com>
References: <20251111155623.9024-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Generalize register clocks function for Airoha EN7523 and EN7581 clocks
driver. The same logic is applied for both clock hence code can be
reduced and simplified by putting the base_clocks struct in the soc_data
and passing that to a generic register clocks function.

While at it rework some function to return error and use devm variant
for clk_hw_regiser.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 148 +++++++++++++++++----------------------
 1 file changed, 66 insertions(+), 82 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 314e7450313f..b040f0f0d727 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -78,8 +78,10 @@ struct en_rst_data {
 
 struct en_clk_soc_data {
 	u32 num_clocks;
+	const struct en_clk_desc *base_clks;
 	const struct clk_ops pcie_ops;
 	int (*hw_init)(struct platform_device *pdev,
+		       const struct en_clk_soc_data *soc_data,
 		       struct clk_hw_onecell_data *clk_data);
 };
 
@@ -450,10 +452,11 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 		.ops = &soc_data->pcie_ops,
 	};
 	struct en_clk_gate *cg;
+	int err;
 
 	cg = devm_kzalloc(dev, sizeof(*cg), GFP_KERNEL);
 	if (!cg)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	cg->map = clk_map;
 	cg->hw.init = &init;
@@ -461,12 +464,62 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 	if (init.ops->unprepare)
 		init.ops->unprepare(&cg->hw);
 
-	if (clk_hw_register(dev, &cg->hw))
-		return NULL;
+	err = devm_clk_hw_register(dev, &cg->hw);
+	if (err)
+		return ERR_PTR(err);
 
 	return &cg->hw;
 }
 
+static int en75xx_register_clocks(struct device *dev,
+				  const struct en_clk_soc_data *soc_data,
+				  struct clk_hw_onecell_data *clk_data,
+				  struct regmap *map, struct regmap *clk_map)
+{
+	struct clk_hw *hw;
+	u32 rate;
+	int i;
+
+	for (i = 0; i < soc_data->num_clocks - 1; i++) {
+		const struct en_clk_desc *desc = &soc_data->base_clks[i];
+		u32 val, reg = desc->div_reg ? desc->div_reg : desc->base_reg;
+		int err;
+
+		err = regmap_read(map, desc->base_reg, &val);
+		if (err) {
+			pr_err("Failed reading fixed clk rate %s: %d\n",
+			       desc->name, err);
+			return err;
+		}
+		rate = en7523_get_base_rate(desc, val);
+
+		err = regmap_read(map, reg, &val);
+		if (err) {
+			pr_err("Failed reading fixed clk div %s: %d\n",
+			       desc->name, err);
+			return err;
+		}
+		rate /= en7523_get_div(desc, val);
+
+		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
+		if (IS_ERR(hw)) {
+			pr_err("Failed to register clk %s: %ld\n",
+			       desc->name, PTR_ERR(hw));
+			return PTR_ERR(hw);
+		}
+
+		clk_data->hws[desc->id] = hw;
+	}
+
+	hw = en7523_register_pcie_clk(dev, clk_map);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+
+	clk_data->hws[EN7523_CLK_PCIE] = hw;
+
+	return 0;
+}
+
 static int en7581_pci_is_enabled(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
@@ -504,38 +557,6 @@ static void en7581_pci_disable(struct clk_hw *hw)
 	usleep_range(1000, 2000);
 }
 
-static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
-				   struct regmap *map, struct regmap *clk_map)
-{
-	struct clk_hw *hw;
-	u32 rate;
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(en7523_base_clks); i++) {
-		const struct en_clk_desc *desc = &en7523_base_clks[i];
-		u32 reg = desc->div_reg ? desc->div_reg : desc->base_reg;
-		u32 val;
-
-		regmap_read(map, desc->base_reg, &val);
-
-		rate = en7523_get_base_rate(desc, val);
-		regmap_read(map, reg, &val);
-		rate /= en7523_get_div(desc, val);
-
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
-		if (IS_ERR(hw)) {
-			pr_err("Failed to register clk %s: %ld\n",
-			       desc->name, PTR_ERR(hw));
-			continue;
-		}
-
-		clk_data->hws[desc->id] = hw;
-	}
-
-	hw = en7523_register_pcie_clk(dev, clk_map);
-	clk_data->hws[EN7523_CLK_PCIE] = hw;
-}
-
 static const struct regmap_config en7523_clk_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
@@ -543,6 +564,7 @@ static const struct regmap_config en7523_clk_regmap_config = {
 };
 
 static int en7523_clk_hw_init(struct platform_device *pdev,
+			      const struct en_clk_soc_data *soc_data,
 			      struct clk_hw_onecell_data *clk_data)
 {
 	void __iomem *base, *np_base;
@@ -566,51 +588,7 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
 	if (IS_ERR(clk_map))
 		return PTR_ERR(clk_map);
 
-	en7523_register_clocks(&pdev->dev, clk_data, map, clk_map);
-
-	return 0;
-}
-
-static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
-				   struct regmap *map, struct regmap *clk_map)
-{
-	struct clk_hw *hw;
-	u32 rate;
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(en7581_base_clks); i++) {
-		const struct en_clk_desc *desc = &en7581_base_clks[i];
-		u32 val, reg = desc->div_reg ? desc->div_reg : desc->base_reg;
-		int err;
-
-		err = regmap_read(map, desc->base_reg, &val);
-		if (err) {
-			pr_err("Failed reading fixed clk rate %s: %d\n",
-			       desc->name, err);
-			continue;
-		}
-		rate = en7523_get_base_rate(desc, val);
-
-		err = regmap_read(map, reg, &val);
-		if (err) {
-			pr_err("Failed reading fixed clk div %s: %d\n",
-			       desc->name, err);
-			continue;
-		}
-		rate /= en7523_get_div(desc, val);
-
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
-		if (IS_ERR(hw)) {
-			pr_err("Failed to register clk %s: %ld\n",
-			       desc->name, PTR_ERR(hw));
-			continue;
-		}
-
-		clk_data->hws[desc->id] = hw;
-	}
-
-	hw = en7523_register_pcie_clk(dev, clk_map);
-	clk_data->hws[EN7523_CLK_PCIE] = hw;
+	return en75xx_register_clocks(&pdev->dev, soc_data, clk_data, map, clk_map);
 }
 
 static int en7523_reset_update(struct reset_controller_dev *rcdev,
@@ -689,10 +667,12 @@ static int en7581_reset_register(struct device *dev, struct regmap *map)
 }
 
 static int en7581_clk_hw_init(struct platform_device *pdev,
+			      const struct en_clk_soc_data *soc_data,
 			      struct clk_hw_onecell_data *clk_data)
 {
 	struct regmap *map, *clk_map;
 	void __iomem *base;
+	int ret;
 
 	map = syscon_regmap_lookup_by_compatible("airoha,en7581-chip-scu");
 	if (IS_ERR(map))
@@ -706,7 +686,9 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
 	if (IS_ERR(clk_map))
 		return PTR_ERR(clk_map);
 
-	en7581_register_clocks(&pdev->dev, clk_data, map, clk_map);
+	ret = en75xx_register_clocks(&pdev->dev, soc_data, clk_data, map, clk_map);
+	if (ret)
+		return ret;
 
 	regmap_clear_bits(clk_map, REG_NP_SCU_SSTR,
 			  REG_PCIE_XSI0_SEL_MASK | REG_PCIE_XSI1_SEL_MASK);
@@ -732,7 +714,7 @@ static int en7523_clk_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	clk_data->num = soc_data->num_clocks;
-	r = soc_data->hw_init(pdev, clk_data);
+	r = soc_data->hw_init(pdev, soc_data, clk_data);
 	if (r)
 		return r;
 
@@ -740,6 +722,7 @@ static int en7523_clk_probe(struct platform_device *pdev)
 }
 
 static const struct en_clk_soc_data en7523_data = {
+	.base_clks = en7523_base_clks,
 	.num_clocks = ARRAY_SIZE(en7523_base_clks) + 1,
 	.pcie_ops = {
 		.is_enabled = en7523_pci_is_enabled,
@@ -750,6 +733,7 @@ static const struct en_clk_soc_data en7523_data = {
 };
 
 static const struct en_clk_soc_data en7581_data = {
+	.base_clks = en7581_base_clks,
 	/* We increment num_clocks by 1 to account for additional PCIe clock */
 	.num_clocks = ARRAY_SIZE(en7581_base_clks) + 1,
 	.pcie_ops = {
-- 
2.51.0

