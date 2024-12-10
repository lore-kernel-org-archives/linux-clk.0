Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575DB237A59
	for <linux-clk@vger.kernel.org>; Tue, 10 Dec 2024 17:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733850616; cv=none; b=WffwVb/r+YrkNE+ajgj365w2dKqNPj19YZBjBiYTNz2TcnvVL1B7X1OTYIoK98tel288opUf9R/780p4Xu8RNNuIKYeNjNyYDSALVZvbX5S79dvJJ/WBpIVxfjJcmBhAFaNIUkqqBPVGALjOy8kjWahP3NE8cvPnGC9jR5AQBk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733850616; c=relaxed/simple;
	bh=OTYVPrJXZsCibJypCZf8QK2KZMdsmtd9T0kWyznh0q0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OjgOIvRGgnJsKT4sMLekdnJ3MJZOnJ9yFl5xTLbl0UCViOLQDSsRAhhDJUGINuee+YenZdUHwBf0W0UGFE8C3zLAydr8YcSQMix5fFda0VUdAjeEU3T0t+IFbV5l856q93rrwSId5pEo4IhkiQsDveZ67oPqOo4gsugn+r93URo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=bHzgadTq; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="bHzgadTq"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d3ea065b79so4488784a12.3
        for <linux-clk@vger.kernel.org>; Tue, 10 Dec 2024 09:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850613; x=1734455413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y4VjqX7iwW/vu6N1WvzJJpy4sCnLnXPgQs452O7qiog=;
        b=bHzgadTqkHFD23BtqN2KbvqYcbXCWKNUpmCFiMAvclw4XLSAoYgrzQ3jl0PppOLaGC
         2guV1KrjMFb/xNpNtSVhLLhizXZkv/WVqDyhAK4+0zvCiKgaN8qASbW/DZ0ESOVWhcYr
         2mAtA2hpqZtUouIL8PyLmxSVpGapr/QtPWRkV0WIr3etRR7WM4oQ3uj4WFfeig3nJjR3
         RX4aMNwM5coMXfJy0wXFRf8RLOIrtDJelVmkR+EKSp/qt4GRM9CdKxhpTNeHCUhvtPuu
         kMcyUIziiPvWZFq77/6D46/4wGYT0Gm8pWaqHjIPImy5VHEVA5Cr+o1puS89MMbcjWzb
         0nrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850613; x=1734455413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y4VjqX7iwW/vu6N1WvzJJpy4sCnLnXPgQs452O7qiog=;
        b=jx44BQS+5PU4sN59oS80ZEnMm6N0xzCg2mp6Se4ZgXc8ALMbLE4oM/YT7ZdQxw3PZg
         KIy8WPW76zwjM/a7xO1a1WW54BhgZf93Er6IOIN/uxwhsofkUrAtuvh5RBSAUO+V+FiB
         zSbc8LYcve1DE1id8YDZ7c4qx3sVbH2v3a6rPHVN7YtHr8ToSpzQ94cWZCxHsL7CtZok
         MGZsMXgEglBgTuuHvqv4k3EWJCpV4y+r4Rt6m+Uek33eNHLdAFstcACiKo0oqmMs8jA2
         e51H1rU3+YadVifnE2HPmqN1SjTb5bL6rTJ9Qxv+jKbDFwIgfxaH50W4FCqDsEPN3ge9
         Q6oQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiBH+BYYECfwTgORl9oczM8T0dxajkEzC76FtVzFrz6ZaO41RwI/orj4worC5Uc2Wks7bjfgxP4ok=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvcqcv0S4Il/KTA8dcCoBBVAW/WhZxxHiWTywpGoEu1D9CIQNg
	9yeK4JPFkBDmN9YgyR+JQijJx4bP7bZqiwWXF3D7zRRNMexpVj8+FX+F9cjGAOALspxLUp4sY6h
	v
X-Gm-Gg: ASbGncuSt8Eku0Duc8HubOP48K76SpcITRwmpTRlf0Bm04tskvsbZ9FCFTliVkQMa3S
	q/crcjX5LfqAyrbHuz8kv/NG3x/2BpaLF8XtBw2+5nWnEwWgYgZJ0WzUz601ruRdk5Y9b/pZiy3
	6iG/kbxPEJPfb//b5R7BS78pI221cGxLF/sd0AZ6A5Fl77Sg5PFVdH6b/4OoQQNGg2Mlyf9zSLY
	x+2aHdUfUHspffSN0Ydrd3pP37vTAKOo49n/c5CGIq3U9bqgo1MXNJLjlsvxwUVIAGhEJAeJ3tq
	IffDxLb8
X-Google-Smtp-Source: AGHT+IF1pww2qqLE9zMCq4Z4/K+bkG+iAYWr1I2S2Beewnfd6QMcuan64k6kobi5emQ4TB2NMs4iTA==
X-Received: by 2002:a05:6402:13d4:b0:5d3:ba97:527e with SMTP id 4fb4d7f45d1cf-5d4185fea2fmr5584908a12.25.1733850612616;
        Tue, 10 Dec 2024 09:10:12 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:11 -0800 (PST)
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
Subject: [PATCH v4 03/24] clk: versaclock3: Add support for the 5L35023 variant
Date: Tue, 10 Dec 2024 19:09:32 +0200
Message-Id: <20241210170953.2936724-4-claudiu.beznea.uj@bp.renesas.com>
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

Add support for the 5L35023 variant of the Versa 3 clock generator.

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

Changes in v3:
- collected tags

Changes in v2:
- none

 drivers/clk/clk-versaclock3.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.c
index 1398d16df5d0..9fe27dace111 100644
--- a/drivers/clk/clk-versaclock3.c
+++ b/drivers/clk/clk-versaclock3.c
@@ -1133,8 +1133,14 @@ static const struct vc3_hw_cfg vc3_5p = {
 	.se2_clk_sel_msk = BIT(6),
 };
 
+static const struct vc3_hw_cfg vc3_5l = {
+	.pll2_vco = { .min = 30000000UL, .max = 130000000UL },
+	.se2_clk_sel_msk = BIT(0),
+};
+
 static const struct of_device_id dev_ids[] = {
 	{ .compatible = "renesas,5p35023", .data = &vc3_5p },
+	{ .compatible = "renesas,5l35023", .data = &vc3_5l },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dev_ids);
-- 
2.39.2

