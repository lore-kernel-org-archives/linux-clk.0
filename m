Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9EE1E0B99
	for <linux-clk@vger.kernel.org>; Wed,  6 Nov 2024 12:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730894505; cv=none; b=RmKNoy1mOcddhNWkTKkXaiAGvwnbHQMnadzMcuAfPHqeIAKv2rlF2VRxHP+T6Keh1Y0JpLl8T/94MJC/0mimcpsHZXNxHw9v6k+rDuBCZxlVjLJYUx2kyidd4spOVVQwLNf+vO5zFJtGnWUl9wHuHHMdgA1QUoIF1zCLqJ3/rCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730894505; c=relaxed/simple;
	bh=gkZYPsH/vb3WY/1lIzQ8Dj4FgRmceTUwrzbmFMLCPH8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mcixDfLkl5IQRIxmI/65u/RRpE952Szs3ceE/h0NVaU79EI8oE1Ul4GjC+AkPR+S5cxhzUCsYhdDH/gSXW4ZhFHKbwAfMCG/0Nwa9Fgxg2t3UHnhZ9pOJIhlJ3vsNkIvuPAiu8gO/JoNevbA8kjfGHIiiSW6UvnyeFVizHrn4hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=i6EBt7lA; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="i6EBt7lA"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c941623a5aso1445269a12.0
        for <linux-clk@vger.kernel.org>; Wed, 06 Nov 2024 04:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730894502; x=1731499302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DTk49kg3sxHgDomjJGsue14cSnQ2z3PLgvI6znyFaQc=;
        b=i6EBt7lACXMMBbi5Okt4M1bwae2aWgrwLVTy06xOgSmOUy9IPLmAnBayrwEkDz7ti+
         m6Fn8OOb3z+s/WlLSscFh7J+MTBG/WMmKA6DfzbxLJWXEO0l/wz9WgYTPEMt/WKvLkAp
         FTQGlkI5czhRl1iOb79WgJOkfxBifDQrpou8T9A6ZzSP/BXEz+iDrUxW9kwfdl2CV9Pt
         z5bRSYOAmfW65k55uRi1E69Ynv7lTyNioLIEkV8qq2IW4l8alEwuJ6a9dKRi566NwcB5
         pvgFikqFs81bbqezshEylIXnbDOkJotcTCSyaIuhZ8EMMRheyhxYLdA08Bo15wA5v7BD
         axbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730894502; x=1731499302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DTk49kg3sxHgDomjJGsue14cSnQ2z3PLgvI6znyFaQc=;
        b=UKE6JjQ5rNU35gYJFhr7mvOoKFfibep1EI4Q/fr1nD5J3lDT1BJhHYKPk/aM7DXQ4d
         OaUcoRCOIEK0w0Na7a653hKqFtc8zCunKwKC7YO8PxOx8Z7to0bc51wJi2YRXtmtbYJ+
         FAaLNxvzrf+NCWHJlRo1WBEn+y+/r07rQXhhmR6DZkd4tvPBethr8LAXoNabo6gMjVzN
         P8zvWl00W32DhUMOAWs06V2h34Jp1+hbpXAc7Js0tCQytjSImhtIHy6yfS732DelbyRg
         IE4WDpyCGD/xFVFpe79OO7q5jG4GsJsszTiX6SL50lX4ICbtOVt6ZTMD1GIsKD8f3cI7
         x1vg==
X-Forwarded-Encrypted: i=1; AJvYcCUNtuvloaba3Esyx1UBdLWNUocZDyexF2WneOFCvsOIlhtcmmnLyyLlT8gbhYGgIumsXNcALMuVCAw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0Lwng6g9Sf1Hsx/+5yTot8Pb4q3q8qLoWfu8sETh/TkXACmyC
	0aWVkJITgsrHWQb6N6R4T2/eHovz//kuCK2ooHdxwwLRQUmJPR4eqv1e6YY1aWU=
X-Google-Smtp-Source: AGHT+IGsGf47lgcF/WyQLx8YrH90sARYpGTUy3Y4l7vmameX6vDncBFwbLkpZsYyaEeHNlLQDhUJbQ==
X-Received: by 2002:a05:6402:5383:b0:5ce:c940:5182 with SMTP id 4fb4d7f45d1cf-5cef54d1a82mr2310638a12.11.1730894501685;
        Wed, 06 Nov 2024 04:01:41 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cee6afe528sm2697984a12.55.2024.11.06.04.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 04:01:41 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	p.zabel@pengutronix.de,
	lethal@linux-sh.org,
	g.liakhovetski@gmx.de,
	ysato@users.sourceforge.jp,
	ulrich.hecht+renesas@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 6/9] arm64: dts: renesas: rzg3s-smarc: Fix the debug serial alias
Date: Wed,  6 Nov 2024 14:01:15 +0200
Message-Id: <20241106120118.1719888-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241106120118.1719888-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241106120118.1719888-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The debug serial of the RZ/G3S is SCIF0 which is routed on the Renesas
RZ SMARC Carrier II board on the SER3_UART. Use serial3 alias for it for
better hardware description. Along with it, the chosen properties were
moved to the device tree corresponding to the RZ SMARC Carrier II board.

Fixes: adb4f0c5699c ("arm64: dts: renesas: Add initial support for RZ/G3S SMARC SoM")
Fixes: d1ae4200bb26 ("arm64: dts: renesas: Add initial device tree for RZ SMARC Carrier-II Board")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 5 -----
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi     | 7 ++++++-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 2ed01d391554..55c72c8a0735 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -43,11 +43,6 @@ aliases {
 #endif
 	};
 
-	chosen {
-		bootargs = "ignore_loglevel";
-		stdout-path = "serial0:115200n8";
-	};
-
 	memory@48000000 {
 		device_type = "memory";
 		/* First 128MB is reserved for secure area. */
diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index 4509151344c4..33b9873b225a 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -12,10 +12,15 @@
 / {
 	aliases {
 		i2c0 = &i2c0;
-		serial0 = &scif0;
+		serial3 = &scif0;
 		mmc1 = &sdhi1;
 	};
 
+	chosen {
+		bootargs = "ignore_loglevel";
+		stdout-path = "serial3:115200n8";
+	};
+
 	keys {
 		compatible = "gpio-keys";
 
-- 
2.39.2

