Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D841EB5FB
	for <linux-clk@vger.kernel.org>; Fri, 28 Mar 2025 21:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743195763; cv=none; b=kEwXD8nKCi2F1OTLYJsOAtKheOlcEHPZykvS43FTEjB4k1luMyYpF1curZqMOwKUIUhhsu/oVM5m3KBhBjCtZH8MHSMAUtce3jvJp7+iz9b3BTwp3JvWug8zSWpJEkr32BmbJtHKc+WFJ+PoGcGUWaRwpgq59Uh5krpl6QA8UPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743195763; c=relaxed/simple;
	bh=Ec7ELQSkAROQJoS+vq5l82oFVLr/jq3pUStBlMRR2r0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kzCmEF/Bg+FMJH3jb16glhy+xlrKi2/ZOngiIi4dCNKMIRdT+EQmmEaLh1JVAc1UHo17ccl+hCn0IugnNagE6xFCVXM08HbJyPnYtaUTHcnCsRJvXqPrKuK4LR+cKiVXI+Q8MRPg1I/9Q8a/w0v1+g+eYGJqyxsJO1AG1ECwvUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=onsl8lrE; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="onsl8lrE"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3d43bb5727fso7428145ab.1
        for <linux-clk@vger.kernel.org>; Fri, 28 Mar 2025 14:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1743195760; x=1743800560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4EIFREDKUdAp5cmkKXroBOp9ZjEFUNtcVcLKCQaMF1U=;
        b=onsl8lrEP94kF47onfIfDGM9aX5DZqa65YVA3jphe4SiDn3K4JABMivzq3YGf17Gca
         jfKdkrC8IrhmFURbGKs0zGAhj/dcVT3NuUE4/nBi4Fo2XgqKfpHE4GjYqRsj3l4wWvW/
         TIr8VJMb+0/ADO1TPF/Uf41mRF/XXuZ7Ly11eDlixGXBLaOzvXfdVFHuvffliKGltXGJ
         NwcywS36uNMi/qIykBxA6XpXhDtnBc6AZs33KaL26IZOCOIJfScgyX56NIsfQZoVqT8q
         jlrrIZoPEwcXMJzLkUTsFQLL3pfc+RBeOCUqYUOzwuROcSZqYxSaS//aGA6eoi+eTS/R
         4HZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743195760; x=1743800560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4EIFREDKUdAp5cmkKXroBOp9ZjEFUNtcVcLKCQaMF1U=;
        b=Ron9mQta6lxkcHJIYpkr7GxrQzevmNMDzkKq4G7rMvA5D51ZkZTZOUUj7s5DNZWZX9
         LDH6rqUY8Hum7uOujymMDLJ4uuJIwn4KsWWzNdoMq/c6My09kfxHQT0a4VT83m6HIeSs
         OhO58ibmqpKE95p+x/1aChh1bnqN8591TSipJZjNvREf7p9JBpd4eY+Zpt1C4ECHXvdy
         2tEzTn96QoX3W5pIBFh3XXmqSuMiyWSmvbdYNl4cfmEaXjLiTjQGSHqdm8cwZBhidPGO
         f78KHPDkAvXP/NObVT4eMQZUMpBtXPp5YSzsve5+p6RL7uaJKx5S0QqwMmN+sHCY5/D0
         3K7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVnLZs9CF/Ltw5iIdvBP4fhqiMh9d2DpNgrMqz45a1gq1R7WzfFZjWCfEOZ/Eac3AnSFxo/ww7UHZo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBIK9baJwBGpeMtABuvF9befYyo0uvDbTaCrQmOQLvOMPaZls+
	xh+effQXKc6H2ydnAoYBqgYiGFg+xRuTwsvFjT6r3/9Nksf9dl9S0ZDopeq7bfg=
X-Gm-Gg: ASbGncuHYDPJWLXmcCa3NKXWb1ifSk8jz9Wj5pY9XRVEDSF+//HCpbasfuVrH9FigAa
	PYQr8kpS+Tttx1T8/ymy3Ofs/RkoAmSu2IFF8LWX4H76N2Y+WRqAK6tCA+pp7mqzQ94vRoxJwOp
	YCFPDeBLFLQq4v7p9vRaXlqTX3QX/VoGhtsTVHVzWXVx6nIj0QNV6UUiHk9mH1Sk2rSgv89DXH+
	WduKZve91Mn52lZ+6eLbZni9YqOBvA3wv/I1SsIMcxtwiHpJZAZsQlRY2FQ3egBN1q/KnCygyiO
	U23idDTFKohzp3ULRTpgAz2IbXFMqjJL84ghf6NElDEUvq97y8bZxceeF9yr9dT3XHVTSr+Dw6o
	GIkX/j0SPJaOHty4MoA==
X-Google-Smtp-Source: AGHT+IGv/tQ9yOo+nSa2AdmuIJoHsAcKRHvpATkGTYnJegSwl7f8akCnzw41qA7R6W+uGcKVHvpvvQ==
X-Received: by 2002:a05:6e02:3906:b0:3d3:eeec:8a0b with SMTP id e9e14a558f8ab-3d5e091406dmr8990475ab.10.1743195760197;
        Fri, 28 Mar 2025 14:02:40 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d5d5a74286sm6769405ab.39.2025.03.28.14.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 14:02:39 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: p.zabel@pengutronix.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dlan@gentoo.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/7] clk: spacemit: define struct spacemit_ccu_data
Date: Fri, 28 Mar 2025 16:02:27 -0500
Message-ID: <20250328210233.1077035-3-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250328210233.1077035-1-elder@riscstar.com>
References: <20250328210233.1077035-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define a new structure type to be used for describing the OF match data.
Rather than using the array of spacemit_ccu_clk structures for match
data, we use this structure instead.

Move the definition of the spacemit_ccu_clk structure closer to the top
of the source file, and add the new structure definition below it.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - New structure is called spacemit_ccu_data, not k1_ccu_data
    - Don't check for a null match data pointer; add a comment instead

 drivers/clk/spacemit/ccu-k1.c | 55 ++++++++++++++++++++++++++---------
 1 file changed, 41 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 44db48ae71313..5cadb395a7dd6 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -129,6 +129,15 @@
 #define APMU_EMAC0_CLK_RES_CTRL		0x3e4
 #define APMU_EMAC1_CLK_RES_CTRL		0x3ec
 
+struct spacemit_ccu_clk {
+	int id;
+	struct clk_hw *hw;
+};
+
+struct spacemit_ccu_data {
+	struct spacemit_ccu_clk *clk;		/* array with sentinel */
+};
+
 /*	APBS clocks start	*/
 
 /* Frequency of pll{1,2} should not be updated at runtime */
@@ -1359,11 +1368,6 @@ static CCU_GATE_DEFINE(emmc_bus_clk, CCU_PARENT_HW(pmua_aclk),
 		       0);
 /*	APMU clocks end		*/
 
-struct spacemit_ccu_clk {
-	int id;
-	struct clk_hw *hw;
-};
-
 static struct spacemit_ccu_clk k1_ccu_apbs_clks[] = {
 	{ CLK_PLL1,		&pll1.common.hw },
 	{ CLK_PLL2,		&pll2.common.hw },
@@ -1403,6 +1407,10 @@ static struct spacemit_ccu_clk k1_ccu_apbs_clks[] = {
 	{ 0,			NULL },
 };
 
+static const struct spacemit_ccu_data k1_ccu_apbs_data = {
+	.clk		= k1_ccu_apbs_clks,
+};
+
 static struct spacemit_ccu_clk k1_ccu_mpmu_clks[] = {
 	{ CLK_PLL1_307P2,	&pll1_d8_307p2.common.hw },
 	{ CLK_PLL1_76P8,	&pll1_d32_76p8.common.hw },
@@ -1440,6 +1448,10 @@ static struct spacemit_ccu_clk k1_ccu_mpmu_clks[] = {
 	{ 0,			NULL },
 };
 
+static const struct spacemit_ccu_data k1_ccu_mpmu_data = {
+	.clk		= k1_ccu_mpmu_clks,
+};
+
 static struct spacemit_ccu_clk k1_ccu_apbc_clks[] = {
 	{ CLK_UART0,		&uart0_clk.common.hw },
 	{ CLK_UART2,		&uart2_clk.common.hw },
@@ -1544,6 +1556,10 @@ static struct spacemit_ccu_clk k1_ccu_apbc_clks[] = {
 	{ 0,			NULL },
 };
 
+static const struct spacemit_ccu_data k1_ccu_apbc_data = {
+	.clk		= k1_ccu_apbc_clks,
+};
+
 static struct spacemit_ccu_clk k1_ccu_apmu_clks[] = {
 	{ CLK_CCI550,		&cci550_clk.common.hw },
 	{ CLK_CPU_C0_HI,	&cpu_c0_hi_clk.common.hw },
@@ -1610,9 +1626,13 @@ static struct spacemit_ccu_clk k1_ccu_apmu_clks[] = {
 	{ 0,			NULL },
 };
 
+static const struct spacemit_ccu_data k1_ccu_apmu_data = {
+	.clk		= k1_ccu_apmu_clks,
+};
+
 static int spacemit_ccu_register(struct device *dev,
 				 struct regmap *regmap, struct regmap *lock_regmap,
-				 const struct spacemit_ccu_clk *clks)
+				 struct spacemit_ccu_clk *clks)
 {
 	const struct spacemit_ccu_clk *clk;
 	int i, ret, max_id = 0;
@@ -1648,15 +1668,22 @@ static int spacemit_ccu_register(struct device *dev,
 
 	clk_data->num = max_id + 1;
 
-	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
+	if (ret)
+		dev_err(dev, "error %d adding clock hardware provider\n", ret);
+
+	return ret;
 }
 
 static int k1_ccu_probe(struct platform_device *pdev)
 {
 	struct regmap *base_regmap, *lock_regmap = NULL;
+	const struct spacemit_ccu_data *data;
 	struct device *dev = &pdev->dev;
 	int ret;
 
+	data = of_device_get_match_data(dev);
+
 	base_regmap = device_node_to_regmap(dev->of_node);
 	if (IS_ERR(base_regmap))
 		return dev_err_probe(dev, PTR_ERR(base_regmap),
@@ -1677,32 +1704,32 @@ static int k1_ccu_probe(struct platform_device *pdev)
 					     "failed to get lock regmap\n");
 	}
 
-	ret = spacemit_ccu_register(dev, base_regmap, lock_regmap,
-				    of_device_get_match_data(dev));
+	ret = spacemit_ccu_register(dev, base_regmap, lock_regmap, data->clk);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to register clocks\n");
 
 	return 0;
 }
 
+/* The match data is required to be non-null, and have a non-null clk pointer */
 static const struct of_device_id of_k1_ccu_match[] = {
 	{
 		.compatible	= "spacemit,k1-pll",
-		.data		= k1_ccu_apbs_clks,
+		.data		= &k1_ccu_apbs_data,
 	},
 	{
 		.compatible	= "spacemit,k1-syscon-mpmu",
-		.data		= k1_ccu_mpmu_clks,
+		.data		= &k1_ccu_mpmu_data,
 	},
 	{
 		.compatible	= "spacemit,k1-syscon-apbc",
-		.data		= k1_ccu_apbc_clks,
+		.data		= &k1_ccu_apbc_data,
 	},
 	{
 		.compatible	= "spacemit,k1-syscon-apmu",
-		.data		= k1_ccu_apmu_clks,
+		.data		= &k1_ccu_apmu_data,
 	},
-	{ }
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_k1_ccu_match);
 
-- 
2.45.2

