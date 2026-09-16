Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31A83DB64A
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 12:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560567; cv=none; b=fsX46rRhJheKHvCx5QGa4qBy8wXFDuEvNBXQMGaeBhfm+ZY80T3TY2qVxV8OhPbYFf6+JzZqRRcEdOfieRyGe51KOf43zzsFPCl0LHT0xj8ttj3R/eWzugoNuFuIIlNctkcuO+T2yo2v5IzfYKT8Y8sxQZYC9KkCXB1/JCfnHsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560567; c=relaxed/simple;
	bh=qDZDH+1AlPLECXu4wvgeFIpUeBMQ98J3KYKtgJqJMSQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mm860/kYrtzUEmtFilmR964XeO/rrexh/ue9VQG8eugRoC86vixui3LkFymQ15QMj3Z+yzNNnG+Uc8SzIxp9m5HrhmaycphWlodCbQ4bHpKoJWUV27xFcPJbtUVX03Eqj6Io3LYlZPAaO23ajOdfkzMiK8pCY/nSeXtuEgNKfvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ykPKu8yu; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ykPKu8yu"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AA8A6C62215;
	Wed, 16 Sep 2026 12:09:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BBBE060337;
	Wed, 16 Sep 2026 12:09:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EFA5C11C7B01C;
	Wed, 16 Sep 2026 14:09:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789560550; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4VPSlb7J/nUbt2N+LVFTubDJY5YTbYvQwFuOvh7mUso=;
	b=ykPKu8yu0iZsknn1ocwAKbeuWm58CSSXMlFS7AfC46SCORTLJfTDW55YkUUwfjim0aWazm
	FqUeuGpPNcfUskq6zq9ltAdB7zq1AEnijAn7vva/pTCxo0oxDiXARmfrRl5L2Ah26s+edm
	2dqvh6KU+tK6Ct8+fOZC23U2OMzET5sgYmPlMWaMeSuLnMQrFxEQyXrD8bIKHNPsdbc6zL
	B/fDarSkv+0QWUURtGx7jQSIR6OpeNodnMCizBk3PLQHFVfcBW63J41VlxTymWh7awgNM4
	PYN4iAQbdduSkGHaPYs84pptMwSqRNn8cl24T4QZuty8lDqbhMYpr9Blgn1C2A==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 16 Sep 2026 14:08:54 +0200
Subject: [PATCH v3 1/2] clk: eyeq: Use devm_platform_ioremap_resource()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260916-clk-eyeq-res-v3-1-93a3b831a5d0@bootlin.com>
References: <20260916-clk-eyeq-res-v3-0-93a3b831a5d0@bootlin.com>
In-Reply-To: <20260916-clk-eyeq-res-v3-0-93a3b831a5d0@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Convert eqc_probe() from the open-coded platform_get_resource() +
ioremap() sequence to devm_platform_ioremap_resource(). Besides less
code, this requests the memory region so the OLB registers are properly
reserved in the iomem_resource tree.

Move devm_platform_ioremap_resource() before checking for device match
data, so OLBs bound without match data also get their memory region
mapped and reserved.

Unregister the clocks before devres unmaps the region if the clock
provider registration fails.

Suggested-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/clk/clk-eyeq.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index cf37feccc734..3c00be00889a 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -513,21 +513,16 @@ static int eqc_probe(struct platform_device *pdev)
 	const struct eqc_match_data *data;
 	struct clk_hw_onecell_data *cells;
 	unsigned int i, clk_count;
-	struct resource *res;
 	void __iomem *base;
 	int ret;
 
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
 	data = device_get_match_data(dev);
 	if (!data)
-		return 0; /* No clocks nor auxdevs, we are done. */
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENODEV;
-
-	base = ioremap(res->start, resource_size(res));
-	if (!base)
-		return -ENOMEM;
+		return 0; /* No clocks nor auxdevs, stop here but keep resource reserved */
 
 	/* Init optional auxiliary devices. */
 	eqc_auxdev_create_optional(dev, base, data->reset_auxdev_name);
@@ -559,7 +554,20 @@ static int eqc_probe(struct platform_device *pdev)
 			dev_warn(dev, "failed probing clock %s: %d\n", clk->name, ret);
 	}
 
-	return of_clk_add_hw_provider(np, of_clk_hw_onecell_get, cells);
+	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, cells);
+	if (ret) {
+		for (i = 0; i < data->clk_count; i++) {
+			const struct eqc_clock *clk = &data->clks[i];
+			struct clk_hw *hw = cells->hws[clk->index];
+
+			if (!IS_ERR_OR_NULL(hw) && clk->unregister)
+				clk->unregister(hw);
+		}
+
+		kfree(cells);
+	}
+
+	return ret;
 }
 
 #define DIV(_index, _parent_idx, _name, _parent_name,			\

-- 
2.55.0

