Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5401D5ADE
	for <linux-clk@vger.kernel.org>; Wed,  6 Nov 2024 08:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730881166; cv=none; b=BnIObtZ/2H50EoNxnfPiAitwtIVsXihlC19ooDyyy9oB9vB+JUlO8RnMreM4Vj7h0aZEZJlm/uvvpHRLM3Y5jiR0wPwHI4KtUWjNdIZrnZ9spoyjW8hyc2yYLuxIT65nsKBW8BFp+Ewzz9KnaYbpMtlSN7jygv3OtveLD3bpbFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730881166; c=relaxed/simple;
	bh=aRX29E4lFpfoVBdRaBaUhYu+Y9s8yOIoYHf5qgiRldU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=siYQj8g4kGL0Q7iMYSFI2LaFKzHPt6lZTu3bNdFWhduI3Xfl7xTVDt+C9a23e5vQBCHCOR0oV40rvs14Gpk6JsAPczm0BD0svAwRB57yHcIbgr1atAlrlw9PdxdJTYsEWLgDVLPuDJ1kcIlVTkwu438uT1ah2XmiI4oK1KOSC6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=QpL55cpF; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="QpL55cpF"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a9a628b68a7so976899266b.2
        for <linux-clk@vger.kernel.org>; Wed, 06 Nov 2024 00:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730881162; x=1731485962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VmaSAqfAey17H9KOZ4IxzkTTETUnwlhuWoRwxR1p7EQ=;
        b=QpL55cpFeo7pSrW7bESvITUkYcnMrubEctve8+8kMWrWa/fUsv2kDuQc1ICVaCgzpL
         9nbxlCGDP126wsiTHhPT84n8BVcDDiEmjsyQVH+YqT+pmrhuZP/tbIDkwuwRbmR+Hm05
         Q1vAj3bXH8gXNhf6VHDFXdX8gRYtbvfs/6wbCGC88JC2TXvhpjwW3eVxVo+JZxjcyoLj
         KQ8qnf7PvFJ5Pr0tdhWoKBhi//jh6ch2g4wr7LCKZky6YmKGxZSN2RiYda4xgsk0xvLR
         uVgqr+muW39reZZO6ag3XWdYwhCfI+85LAQr/53jy3VZvd6gBPIY+06xbCD+exKqW4EV
         gFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881162; x=1731485962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VmaSAqfAey17H9KOZ4IxzkTTETUnwlhuWoRwxR1p7EQ=;
        b=DA3rFu30EF642KRDozFv+1TPF1tqMBdyUhF83wwhJvf9PfO6GsFjIJJ+r+86di5vz9
         m3U5RXQrZlSi7fypVvKs9Bxg/PrLbo2FO2en9wK3Zall1pBoaQ32TH3VPSak8grdYN1b
         xOMTYjFHJgnBSljqLVkJHBEAikWsnBVyGmRAwM+YRftKpJnQXYS409gZ41NlQz+DyESb
         upglRkwjEoG8oNsNKhNuSfckfJFEXGff3rVWFbpBJ/h+5f0eB6kJERF3KVsUKNTpswCu
         ZJtUB4aSKpEnuq3u5I2wZBQ6ULXAatCP/YvRNXsCbDhkDZUXbUTZmBILTxS0F2RcVpjP
         amPQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8iVKsH6rwRjRmfsnxIlYpFkwCxozEJJBlRgwFG92W7JbIgR3RQJ5aqxoPnoPeQo04TApQzkDkZSI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3KutSfwDg4YtWh6hJCgbm+wTVlk0URTNQCxZ1sbBB1lJVriPi
	Ive9mpxSjWXDP66w1FuOn7+p+5dLf7QO/S+WUKO6NQDGTgLVT3WRdrlfybLZhhM=
X-Google-Smtp-Source: AGHT+IGZyy0CCXuwkU0iaqtdLQ1EgHJrS5/HGfBZU7Q+GJRe3ohTVjIvWXQ75Q1Kv98dFpRjMl/0Dg==
X-Received: by 2002:a17:907:8693:b0:a7a:9f0f:ab18 with SMTP id a640c23a62f3a-a9e654cec9dmr1921914066b.20.1730881162079;
        Wed, 06 Nov 2024 00:19:22 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a2dbcsm241369766b.40.2024.11.06.00.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 00:19:21 -0800 (PST)
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
Subject: [PATCH 03/31] dt-bindings: clock: versaclock3: Document 5L35023 Versa3 clock generator
Date: Wed,  6 Nov 2024 10:17:58 +0200
Message-Id: <20241106081826.1211088-4-claudiu.beznea.uj@bp.renesas.com>
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

There are some differences b/w 5L35023 and 5P35023 Versa3 clock
generator variants but the same driver could be used with minimal
adjustments. The identified differences are PLL2 Fvco, the clock sel
bit for SE2 clock and different default values for some registers.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 Documentation/devicetree/bindings/clock/renesas,5p35023.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml b/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
index 42b6f80613f3..162d38035188 100644
--- a/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
@@ -31,6 +31,7 @@ description: |
 properties:
   compatible:
     enum:
+      - renesas,5l35023
       - renesas,5p35023
 
   reg:
-- 
2.39.2

