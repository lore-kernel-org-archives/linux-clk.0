Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8B31FC7DF
	for <linux-clk@vger.kernel.org>; Tue, 17 Dec 2024 17:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734457321; cv=none; b=t1zvmsnBs/M/dOw8zz4+CcFfbREdZsNiVdG2NbqDkYCNYHg1F9VESY89kOsP20ABGGBjzXIWSv06xIohEnEHkWuv4HMzvfCGXhMwf89LusCWzK0SRmsPfS0IkyA6/R066wAjg2K+fo4MMJQy5ovVYtjk8BGp/2hMzjIf14hjc4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734457321; c=relaxed/simple;
	bh=Dtxyoi7doHBih2RE+tW4O4Zl3p0PlcEyWecU0LpLJks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=og9Eh97Yoxt1bnOLEM6pEem9Nsxnk8ziTD4FzOOgvqUuUA7XAC5KdTXhR1rkZXJxkohGasbYWSffMUcT7+jcZPVDiZQaFEGPgBjLt/CoPy1iGNDOble8NApuIFgtbbbmsMmdboyGd5yHGDJoix4wa1Yi8Sthi/4owYb+huoq7ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=O3H5Kwqk; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="O3H5Kwqk"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so54691985e9.1
        for <linux-clk@vger.kernel.org>; Tue, 17 Dec 2024 09:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1734457317; x=1735062117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Osl1zSUTzkBPkmQO9nNp4iwBDW/vG7efr1iHu7KFxo=;
        b=O3H5KwqkRAecuiPxNnpxtluowBxy/jpJO5/K7+lWbZNVXkuAwxBriMahN9WMPDTISY
         7VtMnbKftDUC1YLCDcGpNa6D7fOQRgk7z/Ugn1tcqM18KEx9h/k51jXMIQ5/NQEUyBGh
         NB6Vf/YuUwWLizvUXMkTy6YGhfS10xrQtj/DcIrzZrI0TAcQ8RPz6FK1rqIpI83lD5qw
         sWs/EBC5OgRKZu1o2x62YS4fmPU3AZbqyhTxKvp/vpXuXTrJl6wY4PAZ20cmpR8Dm+xb
         0xFrQTSez4z2Vp/SF1QVFfIxwd04UkEAy8tKb9lfVnZmEXJNCIIPj3XvVGKEaYTR3Pl0
         ZXbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734457317; x=1735062117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Osl1zSUTzkBPkmQO9nNp4iwBDW/vG7efr1iHu7KFxo=;
        b=soWIAcABAo5ANAvDxA9hvUE/gVBm3x7N6g8G80xGE2kdN7g5EpQ076OJEPu8Oc9Tod
         LEe7J3JcOgROiNo4RBCEjuKI9vtNROi5ZTgC5ht/hbZixfzcgv9Sv1R4vczT0Z1RFblD
         I3btv8jKjMnWh87IHo6Ns9AgLILSZTpjV/PpKuJ6tD0je+rkT2SGL+rW/3+VmW0SESzZ
         N1GoeCYmrlyw1aViqAYOptLU2VHAolItkczbxtQ28qwgRko/i/mZwFsdCihBhzspL0js
         tChdvIDUu0fav0HiXkizF995Qd61wx+zL6hf2WZD2YXGUsuGO8ovp0XjOMUMH0PqiLrG
         qodQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHZG1Wx54OCV7f9ZgGtjWG6OGHGk/QU7RwIwghGh1d6fDp52oN8A+DltA/6hXXrecbvWvyo6uQSU0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg+N85hUzg/mPIF43mOg/yi4X91uj6vWOYFSDcsSGqbvRdl2tb
	CTjOzUeLJeDYqriST8kDg5Y5r8LE9rmL2+3qSEImE2v1+7OkuyG3sSEcCF72OzI=
X-Gm-Gg: ASbGncsUyPTYvqDNYUtYWUS3ec4x+v6hx9EaFmuC3MKYhPR45n2MJ73TDId2cNwQe7u
	xmvyIo4Ury3TmbwGQ7kEM0gBKBhtIdGySrV1AG5/z4A/Ppgprzq4s9HCo/gcjj7vIWjmr9TpOiw
	UmFIO20AJiVpXsuFoWGQ3vRLOSru194QBnmf19PLgS5hI2AxVLrYTGcfP4FaHILcc3TEsFaFGHa
	fyJtGN0MPaMt4+fV/IMo7RHh4qXFklQsjJvFr//4r3bbnI/8WYZ6t2L
X-Google-Smtp-Source: AGHT+IGqntv26z6BFLoPHoUGTbiJyjSJJzeBVoYgwb8TZuHAEKq/qkNzfv4RfYGG8n/kAlz1Ay7MsQ==
X-Received: by 2002:a05:600c:34c2:b0:435:1b:65ee with SMTP id 5b1f17b1804b1-4362aa9dc5dmr142370185e9.24.1734457316712;
        Tue, 17 Dec 2024 09:41:56 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4699:6189:1775:3ce7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c801ac68sm11674749f8f.51.2024.12.17.09.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 09:41:56 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: David Lechner <david@lechnology.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2] clk: davinci: remove platform data struct
Date: Tue, 17 Dec 2024 18:41:54 +0100
Message-ID: <20241217174154.84441-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There are no board files using struct davinci_pll_platform_data anymore.
The structure itself is currently used to store a single pointer. Let's
remove the struct definition, the header and rework the driver to not
require the syscon regmap to be stored in probe().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- fix using an uninitialized pointer
- lookup syscon uncoditionally to avoid an OF node check

 drivers/clk/davinci/pll.c                     | 32 ++-----------------
 include/linux/platform_data/clk-davinci-pll.h | 21 ------------
 2 files changed, 3 insertions(+), 50 deletions(-)
 delete mode 100644 include/linux/platform_data/clk-davinci-pll.h

diff --git a/drivers/clk/davinci/pll.c b/drivers/clk/davinci/pll.c
index 5bbbb3a66477..82727b1fc67a 100644
--- a/drivers/clk/davinci/pll.c
+++ b/drivers/clk/davinci/pll.c
@@ -19,7 +19,6 @@
 #include <linux/mfd/syscon.h>
 #include <linux/notifier.h>
 #include <linux/of.h>
-#include <linux/platform_data/clk-davinci-pll.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
@@ -840,27 +839,6 @@ int of_davinci_pll_init(struct device *dev, struct device_node *node,
 	return 0;
 }
 
-static struct davinci_pll_platform_data *davinci_pll_get_pdata(struct device *dev)
-{
-	struct davinci_pll_platform_data *pdata = dev_get_platdata(dev);
-
-	/*
-	 * Platform data is optional, so allocate a new struct if one was not
-	 * provided. For device tree, this will always be the case.
-	 */
-	if (!pdata)
-		pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
-	if (!pdata)
-		return NULL;
-
-	/* for device tree, we need to fill in the struct */
-	if (dev->of_node)
-		pdata->cfgchip =
-			syscon_regmap_lookup_by_compatible("ti,da830-cfgchip");
-
-	return pdata;
-}
-
 /* needed in early boot for clocksource/clockevent */
 #ifdef CONFIG_ARCH_DAVINCI_DA850
 CLK_OF_DECLARE(da850_pll0, "ti,da850-pll0", of_da850_pll0_init);
@@ -890,8 +868,8 @@ typedef int (*davinci_pll_init)(struct device *dev, void __iomem *base,
 static int davinci_pll_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct davinci_pll_platform_data *pdata;
 	davinci_pll_init pll_init = NULL;
+	struct regmap *cfgchip;
 	void __iomem *base;
 
 	pll_init = device_get_match_data(dev);
@@ -903,17 +881,13 @@ static int davinci_pll_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	pdata = davinci_pll_get_pdata(dev);
-	if (!pdata) {
-		dev_err(dev, "missing platform data\n");
-		return -EINVAL;
-	}
+	cfgchip = syscon_regmap_lookup_by_compatible("ti,da830-cfgchip");
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	return pll_init(dev, base, pdata->cfgchip);
+	return pll_init(dev, base, cfgchip);
 }
 
 static struct platform_driver davinci_pll_driver = {
diff --git a/include/linux/platform_data/clk-davinci-pll.h b/include/linux/platform_data/clk-davinci-pll.h
deleted file mode 100644
index e55dab1d578b..000000000000
--- a/include/linux/platform_data/clk-davinci-pll.h
+++ /dev/null
@@ -1,21 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * PLL clock driver for TI Davinci SoCs
- *
- * Copyright (C) 2018 David Lechner <david@lechnology.com>
- */
-
-#ifndef __LINUX_PLATFORM_DATA_CLK_DAVINCI_PLL_H__
-#define __LINUX_PLATFORM_DATA_CLK_DAVINCI_PLL_H__
-
-#include <linux/regmap.h>
-
-/**
- * davinci_pll_platform_data
- * @cfgchip: CFGCHIP syscon regmap
- */
-struct davinci_pll_platform_data {
-	struct regmap *cfgchip;
-};
-
-#endif /* __LINUX_PLATFORM_DATA_CLK_DAVINCI_PLL_H__ */
-- 
2.45.2

