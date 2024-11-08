Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644A11F666F
	for <linux-clk@vger.kernel.org>; Fri,  8 Nov 2024 10:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731063058; cv=none; b=S7bsd31jmiB3ZTC7P/dHdNc+DzDGaI0zdTyUxBGtyV9lZfXR3Y+1daZuFokl1du2efJMTHYN2A2k3wi3wjC5DVyh/MJMsp/6QLUgzb2KMRJwHG/faVBFmOzqafYu9I8aSlyyX/KPUOzh31fvnYlrVFpkOQ8LqDEGQEZf0IuvK60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731063058; c=relaxed/simple;
	bh=1JLP8YBI/NfuJpSNZsJG39bojJB5MMAu0LS2Keuaup0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EGAj9o6IvfMooUVTDdxoc+XiRzOiLZlsFQvT6U82RIRmO1kscmj0DdRyXPfaA5w/ZVQuu1/b+XcRT+KaiAKvyv0zYVMBMKhVphb494GJcNEHa7Jv0aDYYvq58928p1bd5wuNzeJLkxl+JNScvP3eOH/IXMhXs5yI3tqWxe/yT+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=pu4j2afD; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="pu4j2afD"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a9ed49edd41so358642666b.0
        for <linux-clk@vger.kernel.org>; Fri, 08 Nov 2024 02:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731063055; x=1731667855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eOLdQvWvS7gaNvs3DCiJZvTYPDD5HWrJjoBCATic1So=;
        b=pu4j2afDyCIDpPPaTvvQlE3uz2+ANnJ/NY6vRRZQjx1b1QCrEASjrWtPToEFe5j67j
         dvoBRAm6gnvkrVpPrd5Y74QzkChPL/V5tZIMBR4ELGGo1WO5aNVBieaP4574Jw+oUlkE
         lSNoMKPfk94binQ4wKMlZ6tpP/ai41mBRQzoOAmB2UqSj48H7lWbrcswCrYF3uLXaaMe
         Qo+sYra4QPW+0CVsv7Cq42QJtFFULB3MCI/x8o7wUsA46g5n7QECSX+atzf3BF1fEhdN
         sgfdVdeIUrtS/SYASKxS9r0syByM2TaVdeMrSVhd1t1HDxna2AawrBVCy9vaGrIzj/Pb
         lVuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731063055; x=1731667855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eOLdQvWvS7gaNvs3DCiJZvTYPDD5HWrJjoBCATic1So=;
        b=K3SRIS6qEH6IBtZMgucLfZsTP5KkhAz2iJL4dz/3rp4tdUFyQ42qvaIbm7a97Qyosc
         zuYiVs3fhBlmUxvpHmpFUxaJGigHYHXueGBX+M5rLdVyrJqkqAQwWzEwTTXFIKfN04g9
         ZdT6I+YzLy7frOovUztkmwdh1Tsw34vmzMTZ6hohnEpEjOz6MU7uBVm6cJiQa3ds1kz+
         UPrvXVhBRr9yacWclA0P3QTuPFNoOO6DwJho+E0SuJ52K42cau498e5k4VzIfcl6Vgsj
         0plj/1Od1N+Wp87uZ4fcZYwJQgaNDYSP544XuVkiQtWKII1IvRMQATifc9znoOqDyKYD
         ULqg==
X-Forwarded-Encrypted: i=1; AJvYcCW26H1lR/8z7VsCA7rNH9tgfniFkL6Te7UF0N7ofFq7XwV1tRJ/WfQytNenM7boTGmtbvpb6wkcTWo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNRXs1yMPRQCXJ/Stuxr+vy27vwy4p8UJhyBTVYBH3SGS/Hyxn
	GZ9PqLeHR/BhvqrGpNEBjj+qDtRtr9VfK2MUJQlXKGegvzlD53EDO1YR81eOXDs=
X-Google-Smtp-Source: AGHT+IEDcIr4ZulRfChZaF/rfxZKMkUXnFBiVs3aCjpXf4oh+sd3M27JOSZF7Y01oPyVg+uYn/eBkQ==
X-Received: by 2002:a17:907:94c1:b0:a9a:6752:ba80 with SMTP id a640c23a62f3a-a9eefebd152mr222750366b.5.1731063054628;
        Fri, 08 Nov 2024 02:50:54 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0dc574dsm220464866b.101.2024.11.08.02.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:50:54 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	linus.walleij@linaro.org,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 17/25] ASoC: sh: rz-ssi: Add runtime PM support
Date: Fri,  8 Nov 2024 12:49:50 +0200
Message-Id: <20241108104958.2931943-18-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add runtime PM support to the ssi driver. This assert/de-assert the
reset lines on runtime suspend/resume. Along with it the de-assertion of
the reset line from probe function was removed as it is not necessary
anymore.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 01e8b6a4e8a8..d0e2665ec830 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -1139,14 +1139,13 @@ static int rz_ssi_probe(struct platform_device *pdev)
 		goto err_release_dma_chs;
 	}
 
-	reset_control_deassert(ssi->rstc);
 	/* Default 0 for power saving. Can be overridden via sysfs. */
 	pm_runtime_set_autosuspend_delay(dev, 0);
 	pm_runtime_use_autosuspend(dev);
 	ret = devm_pm_runtime_enable(dev);
 	if (ret < 0) {
 		dev_err(dev, "Failed to enable runtime PM!\n");
-		goto err_reset;
+		goto err_release_dma_chs;
 	}
 
 	ret = devm_snd_soc_register_component(dev, &rz_ssi_soc_component,
@@ -1154,13 +1153,11 @@ static int rz_ssi_probe(struct platform_device *pdev)
 					      ARRAY_SIZE(rz_ssi_soc_dai));
 	if (ret < 0) {
 		dev_err(dev, "failed to register snd component\n");
-		goto err_reset;
+		goto err_release_dma_chs;
 	}
 
 	return 0;
 
-err_reset:
-	reset_control_assert(ssi->rstc);
 err_release_dma_chs:
 	rz_ssi_release_dma_channels(ssi);
 
@@ -1182,10 +1179,29 @@ static const struct of_device_id rz_ssi_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, rz_ssi_of_match);
 
+static int rz_ssi_runtime_suspend(struct device *dev)
+{
+	struct rz_ssi_priv *ssi = dev_get_drvdata(dev);
+
+	return reset_control_assert(ssi->rstc);
+}
+
+static int rz_ssi_runtime_resume(struct device *dev)
+{
+	struct rz_ssi_priv *ssi = dev_get_drvdata(dev);
+
+	return reset_control_deassert(ssi->rstc);
+}
+
+static const struct dev_pm_ops rz_ssi_pm_ops = {
+	RUNTIME_PM_OPS(rz_ssi_runtime_suspend, rz_ssi_runtime_resume, NULL)
+};
+
 static struct platform_driver rz_ssi_driver = {
 	.driver	= {
 		.name	= "rz-ssi-pcm-audio",
 		.of_match_table = rz_ssi_of_match,
+		.pm = pm_ptr(&rz_ssi_pm_ops),
 	},
 	.probe		= rz_ssi_probe,
 	.remove		= rz_ssi_remove,
-- 
2.39.2

