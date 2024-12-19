Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D6722371E;
	Thu, 19 Dec 2024 12:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734610772; cv=none; b=VT3OlghYzuONJjPp/sXoc4m/P6Mhz+KIERTH3E+CkyCJeCgtWCa4hLx3uZnah3YYtWcjHskVbR8XjPqyaj6KBhSgdXvQ2PCwmO5QJfkeHP/27I5v3wJkHSsUCz/IY8xzLQtrP2A1C9xE10pqMiBxbBd+Csp35ebtQMO133qHxZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734610772; c=relaxed/simple;
	bh=K+IMzI1869RsBAziOcBqZiBTYoxnx5kyJlkhb/of8Mo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VDVpEOE9TRLOyrAoYRlHhzxxQZrRCNTqkRuI+unNthtwsor7LJuc4ys/BC5Ok8qX+UenDBjA2HYC5WbYcZycOw3QD6QZNT0K6z4SEVfNHyEciapErnzFvBYdM6TvL8xZCDg+CfHPKugvXFMeV7C3hbB6X2tuvgSLmEHUqDFSyj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSVbjzRg; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSVbjzRg"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4361815b96cso4977485e9.1;
        Thu, 19 Dec 2024 04:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734610769; x=1735215569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IIor4p1Ud+HnzZZBxzQFkJT9AJteV8Oxrgd3zeQoaI8=;
        b=mSVbjzRgkgxAWqZJBlb1ZciuPssD8TzfQ0PDmx0pdngm7ko8D4hvmLcpBfuIg1vLOk
         2MLNSDIlIq99CiUUpctq7ApYdFYLhdLslX7q7bkBmc04VbvgxUZYL90mbS4GyCR0RgsY
         rlxNf5vJrPDOZ6rjC4Aaa47XMwCm92i9duYz9wMLrPYAlSNBoqxEW2rhLiSfwR0XzKLL
         HD4hMkdYFEwU80aiWmlfL9eRipGpMVuk4X5cmPQtgSniUw1IaThr51nAe7BOfJFN1cHO
         Etb7ezKNjDvk1FVRegpyvUHQkn03cEj1CeHB9abe6UW2I8ToO2mNM/iY5QvvNyi645MD
         cZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734610769; x=1735215569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IIor4p1Ud+HnzZZBxzQFkJT9AJteV8Oxrgd3zeQoaI8=;
        b=UIcOk+ScUmaIjp+iWH9VgpEVlWVZk98QeEHtgnexPyTINULzkLbd/9LN2wMrUBGGnV
         PZbLS5Xl09Cmch0G3pV9e3qYsdGvkixqHmhspXrLadrchRDzmVRP6DzewAaNZeWl6Mtw
         qqjBCvYKcbLHhXSyCIRsNEYt+nZ7ftG7nKWlLUsVwup4ZFhZcBSew91jMuzvfECI0GNs
         yJstqE9wiAzJSrVjXaNneS9FQOQRm/bf8Y3igUEr03+m2iVPgVVlJGvxM3fL2T4f4Kvn
         NUO5X8iDOPE4tu0BpcFgsJVOweEKXgg6+PkCFLEynJ4GuV6L7rBVHY29JAXOF1yzLBQM
         Xg8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW6xiArEKJFCe2EpEcTftXmm/89rDV5LiCxSqcLjgiJLcSc2IHuDK0X4hfr6klbngTeVLxEpscUUQZhhox2@vger.kernel.org, AJvYcCWQ1Vt8V7w1tPlDD3ea2AaM0C26ldSCrfBgEvfV367RSz6QTbalFI6AfVh44SyeSL0YP1tgWShx7b9g@vger.kernel.org, AJvYcCX1wdF+JQXVyJSmNnsg0We0Jeo35fQnGttqLlBt4tMqk5680bNho5JD/lWQSQrfYd/wxoVT/DzHaMNR@vger.kernel.org
X-Gm-Message-State: AOJu0YwOdcPHuSLIILiklwxR+LAPb3fFeTeDgo3J2/ATq127035QgC4P
	mLIgf3/4xGXcOaR+gZp0X29zLtR/hSk/IrXcp6l+c+zzrwDwO8Z1MwjsRw==
X-Gm-Gg: ASbGncv41UE6VzkQtG4UaxWhqkp+vPBwdJJnk8CJdE3GKwZ0J3AgsCikbb3+wrt5/fa
	VF/u76xuN14XZjEIvrcrwUEd27ZaubGaFzPDsN7LVqaGYnid4BdJFkCjxYt90fhUrtPOETL8nYx
	Gh5foV+ZirV4ASbC55utek0SD2ObuBgZUkxLRCkeOFEK6nZXBzeTPqbeUZZjdVMMuvSlpufZzq+
	/WGZX3BSJV6zxuOPwPgd8LHMx0SFEtRE6PMBBZVJfKoVrLmtjsD0tRS0TkwcULj2a5eWcYd9LFm
	GBdi1X0CfzZRgU8ScrRAWsKRpG2nxVEVMNklVy/o9to=
X-Google-Smtp-Source: AGHT+IE+oAD4kFa6MziJtl9Tyb5jZgvs/B+R7oj+1rTOWVehJPPKCnh4BZlKXvPlKODLzPnD2GdOWw==
X-Received: by 2002:a05:6000:1acf:b0:385:f00a:a45c with SMTP id ffacd0b85a97d-38a19b29310mr2948610f8f.57.1734610768474;
        Thu, 19 Dec 2024 04:19:28 -0800 (PST)
Received: from localhost.localdomain (host-80-181-61-65.pool80181.interbusiness.it. [80.181.61.65])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436611fc762sm16679975e9.11.2024.12.19.04.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 04:19:28 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	upstream@airoha.com
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v3 3/4] clk: en7523: Rework clock handling for different clock numbers
Date: Thu, 19 Dec 2024 13:18:52 +0100
Message-ID: <20241219121902.16339-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241219121902.16339-1-ansuelsmth@gmail.com>
References: <20241219121902.16339-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Airoha EN7581 SoC have additional clock compared to EN7523 but current
driver permits to only support up to EN7523 clock numbers.

To handle this, rework the clock handling and permit to declare the
clocks number in match_data and alloca clk_data based on the compatible
match_data.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v3:
- Rework num_clocks for en7523
Changes v2:
- Add this patch

 drivers/clk/clk-en7523.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 495c0d607c7d..596847446b14 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -75,6 +75,7 @@ struct en_rst_data {
 };
 
 struct en_clk_soc_data {
+	u32 num_clocks;
 	const struct clk_ops pcie_ops;
 	int (*hw_init)(struct platform_device *pdev,
 		       struct clk_hw_onecell_data *clk_data);
@@ -504,8 +505,6 @@ static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 	u32 rate;
 	int i;
 
-	clk_data->num = EN7523_NUM_CLOCKS;
-
 	for (i = 0; i < ARRAY_SIZE(en7523_base_clks); i++) {
 		const struct en_clk_desc *desc = &en7523_base_clks[i];
 		u32 reg = desc->div_reg ? desc->div_reg : desc->base_reg;
@@ -587,8 +586,6 @@ static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 
 	hw = en7523_register_pcie_clk(dev, base);
 	clk_data->hws[EN7523_CLK_PCIE] = hw;
-
-	clk_data->num = EN7523_NUM_CLOCKS;
 }
 
 static int en7523_reset_update(struct reset_controller_dev *rcdev,
@@ -702,21 +699,24 @@ static int en7523_clk_probe(struct platform_device *pdev)
 	struct clk_hw_onecell_data *clk_data;
 	int r;
 
+	soc_data = device_get_match_data(&pdev->dev);
+
 	clk_data = devm_kzalloc(&pdev->dev,
-				struct_size(clk_data, hws, EN7523_NUM_CLOCKS),
+				struct_size(clk_data, hws, soc_data->num_clocks),
 				GFP_KERNEL);
 	if (!clk_data)
 		return -ENOMEM;
 
-	soc_data = device_get_match_data(&pdev->dev);
 	r = soc_data->hw_init(pdev, clk_data);
 	if (r)
 		return r;
 
+	clk_data->num = soc_data->num_clocks;
 	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 }
 
 static const struct en_clk_soc_data en7523_data = {
+	.num_clocks = ARRAY_SIZE(en7523_base_clks) + 1,
 	.pcie_ops = {
 		.is_enabled = en7523_pci_is_enabled,
 		.prepare = en7523_pci_prepare,
@@ -726,6 +726,8 @@ static const struct en_clk_soc_data en7523_data = {
 };
 
 static const struct en_clk_soc_data en7581_data = {
+	/* We increment num_clocks by 1 to account for additional PCIe clock */
+	.num_clocks = ARRAY_SIZE(en7581_base_clks) + 1,
 	.pcie_ops = {
 		.is_enabled = en7581_pci_is_enabled,
 		.enable = en7581_pci_enable,
-- 
2.45.2

