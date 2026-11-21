Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795298365;
	b=tB+obgbKTGn7nKOgRYns3YAnp12710RJeB41/FAAj2Uos3DwqRDz38Oi/3q3uyZ1DnJ6
	 shj2wxuHVzYYxf4LRXTUDvbWzv+w4VmDvX9W8Tni/W3wv6pAj5vruBSUhV/jauUG9KZxf
	 RrxtJlK3MgpYHwgOC8yxkzP7NFAJsFNhK3AFN2NQ8HBLUxdJR6M1XUlOsKojCEW8BNpHj
	 Lt0h0nWa706AidujEuqClaf67eAR0IErDLkwAadFN6yxfPH7QjEQQ8w9CKj1JXnboCEVt
	 mZvo0iO00DLTcAF5v2MotoQKFkZzrrizhRot2t5nQX7+Lu8MlfTx4PdJ4OEbf2Jn3NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795298365;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ie+VxRMBb1t02FVCSVjXGfw+0mzREX2/XzDdOuWxUVk=;
	b=lBFqbruZ2fwzZr1nTMB5sAJ9gE7aYJHzQxoQrG+0pYFq6hlMjeJPfnDJTn/reJSBynHV
	 mgP5UCLnjrgdXkmP50No0k/xA+CrBo87zv15ttVc/Bo2FKwfrV2ggSy28ZDpLfshCyYpq
	 zEzMXg+XrhcCJtqmuVc7dJyRYwoEOYPgt4V2QIE5cuH/KpZy4w6rokyyigNoDvsL7PJ/u
	 rVUsHdgGvI/RrJ3yoYBTYb8fO2TeKLUfx7TJIqRvyLJkXBEA7zcM0Of7xIX1GiOJEcdFt
	 uR1x/7QXuWVJ03TZ2oq1ITma7hz+I3m1+X57/I24Rs3W4x7TOEXqXOddc8d4r+xzocQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=phQzgBzH;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892D7606A32C
	for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 21:59:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 892D7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=phQzgBzH
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49d05d51553so13977945e9.2
        for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 13:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795298364; x=1795903164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ie+VxRMBb1t02FVCSVjXGfw+0mzREX2/XzDdOuWxUVk=;
        b=phQzgBzHxfryHjZol1TOKctC0THTIqYZJQOwnCWlG7ojtvf5nyhn4AOXob2ymVUdL2
         9wcGPYIc8RKzLq3PN+BCq8oj0REZkXg90eDWlE49LU1m9mZwpd4/LW6i3KeRZl/4+7x6
         cRD3s9FIcaJVsUIZdk4/U/976vBiNqVYahAv5FkEycGhURNJOZndVcxdef5do4XDGDxO
         WOg6HJ31F15R4etc559noKBpCYxFTJ/CcZO+uQfFZyLVpXT/jopg6vsUOshbY/KMCE/x
         EumxbO3a8m9w24qTlldG/a803H9o6aLCMpX+5TKK6FMzKwaAv8NOTnkJv/IP0PrSWZHG
         fHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795298364; x=1795903164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ie+VxRMBb1t02FVCSVjXGfw+0mzREX2/XzDdOuWxUVk=;
        b=coEM0bv72OkMwH6hVbSBFGwq8iiVCUacZJFiFJSTg5ll09ViVppqUtJ1RxYhoOtXKj
         QZ/DpF261GYjW/E8E4+3DUufbQoNLwE9M0Otpv7/sPQS4zgQ2K97dujY+ZsjVQ4XVHhL
         CR5TutTa9PdBDbGHhPud8gTll5BgK5XDk4im1LQTTkgDNmwng6EtK/HlSKemeyXS2/u3
         XF8FM41QibxaQsFls3geieZo55x/xFVxjnTqi+RW9gmvDejSzwp+n/VqXWI7YuBbNBTS
         s6YQGBeA5be48EIyGaMa81WNeqZefY+jNEzN5ijz6GorNqbHu290H+wyIZQH+J+R5uGc
         5oow==
X-Forwarded-Encrypted: i=1; AL+hErFTWaMpnb2I2pJwbskPrp+zLd3VeHilQKx4DnoavVR8PlkvsWKoD47gA55UX1LXcYJ8jV+KXXOSh5c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9r3s8gpI/O4m9HBKkXAmuXWZCCwjzu3sRm1uwjTI3Ank4g9dlU
	VCXbLpCxfY4+LzXJTCOs0NixSYMljdkdU0JM5mp8DWEsKyCciKXg+vx+
X-Gm-Gg: AZFdTZeYUOazkMWhz7vIqblpzOLxO0YlfuIoH6kuySA5Qv+9Ysk9exSHBuISPsUOmMU
	MKj5TXBwQvi12qfC2ZpB1H4S8YTcZiTMgDuy8B4Cj2nykOletJtgw4XWaAlPncbqvdMEJYU/yhR
	+Dc9yvHqz4waWgztvTDbH1StXOPkSjoCXx4nUbmkVGwXVM5omxjE2nBV+PxWB/FifKmplJQHds+
	NUqOxHrBvueIdRmo/Ch/zTn0jpDY2pmZEte81iyK/1pQQyqFCCXzRdW+4ju/eNNwmtHUpGmIWJG
	mtjingMpDoNhLDKzCuHJ0EgBxjlPcbfFhOFetJWRm0bW0XCc4wbLbmeCmcARhk0mq1XN15Mjjls
	Rfa2FyIU8QiSA3FrcUUOdPcWarvOnmuIdh7/FgcpfiCNsgTywfwXoPeSBwVCB0VckjR71ZgUYjM
	BXTXw+OTWyRDpQWx8ttddaE8mkzVj81anWKPHLOH8rFLAUYEIr6NWnYHwtavlJUvFcDpi+SE7yD
	gQy1hMPWuxRDQX3C5MnjbghBM+LObyD/68E2JUMT55LQhSZY4sNTbifkQcljvzl5BMkPXsZSHfA
	wgJA4DJNPxPdRlS2Un2gYB3A1Dskmm/M4ftRHkw6e6pJZLRf3bWtxzNOKa1lM92ITqynMXopWla
	SoCRhHfaiysdBNl4/v35vm+npsc8eCIwETl2U4nneKjadu8OFgeA=
X-Received: by 2002:a05:600c:c09b:b0:4bb:665f:7e52 with SMTP id 5b1f17b1804b1-4bb8880995dmr114190035e9.10.1795298363855;
        Sat, 21 Nov 2026 13:59:23 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-87-17-253-173.retail.telecomitalia.it. [87.17.253.173])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm253651735e9.7.2026.11.21.13.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:59:23 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v8 1/2] clk: en7523: convert to full clk_hw implementation for en7581
Date: Sat, 21 Nov 2026 22:59:15 +0100
Message-ID: <20261121215918.183705-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261121215918.183705-1-ansuelsmth@gmail.com>
References: <20261121215918.183705-1-ansuelsmth@gmail.com>
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

In preparation for support of .set_rate, convert the clock register
logic from fixed clock implementation to full clk_hw implementation with
dedicated OPs for Airoha EN7581 SoC.

While at it also rework the en7581_register_clocks() and
en7523_register_pcie_clk() function to return error on clock register
fail or on allocating dynamic memory.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 105 ++++++++++++++++++++++++++++-----------
 1 file changed, 75 insertions(+), 30 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index b38d7b5dc0ac..1bc11a01e61a 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -126,6 +126,12 @@ struct en_clk_gate {
 	struct clk_hw hw;
 };
 
+struct en_clk {
+	struct regmap *map;
+	const struct en_clk_desc *desc;
+	struct clk_hw hw;
+};
+
 struct en_rst_data {
 	const u16 *bank_ofs;
 	const u16 *idx_map;
@@ -640,10 +646,11 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 		.ops = &soc_data->pcie_ops,
 	};
 	struct en_clk_gate *cg;
+	int ret;
 
 	cg = devm_kzalloc_obj(dev, *cg);
 	if (!cg)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	cg->base = np_base;
 	cg->hw.init = &init;
@@ -651,8 +658,9 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 	if (init.ops->unprepare)
 		init.ops->unprepare(&cg->hw);
 
-	if (clk_hw_register(dev, &cg->hw))
-		return NULL;
+	ret = clk_hw_register(dev, &cg->hw);
+	if (ret)
+		return ERR_PTR(ret);
 
 	return &cg->hw;
 }
@@ -718,7 +726,8 @@ static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 	}
 
 	hw = en7523_register_pcie_clk(dev, np_base);
-	clk_data->hws[EN7523_CLK_PCIE] = hw;
+	if (!IS_ERR(hw))
+		clk_data->hws[EN7523_CLK_PCIE] = hw;
 }
 
 static int en7523_clk_hw_init(struct platform_device *pdev,
@@ -741,46 +750,79 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
 				     en7581_rst_ofs);
 }
 
-static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
-				   struct regmap *map, void __iomem *base)
+static unsigned long en7581_recalc_rate(struct clk_hw *hw,
+					unsigned long parent_rate)
+{
+	struct en_clk *c = container_of(hw, struct en_clk, hw);
+	const struct en_clk_desc *desc = c->desc;
+	struct device *dev = clk_hw_get_dev(hw);
+	struct regmap *map = c->map;
+	u32 val, reg, rate;
+	int err;
+
+	err = regmap_read(map, desc->base_reg, &val);
+	if (err) {
+		dev_err(dev, "Failed reading fixed clk rate %s: %d\n",
+			desc->name, err);
+		return 0;
+	}
+	rate = en7523_get_base_rate(desc, val);
+
+	reg = desc->div_reg ? desc->div_reg : desc->base_reg;
+	err = regmap_read(map, reg, &val);
+	if (err) {
+		dev_err(dev, "Failed reading fixed clk div %s: %d\n",
+			desc->name, err);
+		return 0;
+	}
+
+	return rate / en7523_get_div(desc, val);
+}
+
+static const struct clk_ops en7581_clk_ops = {
+	.recalc_rate = en7581_recalc_rate,
+};
+
+static int en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
+				  struct regmap *map, void __iomem *base)
 {
 	struct clk_hw *hw;
-	u32 rate;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(en7581_base_clks); i++) {
 		const struct en_clk_desc *desc = &en7581_base_clks[i];
-		u32 val, reg = desc->div_reg ? desc->div_reg : desc->base_reg;
+		struct clk_init_data init = {
+			.ops = &en7581_clk_ops,
+		};
+		struct en_clk *en_clk;
 		int err;
 
-		err = regmap_read(map, desc->base_reg, &val);
-		if (err) {
-			pr_err("Failed reading fixed clk rate %s: %d\n",
-			       desc->name, err);
-			continue;
-		}
-		rate = en7523_get_base_rate(desc, val);
+		en_clk = devm_kzalloc_obj(dev, *en_clk);
+		if (!en_clk)
+			return -ENOMEM;
 
-		err = regmap_read(map, reg, &val);
-		if (err) {
-			pr_err("Failed reading fixed clk div %s: %d\n",
-			       desc->name, err);
-			continue;
-		}
-		rate /= en7523_get_div(desc, val);
+		init.name = desc->name;
+		en_clk->map = map;
+		en_clk->desc = desc;
+		en_clk->hw.init = &init;
 
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
-		if (IS_ERR(hw)) {
-			pr_err("Failed to register clk %s: %ld\n",
-			       desc->name, PTR_ERR(hw));
-			continue;
+		err = devm_clk_hw_register(dev, &en_clk->hw);
+		if (err) {
+			dev_err_probe(dev, err, "Failed to register clk %s\n",
+				      desc->name);
+			return err;
 		}
 
-		clk_data->hws[desc->id] = hw;
+		clk_data->hws[desc->id] = &en_clk->hw;
 	}
 
 	hw = en7523_register_pcie_clk(dev, base);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+
 	clk_data->hws[EN7523_CLK_PCIE] = hw;
+
+	return 0;
 }
 
 static int en7523_reset_update(struct reset_controller_dev *rcdev,
@@ -1060,7 +1102,9 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
 
 	priv->base = base;
 
-	en7581_register_clocks(&pdev->dev, clk_data, map, base);
+	ret = en7581_register_clocks(&pdev->dev, clk_data, map, base);
+	if (ret)
+		return ret;
 
 	val = readl(base + REG_NP_SCU_SSTR);
 	val &= ~(REG_PCIE_XSI0_SEL_MASK | REG_PCIE_XSI1_SEL_MASK);
@@ -1122,7 +1166,8 @@ static void en751221_register_clocks(struct device *dev,
 
 	/* PCI */
 	hw = en7523_register_pcie_clk(dev, np_base);
-	clk_data->hws[EN751221_CLK_PCIE] = hw;
+	if (!IS_ERR(hw))
+		clk_data->hws[EN751221_CLK_PCIE] = hw;
 
 	/* SPI */
 	rate = EN751221_SPI_BASE;
-- 
2.55.0

