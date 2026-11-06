Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964757;
	b=YG8mum6C1W3DYAHzSr9skU6JDDojGO9yJQZNLCmuXD4YqlM07TSae3UTNIkCNY00feDR
	 uF+WnWPhXrrISbE89/P+iUe4JGv8INwYavZRDjqv7ND+54PwqKM3RMbk15UEH7IYccL3l
	 frQM1iHwAajXdgYlSeqhhKJECdD6w7YXTSrj/sbT7WsG+EOwdnCj6ERvW95YD0xMQTqH1
	 FlksREhRLaFQUK0gYJW6Pj5TqFChlzJc7CraxPgmFzsUkn1ZVELkWZdCU90V1mc5Kg+mp
	 OLjurhcVm6WT3Xif3dto2/l3WFJKZUiuGBC7/CEGa3N4DyMzys7+mUwM3MC3FyizkRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WhfC9zLe5HZoGXWudWFtnEm8q0utD3cNm8ZYGhH+ONg=;
	b=mNYAEAxYRL+0ZjbGZc+Xzp2B6kOsQg5wv0i81f42r39uLdyUstXI/9h2Et9/EaQtTKa+
	 cgzJPm1HkCm+kMiLkuE9wl3P6R7zRBi4nrjGcRpZpCs63OXA7LqImxpHlfqBVuiXWcX71
	 ZPS3V/tcHeKiY+mAIpMPRlPL22N/GcF2MlTVQRID9HifJYDuvcgJxQLkTGL7/kDDbLqWA
	 gYys4CqDkqNgTTU9EddhhLONi/d7kR1miokZhnr5VJM6CH7ChRxS6lE2NGFZJMvsC9SmF
	 SVJ5ix+ESIjd+eZtuBzKAr4LbXno4ILDnTuI+8lSULEuk0w6LG8bnqSYXBdn9rBJMsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GcxkvHdU;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B287360A6F7B
	for <linux-clk@vger.kernel.org>; Fri,  6 Nov 2026 11:32:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B287360A6F7B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GcxkvHdU
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-492690dd5daso376883f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 06 Nov 2026 03:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964755; x=1794569555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WhfC9zLe5HZoGXWudWFtnEm8q0utD3cNm8ZYGhH+ONg=;
        b=GcxkvHdUoMJNPaGmfdiQuon9pe+1ohct49QQwJ8+UUeqf6iT5IHTNhD//VVnsX3hEc
         TOp2EmQ5CyF/MX8SDoYjC1nK4OF2I2rehnfmrUHEyK0YnNnWP0bF3j4JZnTw3FA2GO8I
         Ah/jONPlGDOw+4602BhXQTBPdeCmb5pxa59Nhw6vOUAMlBuNxs2yHGw81atrpRQFbxhZ
         0TkXSLaVrTqVudX5+DaKxwv0B8xOxkbcTcwRX7uBO4Uj3zq8ZLR0yYQAthQF+Jupayd3
         WUY9R7D6XBoOeiHMaXdCZBPJN5hH57Vjep8vVn9KYjv1Duu2/UGm5lKYN0Z/8sdfE5Kp
         PPRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964755; x=1794569555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WhfC9zLe5HZoGXWudWFtnEm8q0utD3cNm8ZYGhH+ONg=;
        b=FUlh3SF/WF/eCU/YxG5mGRJXuhZL72GSkWwzKhM5EU1MPB92Q5QrVfV3f3JZvp4iKL
         FxpJx7oRKjZGpuY1FRooeveVKvuyaVUBtSKbygk9eEyMZsOk3id+tm7H8V4omhnktLwY
         +rjPP5IGJRytBu6stOHnu0U7Y+NAWnJlLGdnYH/+Jy27wBPyfBltoWFjrv5mJp8+v3I5
         d7tqGrSeWPBCGdLII/fvDO25Orn8nj4ozQqNeMoQ/ahXkNNdFNJyUaY+QZ7FeQOnP52O
         rnKhvf9MM+daO//H9vTe2gu6qndDjZcZPzucWexI9fMpvLv+hb1jgle2Y/1/MY83uTr8
         /zqA==
X-Forwarded-Encrypted: i=1; AL+hErE10hr3WCaxl871souIpdlHOnQW5ykSrUoXVYSaCQaTKdtnAfY8knJeK/9KzvQzDOL6roQ33jRkuvw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZE4fbiZ3KebtHDKDa3uiNVZv8cBRcO8E0TwHGl5WuUZ90FuIM
	PXtOEclyuIwb9hio/6RDNlwhFObKJCTfyx685Lj1Rl+Zw6m2ExxGaAxU
X-Gm-Gg: AYBFou2GHyW7Ws7BkIpgFEeRTj3TVhIlDorO6syahNdDJaul1tBT11NmE7i/0oo0B1n
	Xbvj7HD4yNn9+WT5IpYHBBYX5zQtOag85Uu1aeVQZ7MGl5B1UkzJcJX4/vOb2OR2d8wTHvjLeOy
	cwfT8tC4fsPoW7RyzP+QVzEGdaXS4iE7hGVZXhWlNu3i/pD7agB2qqs9w9tfb6uTumy0XXrsDFz
	VhcQ1elCNdk6Y+DPjZq1mg/LexpWd8whW6iN6Izw4TE5Vxgm6FYuSPaoC8lghVeJOHaVVo/UMTe
	eYd+Z+7FA/wVN2/VQQxgDUJSU1QkYK8Nrj1DuADDnta0Tf+nCT/0GY0Hd9FqfpoU7gbGGv8k75e
	jUgkV2Xzm4zWhH9aLw4B6IgcUxG7GkNOtwtywEKDSRH/7tc/t7naL4VeWPMXYvSvkMBkAsbEUsh
	L69bscYTEcsOnLkIdwiKGlL2MIJda1rbUVQEb1kPYpBMQp3WOOdAFwUXDO+JBca1H0ySXbjXHD6
	WbN4Arplvxi+Vmdd2lKATnFY8X8WMf5fLZeA+NSYkBzSyACxfwnUFetp5LMmCgCY5Tj3+Y+obPO
	Gmk/cqMtZJXT/3ra1qUOp8EI2Q0hVFaEGy7YPArOl+5ZhFGQiW5OvvCHT/U8T7y/XJzcc6OO9ZF
	wPz6czvswLW2FHBuMzoIdSGRxvrCYBn71TPXDiyL9U+mwZJup6QDGs5A=
X-Received: by 2002:a05:6000:27d0:b0:48c:67d6:a87a with SMTP id ffacd0b85a97d-49276d4d926mr3447258f8f.32.1793964755054;
        Fri, 06 Nov 2026 03:32:35 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-492d72333f9sm3254280f8f.29.2026.11.06.03.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:32:34 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v4 1/2] clk: en7523: convert to full clk_hw implementation for en7581
Date: Fri,  6 Nov 2026 12:32:24 +0100
Message-ID: <20261106113227.182324-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261106113227.182324-1-ansuelsmth@gmail.com>
References: <20261106113227.182324-1-ansuelsmth@gmail.com>
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

