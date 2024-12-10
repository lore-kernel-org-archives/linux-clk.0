Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBDF22FAE2
	for <linux-clk@vger.kernel.org>; Tue, 10 Dec 2024 17:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733850642; cv=none; b=GD1Tjjh0EpNI/4bHXSaKRTlRYs7Hptj2kS33ovNYSPOKzdQ0lnVPxCd3AHzA4oSNayMVGq30z9E9UKNebSGcuC74ZrmWct2vuntowj5NHHSbIoioli+xiqbjM8RvoeemrAPoqlQSEUtMvmwttuVaHxyThs8IXAPdrYnQLoDYZ+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733850642; c=relaxed/simple;
	bh=cB+Bpu7l1dV+zM88HO7Ze3t/5fdXwi7jPTuxAvUk+U8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HXKbjlBHTVxjSlovWYk9mM75iokNUTDlQs2nqUkR/R9hgUA1nl9mjyxvb6c8SHkgteWqzHSnZMTUR/QTmj3oAzT+KQLkFqYXaAw4zw/7P/JDoJIkXmADA9CE5vm653vsjW+pQfHKZoGaEO9tfddSIgh3VUrLjsrWdnhmKstv+iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=VqH3JmWO; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="VqH3JmWO"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d3e6274015so5214315a12.0
        for <linux-clk@vger.kernel.org>; Tue, 10 Dec 2024 09:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850638; x=1734455438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z6Hy/pRodMw2d91URONzNaEgR8YWtQs7fLTqCwO7+FQ=;
        b=VqH3JmWO8a/dlBZKwdVROvo/+MKWvN5DXmrbLUo5A39E3UaP444kOfHcntyoanVGjg
         5vyCowgmh/B2NTIEPfRrqdv0rMnEf53eif3FLFzpyLecp4R3kKQg69iHg1sFQCWSBeqM
         HJ8Ui6I6oZMTPq6JmgABmhUfAZP7iJddfzI+mHWvTGonyc819SJ4HtBssjejTKjz7c2z
         m4puIilvI35SmSnQDwsF/8cyKd+rs81QLiYLKWa7XfKVGFrSQW6YweovrzD/7hrFpmNv
         zGHqHUvL/jxvurpIGALUpBWfFaERvJ0HBkM9GM/FX8ruLg8wCe3SfYiquALvGyB7mhqC
         5f1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850638; x=1734455438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z6Hy/pRodMw2d91URONzNaEgR8YWtQs7fLTqCwO7+FQ=;
        b=DmT6V7de7oSzTwW8smCx6SrlbSuQsqoXU81sWCRHRi5WoKC/qdVnLU5VghtcgyY/co
         WRLzZc3QVpr+B4GvGNI+m4mROzpVUYBgoOgdZd5bnoI0i35/Ryjw4YMvom5P2YwnTmKv
         o3aDKZlqkSMCZ7V3+ryeYb5l+xSFgxjfTG/t6KoIfHmRi8WIoJVi8eIGWjVHJDUSMnI8
         R7u6y0+4XXHpKdMqJPQA8btPoNnqH0qaVnlVRRY+LJvmftBcJndXq012OGQuBG7f0kdX
         3uZKmtY1KYDp7NMsIE5MNL//J8n7Nwxfn2sn9FsjUDF6HwJoVf/SaeII8cOJnSflKFvq
         KnkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfEtHn01c2EqFGjp2L7JnkWrGQKHMLpgeTfUH7RuirV7q/cBn73j7q5geaV6HbiXQ9R6eu98AT1iM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp7/bSw2fkWZ6S/pdw/5LmDlrKK+7IPIIcsymsKLwZv8jmuO44
	b9Iib6e+nNBulXK/sg8kw7dk8JZZwQyEFRqnT70juOTBhSN7a1oC3XR5y8zkPqU=
X-Gm-Gg: ASbGncuTSJo5yzm+9WTRdoC7kkAJOojLcnVyus+IkOr+DzvRO90OfH0RwjmStVTv5og
	2eycabkQafWqlIUoIw1epk6XHTgyBiN+9BUkT+Npe396dtuipwRzJiItAb+d7J9zPijoxzqsujE
	PhfXtr2HPliawBpVAJCzFvmxrF8xvPqk3me/c2/dGZtSMWqvRASaSoq3c+g2BaV+STQNQjRvJwy
	ZvUsu3JHAMMCjGd9a+Hk4wRL59htAxEhngBC2yEUNE0epQPhkcVWxD3GMBkBNG0QGIiYqLLHCC2
	SbxzNrOglYk=
X-Google-Smtp-Source: AGHT+IGqcJ6bqhwIIKJrt+yeOZgP79f+Ka5SbVUv4mcFJwjMu+9gX00sz7DE8koWILZTW546alVDvg==
X-Received: by 2002:a05:6402:1f10:b0:5d0:b4ea:9743 with SMTP id 4fb4d7f45d1cf-5d3be67e142mr17354125a12.8.1733850638421;
        Tue, 10 Dec 2024 09:10:38 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:37 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 14/24] ASoC: renesas: rz-ssi: Enable runtime PM autosuspend support
Date: Tue, 10 Dec 2024 19:09:43 +0200
Message-Id: <20241210170953.2936724-15-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable runtime PM autosuspend support. The chosen autosuspend delay is
zero for immediate autosuspend. In case there are users that need a
different autosuspend delay, it can be adjusted through sysfs.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

Changes in v3:
- s/sh/renesas in patch title

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 878158344f88..eebf2d647ef2 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -1140,6 +1140,9 @@ static int rz_ssi_probe(struct platform_device *pdev)
 	}
 
 	reset_control_deassert(ssi->rstc);
+	/* Default 0 for power saving. Can be overridden via sysfs. */
+	pm_runtime_set_autosuspend_delay(dev, 0);
+	pm_runtime_use_autosuspend(dev);
 	ret = devm_pm_runtime_enable(dev);
 	if (ret < 0) {
 		dev_err(dev, "Failed to enable runtime PM!\n");
-- 
2.39.2

