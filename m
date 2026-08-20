Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3083A63E4
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 06:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787209154; cv=none; b=VWffloj+/CIgHLKKBxh/PEtZ13DRiVSikBS+hp2FwouW7MuAeaB4LH7Bb2Y0JDlb/q/k+4WaK+GFikKT0R+HGTE3VPUGZlmJd2+sipvGZbzyohfAa3sOahU2Xqfqp281Zer3r8e+7A6JmYlQdsEor94xls4gd6+lhK6NWjkPODU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787209154; c=relaxed/simple;
	bh=QFQbK+h1+T3zXv+Lo48t5Ke65VULKiJ5q5hWe7PoMYE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nnpt/P6/lAAm2y2PxlRIJJ3FHmCoMv+of/MaVqESjhBSjvMHl8t3g69Upb/WrK+e6qN8//2CrVOgG6mvZPj+moi/rb8FxUtbNe07cHVoP+o8+Ti3H56L6VEhRLhmByxc6cCGYmVS6Vt2E4mE2dYyv5la4QwSeL+lCxKD3yu32bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GAzLSiH5; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GAzLSiH5"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c999f162c9aso1176215a12.3
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 23:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787209152; x=1787813952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l+flFXip44k0sCr7rKJMxdk0YHFqAbrFUAstCTx4HU4=;
        b=GAzLSiH5UJUYm86Dp4pHOhPMz2zLDDmIEYmtL3eADu7jYkkHGH1XME22SVYjduWosv
         qQl+FQAC/88INrm8NaHek7VsptLc6LE97Tb3JTGf24e/wYhuUjwq26A+2rnxicwQafMW
         PEgQ51qXh9Gk4CcdRHyTAg60J7TEcwhbwFhK3iLyl4OmhnfFJnDPOQJ0aK4aKtF9gUK6
         WvsQY1sXZihI7UE6qRfFzoOudRMDbeibzd8dlKZImkn+YoaG7Zja6CCzoXhEQFMnL9pi
         LlI6QimBeNRRd6BfWlMrHEuKS9hGPy2XbW/go6Ai0DmLK0BTE/t+98Bd2EzdTl1FN2GX
         VaBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787209152; x=1787813952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l+flFXip44k0sCr7rKJMxdk0YHFqAbrFUAstCTx4HU4=;
        b=N1ZNjI61uWBqfCmyaAnxi5GifNvKBhqBdj0psiKQzwjgX1TrnvCpZm13xDCrqWWoFd
         0C1pHR90bKcFZigQGGUlrH3TxcRKmMbmD4vw6zS02KYIiWkTz7rVNPt1x8Sd1AFPPflx
         /qNj5kKv4DK2v5q8mSlr/YC379L9S7k5op+FKTCPrIVFJzV2EXtZJr3rXRf9FTZDmUbx
         Urn5eMQZSf8yzW3AdvMFzGGjm/VWInlRk8nLXojCYw5HiUbJtt4Rf7a1l8YGjraSe2e5
         C8eEW7cdmSA7aze4btuQAyq+MV9pZRHOddYfoUs31vpLTTxE1ViVn8fCNDS3H37BPVCb
         Adjg==
X-Forwarded-Encrypted: i=1; AHgh+RoVXclVrhVWODcOuUJtfantnvIwOxSv9QpRm38EXTpLsxn9CrQYzBgUjYu0nvCnA0NIjiBDHeNuWkQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kQOkGw4GtTpTAB+F0mVPkQon1/PB4nxDa7xnz5D4F5O1SUeH6Y
	V1Q3kbRmAfouW2zxDTb7rSRO282bM3B8Hpm5d5zlOo+LydAccFrFb5Y=
X-Gm-Gg: AR+sD1171EcucLpOeYCz0pxEigqC3nq27W8M+Kq7jZPRXZtOTfRrzJ1o9t1JGi4dT3A
	QBh5+dhhYWveAOZuYVwJ91YSTsNgDFFybugNjZ44DnmwN5cWxeXtVAg9FMh6GajEjXJerRWuMlA
	gvfysoYI4V+3hTS7kxNzr36yzCf2UOvKcCJWO99NIrcyyHzRYjGFGbL9yS8ReInZtdfgeq2O1gl
	+zcuJKUsHcq95EkVqKhoJAdZNdiUIY/A+gWW7uiMtHngYh+mgiLE9khfZZl5djsvwq3GRvcK/I8
	sir8H6WUYN/9bqWZdk9Agf20a9UababYaIUeUcvg7ALLJvToYoAt9ctKRRWdOoBwfIIKcQAgmS0
	Cw2P6/Usites2GAN8Amm85n/z50GPK1Oqw74zQoqSNJWrLg2lwjLm3PLox5nddfZUkJZD2q1qRD
	sNCmJhBYrRFELrHZzXLW4owDJhsXdBSLImxjha2D6C0zrL5UyiWLeG9aGdTtnYDTG3u7mVTpAog
	g==
X-Received: by 2002:a17:90b:4c8c:b0:38d:fda6:4873 with SMTP id 98e67ed59e1d1-3958108a4bbmr17249377a91.10.1787209152046;
        Wed, 19 Aug 2026 23:59:12 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb87174sm5483221a91.12.2026.08.19.23.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 23:59:11 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	bmasney@redhat.com,
	luca.ceresoli@bootlin.com,
	krzk@kernel.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	peter.griffin@linaro.org,
	alim.akhtar@samsung.com,
	michal.simek@amd.com,
	shubhrajyoti.datta@amd.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH] drivers/clk: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Thu, 20 Aug 2026 13:59:04 +0700
Message-ID: <20260820065904.2032536-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the deprecated SIMPLE_DEV_PM_OPS
to DEFINE_SIMPLE_DEV_PM_OPS and pm_sleep_ptr().

This lets us drop the __maybe_unused annotations from its suspend and
resume callbacks, and reduces kernel size in case CONFIG_PM or
CONFIG_PM_SLEEP is disabled.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/clk/clk-si521xx.c                  | 8 ++++----
 drivers/clk/clk-versaclock5.c              | 8 ++++----
 drivers/clk/samsung/clk-exynos-clkout.c    | 8 ++++----
 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 8 ++++----
 4 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/clk-si521xx.c b/drivers/clk/clk-si521xx.c
index ceadc07bcb6d..9336d08e8083 100644
--- a/drivers/clk/clk-si521xx.c
+++ b/drivers/clk/clk-si521xx.c
@@ -341,7 +341,7 @@ static int si521xx_probe(struct i2c_client *client)
 	return ret;
 }
 
-static int __maybe_unused si521xx_suspend(struct device *dev)
+static int si521xx_suspend(struct device *dev)
 {
 	struct si521xx *si = dev_get_drvdata(dev);
 
@@ -351,7 +351,7 @@ static int __maybe_unused si521xx_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused si521xx_resume(struct device *dev)
+static int si521xx_resume(struct device *dev)
 {
 	struct si521xx *si = dev_get_drvdata(dev);
 	int ret;
@@ -379,12 +379,12 @@ static const struct of_device_id clk_si521xx_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, clk_si521xx_of_match);
 
-static SIMPLE_DEV_PM_OPS(si521xx_pm_ops, si521xx_suspend, si521xx_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(si521xx_pm_ops, si521xx_suspend, si521xx_resume);
 
 static struct i2c_driver si521xx_driver = {
 	.driver = {
 		.name = "clk-si521xx",
-		.pm	= &si521xx_pm_ops,
+		.pm	= pm_sleep_ptr(&si521xx_pm_ops),
 		.of_match_table = clk_si521xx_of_match,
 	},
 	.probe		= si521xx_probe,
diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index 913fcc5675f1..bf2276981e01 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -1223,7 +1223,7 @@ static void vc5_remove(struct i2c_client *client)
 		clk_unregister_fixed_rate(vc5->pin_xin);
 }
 
-static int __maybe_unused vc5_suspend(struct device *dev)
+static int vc5_suspend(struct device *dev)
 {
 	struct vc5_driver_data *vc5 = dev_get_drvdata(dev);
 
@@ -1233,7 +1233,7 @@ static int __maybe_unused vc5_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused vc5_resume(struct device *dev)
+static int vc5_resume(struct device *dev)
 {
 	struct vc5_driver_data *vc5 = dev_get_drvdata(dev);
 	int ret;
@@ -1335,12 +1335,12 @@ static const struct of_device_id clk_vc5_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, clk_vc5_of_match);
 
-static SIMPLE_DEV_PM_OPS(vc5_pm_ops, vc5_suspend, vc5_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(vc5_pm_ops, vc5_suspend, vc5_resume);
 
 static struct i2c_driver vc5_driver = {
 	.driver = {
 		.name = "vc5",
-		.pm	= &vc5_pm_ops,
+		.pm	= pm_sleep_ptr(&vc5_pm_ops),
 		.of_match_table = clk_vc5_of_match,
 	},
 	.probe		= vc5_probe,
diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
index 5f64d93b2fac..9c8b17cb5e7c 100644
--- a/drivers/clk/samsung/clk-exynos-clkout.c
+++ b/drivers/clk/samsung/clk-exynos-clkout.c
@@ -214,7 +214,7 @@ static void exynos_clkout_remove(struct platform_device *pdev)
 	iounmap(clkout->reg);
 }
 
-static int __maybe_unused exynos_clkout_suspend(struct device *dev)
+static int exynos_clkout_suspend(struct device *dev)
 {
 	struct exynos_clkout *clkout = dev_get_drvdata(dev);
 
@@ -223,7 +223,7 @@ static int __maybe_unused exynos_clkout_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused exynos_clkout_resume(struct device *dev)
+static int exynos_clkout_resume(struct device *dev)
 {
 	struct exynos_clkout *clkout = dev_get_drvdata(dev);
 
@@ -232,13 +232,13 @@ static int __maybe_unused exynos_clkout_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(exynos_clkout_pm_ops, exynos_clkout_suspend,
+static DEFINE_SIMPLE_DEV_PM_OPS(exynos_clkout_pm_ops, exynos_clkout_suspend,
 			 exynos_clkout_resume);
 
 static struct platform_driver exynos_clkout_driver = {
 	.driver = {
 		.name = DRV_NAME,
-		.pm = &exynos_clkout_pm_ops,
+		.pm = pm_sleep_ptr(&exynos_clkout_pm_ops),
 	},
 	.probe = exynos_clkout_probe,
 	.remove = exynos_clkout_remove,
diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index 4a0136349f71..da62c7b7f24d 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -955,7 +955,7 @@ static int clk_wzrd_clk_notifier(struct notifier_block *nb, unsigned long event,
 	}
 }
 
-static int __maybe_unused clk_wzrd_suspend(struct device *dev)
+static int clk_wzrd_suspend(struct device *dev)
 {
 	struct clk_wzrd *clk_wzrd = dev_get_drvdata(dev);
 
@@ -965,7 +965,7 @@ static int __maybe_unused clk_wzrd_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused clk_wzrd_resume(struct device *dev)
+static int clk_wzrd_resume(struct device *dev)
 {
 	int ret;
 	struct clk_wzrd *clk_wzrd = dev_get_drvdata(dev);
@@ -981,7 +981,7 @@ static int __maybe_unused clk_wzrd_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(clk_wzrd_dev_pm_ops, clk_wzrd_suspend,
+static DEFINE_SIMPLE_DEV_PM_OPS(clk_wzrd_dev_pm_ops, clk_wzrd_suspend,
 			 clk_wzrd_resume);
 
 static const struct versal_clk_data versal_data = {
@@ -1242,7 +1242,7 @@ static struct platform_driver clk_wzrd_driver = {
 	.driver = {
 		.name = "clk-wizard",
 		.of_match_table = clk_wzrd_ids,
-		.pm = &clk_wzrd_dev_pm_ops,
+		.pm = pm_sleep_ptr(&clk_wzrd_dev_pm_ops),
 	},
 	.probe = clk_wzrd_probe,
 };
-- 
2.53.0

