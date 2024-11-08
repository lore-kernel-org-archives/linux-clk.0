Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98731E32A9
	for <linux-clk@vger.kernel.org>; Fri,  8 Nov 2024 10:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731063030; cv=none; b=WYYOyE2C4MOr3bVb0qqyabNaS/+nDLjuPqLA8/Px4ug8u/WELhCs2yiOoRCn6VKJpIcGhJsXVLzgfkro7RRbhbhqizD22s5R4al1/+IrpTnW6B4qvalgvypCrWZvpGEdeRik4wTHu91RskLOgd+Um2Li5t7rzGT5BrBdGBPkv58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731063030; c=relaxed/simple;
	bh=h/y23T6WXsZosOzfQNnDY+T32ZVWlwo2fUWMCoZj4Lo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EykJv1cZ6lWyUwYGnZ+YpOxLo6xaeQTPCU8vkGEdH5NXHipmYgLFZXHsXWZPNcVpzNkFGCj7xP60Z0N//jky61J5KO+hAuIhuVp/XumT64wb8P+K0noxmC1laGPr3rnvkOKv+PNkQCqif3YZOtSO5YNGbPFjaBDn+PQ/iXk/+4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=A81QYsmV; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="A81QYsmV"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5cacb76e924so2832552a12.0
        for <linux-clk@vger.kernel.org>; Fri, 08 Nov 2024 02:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731063027; x=1731667827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EUINzcxd/jCXeTMEdPSmJ3jqpY02TDO75OGNa1aC3GU=;
        b=A81QYsmV5wYG7J3JXFfonWCtIdvPYV5VFyOYawGMs6iObrxcBQudpD6KldaYHa19kn
         E6d4I0655LOKvCqNOVrBXot3+5zE1tdXUaRZOOeYuDnj/USzrZjRs03+GChqdk5pKZuZ
         TQp9oZ+GbgjHXbwaKWx+wb/FCp/2WEOZ6tW800E02lq7DOTmuIc+lc8/shO2B1dYMR97
         MwS4hqX6VzTjnWa1fBsGRq1g4PVxL2V4TZ65L+bg5ilxaypaLPWQ1HDR5RUPuxRqdhK2
         l7nA9iOGwauyritVI0sXOQILpVGX98fVB3QD9yYZR/2ytJ06zxuH4wWWH6mg+iC5gz4v
         yHkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731063027; x=1731667827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EUINzcxd/jCXeTMEdPSmJ3jqpY02TDO75OGNa1aC3GU=;
        b=bKG0I46K9QEDj7JQJTIR2Bpt96iZsRdh6AJSGV6HRE0hjNxkpSLsrX9XBVLf+T4fQv
         0XCCyyvxraluuR61ISzI45PeW8vpxTrCjyykYPGSABOcMaGaYOeDz2fzGw+15aNm93gS
         moE/MUEShPqJVCs+8/HGXiQD1NzJBCETLa/0gseaztgXHeH107DDdQm3Ly/Ip+l881OO
         FbcNsPe7H9jAB0cJihNlTKdZdZI5y9KeeMAVqlUU5NQqKjhK7z1xkbE4d4Gi3e3G3c7r
         9AT90imLdO9gbFxtSPmtpMVz23QDF5dXibt8TzEdVQQn266Wjv7bitdg+dSsIQilQLMi
         hD3A==
X-Forwarded-Encrypted: i=1; AJvYcCV7oROeT45yMWuRNfQ3SL+FyQRt5G7pC4VO0/rUsAut/2leuVC5XQMuH/cEnxXZIvWu1e+Idv4+X9U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1ke4+J+9eMEunVLqMsiHJNF1lobTF7zdrrHTEEluQsUgvcUvk
	KMgGohwuSFhn3fA3y04VileHQEsaRGkVTs/5t2sUJzdt7K+lU2k4nbRUmmIVEk0=
X-Google-Smtp-Source: AGHT+IHa+tQzc4xAxHWtIFyR5mkaoQUPDtmy4x/74qPWFJq2UkKS0Y337B/HDHtOvTb+ulbrG5B3Lg==
X-Received: by 2002:a17:907:9603:b0:a9e:b5d0:de6 with SMTP id a640c23a62f3a-a9ef0016d4emr181814966b.50.1731063027209;
        Fri, 08 Nov 2024 02:50:27 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0dc574dsm220464866b.101.2024.11.08.02.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:50:26 -0800 (PST)
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
Subject: [PATCH v2 07/25] ASoC: sh: rz-ssi: Use only the proper amount of dividers
Date: Fri,  8 Nov 2024 12:49:40 +0200
Message-Id: <20241108104958.2931943-8-claudiu.beznea.uj@bp.renesas.com>
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

There is no need to populate the ckdv[] with invalid dividers as that
part will not be indexed anyway. The ssi->audio_mck/bclk_rate should
always be >= 0.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

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

