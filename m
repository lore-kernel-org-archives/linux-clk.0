Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97251DB928
	for <linux-clk@vger.kernel.org>; Wed,  6 Nov 2024 08:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730881178; cv=none; b=cqjxTLYVak9AG2p5hYDDKAiVC2ASA2irLQMcqiKakEfQ1f0jd8p0DMz5cpi27csvgdlmKM2fx2o6s4JoK03pq1KYTfQFqJb7A1Es6HZDnf8A9fPynq60q5t3afW4CQ85E/buHOoV07VsOFP1niz/RiRd60cEWzRN8yiFFsrmh0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730881178; c=relaxed/simple;
	bh=mPMc+AF/vlJROlCObatgVXliT++4ROpN8Q/2wbdWDrk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ktimDKf5IJw2x+SdZPtZ+deYTqN+sjf+eoUXvScRA09wSoMuj63R0IEt0qc7LNTxexjAgbANVLo4aRQfDPV490G3JoKPsqTXnzjss9jIDzFVhpMiDVyXY9RJc7/s1PUzhN/MP1vb9/QuvLhkGbusIoqunqus2wskV8geK8LJCcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=LsD99UAV; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="LsD99UAV"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a9e44654ae3so844556466b.1
        for <linux-clk@vger.kernel.org>; Wed, 06 Nov 2024 00:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730881174; x=1731485974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wBAuoz3tKBWR03gOjJllr++JmJ/mfkVVEbr7EkinvMo=;
        b=LsD99UAVW1QLt+R55TV6vkUOUUBrOFFk14VzlqPM97YyNQFyEep1bAMnadnrU7THt+
         BuuoBtoOlgA7e9STZ/1+ktYWtmc3uIQ0w9cdTqTzSk8l8FPGT0tXLecuvfUN6BB91BdK
         /BYUIWWC2FZ8eP27GOxKd+vRhMrmnty9++t7UcgOI7as3BgURwfv6HwHshdoJAoLku2d
         chEYhyQkhIh11nEDiyaUyCZsKp6VVovTRc027ksMg9Wyc2TIkoCWsa5G3k4MUgb5/HjZ
         pyt5gI55Jzq37fnFwsrYJ3d6+GhuuHHC//9Aict1EfU3zHOyLZuSIjwDblapF3t5yNwl
         l6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881174; x=1731485974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wBAuoz3tKBWR03gOjJllr++JmJ/mfkVVEbr7EkinvMo=;
        b=SHbA6493uXGiiW7lrRUE5LZOhxDqnuVFSjVaLaJnxTP+pP+f2UUfVy60Kj5SSQ9SRc
         ogFF3s9DH0bi0ZSLnoD0mF4c8E02HDLUtf2xn1/B+FEaEAxiIFsfv/i+WxOd21k9pIl3
         clmXxySNeUBpAgsBUBnzVqI386T7mekaAmsW5NNWdWJ+8BeHCWJL8gQATXuuBS6yPYl1
         CB1SROiuJcx9SIq1bF1EafZ6N+UK37wwr/sv25ARmYDtVbNpRZ6YNY5NZCsZK1Fl2mZh
         tS2dRTnmTioEblT/ej4h7JTt1VrR9LOP/jfyHTGnMFaRrLN0Mgis6LYHJ1Ughg2S532Y
         eGZw==
X-Forwarded-Encrypted: i=1; AJvYcCWiry/8cmn98X2dPD8uvi7XObLSezpHMskJEOkgOWYhxHXhZGGJt+2J45cS5Fj14LA5kLAuOairFcQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj0XCiu0gs0iU2I9ow7+R7Go2vQZS68z7V0z5cBAvwmBxvRfTJ
	Bd1TlJ+f3rizutVFFTX8NbKdRsQHSlDFb1Thj1bBxI+xKGmB6OxOlzgGbz2t/Ek=
X-Google-Smtp-Source: AGHT+IEwWlrK88WIb1wNQGuBxXyAjVdXhR30N25VSy/E7pqQApgtSLL+zYLhkyw+puly/i3rzm4dFA==
X-Received: by 2002:a17:907:7242:b0:a99:ee1c:f62f with SMTP id a640c23a62f3a-a9e5094307emr1876407366b.34.1730881174308;
        Wed, 06 Nov 2024 00:19:34 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a2dbcsm241369766b.40.2024.11.06.00.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 00:19:33 -0800 (PST)
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
Subject: [PATCH 09/31] ASoC: sh: rz-ssi: Remove pdev member of struct rz_ssi_priv
Date: Wed,  6 Nov 2024 10:18:04 +0200
Message-Id: <20241106081826.1211088-10-claudiu.beznea.uj@bp.renesas.com>
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

Remove the pdev member of struct rz_ssi_priv as it is not used.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 sound/soc/renesas/rz-ssi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index a4d65be17eb1..a359235b55af 100644
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

