Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095601DAC97
	for <linux-clk@vger.kernel.org>; Wed,  6 Nov 2024 08:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730881175; cv=none; b=Cg6HRN/iGxnOA2sUx1+BYE6yM5fnzAY2UUwDtPrAZp4xQjHhAMFJz2tttZ48Q01+WYy4wCrTNxAXtzgy5NpHX7WxhMub7Y6CdaRF/Nj8nsi71TDg+NWiMHh5qXu8KYn5UhpJvaUycfrFsx7rYMSSCmTIpSmpdNLuYFkZRiy9ghE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730881175; c=relaxed/simple;
	bh=a+IUchkvg57gxZbkyNp9bTZ3an2EXOBGERsCCV+NV2s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HPz4lUXeXH1BFzL6hry8GjLkeQrsmCtK/Ayt+Y3NGxxGM8526hcRGTDJb4I66RFxwlaRaPej8R26yErOFdOiqjjgWMYbCJmrp+OwZbUB3tVdTMtfUk8wnA3lKbXmyoCiug5F1Lp6vzW15+3UseuhM0K8mk1WH4h0Sdp/ATHQowY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Y7QszrUW; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Y7QszrUW"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a9a0f198d38so1080305466b.1
        for <linux-clk@vger.kernel.org>; Wed, 06 Nov 2024 00:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730881172; x=1731485972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=54nqiDHAf9M3O/5JYgCXuFRVc4rEVNuOCEXOJ805IPg=;
        b=Y7QszrUWozmghiossX93kjZkOO2rnwBuTn3wLXQ1HqdJYysAGEIxo9owGy2j3nO+c1
         WkpCC0H8OLsLBHBYS/Vo/lbmn0ggLaGdAwxM8HYvBtPP3FYaFYYgLIXpeNEeNq6fntUS
         smNKazFySj8V54iPpK+zxbm29e4F+GI48kS4kJc+3HwNeXsVl71aTVKpvK2orW1T3GRY
         Cj3AOzR+larPoeJuC+NgnfPjaXAaOJJ1qg++dj0TIGKcnCqHC5W35SJwFASDyvrHHIWR
         CX4eGegfWi7u492uwqR1/S2fp9d3DNESXdRLG1e7qLDr1233NwbZhECHKTs+w5jPJ+jC
         M2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881172; x=1731485972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=54nqiDHAf9M3O/5JYgCXuFRVc4rEVNuOCEXOJ805IPg=;
        b=FaChBQc18pqLqmx9AQ0+ZgMH4lF8DKa76Z0fBV2v+t26cu6+fy8oiXtj/oxlz9g8TU
         TaNJALgWpo+N9t0JYIf5s1vyN/vCDgp97b3oeBT4K9TMowbOAY5jY2u8GNBZ81+dmaAt
         hQ8Yz5T0wFkGg8T6QiVOWT21FFukWfnkEvvS7A/PaJnZ1/vNg4nVjuJEeidVssGqDS9D
         ZGiOWsrrHVuHvtCz7jzWHokyQo5FixzVFZhRnZ3YNWYYvmbjTMbDD5YWtTk0Eg+xWoVj
         cO1zjlICoLDOqvwkt/LAUDMTjD3bEJLe30Rn/JJUeN1GH5DTqtfZA44XgyP0pwrG3bbK
         JHKA==
X-Forwarded-Encrypted: i=1; AJvYcCWDionFVyGAbSuBxu4s6Ia+F0+Jx2wHveE5UpMQLLCxuPfldAPdJR9aTjwYJmXo8H7pgjj7jUtq7SA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyaMg+29WRMcAomKO6GqFFsy6mrDU4XSARhQ2dHpoF9HS9nHUR
	V5zuMyOQMYiZ7JZVT380D5lYs3Y41EnFk2aNnSUZvSVX0jokP2DdXsiZx5FLZwg=
X-Google-Smtp-Source: AGHT+IF/XT22UAeG19xPFVLsEumo/uwLEK05hyFiHlUZcUMHq9+9v5dsaFc4UYukkjyQ8GsIJhfNjA==
X-Received: by 2002:a17:906:bc02:b0:a9e:b150:a99d with SMTP id a640c23a62f3a-a9eb150ac01mr535571666b.5.1730881172333;
        Wed, 06 Nov 2024 00:19:32 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a2dbcsm241369766b.40.2024.11.06.00.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 00:19:31 -0800 (PST)
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
Subject: [PATCH 08/31] ASoC: sh: rz-ssi: Fix typo on SSI_RATES macro comment
Date: Wed,  6 Nov 2024 10:18:03 +0200
Message-Id: <20241106081826.1211088-9-claudiu.beznea.uj@bp.renesas.com>
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

The SSI_RATES macro covers 8KHz-48KHz audio frequencies. Update macro
comment to reflect it.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 sound/soc/renesas/rz-ssi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index b4439505929f..a4d65be17eb1 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -71,7 +71,7 @@
 #define PREALLOC_BUFFER		(SZ_32K)
 #define PREALLOC_BUFFER_MAX	(SZ_32K)
 
-#define SSI_RATES		SNDRV_PCM_RATE_8000_48000 /* 8k-44.1kHz */
+#define SSI_RATES		SNDRV_PCM_RATE_8000_48000 /* 8k-48kHz */
 #define SSI_FMTS		SNDRV_PCM_FMTBIT_S16_LE
 #define SSI_CHAN_MIN		2
 #define SSI_CHAN_MAX		2
-- 
2.39.2

