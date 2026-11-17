Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939899;
	b=L7gr1sppm2aaJ51LQ1N+92EJurSM9Kv1lJ9n5z07F8jKwzrHp8LX3S3+o7HunvG3clLA
	 DuQCUs8UKCejTyBkbUjnp0w6qb829gta4GsUfpflSGESJ2T9u5Y0UXyyE2K9v3c5UHaQX
	 JhRbmJlggI6uVmw2e7vMK6Bh987aQs5Ifk3BIszlBqq7EWSjwq6QRNifDwu4t2UrXvdl7
	 zRiIXYBPphyei99LDwNdE8ftkRH/jqlLJnlzDfxPjglqfYAr/9MrInpleXFvPMNdFAd1O
	 2cc+kpVWfpsw3tX4anog/pVxxbsUiJ3RcTSmIDUD2HE2Oyqy7XXLjqai15hZtzUQX8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3T0UtHpv3iva10MQL4+oovUpl39KWNdB9AOhKqGwH84=;
	b=kZxeN3HbhM/FxiBJVN8tq4zw6K3h5dyzxGN8oTn5ZPfoFXkFvyj87cBZyyEPusxc6ynX
	 0221Ul4A+P8FyOLBAQUKewT7oUBBzZPtR66vuRevNbQX+Wn7yTI/chHkiNICzB482PAdB
	 nSANe54iGo9TbS+npJVkrEJdFRUp3aCJZlXV8wHb7ScBdcpeiNHeL7u7PTTNNS97CXysA
	 tyEhIQhtXeIYoXZcJLzq3HuauukthJnfxujFgYGTVlERPdylcsuscHoNQK39S29er1VEI
	 u3AmCtEvOuHkVbKn46P+BczJSWaiR8/XDk4bb869W/l06r+jCaiBKZSwO3+SGmN9VnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HSeXD8Ic;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BA4606A88C
	for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2026 18:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05BA4606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HSeXD8Ic
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a5024b3c28so467380f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2026 10:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794939896; x=1795544696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3T0UtHpv3iva10MQL4+oovUpl39KWNdB9AOhKqGwH84=;
        b=HSeXD8IcFiP/6H1TpvFfMVsRVZcLHCHbDQpV7AQt+9sOW+UhwgZTIuwbrtNGfo36IT
         pcA33Z3uXJLhdFJvOUlPpJcIf8/DRhKZ0xNenjB5puKyrcgWg3tXFMkN0T63Vz2k5oak
         CyLmoaJMKDdmjp2hhkDvAbTYt6vb6pBVeafFwq3UBRi13io0Yz6vupvGvQ/jGV+aSP1B
         lvO8odpXLNPPzSvEhsyBRzb0zAw3EF8Rz1IPe3VYRXmK5+Wb65GAGxNJj8x6K+6THusq
         K+QwAHwWsCny05m+QOJJ5eQNOE/HUuF9Yx7jlQoqLz+DywdLZghZWypOyVxwq3HvuwBI
         haWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939896; x=1795544696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3T0UtHpv3iva10MQL4+oovUpl39KWNdB9AOhKqGwH84=;
        b=WO98B35tqHjninyKuLb4JmacARO7Gcw0thp8je7j6rlxBRGybOHRp1PrHg5M1+nKvw
         x3wffYDjVKj8A+8EN+uuTGtFv+o1lQPcs9t8oolv434guAQXSy4BTJA55awf7XnngYNZ
         36LHlYPGwnHGHj3Bzj9ivGQ//cQDP6fkH+LEcq+4KQe1TTXc0SW9sPaHQ8olVGKeuoMe
         66458LRgm84b5Cp7v6LTfG3lC6f78M0gP94dTXEeh3sYXdStOLHFZo2clC4zT3yXbyaL
         2wcs65FqP+gK7TeX36rZ05N6/pE0idGEAuuvemQ+hrfZG+BuVcw8z3K9/VM73NTtbZ3F
         HpGQ==
X-Forwarded-Encrypted: i=1; AL+hErHe+v+zlckh5LcibeZ5vPVwm43yEe1zQG7sHXEHeHj0hZcerP4Sgirch05kOyz79AyL+ufmienNCxA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ucDXMMC+PW2Wf9Z9uXo94tjHgOnE53gdGX0kSa+TSMn1hrPXV
	eAj4pwxbSs69DUTvT0pUVsBoULZDHvimYCsZm0rCPOgAgv3F5oUecXLa
X-Gm-Gg: AZFdTZcr8mAhmPs3DhaInQ3xUh0tVIAyUwRJhawQvewVSQkbwBMKY2OfxtqoUZFvrT4
	a+s9UIXKDZKQd9mDgjBinz46UFK96Waqioq9KI00qWyfN04kvYQ9S6F1ArDCkLDMdMYzZjyNC8z
	GU1SGa3p8BioSrj1y2X7a5t/UrZRFKf/KanbNQ5RI78k4tWo/MRu4714qSVrGfg3/S4mHUAhF69
	bR5pL+mhvvMVpcYtW4DVLvDG9f55OIHdx9+/Sj3BM63o9mrlq4LgO1Gxdl9wRX28tVN9bOvzVMM
	0u5Ro95UuVSgVimFFdpWq5kQMjrKXMu2kf18lD+CQIc4ZV2wSYuL+/shZVMq64K+e8zjYg8ggIG
	5DfgmDuSKt/hP2sUIsnEQsyjmlNx8QOsN/tqpSyfs0AyoVpoggncsbHK+IQPK3pusfr+ZV+fCDy
	BwrZ5pzRfLHhaQSrjNtcKYGYOPQiI54TuHWiHS8g3PPfs/I8qwODiH+s5e43Bl1Du7bRQl8qWKH
	33eaKIiwyfjE+BL5ATmCMQkG29IRW1z24yruWUYgiOj4peCMp91bhA+PKnEDEHsfVIo/mKE+Rmb
	26/dupzMeVB4UUNkzymn1uAGSsnObs/beLCPGr8dXIXjKMtATUpw4Wgkl8yVmF8IVvoseU8eBHf
	O4ZXEw5x2GWLkvvxNWg1cpZ7ljFTXAqVHyQ==
X-Received: by 2002:a05:6000:4b0e:b0:48d:f852:c66b with SMTP id ffacd0b85a97d-4a3771eebffmr7414445f8f.22.1794939896438;
        Tue, 17 Nov 2026 10:24:56 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4a656933956sm134084f8f.44.2026.11.17.10.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:24:55 -0800 (PST)
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
Subject: [PATCH v13 4/5] clk: en7523: generalize register clocks function
Date: Tue, 17 Nov 2026 19:24:42 +0100
Message-ID: <20261117182444.103123-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117182444.103123-1-ansuelsmth@gmail.com>
References: <20261117182444.103123-1-ansuelsmth@gmail.com>
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

Airoha AN7583 SoC will use the same logic used by Airoha EN7581 SoC to
register clocks. Generalize it to register clocks defined in soc_data.

Add the clocks definition in EN7581 SoC to support this new implementation.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 6aa6dfaf414e..f12b69f8d453 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -147,6 +147,7 @@ struct en_clk_priv {
 
 struct en_clk_soc_data {
 	u32 num_clocks;
+	const struct en_clk_desc *base_clks;
 	const struct clk_ops pcie_ops;
 	int (*hw_init)(struct platform_device *pdev,
 		       struct clk_hw_onecell_data *clk_data);
@@ -802,12 +803,15 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
 static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
 				   struct regmap *map, void __iomem *base)
 {
+	const struct en_clk_soc_data *soc_data;
 	struct clk_hw *hw;
 	u32 rate;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(en7581_base_clks); i++) {
-		const struct en_clk_desc *desc = &en7581_base_clks[i];
+	soc_data = device_get_match_data(dev);
+
+	for (i = 0; i < soc_data->num_clocks - 1; i++) {
+		const struct en_clk_desc *desc = &soc_data->base_clks[i];
 		u32 val, reg = desc->div_reg ? desc->div_reg : desc->base_reg;
 		int err;
 
@@ -1286,6 +1290,7 @@ static const struct en_clk_soc_data en7523_data = {
 };
 
 static const struct en_clk_soc_data en7581_data = {
+	.base_clks = en7581_base_clks,
 	/* We increment num_clocks by 1 to account for additional PCIe clock */
 	.num_clocks = ARRAY_SIZE(en7581_base_clks) + 1,
 	.pcie_ops = {
-- 
2.55.0

