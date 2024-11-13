Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F4E2144D1
	for <linux-clk@vger.kernel.org>; Wed, 13 Nov 2024 13:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731504998; cv=none; b=FQJsiYLpigMd9B8H9wgtYKmmoCu8/iVWs7xSuinRLzkJpC6ojmUnkLZ0ypxIWtn1gI+i07klIVgWKU+afqeLsk0vLPy9jAa+O2tXYTofoDDo/ToDKplvsN8CxoEXS6qMeT33ztja9XZeXHzdixTTMoGIySf9A8mBvGIDSCXwEHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731504998; c=relaxed/simple;
	bh=DXqkEsEFafo5gzhgygX2LHxqn5B71xDGuEPoHC7uuxE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Olr/s6K3xIx1kMjtPSD4IFkYZL1Ep2ERfzPL+5+g32n43CkRgZXJ2O44NT1qKVcZKtpWTUr93SfrIi/XrPOrMq/yK7t0boFRsaL5ftmb8ADmK/xKdxYvkORqNTIrRTaL7OY5dKnmItbJSgTg6FMZkl8UTZM4dv6sT7xAvqhirmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=dZ8sZwuF; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="dZ8sZwuF"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43168d9c6c9so60028355e9.3
        for <linux-clk@vger.kernel.org>; Wed, 13 Nov 2024 05:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731504995; x=1732109795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ecd0Mof7jXO15WeLDSECeNnma82ax84EAenvyaM/htc=;
        b=dZ8sZwuFgzApku4oIqYpfi0yVtTtTK1qR7SPRRT5B7lt3AeqmEWfDq6iSuDO39lx/k
         cVaKmf4KD8KRCX2+8lUa7avT74ejbk17Ep9Pyp1ie4VREwWWO5FNjjmItusbF3CSjzEW
         qts2KBi4GFbNhXFdsEcCtlKt2ZDG3sdWklweqcEKR8mTwjAbFUC0YDWLSFIV5oQ31QzI
         bNpDAlZVbHT5J31hnVm8aUP9ru1DJ2yXTIEA+wyDow+av+3D+fqs5UgvRUj1QBw7T4jG
         Q5NtkpIb9zufqBVOtUmRu7SMRgDTARu/JQ32WH3eewyeFXrBmBuUBKx1jvK2owsyspuW
         Vpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731504995; x=1732109795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ecd0Mof7jXO15WeLDSECeNnma82ax84EAenvyaM/htc=;
        b=oBTyDvo5npY//YqVAEEs+dzQCvr+r80GNlXKbd6scP+goTIbTvSuCB9gxWIiDJLbQh
         TPPzkYpANlTBcofu2XVU5kHZipSjv6SY8no50+daC484zT+4y58fuM5GQJj6mxKkRKv7
         6GnUo/r/KDOK6oFaaFNjhlGhtHMJBoenvW8KyQlPL/v8Cl9Rjmywj3jTvAc2AfiatHwg
         wL2/xe9uia/VuYEr2tkplpoukoPSWs8fxOrFQA33iy2JGhvQ5vNRRVRFxzbCu8MhqbFs
         CbIXRQFo3IqwzKEF2wAZiFSykGk+Yw+AEQ21wwFHQJWtZXwKZNaz4dqSdN5GnIiZT1T5
         WFCg==
X-Forwarded-Encrypted: i=1; AJvYcCVTnlmE93i3qxTIfaAd767D5XVjbqbUciUglt+JBYgta0D8bTaDbXCR98YgTCIBIH/JfHv2A+0IfF8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZubcVHd9Ur8FCE+wb8U/Os4VtQjqgIyDoJAxhC6g/+FY4kOBO
	fVzMpOh18uj8pmkMiUjmACA9L+6DTDv0pDT/SNo4jBPC3SfiZwW01WUb56GYkrY=
X-Google-Smtp-Source: AGHT+IELyaLhsE3PYbeF70nEZe+7NBLbFVxsVluLuBzChJqpUv6UsXqyPsBsDxXq4b7mT1iHHgmc9w==
X-Received: by 2002:a05:600c:4590:b0:42c:b4f2:7c30 with SMTP id 5b1f17b1804b1-432b7515c33mr162135415e9.23.1731504995111;
        Wed, 13 Nov 2024 05:36:35 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d54e2f2esm25664165e9.1.2024.11.13.05.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 05:36:34 -0800 (PST)
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
Subject: [PATCH v3 25/25] arm64: dts: renesas: rzg3s-smarc: Add sound card
Date: Wed, 13 Nov 2024 15:35:40 +0200
Message-Id: <20241113133540.2005850-26-claudiu.beznea.uj@bp.renesas.com>
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

Add sound card with SSI3 as CPU DAI and DA7212 as codec DAI.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index 6dd439e68bd4..89673bbaee6d 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -44,6 +44,23 @@ key-3 {
 		};
 	};
 
+	snd_rzg3s: sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&cpu_dai>;
+		simple-audio-card,frame-master = <&cpu_dai>;
+		simple-audio-card,mclk-fs = <256>;
+
+		cpu_dai: simple-audio-card,cpu {
+			sound-dai = <&ssi3>;
+		};
+
+		codec_dai: simple-audio-card,codec {
+			sound-dai = <&da7212>;
+			clocks = <&versa3 1>;
+		};
+	};
+
 	vcc_sdhi1: regulator-vcc-sdhi1 {
 		compatible = "regulator-fixed";
 		regulator-name = "SDHI1 Vcc";
-- 
2.39.2

