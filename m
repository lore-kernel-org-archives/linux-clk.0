Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9B120101B
	for <linux-clk@vger.kernel.org>; Wed, 13 Nov 2024 13:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731504958; cv=none; b=TqQ/ZZp36WFJ7prVKkKsJ9OXdj5vKPkYIiTuZKG8aWQBFN86Zqfp9XkNFrFu6KFhdQOg8FZjsoEBTvCowxPa6Bb99f+CnS1Ieo0kQRQ20xEY01ZQ7fzz6k/z8dfJ7O7hNUPNkDJQtZ6BHf5imNDUJQ47rr9u9QvC/OQ7aPpDa08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731504958; c=relaxed/simple;
	bh=TSqSzOs8Q7BMfa4saTar0ZRCzZC0f5vyfoNlajUePmc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OR94v5/QWTZvTCBs98WcZCkmJ2heGAmY5gbeFONoB/9xgeR0uwBPTrsvB4JH6ePzqXqs4klSJER66Hs+3BrG9GRSGE2IUSF6pAnkQG1fSPZKjfDn1IaI5heFD9uSFQl9xN609XPZhg0hDbAu7KE+DJiLRfsEarKktpP8tuuvn0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=kKnKaG2b; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="kKnKaG2b"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4316f3d3c21so56409965e9.3
        for <linux-clk@vger.kernel.org>; Wed, 13 Nov 2024 05:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731504953; x=1732109753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Sa3H1f/E/g0KGrtcmKvCv12Jkl936NP4UC4pZY9H8c=;
        b=kKnKaG2bzadX4UwnSHcO8CXdNKaiWXHMAVYJjthK0gAm4HGIEwiS0S6a1FQlnCWKvK
         mNQEGpr8XrymSvEXG5VCV3TIuXqORXY2gfnLe5YeZIW45bGeRkKfsygEiqe80N6y5gvL
         C4kyjkwszwb1acrefO+dw/WUYQ8hvnVKOPnrW4juTm14naOmdvlb+waV3CwD6NMmY1F9
         Dzzz45vCwvgRMEyvLYlffysmTlH0HYekWmY/YBxdkAFyScobNGf62mcvjW+/hOgWAh4N
         HGzP769AZ7qojvnslMrrkOPMjW+n6dmwE+TJ2RxsWSwen1NZZhFE7DPGi7DRt7wREFFZ
         KbnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731504953; x=1732109753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Sa3H1f/E/g0KGrtcmKvCv12Jkl936NP4UC4pZY9H8c=;
        b=V+pYXez9FTLFYUwD0FF807SToOXu+LkX3XKzjxQ92qPHNV2McQK6glvagECzBTxxeZ
         1E1uB44/wEVWNaatZjfhDcnYeMvYVAD7OY9u1Jo6+3viiBNFZuJpXnEhqKNbZYMuDsOl
         fTNVva0GgCJOA5iepr9aPGYI56yDzyDaOrTf40/47K4J9RwIKwToDq7pZn/6oxqQwIfc
         dwYuYEuJ+Uc+k8bEW/JEpfyu8qBir4CHAi58+vE9H+VGrYamMGh8o5duTjONP+qqofGn
         1WyIWz5Iu/gN42Tssk9dWh3dzieEVYI07vtX1A2JiBxUPvSg+xbixclk8iY8OyIbVj1L
         vmLw==
X-Forwarded-Encrypted: i=1; AJvYcCW1cjByiE2s/sK26JCN7FOyj7oiVh6zXDqeEg4qX2F9W1tntmwshYi8iq745zoTDzLMcCk2QAxhe10=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDEDRjGjFGa5MlgV4E5R9sGQixTjfBQASzGdHDk0bvel/2JQbs
	EPKHF1RXP76ByMWBzbxjygzaJwdO/0nWoNual415YG4Bxdj/nnwUoqOPZBvgJ0k=
X-Google-Smtp-Source: AGHT+IEYHJzqM5FW299ZAdbK6T7DVikcehfuphKy8vP+A1ZGKFW5gkq6w5nT2ifGCWhjngi1zECKUQ==
X-Received: by 2002:a05:600c:4e0e:b0:431:59b2:f0d1 with SMTP id 5b1f17b1804b1-432cce6825amr58718565e9.4.1731504953372;
        Wed, 13 Nov 2024 05:35:53 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d54e2f2esm25664165e9.1.2024.11.13.05.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 05:35:52 -0800 (PST)
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
Subject: [PATCH v3 04/25] clk: versaclock3: Add support for the 5L35023 variant
Date: Wed, 13 Nov 2024 15:35:19 +0200
Message-Id: <20241113133540.2005850-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
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
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

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

