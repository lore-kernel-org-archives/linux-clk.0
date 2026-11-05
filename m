Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890943;
	b=f5duzC6hoha5yA4yDUrD7Y8AN/GRCLgyxzhq6AvQjLkXXLI0WCqLheKeUW4tVI2zwdCO
	 kf8h4sWTpNCF74MA19oB9Pcxa3WeIoN+sF4okye4OV+h1OY9xjGKDG7eQGtfdR2RYQySJ
	 cfa69oUMBCGl5tiVA/y0qztf19CYtLysD921CDuPg0TXn29dCyh3+CrAUKK+I+eIlKwye
	 DL5HcO3kCONPi0jgver3p/4uxDVGFKQXFSkoMKD7okUHUlmXYvaRlorSAL0Hlg+N7KJXk
	 c/FJecfV3pgZSA0yiBPFmJUc5dzMvsytVFUfrX0/4/PsmC38wsfzAsYbt0O7aPc8Xqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890943;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WhfC9zLe5HZoGXWudWFtnEm8q0utD3cNm8ZYGhH+ONg=;
	b=0XYqP/WOr2z+D8rk9q9fv7p2FsBpYoVaqxTttYLzJqNiZcnr+Vp41DtOi6u2aDFVCRdU
	 Aj4MDQy4CpSQZWbmnYC5WuwXDrPV3Szfw4T0HIRL9J02GegN3BpopYSt46Aoa8nd2FHt8
	 W91+O567F6u7mRH2PSXxxl6ROXbcYpeMqKigCxoy2+TJATOs4KnbeP4dSnFrWGa5IOQqI
	 JN9A5DJQI1MHpFhN/APUvU3SCL2hrR42M5eOEe9pTbkSgSQuHVbgTSB6OITw3ZpLgGEnb
	 DFYFn0N4QCa0YM4gKe4agk1ZrZWgSdrpz1MibKizdMd518xm13Z0QjshmCKl/Az4uYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cYVeN9Ge;
	arc=none smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33728606A32E
	for <linux-clk@vger.kernel.org>; Thu,  5 Nov 2026 15:02:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33728606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cYVeN9Ge
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5bcb4f23ddeso1851864e87.3
        for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2026 07:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793890941; x=1794495741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WhfC9zLe5HZoGXWudWFtnEm8q0utD3cNm8ZYGhH+ONg=;
        b=cYVeN9GeZ3cisxISnKLjZlIyT+rK1yLbIVjHn5XG6in28/fMG2xB8+9AzlcEOP3Tn+
         VWBWNJJyGExU/01KlsfcjQ+ylMG6QiMGe7FF1KzSz3bdgs/hOnktrTMBQgpytVJYHsCQ
         VxX4oqX9UljaU+GOja1bnRi6DSDU/RYYYtQ875uAIOB0AIqf3y5s0sNK5613hTZlRUwh
         YTq+1kF0XuEAtTJAcUlXa5P8jsHKU9NgU76fRFs4U3Tj9Ks4SRZ9+J/XLxF72xbqMsdM
         0OaWT8ZikeZZ+jueJ/8LZekROr5y/eg/X/huh5HKUob+CIZk68DcDtROzj2ZNupegUDU
         miMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890941; x=1794495741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WhfC9zLe5HZoGXWudWFtnEm8q0utD3cNm8ZYGhH+ONg=;
        b=VglCngz7hqwECGDvZZoNSAMvkAIf22EvOMYTkZsun63OtgJE+1smf6qriYV8cJgfmA
         4+oeMGWC0DvoBaKbVf14Gr9RFVJNrXlyfcXd21rEwOwgrrUKziw23fDzWwh41hLEZ1di
         pqobpmQfU8h4I+lM80o5pKtla2Nb+PV41w72kg/eJoDHmMqAfe/zJdv7z6w3cyYtBqVi
         a5IRYe1+ddUJB+LBkx87oVyIegEvG06Q8JriCboBU7MOkf1qXHMMvRsP9z5eaWACaKnB
         gzkON3mcO/I39LqIwZQVegQAKs7EAq89l5yIWqz5WE+vBp+p40M+9ZwKaz21NX5vMvw7
         q3wg==
X-Forwarded-Encrypted: i=1; AKwUvBxZ0xY9/DlidH6/NphMXDuTFfIzxCiytvulqsEmNz8Rheg+9UMUNgMkLzUCrR1swfbLggLmJFIDlms=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vPtPuk+vqMPytK1JfWwjtzLPmjhxu/5D9e+I330bQYhAZ4WiJ
	PiloLiqTnT4V4A4tIRErH1li2hfHrQE25LlgkambPnhRohIuVMQiKPjM
X-Gm-Gg: AYBFou367+3208P7nCaMOj+zlxrEveA/zDkfeY+Boz6Jp4QQbZAzr/niGM+lA+tuKqO
	oujUg9K53tsX9XkF3CiOWePAlVGCGxUTG8jHvRzLdxYga4nf3UXy1emZLTO4iN31heiWXyuOtyk
	KZWtrKiRrsZIuJeiZ6ssQVFxB4hLhm/O/wxTi/dwScZ95t2CjhKSP0lJGXgdBZyXPoILssWj9m1
	3sWW2pCon79lK9IHD1ARzQ0mpX81CtDnGxuz7B7PFPJGYHlef3827mKFB/wJq4b2cNAEnvn/Urq
	3cITFl8iSaRrSdVT4IpmeoXjFrI9TYE7fpydWgF8omALI61eizZ7p2Wq1uqJ2Zgcnto7dcW0PMs
	dFg9Lw7VMU7DSihX/8hKpParMcY934BYGe08cZTFu9d/p55MW3Aq0LXX9eRtCqGVz3n2wBz5mrS
	0M7qZT/TwIqR9/u5eyJQB83H9glW5AJ4CErPstctcsnJOcef3Q9yuQI9RGyPUECJkIKBNOk95uR
	R9PD5LGbC2Xc6Y7/xLASJO0czXaQrQFkMvzy8C0GHcSxeuofnItSsZL29sFmvHRZGIFrBnChySx
	L0bpZvOHcaFCnu7MSktc8/QsmrJqBYGvo5bPS5ZVz0TWjl1RYASulBgJW2vBcnCpbgm0LkiQUNI
	dQg57ibe+qGiEMkhfT9LgpTUA
X-Received: by 2002:a05:6512:3d17:b0:5bf:a27e:e23e with SMTP id 2adb3069b0e04-5bfd957fbe0mr7482897e87.57.1793890941006;
        Thu, 05 Nov 2026 07:02:21 -0800 (PST)
Received: from Ansuel-XPS24.lan (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48fed552aaesm11042960f8f.40.2026.11.05.07.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:02:19 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v3 1/2] clk: en7523: convert to full clk_hw implementation for en7581
Date: Thu,  5 Nov 2026 16:02:05 +0100
Message-ID: <20261105150207.23023-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105150207.23023-1-ansuelsmth@gmail.com>
References: <20261105150207.23023-1-ansuelsmth@gmail.com>
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
 drivers/clk/clk-en7523.c | 75 +++++++++++++++++++++++++++++-----------
 1 file changed, 55 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 24fdec2e6198..6640e814d36a 100644
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
@@ -742,42 +748,71 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
 				     en7581_rst_ofs);
 }
 
+static unsigned long en7581_recalc_rate(struct clk_hw *hw,
+					unsigned long parent_rate)
+{
+	struct en_clk *c = container_of(hw, struct en_clk, hw);
+	const struct en_clk_desc *desc = c->desc;
+	struct device *dev = clk_hw_get_dev(hw);
+	struct regmap *map = c->map;
+	u32 val, reg;
+	u32 rate;
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
 static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
 				   struct regmap *map, void __iomem *base)
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
+		en_clk = devm_kzalloc_obj(dev, *en_clk);
+		if (!en_clk)
 			continue;
-		}
-		rate = en7523_get_base_rate(desc, val);
 
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
+		err = devm_clk_hw_register(dev, &en_clk->hw);
+		if (err) {
+			dev_err_probe(dev, err, "Failed to register clk %s\n",
+				      desc->name);
 			continue;
 		}
 
-		clk_data->hws[desc->id] = hw;
+		clk_data->hws[desc->id] = &en_clk->hw;
 	}
 
 	hw = en7523_register_pcie_clk(dev, base);
-- 
2.55.0

