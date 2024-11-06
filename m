Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6571DE3D0
	for <linux-clk@vger.kernel.org>; Wed,  6 Nov 2024 08:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730881195; cv=none; b=DHW+BR8mJ9PXGRvmAlR1xSrwYcvBRNu5m6ndXrCqbzEgXGAnWqw2iO4RwsYbr++HjSGkHW07OHLYNEnbJBihisDMrTVWyspUkCKeAYt3PdROivsnjd6FAnDW8YTE1EUVLzwlUXumX3giu/AWTsIbQpSGKrdxh7MGoEOJ+xcbTbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730881195; c=relaxed/simple;
	bh=Vy8q8hLeLN/uSjTjj1O6cVO0bfFoNiDhs2RJ5weaqXM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RZdnhVJfYRIGYLPXAHVG5rWVdzDicL6CkQf6+GwJFJyA48+zduUWZVKxPOz5YSRH1ZeVFFJD+Ff/mrBVRqGPFtVSMFvm42rGeR5XA2zL6sf8hsA7IFKl5h7jCQ35j06wEP0CTs3ZAtzuQgF7h2bAcWYgUgbSYZhMFquVmiDZMes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=A1x1Nyyq; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="A1x1Nyyq"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a99f1fd20c4so824948666b.0
        for <linux-clk@vger.kernel.org>; Wed, 06 Nov 2024 00:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730881192; x=1731485992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBGr+/CU5GKrA75XPsK9kUx9Q7JVQRjFQnq3d+qtODI=;
        b=A1x1NyyqyLY/LcC6DKLayttBkZ8jtAx37pzJGnSpxVuZRdE/y6jw6aI5X3NXkVSA/e
         fSFdYtxUlJiPTaQMln3O9A0bo9X6pMbNlEjbPk1JUOP/RQOF+jMSFJS9ZboAGsqtZOCP
         /famd5BcrEHFgfrEtXKLUCiEjYvYa0BmzEAAfZFNom5iuy2xb8NkVMychF9q3d9hWTwx
         qmri4GsaGL3HBPZ6AWqwQ5kBoTxnPjTSdNWZnZF+RCRORpenuM3VVwyLmy+/jqHC45Qj
         IUroCiQsjj7RuZqkTw7z09Uh034Khk+qL6P4nql5fNNnzF1vmNxhMmi0idKnO75+j63J
         ag8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881192; x=1731485992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FBGr+/CU5GKrA75XPsK9kUx9Q7JVQRjFQnq3d+qtODI=;
        b=cAr32dr9HQ9fAIGCPQdq5EKwEWjYt0Mlq0w8u3Os7jdnfXb4i0WbCasfpTcOOXiyop
         PRA1rj3akQD1l2tspI8t+QASw+3ZN7rfJTudnNG6Kg/wOeLMTzTO5CAdjVlz9cPaRLRa
         sPKhIO8qy4+aVKwkXPa1jDFMxOY7ZuoaBo87+TS/8GCNfz7jrst8h6+0kdjqNVZxFnBm
         c2RWAA9wxdo5y4yBkT14QJbg8lyqrjXmVIQzNXfyNYIxLtLXM1ms25xeKYcT/Eruo2Hm
         Qck7VEv+JOnmSamcP3AR0N0wt2vXqdL8Oc9y5QibdO8Ari66uPaKJkFsdJ66dVdrTU2g
         7ABA==
X-Forwarded-Encrypted: i=1; AJvYcCX3NxqVuFr3wBt3B7nD9NmQKkRzDTL8ZRy4HCBCKQOI2YMQD+0wk5GDvSUlRSvH5f8wf020l6+8/qQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDOfxVa7GoKY2epGh6ssJ9FqChfxOuM7cgZNwmB8woSg/OUE4M
	wq12mxcfPLJO0NVvzFg3PfNhzsgYECxc92Uv14bROI3YdJjMOo6F27sjqtw7UkI=
X-Google-Smtp-Source: AGHT+IHkrgvVybjiJt178ijNfP0NNcD+icE3rT0yU79Y+ArFB4PmGtvQCUZWvV3EcRLAXzj7ZqkSBQ==
X-Received: by 2002:a17:906:7310:b0:a99:f779:ae0c with SMTP id a640c23a62f3a-a9e50916803mr2296299666b.25.1730881191714;
        Wed, 06 Nov 2024 00:19:51 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a2dbcsm241369766b.40.2024.11.06.00.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 00:19:51 -0800 (PST)
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
	support.opensource@diasemi.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	Adam.Thomson.Opensource@diasemi.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 17/31] ASoC: sh: rz-ssi: Enable runtime PM autosuspend support
Date: Wed,  6 Nov 2024 10:18:12 +0200
Message-Id: <20241106081826.1211088-18-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
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

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 sound/soc/renesas/rz-ssi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index e17dc1c0bd47..be96376dcd0f 100644
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

