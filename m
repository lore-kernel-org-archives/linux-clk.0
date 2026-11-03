Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793739313;
	b=lXjybjFPkRfC2b8l+Np/l5IBRo0eTCNCLO1TAQj+fhQVqUNb22MJLG/08Y/dRc3EcgeG
	 p4m3NCDocjMtL0vehrtJD1WYC3lVgGVaFBt+FlV7mrkHVRTCIuz0MeBiAQkdywEDnexAq
	 FXWF7iQhsrGRbxf7D4ynN0XxfqyrjkVi6Zy/gTC3Rwb9b7kOlvDVv4P77MpqnzoOXsf9p
	 OdOLUCdh1XPLo6HkqQDyT4kUSvWv9GRv/AkHohtJs45XPGV9cXyMxkthTOjDbEbu8BYVh
	 gUkkpjMkBZ0rgbsjrGlAaVJL29/K5EBVZwS6CZ0ssuMz6W3PcsJDu/J/hFgNRwPrhRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793739313;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6kYjp/c/VLGWhL+j1GfkH8g34hTaPrX0tCHpRbxJcD0=;
	b=pZDDCGLvrOurPd0qWjmuQ9KxupS0jPm+C5W/SOA2g90wjh0Frlwb8q+/0ttih2UDHF02
	 lR/u0eHHFzfPB9s30ikZ8zeXZGPjIHT8Jhgt5Knp7TI7l6YcthLbSbGkHsRPqdS6BdKBi
	 TsMdNJ921WNTpDATFdU7yDvOorYBPF+7YghOSxYn/V+mTc6EBmf3mCQJY6Lad+6RmHJ08
	 CfNUtsgaJyGwiIUgdaxjY65MNG/29W/rRbKxQo7V0Ut/9BxUthwqc3F3U4tGorSFw64ln
	 yXxgID1hkY8MZDe5L4gK/XLkgYrh/olPLeWhGTGwkg5e2rkOhrXVTAToVuPFjR/FATQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XTife1AU;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035B2606A324
	for <linux-clk@vger.kernel.org>; Tue,  3 Nov 2026 20:55:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 035B2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XTife1AU
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso41238085e9.1
        for <linux-clk@vger.kernel.org>; Tue, 03 Nov 2026 12:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793739311; x=1794344111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6kYjp/c/VLGWhL+j1GfkH8g34hTaPrX0tCHpRbxJcD0=;
        b=XTife1AUuSmUXnRTDoeyTTj0VZ5OMWHc7vqW0h5XEuzBDSdW8dVj5dfLIKCNi83WMO
         TN25pqdXU82AyOX2vZSbg/0xkrSYB5FNLMjm2zaYSJGhLxFBTStqrbwYMALVBT8Vf8sF
         CIWHBRkDQ+JL5Nryy9hi+8gt6NpiAZ5TIuTl4Vix6qfm/195UpaJkulMz5fB35IPOBYD
         0rWKapYvuyYQaZaxLRSKVfdEC7XJrPi742XeA8YgfI/2Ae16CBD03rBWsUrg82aFrsh8
         Zxx0PYeNR9SEe96NarnYx5wQuqta/pFaCeYqUWywobf8AZZo0E6d0e/fyRq2GtfTvuFY
         2kAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793739311; x=1794344111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6kYjp/c/VLGWhL+j1GfkH8g34hTaPrX0tCHpRbxJcD0=;
        b=c3tRwgfpxhpeUJ1KsZ4wdNvp2Y1z6ldpAoHsW5O7rGFuwEsJjletVR+Y8C8z2lVdSa
         bbtdwTftH2sM9oQUnGTqUvGn6zhG1jEi85pkW2Y0iIXmwFSkRHTg1oONWDWeREBQg0mV
         xXI4Vh/G+LGeFmIH8EoMHOepkHw0rv2EdNCDLeJNvElqpjnntgNv5qFzB+tGzYpHlEAd
         6nBJ3eZFC3S4tpSP6/789aCWcdRXrtb+HuIiPYtu8BlO59jTrdjXqZSFze5wlMzzoppt
         YdpPjpAoV751s0YdKQTBrcYqSxO/jA+foafgkSj1FEEDZhuvHshRbMSfTB2cbRKmDU6X
         wIjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzv6YyyH/K0Ha0Trwvzvwsfs0FppgXXsR/aa//4Im6AIX1crzVsKILSqxH/8s9nmA2AjPXflx0Vtk4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xIl89UNDI13U7CDkH/X/9R8hQ8/xDoBh72IjaeE+U2GlQLlZb
	AgXP3num8PbNJ5jfuBkcuNaMCSqY52WFuLWcoc84JUcRkaHaBRikVjbB
X-Gm-Gg: AYBFou2pHz+4/Afy0YRu7yMydE+mJoZmojiDYkSTQTM2ZbNiz4eMiw0IYPR+OtYcFjT
	Pue3VkraGke8HxGT5WJfcaxzEaJ073FUpvrjR0c9TxDygEKqUC5l5uLxpk3zAGCGwSaAm2TKudb
	SbkQNjfygYJu9C4vobpgtpplOmsIxmOQB8t31LmvBAcFsYBB2FAQw5KBSqV84v7G9o74f3+AN9J
	vSecV9CT55Gr0PRvSz+4g7P2KTFF/+sZh3ktkrEoOYOgwI8XjuIGeOsv6AIs3vQUtHdPWiJlxEX
	KN/NJ+vT3JTTbz5KRRPGHIJM1vFmoRoNi9yiw56z+t2X7/5EQdyOhD43lw6L8orcJqYR2FptM1l
	cfI9gRUmYivrWyEvejjyHwBQ5m1uwhWxNH2vc1rizqpMlQtIllJ3/0fytCLK1TkvIloFMHxi+IY
	fnIZt/t/fuqL5QMXTRwXPSZHbyKxOaK/wWt8EBLT8A8e8YYH9BE/VDlwcru5RKSDSOkhBQVeyI0
	dnUPTUsSIuftuV4wmUw84OtgDglB8Rpne8+jmehcAoe/C6GOZa/nfWC2eaUL5lF69Wq3YwPoY0F
	izskiNDa5RMI/NfIK52qft7kxxyUIuAx8hl7+PiF0N9wxr2kBERUmbtEkWAvDxY/mzXrTsyMIAf
	tCB6WHT/Jy+MAMjOuwIE1tlnrZJ0brhapQA==
X-Received: by 2002:a05:600c:34d1:b0:4a0:b6:4619 with SMTP id 5b1f17b1804b1-4ac12475a61mr331900865e9.0.1793739311446;
        Tue, 03 Nov 2026 12:55:11 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b43457595asm1140405e9.4.2026.11.03.12.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:55:11 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 1/2] clk: en7523: convert to full clk_hw implementation for en7581
Date: Tue,  3 Nov 2026 21:54:19 +0100
Message-ID: <20261103205500.14974-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103205500.14974-1-ansuelsmth@gmail.com>
References: <20261103205500.14974-1-ansuelsmth@gmail.com>
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
index 24fdec2e6198..aab4306ae037 100644
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
+		return 0;
+	}
+	rate = en7523_get_base_rate(desc, val);
+
+	reg = desc->div_reg ? desc->div_reg : desc->base_reg;
+	err = regmap_read(map, reg, &val);
+	if (err) {
+		pr_err("Failed reading fixed clk div %s: %d\n",
+		       desc->name, err);
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
+			return err;
 		}
-		rate /= en7523_get_div(desc, val);
 
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
-		if (IS_ERR(hw)) {
-			pr_err("Failed to register clk %s: %ld\n",
-			       desc->name, PTR_ERR(hw));
-			continue;
-		}
-
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

