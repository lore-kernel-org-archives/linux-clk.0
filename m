Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328641D5178
	for <linux-clk@vger.kernel.org>; Wed,  6 Nov 2024 08:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730881174; cv=none; b=TViZJ0cNXeNlzKQik6ZI5d4w0cCNtiVY1sN3hvs4MsVUlYO/5j64YbVsyUPIJmap9aDQEaJUKOScHjkpzmGZR7rWLJ9nq9jg8wwuMRq4dpLAnI7k9pI5xiAOw5Ng58+iRPdzxfiy4H4JZ1XpsOmMM8MxfES+RRUjJyMnUsbus/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730881174; c=relaxed/simple;
	bh=/6aTrJTZ4Jidw/36xgtKQTOiFQ2EPWFG5aJ/0JSGVBs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QLGr2vTfE0jH9Xy9Ewls485vhtjv9d8cN6sfkMZl2WzrJ4Y0ZF6zil2/AvVNOJTP+/aCdi6Z3pMDzrn4uBA6/l1pIGsLUkJeFVwawVHK+fLKWRoKGiY3tgwV5kL6nEj47LBFTtcOJlkLUU1RiY/hR/+OPopSoBRl4+FDpKaZhrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=SW0ERnKs; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="SW0ERnKs"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2feeb1e8edfso55158711fa.1
        for <linux-clk@vger.kernel.org>; Wed, 06 Nov 2024 00:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730881170; x=1731485970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qs8Ss9deUl5XVYufQusJH2c5geYUc//oteJUW4gxtzA=;
        b=SW0ERnKsIXRWN5mDna/7qX6rZugzUGRRWN/UXG6E9BphUW37mwjhoUxsGiSvQGK78V
         MMCw2fxFxI79yQzDPqTGlOEVWfqaaVnmjFXsVsKJ6UGNNM61rX3RNtMaZEdIYFITGaCs
         LShVwBjwOlKVjIzdXS+n5nvdvi1R4Z4yKA83EthQsDOnaVJS5YdI5nGlhhU0xfkR6GXg
         e4cZ3dlMFLUncHeMpInNEpwVQQB1dXG/t4XfN1j5yFUACRYduGMnVIk/9hql3snS46L+
         0+KWSPsvg0b/45rM3FAdwFdqSO3nyZlvdwISYzBZWGxNV+yfHCOXuOy8p93lqlCxUSP/
         pRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881170; x=1731485970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qs8Ss9deUl5XVYufQusJH2c5geYUc//oteJUW4gxtzA=;
        b=O9ti/R4nhIm2v4Krq7nq5CyfgJ7MPOB6XyhJaCzEg8m3COvLrNAj9a+qlAR/GjDykc
         XfkoH3LH71EkLqY0M1CJBBohWavp7U7gdTyP7ui7av+6qXuFiOaWWS8DCLNTKnErScUo
         nRDr6oae7zt00dWmZvd5ZSfFqBeyDcZ3Io3BiHhZAasK1wp3pbLIPshKpA0jkuJYBjON
         6DoCpZXtqT1JLXZLUwUEcdLKretn0fonAGsbHz2B2sEieU/oVRPO/hOn2Ko1aAK91Xen
         abD+LfASV11It3sNzn57uo3oV7cpLxqDx6uwnRlxstIKslkiX7ZH77RYAsY+4e0Rrf0I
         pouQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAeiOBvKhQd6Z+DP/rCVzWfE2p95NYMlLaJaAMbm37h3tArmW4uwTtwvSEUeyahDC/3VbTAX6Q6Xw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQvGWU/PYOxkEknoss7povsPCBfeHXTSpsx8KvR7HSkwG7puFo
	qVxf0Wi6m/KJhn0Z7FcZHMtwIiwpAQy4g5x6WBb6QB3ebjgFuKI1TaCtJdJK9TA=
X-Google-Smtp-Source: AGHT+IE6bm+5nSovHMVfHCwPuTVdYgbqN3XXTW2qPIGl/kWKDFvfvED0CYNKOeuBjIaEcKEOrQ/zIw==
X-Received: by 2002:a2e:a98b:0:b0:2f0:27da:6864 with SMTP id 38308e7fff4ca-2fedb7a2d44mr143308401fa.17.1730881170289;
        Wed, 06 Nov 2024 00:19:30 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a2dbcsm241369766b.40.2024.11.06.00.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 00:19:29 -0800 (PST)
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
Subject: [PATCH 07/31] ASoC: sh: rz-ssi: Use only the proper amount of dividers
Date: Wed,  6 Nov 2024 10:18:02 +0200
Message-Id: <20241106081826.1211088-8-claudiu.beznea.uj@bp.renesas.com>
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

There is no need to populate the ckdv[] with invalid dividers as that
part will not be indexed anyway. The ssi->audio_mck/bclk_rate should
always be >= 0.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 sound/soc/renesas/rz-ssi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 2d8721156099..b4439505929f 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -258,8 +258,7 @@ static void rz_ssi_stream_quit(struct rz_ssi_priv *ssi,
 static int rz_ssi_clk_setup(struct rz_ssi_priv *ssi, unsigned int rate,
 			    unsigned int channels)
 {
-	static s8 ckdv[16] = { 1,  2,  4,  8, 16, 32, 64, 128,
-			       6, 12, 24, 48, 96, -1, -1, -1 };
+	static s8 ckdv[] = { 1,  2,  4,  8, 16, 32, 64, 128, 6, 12, 24, 48, 96 };
 	unsigned int channel_bits = 32;	/* System Word Length */
 	unsigned long bclk_rate = rate * channels * channel_bits;
 	unsigned int div;
-- 
2.39.2

