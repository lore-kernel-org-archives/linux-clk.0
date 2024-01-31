Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA1874E2B
	for <linux-clk@vger.kernel.org>; Wed, 31 Jan 2024 10:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706696441; cv=none; b=r0W3fGxqXdteCW1GeHhqcFCsBsfvBnJC6RRMalBsTCcnWJ+evm+Wb4QdxduzRrH4sdjivQpYaTz0Dm4q4RjajBYXzgFCeR8/9HelFPQHEkhPVykFm91aiHBfAem+ifMDHAbjDsEFVmbSnKOrZUM1y4m+LMYgaETldyMFqve+u+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706696441; c=relaxed/simple;
	bh=H6FcSZimBVudTaR4rGYjmB2bIv0NVLGFUOR4xJQdDQs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZEITGRXHMBkWK5OJ3JJmW9iFzGYd8/uJ6mPULg105FKTHAr0z4lwSk6A9QkKk5EE+v5H+kpZXGtHJvBOesj9V7xtqJQUIaMxKq5wuFSi6svfzoaCXBEesJNCD1SCIaCOrKI5lwRebKHMqKz05Z+IrdRZpWshZINN/VTLlM7NjVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=RCEqASWB; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="RCEqASWB"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a26fa294e56so642296066b.0
        for <linux-clk@vger.kernel.org>; Wed, 31 Jan 2024 02:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706696437; x=1707301237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mO6jP/QWi6LCd6JhCn7qcYJB8RjfTTwNL1rKSjMisP8=;
        b=RCEqASWB6pmjujSA/Mu4ks1gJWH7zk0hRn8sQWvIeu3vulKYqFDOIdbqnzhZXXdUYb
         KJh51rnVOGljOMdBNmlRZNv1T1Kp7ZZZpa39MRO3rlr9+/QFO22xI/dseksSZxR1VY34
         d/Ew5xSNS1culhR1Yv1MTYjQiwBQw0L++06BVBQtuJTkX7NTLUktQtSYAu/d1BuGsgGn
         s3nKepGUHlKNQyinB1K04GORykgAHg1d68ulWpq43b92CyTzsgOVN3eq6SvBt909bUsc
         rAcjkzXCmrkOr78VWywVMxOivBcdMrb7rSY2LDEdumqqrhP0uQFedMpSKVcwxAY2Ou9v
         4r0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706696437; x=1707301237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mO6jP/QWi6LCd6JhCn7qcYJB8RjfTTwNL1rKSjMisP8=;
        b=WPHcIfJkUufcIImt4I2JFIA1BGZvA7QxQYLZV/tEN2oDEO8bq6nGa57smeqvtJuLuK
         R5mF1U/UkqaIEwANTV7ddx22ofyqyX+EnZ1Zm0j9cBljdFBKbm8DBnVgZlnD8Rwp4h6K
         G10asUEsm8LCqnAFSA2TDqw6HJHevkoZDJ+ns+pHCD0U2pLls7ogaDotcyQDTJe8HBva
         9IA6AZW4oUFB+rKq67iFxYxG7jxTe7WmIGr2pTfxJoVOPFPCyuuSH0npqDY2B5ExzVhE
         dAwv7mG7NocDQMkIO9/h0/9YBPRAfRmA5i+lRnW7VsHgCS0MxfmjAvm9/YZVTQti51pb
         nqew==
X-Gm-Message-State: AOJu0Yyo2bzlhsaOK1IXdCVXHcDxl+28kshaPXWMJmwH8MT+6cU/4Dh0
	1rhLb8Yyr3hueBNAf7fRktSSnPRCOB/muvYpIFy4IRaCh3Rip9klEE/2H3viaDo=
X-Google-Smtp-Source: AGHT+IFxIAJqZQff8YhsVRjDOIwsAOn1ZXdtq63EKMPORsiG1KeevAGRjV0bqdNGoFXnvOIMGEh/Yw==
X-Received: by 2002:a17:906:118a:b0:a35:88ad:e607 with SMTP id n10-20020a170906118a00b00a3588ade607mr839119eja.31.1706696437272;
        Wed, 31 Jan 2024 02:20:37 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXb5vxl7q0ujGxCfzWzXA0dChjsu9Kf97S3Ve32BMSyn4a1NBlfWCk3Wuif0En7CfdlWnancsZr1rNrLf3om04RD/LPCAEb+cGQbeOln+g1sQb5v2J23OD0y7me6quuIXZ5Yid90Xd2Z10lTnK+rq72d94ROsBN2lw6Oh8rurlBzj63CRqI3hr5jXY+FcK6XDlgoMXSABMRvUGxf+Nuea/BQ2ZZp7O5zCg3xi9L5hMjASYqN2/mgkD6GGgesBm+y0GWmkUbwAvcSIQ47TknFIg/P81lAqcVJRdrJYawL5kyqPFONXVtS+uGux7cOux5wQAvqAFa/ipD9uJXvGKreVR4hRsmnvs1OWOpzxtIxecU/+PP5MtpvudwdTjqstaBx2BtIEnvxFApFwA82x7HsoxgAJCeEErPr50vQJYeX+HXRCIS2ZDWtg+egoBMQJ0EHJscfSgvhOxeSXMoJJHTahswDp9K++71oexBmurSA0ijQwMHFthoNVz8juvuJFYK9SqtvilO+HHftEm7uO811iXko4x3ejuKgcPuHTROxtQiy5hMQqajeCmMx9cWMuy6lerTeBUbRnZ9MdCjYBIPAqctiynFSdteDn6OhwDlepM1onk=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.87])
        by smtp.gmail.com with ESMTPSA id vk6-20020a170907cbc600b00a3524be5a86sm5212966ejc.103.2024.01.31.02.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 02:20:36 -0800 (PST)
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
Subject: [PATCH v2 06/11] watchdog: rzg2l_wdt: Remove comparison with zero
Date: Wed, 31 Jan 2024 12:20:12 +0200
Message-Id: <20240131102017.1841495-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240131102017.1841495-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240131102017.1841495-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

devm_add_action_or_reset() could return -ENOMEM or zero. Thus, remove
comparison with zero of the returning value to make code simpler.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 drivers/watchdog/rzg2l_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index 93a49fd0c7aa..29eb47bcf984 100644
--- a/drivers/watchdog/rzg2l_wdt.c
+++ b/drivers/watchdog/rzg2l_wdt.c
@@ -316,7 +316,7 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
 
 	watchdog_set_drvdata(&priv->wdev, priv);
 	ret = devm_add_action_or_reset(&pdev->dev, rzg2l_wdt_pm_disable, &priv->wdev);
-	if (ret < 0)
+	if (ret)
 		return ret;
 
 	watchdog_set_nowayout(&priv->wdev, nowayout);
-- 
2.39.2

