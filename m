Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B5723A572
	for <linux-clk@vger.kernel.org>; Tue, 10 Dec 2024 17:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733850627; cv=none; b=cPBmsD2bl719M6FqAnI9QoZUnYosvWMElpLZiA8cUGLY9DqW9uAtQR/ldPg1Sh1U/6BFBapkiXBw5CT9kpJllBFh51C1jau16StJ+0hWXerLc+GIJ4E8MWFD6z0pdIVNojlF7HNCAUV/3S9vbz6S88yJSf8/Fv2g92KhhpT2290=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733850627; c=relaxed/simple;
	bh=RalPxCPilUWbjYvZHpa4B7ebOphri7Uk5DSwxD2axvs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=os9BHgj4hsczoflSkGUIKCrQSYp3gQz3EikSLvvdj0cxYZEikviumXMykch3dJmsiggOOg6TedZR+i2P7Aw+k2w5HucRYGoWNaaCI0U32XH2NPsnjSp75hwpRcp/2RA/ho4zNj7WzA/7sN5V0ad12z1hEXJ2wIYSWtkd/W98Av8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=EGQjxsQc; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="EGQjxsQc"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d122cf8e52so9170752a12.1
        for <linux-clk@vger.kernel.org>; Tue, 10 Dec 2024 09:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850622; x=1734455422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quo1xBiWZKYYPo7MUB0R0AMbPr7YypV5dW0W8isrnRE=;
        b=EGQjxsQcO50WGgYmy6Zfh/+57aYcCdg7phDM3bX4pHrdJ37AUoYs2w6rYlD3P/XnRK
         vbL4L65+v1Vs8/KJ6KMpaAyDEC3qzyhLAgeaE8b3jPpr5Sp0/bkbIKVdJwAWc8tRUM2s
         e176Of272Zl/+1F40fo8kkusiwXkwbrKNL/BAsJiIYuXe2GcdgzbDM1m0h0F6nroiCsZ
         joj7pJLA3cycvZ3GPh0FWXDgEcNH1zATjoJsy/jd3R4HboJBtquK5AAXIz78ftY6qrsr
         gOFAOI3bx1NzbuB8EsLg2Q/0peDZCDQLDozqftozXP4vufrfhcgScr5Var4YdT3at6Xq
         Qu/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850622; x=1734455422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=quo1xBiWZKYYPo7MUB0R0AMbPr7YypV5dW0W8isrnRE=;
        b=vCh8xQGwHAs9ZRMduLI2XPyeLqs90wC2hOPCvugedEC+Q5DBl/LqURD8UAY8gauf7/
         hOk/7A+DGAnFx2Hqaesc2W4i6TbLVPnV7FSOtQ2D4+TM/UYjbchMSQgMJRCikhQnspSa
         JXM9mVKeZAHi+sOx41rQjfUTcqmh9CSuPxVArN1YigpRjl31MXsK8Nzz6lt8yTgHRWVZ
         E9weV4gD84gAqSvE/etDBTN8mKBR1PCvjzDSui2bUKPbPXhH/b63Kpaj60hZoXAx1PUW
         mMgazJmctJD58/K2vhNMkNqJ0oNJi6KqUyuUhMBcKKrJ0TDRqxmKR9pZzFQ0njICx8So
         t1jA==
X-Forwarded-Encrypted: i=1; AJvYcCXws7zVPq/mH8tbD41b27vRk9oLys6Q51JoSFA5JQ06doNCUIyltvIPjJEdn/OyhNpKatZr5aOti20=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNhapdUklLzE/t+6wcVZQAmNq7KZcQOCWI8vFZS2iDjisu3UAX
	4ndx3vZwtZgCqqHGlq2IgdIc8q3TQ3lyoQy/1mjaPT26KYq2YKdTY7JcLNC88lo=
X-Gm-Gg: ASbGncva4dhMuQDKRiO7Xp6muwzwmWCA2FHPbAg8cxETVWawjnPrKrvU8eg2DssWNMD
	uyGEVzeib39Ba1wM47xeUcNLlWfxpX5DnPIUdCh7lblkQYzX1xl6sXcUFxcaKsM5z27rYvo4plA
	4bN7ic4nqkJBg6I++OW3QjNGaIaOOwPw5OvfxOGrpAaswqw4baJY8OJkPV3uYM7n1fa07i10Kq3
	StD6q9h9tcw2Dn14/GyvwPwGMbJH7o4Iq76aO7tKDxxmUUHlTcddWLxDvxXpiWZSVkj+dqwWObr
	c0/Jg39K
X-Google-Smtp-Source: AGHT+IEVq5G+gawrHiPzQYVclV2UevSYSlAdxNYl7RmLq5d6hxx+eXzeCUIVNOyKC/W4oWQ1f5HO/Q==
X-Received: by 2002:a05:6402:1cc1:b0:5d0:ee52:353e with SMTP id 4fb4d7f45d1cf-5d41862ed58mr5867285a12.29.1733850622148;
        Tue, 10 Dec 2024 09:10:22 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:20 -0800 (PST)
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
Subject: [PATCH v4 07/24] ASoC: renesas: rz-ssi: Remove pdev member of struct rz_ssi_priv
Date: Tue, 10 Dec 2024 19:09:36 +0200
Message-Id: <20241210170953.2936724-8-claudiu.beznea.uj@bp.renesas.com>
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

Remove the pdev member of struct rz_ssi_priv as it is not used.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

Changes in v3:
- s/sh/renesas in patch title

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 35929160a8a5..b24c323ee05f 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -99,7 +99,6 @@ struct rz_ssi_stream {
 
 struct rz_ssi_priv {
 	void __iomem *base;
-	struct platform_device *pdev;
 	struct reset_control *rstc;
 	struct device *dev;
 	struct clk *sfr_clk;
@@ -1043,7 +1042,6 @@ static int rz_ssi_probe(struct platform_device *pdev)
 	if (!ssi)
 		return -ENOMEM;
 
-	ssi->pdev = pdev;
 	ssi->dev = &pdev->dev;
 	ssi->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(ssi->base))
-- 
2.39.2

