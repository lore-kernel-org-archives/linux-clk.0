Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792702598;
	b=t1gwVuGFM+B5qbQnEn1nkP6EhUkWN2ErdR5KgQ4jVWmUJI98rVxXIHpWT3XzExygSoO2
	 n/GJaF7mGVYI6DtkOgqtAqiWfQODTztHLVGGpxWJjxREM08qDCSTMA3Ms4GF8MmyM7blK
	 ppaIIhkCBBBDhCnaseKQgJd+7wqb9ks37phMZElrqT63hWUE0vNAlgsnXVrlzXfmt5ZKV
	 /h187ssEFxUPWy9g3jXqN1gshiNEs70TQ/sXlwIdlgu0Ox1xOw7fC0zYPVLhkzTJXgpsp
	 gucYkq4Q9V9w1wcSjbB60Vuqn2nH0uIUC9zyJUKdtsvJwj8QoCQcEfkriv2kncLQMuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792702598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ShBYTnOsDYO99yTK6UtsudX5SewhFVhrgvpTMb1gDM4=;
	b=icuh92FCvCXVkI/m+OZBrnQsbe3e6h1psFL2bW/QV2xJBtM4qAxqL8rpJIO7fy1oeib3
	 IrJj5TLoOUaUxUhTFvHH3zD5IUySAnXpVVTZAd9V9DINm62R/pH4tDOvHz0OBtMpFW1bc
	 tfYlCiF0rLP2UjBu2DnuVjKD3ro9NF/1zDcx8B9QD+9r3MKRSbHSZgrcVvi8yiy/DdeZW
	 nIKnOV4/Xp7ekEilTfM0QJl4phqv0trOw2riKndPvPdE6WZxmLD6tGaECw+f4SiJtzH53
	 dTxC4zccfXccs0zogefkXQj0dO3imzLkU62d7lX/2/ziSnsNuYxI+o+OibHkK6QV/Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=M8GYWX4p;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B70D606A319
	for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 20:56:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B70D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=M8GYWX4p
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e011d370dso170620f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 13:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792702596; x=1793307396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ShBYTnOsDYO99yTK6UtsudX5SewhFVhrgvpTMb1gDM4=;
        b=M8GYWX4plRYySW0lJSNyXmBdwKXow3X+a1uH8e4DSzBnzVFshp2oXCZHNpLtp7fyGA
         tQe/TkDeMhjyvIkUblEr7UFpMtXfwN3P2ERR3CstehRY5jsDu9+Mwz37TNRMLQP2SgBp
         yRatBytyxMfAVaMiX3jAxcAcneXipSI98r2FycDI40+iRlGMoiAfvPCqbcOspgUQPSGM
         QE1taWXGVdIeIuLHc/E2IwpIZWtYbLAVflwSc6j5p58F7gmRlbzmjjyqB5inCezFTAs8
         ZhY5U2vs7IpwkEROJhK01utwZomdX9Kz2o6cDLYxms6dUmvVgVu6yfzwjOuTJYk+q8GB
         VZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792702596; x=1793307396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ShBYTnOsDYO99yTK6UtsudX5SewhFVhrgvpTMb1gDM4=;
        b=S9lPPvuaEdJHVKFxjljh84gm3ImRwpO/+v74g7n6SNyg/YTtvhfqiPp+OYJZB/P0La
         RAJkkG+KgxP6YNn5JdWIoFfpTWTcEh53F0uz3YHWKPkzH3IjdMjrP+HZlrlo/1aRPqyp
         WKTjDIgudDXzIiu7dwVfArB3GLb8atZIChwEvn/lYO9mPg6/4IUBrkLmm5KztDjeq0h7
         LSjcjkIsrJ1W2bnEnKS4JVaBGvCIB70hlBA6TQ64HKOP6mRzPyJQIMXNholuty1ktgWl
         /doYAcrvxs9OBG+FVq7Dj33PH34yBJWSRrJE7zrzSOxgt2MEw+7HF9a+1ydPqVGxW+sD
         5eXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJ+F3fOYG0fknNngUjxYOJJ5Z6Xu7ebZpJBeGLRhOJ447cNcKz6MJiaMUCzh2d+KY465yvVa5TZxc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIoGUnqUJkwz55XEFBBqvl8Mt0NO8eHtg5BjpBdKtqaOq9vnB6e
	6ixqcTy54P4SuoncgSLk0kSy0/kBaqcr8Xo1km48aI5x6uQHythsZ6Ti1KV2Fw==
X-Gm-Gg: AYBFou0Q6ml5n4wqpaar8cxr9b7Ct3QtIDQTWFYuU3UwIFfZjphDlpQJK1AdCga5F+o
	72n3Zf8lbexGscJpksqUlp+dyIGP9Mtr/MVN93J7hMvyYGNpPx4G4tmndiAuJ5H9RrLi9kFJ+u5
	oUPJx6FO8Tr40aJJYZwWQGW4zaO5w7GJlEXefz3Z1Gy6hQCnbXEs9UTgG4ZA/v2lyQ9BMsIsQPC
	G3iw2/enP1+v9EHwr1FLdxtikrqxD5saYXXfSGac+jyyOvR7WtdR3j+m3qz6zF9nxP8RZ5HtlMG
	tPJlxhH02IpU4zRFxxIgBbN3Rnk0ATLYtCqlvBo2ffrkB3dm4zznQwWss1NFMEdGDm34ruBZrS2
	J6/5NHxHJtI4x20Z0zvb3vS2uLZHhaMRZRicGJsJvcTKgmv2J0zXqUDOCafQibYH5k/F4W48/lz
	BqDwBEHXdNYOBI2rarfpOK502lE6iNoUXLSJkyhNBx3tSLtgOpLjXdLNcuplorKFRUbQAOE+CJq
	FAbaGevH0Pz791V7O/Kw/XLNym3/gm/9uRHrWC6K5T8QOcS0YITwQrUPEmFH6++wu4Yh+L/7bI9
	devhulq0m5Tti9+VRrN0QXd3M/vAJ3JuASko+HV4nweolMfAGXaqqC3yUD0g
X-Received: by 2002:adf:fd0b:0:b0:48b:59f:db9c with SMTP id ffacd0b85a97d-48e385cb1admr27371f8f.53.1792702595465;
        Thu, 22 Oct 2026 13:56:35 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e38025c67sm394006f8f.20.2026.10.22.13.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:56:34 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 1/2] clk: en7523: convert to full clk_hw implementation for en7581
Date: Thu, 22 Oct 2026 22:55:33 +0200
Message-ID: <20261022205535.688352-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261022205535.688352-1-ansuelsmth@gmail.com>
References: <20261022205535.688352-1-ansuelsmth@gmail.com>
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

This is just a rework and no behaviour change is expected.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 86 +++++++++++++++++++++++++++++-----------
 1 file changed, 62 insertions(+), 24 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 24fdec2e6198..2f203c94f87e 100644
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
@@ -742,46 +748,76 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
 				     en7581_rst_ofs);
 }
 
-static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
-				   struct regmap *map, void __iomem *base)
+static unsigned long en7581_recalc_rate(struct clk_hw *hw,
+					unsigned long parent_rate)
 {
-	struct clk_hw *hw;
+	struct en_clk *c = container_of(hw, struct en_clk, hw);
+	const struct en_clk_desc *desc = c->desc;
+	struct regmap *map = c->map;
+	u32 val, reg;
 	u32 rate;
+	int err;
+
+	err = regmap_read(map, desc->base_reg, &val);
+	if (err) {
+		pr_err("Failed reading fixed clk rate %s: %d\n",
+		       desc->name, err);
+		return err;
+	}
+	rate = en7523_get_base_rate(desc, val);
+
+	reg = desc->div_reg ? desc->div_reg : desc->base_reg;
+	err = regmap_read(map, reg, &val);
+	if (err) {
+		pr_err("Failed reading fixed clk div %s: %d\n",
+		       desc->name, err);
+		return err;
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
+{
+	struct clk_hw *hw;
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
+		en_clk = devm_kzalloc(dev, sizeof(*en_clk), GFP_KERNEL);
+		if (!en_clk)
+			return -ENOMEM;
 
-		err = regmap_read(map, reg, &val);
+		init.name = desc->name;
+		en_clk->map = map;
+		en_clk->desc = desc;
+		en_clk->hw.init = &init;
+
+		err = devm_clk_hw_register(dev, &en_clk->hw);
 		if (err) {
-			pr_err("Failed reading fixed clk div %s: %d\n",
+			pr_err("Failed to register clk %s: %d\n",
 			       desc->name, err);
-			continue;
-		}
-		rate /= en7523_get_div(desc, val);
-
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
-		if (IS_ERR(hw)) {
-			pr_err("Failed to register clk %s: %ld\n",
-			       desc->name, PTR_ERR(hw));
-			continue;
+			return err;
 		}
 
-		clk_data->hws[desc->id] = hw;
+		clk_data->hws[desc->id] = &en_clk->hw;
 	}
 
 	hw = en7523_register_pcie_clk(dev, base);
 	clk_data->hws[EN7523_CLK_PCIE] = hw;
+
+	return 0;
 }
 
 static int en7523_reset_update(struct reset_controller_dev *rcdev,
@@ -1062,7 +1098,9 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
 
 	priv->base = base;
 
-	en7581_register_clocks(&pdev->dev, clk_data, map, base);
+	ret = en7581_register_clocks(&pdev->dev, clk_data, map, base);
+	if (ret)
+		return ret;
 
 	val = readl(base + REG_NP_SCU_SSTR);
 	val &= ~(REG_PCIE_XSI0_SEL_MASK | REG_PCIE_XSI1_SEL_MASK);
-- 
2.55.0

