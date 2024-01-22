Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3038C3EA75
	for <linux-clk@vger.kernel.org>; Mon, 22 Jan 2024 11:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705921908; cv=none; b=HaUYe0YIwUlwaIeCqBsCz0BdzCDiqIWCDZxpkS6PSKBzMFBdmVmD6ObysUyVjClsDgfBPPShTpcW2rz5GlAwMDoMyyzyIwezU5J0/TVLP5s1PVVi5b+wwIkmIyGa/5KY7CcXinzulPiCvQ80aA2Lde2/n0GTb0ozmIWnWYcZIa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705921908; c=relaxed/simple;
	bh=LIPwfTVYzjHtnuFd0jU3NL/6FuMhnlnEQLJY/PrGiyo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Vlqzfxh7RcH1aBRTcSN3Upjtf0xMGmQtefU8OMx0SjTwqp/ZueXoGHNpAfh2ALKYPccmqEeFHjxPt+two1l3rhT8EAjiqfnokYXzoN6WamXCfInENImFMsjjmCDAdrCf5ow+Sqm1KyDZSl1TChpV6oLveFO/TIOZ43o2O4MF3h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=IhcUJMwS; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="IhcUJMwS"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-55a354a65afso2609678a12.0
        for <linux-clk@vger.kernel.org>; Mon, 22 Jan 2024 03:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1705921905; x=1706526705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqtCeRjkRQZF1X7FzpXbbf307qf5/3u+eo/6taxNjjo=;
        b=IhcUJMwSmBVgnNoSy2KtZk8LT4jyaB6dfGx1vU/CM+Oe4jLPM324OaOtvug7kzCZO3
         EcEylgyxpCS26STLgoAfklQVfhnrTcMzlcWW+OabsZIZ019tRBTCGkLdUw7Q+TzPcpdb
         gHwg0VL4cFiqNJI0hNqalvHyP8Ggr+R/2X4Kjw4b84AWLvBrDdDog3DvRc0xA/+uUqku
         c+Bl7srOSJJKQXqGzER397Ton6iiUyOli2iVh6Eeky1vTbQGHzTZj7j3x0uLyGqFsfsO
         Nj5vLoqydbKAKC57L0x86AV/L+sBstKi+LHNAOdp0ZDXcWZ/CMEs+WSLZxkM5u/I7zSb
         JUkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705921905; x=1706526705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pqtCeRjkRQZF1X7FzpXbbf307qf5/3u+eo/6taxNjjo=;
        b=VDkhBgNvm5CmEfC4LOthpfseKT67ftgnM/o4VkbeT45nq+8ORMJ3OjDiaDX/MFbYBr
         vjIRYELcV1/XPEDoN0V0XP8iccJ5dpmqJLlqIJ9T+52+QFnciICUAdJopP+vaaVrk+82
         MKr2zvjXrxCD6kSKjtsLFTFQRLlNnQJX05VzrpvzeUnJdevrXTG1esKGZIpuRhMnP6sF
         7sau5Nyni+QBu1OqqD/O2lecZavomube5DaKj31fP3pOh5vFjGvjIfyHUYj7ZWFaKSkl
         vhbar+6ziFXqdu6n20eTRoIgUDVJPmfA57y8bz8c0GrcMJxb2W8ijsirGHTfoBkAHYFf
         UZwg==
X-Gm-Message-State: AOJu0YwZK1JFVbVJHCcCw8RyMvg5umqCRoxiegZHsUSc8CTM+B199UXO
	Xq+i4ne799pwqLU9NuU1x20QCiuUHzY6KSjkn2vhpsUNzDCcQoikJTnqh6NrFu8=
X-Google-Smtp-Source: AGHT+IEgcYIELtC0sF+RvoYDICw9Ux8ufzqP2HIXOse25Hex57bekVk6pO079j4rGH6x+e/vxmiF2w==
X-Received: by 2002:a50:a6dd:0:b0:559:ccc4:157e with SMTP id f29-20020a50a6dd000000b00559ccc4157emr2518301edc.30.1705921905246;
        Mon, 22 Jan 2024 03:11:45 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.135])
        by smtp.gmail.com with ESMTPSA id t34-20020a056402242200b0055823c2ae17sm14194241eda.64.2024.01.22.03.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 03:11:44 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 04/10] watchdog: rzg2l_wdt: Remove reset de-assert on probe/stop
Date: Mon, 22 Jan 2024 13:11:09 +0200
Message-Id: <20240122111115.2861835-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240122111115.2861835-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240122111115.2861835-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

There is no need to de-assert the reset signal on probe as the watchdog
is not used prior executing start. Also, the clocks are not enabled in
probe (pm_runtime_enable() doesn't do that), thus this is another indicator
that the watchdog wasn't used previously like this. Instead, keep the
watchdog hardware in its previous state at probe (by default it is in
reset state), enable it when it is started and move it to reset state
when it is stopped. This saves some extra power when the watchdog is
unused.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/watchdog/rzg2l_wdt.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index 0554965027cd..988926e50741 100644
--- a/drivers/watchdog/rzg2l_wdt.c
+++ b/drivers/watchdog/rzg2l_wdt.c
@@ -129,6 +129,10 @@ static int rzg2l_wdt_start(struct watchdog_device *wdev)
 	if (ret)
 		return ret;
 
+	ret = reset_control_deassert(priv->rstc);
+	if (ret)
+		return ret;
+
 	/* Initialize time out */
 	rzg2l_wdt_init_timeout(wdev);
 
@@ -146,7 +150,9 @@ static int rzg2l_wdt_stop(struct watchdog_device *wdev)
 	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
 	int ret;
 
-	rzg2l_wdt_reset(priv);
+	ret = reset_control_assert(priv->rstc);
+	if (ret)
+		return ret;
 
 	ret = pm_runtime_put(wdev->parent);
 	if (ret < 0)
@@ -181,6 +187,12 @@ static int rzg2l_wdt_restart(struct watchdog_device *wdev,
 	clk_prepare_enable(priv->osc_clk);
 
 	if (priv->devtype == WDT_RZG2L) {
+		int ret;
+
+		ret = reset_control_deassert(priv->rstc);
+		if (ret)
+			return ret;
+
 		/* Generate Reset (WDTRSTB) Signal on parity error */
 		rzg2l_wdt_write(priv, 0, PECR);
 
@@ -231,13 +243,11 @@ static const struct watchdog_ops rzg2l_wdt_ops = {
 	.restart = rzg2l_wdt_restart,
 };
 
-static void rzg2l_wdt_reset_assert_pm_disable(void *data)
+static void rzg2l_wdt_pm_disable(void *data)
 {
 	struct watchdog_device *wdev = data;
-	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
 
 	pm_runtime_disable(wdev->parent);
-	reset_control_assert(priv->rstc);
 }
 
 static int rzg2l_wdt_probe(struct platform_device *pdev)
@@ -280,10 +290,6 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(priv->rstc),
 				     "failed to get cpg reset");
 
-	ret = reset_control_deassert(priv->rstc);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to deassert");
-
 	priv->devtype = (uintptr_t)of_device_get_match_data(dev);
 
 	if (priv->devtype == WDT_RZV2M) {
@@ -304,9 +310,7 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
 	priv->wdev.timeout = WDT_DEFAULT_TIMEOUT;
 
 	watchdog_set_drvdata(&priv->wdev, priv);
-	ret = devm_add_action_or_reset(&pdev->dev,
-				       rzg2l_wdt_reset_assert_pm_disable,
-				       &priv->wdev);
+	ret = devm_add_action_or_reset(&pdev->dev, rzg2l_wdt_pm_disable, &priv->wdev);
 	if (ret < 0)
 		return ret;
 
-- 
2.39.2

