Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366F61EB9E6
	for <linux-clk@vger.kernel.org>; Fri,  8 Nov 2024 10:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731063033; cv=none; b=WRRWDKHZWkfHTkk5UIiFnmVG0V8hSsmVEpVxfJQ/MdR2f/j624w7++m0YaaW0HFXNf4kTLputTaSAxho+30yjHO3iBgLLBd/fIaJaYMvdrCJZvWNCi/Cc/3BPDTxOp/gPOwnJte3+/MPV4NkhmsDzmyHsfTE8sdFFXN3Et3BhII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731063033; c=relaxed/simple;
	bh=uQfKkEoR32N0d989ZespVXFD+EYoWvBvpUMB8tvOdrg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lhbnQjZZk9GXfFHa+E3dEIRtyIPSwh8W8Q3/AFvNd8q4mwtDJ+VNSzSsA3CiLx8duf77rP4tS2GtyE5ZY2dFsVNeCPeVq53kTHIShBy5wERuFktFrOblDv8YqWK1CnN13j8l0dH3Vfu+W0jHi6RZARBP5MxCEaXlrv0uFhapJK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=iebG5QP+; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="iebG5QP+"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a9eb68e0bd1so273289466b.3
        for <linux-clk@vger.kernel.org>; Fri, 08 Nov 2024 02:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731063031; x=1731667831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVWcqtL2/z6hHqWPVR/NbA1tV+dgOCVHn7AuI7jqeJ4=;
        b=iebG5QP+iP6Inr3RzPjO2Qc4Mlyw9fr0dqb3vxbEk6xx1YTG7nVwApjBp1mYrppw0s
         rzQis8MO+CHhIWaZw0J25uvRxk2DcbHUNjdqrvX3lC3zTh4VUhk9E/FktQH8sxsALkgs
         ABTKObYNuq4zEnOMi35/rP7Gje6Ad6dK5CduxQ7w9SAhQyWQcA6igVqOnG21riZXE+CO
         bFr6Vm7EzB/sva6webN6ueneeGDS+ySJ3A/VQqNc7dGAaqA+mvSPW0IFpe88RpFs/g8H
         ouyIWQZhN0y/WK+pOBFj0OhWMgx/9uliiY2/qlQ7zu1WC1rYWevGYybR/OkPpNH7SqKO
         +ruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731063031; x=1731667831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RVWcqtL2/z6hHqWPVR/NbA1tV+dgOCVHn7AuI7jqeJ4=;
        b=tRZIxTu+wboq/g6U1lYV5IGrlCK8wouIJrzkVGe2qzV1BNpSZ077BvCdxIKKiJpA4U
         qV3IbshXW0TicH/58/QSJk+FbT3z7Y1ug3zk27AGVB3wnfBJVHjRQUesJMXvVjWoOsIe
         Cq/RvA95KwJmCUwGzR+xqZ3JkkrtmrhpXbOKStRH5bnbEC7TW2akwWrAnAA8dcCPVUe3
         vhfO7qHEAj0icSLTE7pK4PRc5rPiEJl1O5gBCdqf/Omj99M+KxVgmXzh1Dt8Ts2n7Hud
         Sojtny2rzu7tI3cbrZ4oCpNxGkbfgRqiK+hPmYKGuzpMCNWnH5FNa5yDsK5IIIHFmR1S
         uxTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyxY8Dz4o0gROVtbSUOAjQBTHvNHAQIxXJVG/lXCYvDcR0RImtu8RicvpSdTICPIHc42iPNinSeXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZaM3varOxxemzbB4CE/KOJ7ZGK2lVr2bu0b+2mCG6UqDdigI2
	hGvo1gHcsQDC3nu/Nt57wWkagR54jmKs1aAXDVDrgEQLysYJ62X9rZkdGdka+yQ=
X-Google-Smtp-Source: AGHT+IFft6CwH3EePxmvnwbJFYSPRDnYeOJGj9yj1dd1M3Hdcr69b4JKtRaHUgCl0R3MhySJFo0PIQ==
X-Received: by 2002:a17:906:848:b0:a9e:f28c:3749 with SMTP id a640c23a62f3a-a9ef28c3ac0mr107670166b.32.1731063030575;
        Fri, 08 Nov 2024 02:50:30 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0dc574dsm220464866b.101.2024.11.08.02.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:50:29 -0800 (PST)
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
Subject: [PATCH v2 08/25] ASoC: sh: rz-ssi: Fix typo on SSI_RATES macro comment
Date: Fri,  8 Nov 2024 12:49:41 +0200
Message-Id: <20241108104958.2931943-9-claudiu.beznea.uj@bp.renesas.com>
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

The SSI_RATES macro covers 8KHz-48KHz audio frequencies. Update macro
comment to reflect it.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

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

