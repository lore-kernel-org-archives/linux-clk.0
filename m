Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7074B5D6
	for <linux-clk@vger.kernel.org>; Mon, 22 Jan 2024 11:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705921917; cv=none; b=HIyXKNu3zr8EndffB/vZCSjMOONJJ+qSyHb6V1cNtXWVfdPZQ+YHRgSjgBk3ojTcMScn7avQNJtCdqCRBaMKjR4SPDt0xuvbxHAQerYed9QBwc6tc/52MKNmQL56FGpn3wWdVKErintsmuT9meAGz9rh+679KCeUrNBBdllo9Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705921917; c=relaxed/simple;
	bh=qazOWi0/wkt4tNXD2u9ZsGRjtDApxIhQD3uVv18+fTs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qk2LY6Y6yWFFngW+fSstAjgK/a0JGzLpscRhuwHiMK9NyytXNmPPgKz+OMnfhsp60DCw5XbDC3wxfIVWAoCl/8Jq70s73XZl6Vrh3fwKivnTPrFOYRCDh38Ah1NQC7tCeio8EovY/FJXq6nvu3wlmHRQTAfwlN2cRThrBYMmCec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=TzVucT57; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="TzVucT57"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-55a90b2b554so1605477a12.1
        for <linux-clk@vger.kernel.org>; Mon, 22 Jan 2024 03:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1705921913; x=1706526713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/yq0en0upSEiAFhoOCAc7XTDKkkXSUYjmotseXuMY0=;
        b=TzVucT57GuzCZ/o9Mqn7+j8sbMO9dejDsUv5xMCdHDZAEednUbWTQEG8P0uwz+gHCH
         tdtOCUqkZzs7egq1iz/eFt/YEXU7YOJbwmezrg/q9P5iQlqq7pdqhdgrj2JTJWT6fhTq
         PFpoOW7o7fJaSZaE3TXTM2bYRJUT8E69dC+yKSNCJtENxLju0X0WTcws/S5bDKHYxD2m
         80Z41aBIJJXeRaj1uiVcooCeZl7ju4OgJsBCEh8rCKKlRknoVTGIAkEbmD+ypbAjDRfu
         NW7pZtX/3OKk1L+BJ5J4GGJVBlFsPL7rPEwa5RFghIq4AfsrFvvmKjEhdBHhDAgHhfcW
         974Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705921913; x=1706526713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1/yq0en0upSEiAFhoOCAc7XTDKkkXSUYjmotseXuMY0=;
        b=xUIK94W2eRjfGhbV3Ge/X2QUWjjNXdC+/E7iOKPo88ygUEcUDpJZcapn4wXJgdSnhO
         jAR4RSVnHmqdmlqZtpAB4xykMbJPkMAhpMY844dVMkXEe7kVxaJih/l77nrWQ2Feo97N
         kXudnnJGyuwMz8m27TmZukUT4k95hO1cBW85PgWoDbRcJXvxvjKIjWN43+NqDUmKR2em
         s9SYrW4e9EMpx6nPLSV5al3agL4LoDGOWIDNUtcXmY3ZnEYULCA3Z/VbpCVkU3FdnJCo
         Apo6a3lxFPuqDn3K5FyhXgJYwuhtNakp/2PxmXk2zKdoS+A9GrgkfkydN6VJUB/8QYq1
         X0Qw==
X-Gm-Message-State: AOJu0YxW6NAePZcAeEGLgXfm8SoPKRuyFyCVxkequzYyIJd5+ZdXn5uH
	/4wog/qJ3PAThCb1CQgz1oohCXRU4dazFOeFgTvbqBRXaoPfY+ZknSIiO82iZwI=
X-Google-Smtp-Source: AGHT+IFrorgV8xW2A5dJ9RhzKCiKxJHzvqYy39TZW4Gdx74LkKiO1Q8pZsRwPvYENyXdxM0Y7A7ntg==
X-Received: by 2002:a50:9e8e:0:b0:55a:64ed:e34b with SMTP id a14-20020a509e8e000000b0055a64ede34bmr2002822edf.39.1705921913726;
        Mon, 22 Jan 2024 03:11:53 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.135])
        by smtp.gmail.com with ESMTPSA id t34-20020a056402242200b0055823c2ae17sm14194241eda.64.2024.01.22.03.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 03:11:53 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 09/10] arm64: dts: renesas: r9a08g045: Add watchdog node
Date: Mon, 22 Jan 2024 13:11:14 +0200
Message-Id: <20240122111115.2861835-10-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240122111115.2861835-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240122111115.2861835-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add the DT node for the watchdog IP accessible by Cortex-A of RZ/G3S
SoC (R9108G045).

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 02fd68b06eea..19bbcae01d80 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -269,6 +269,20 @@ gic: interrupt-controller@12400000 {
 			      <0x0 0x12440000 0 0x60000>;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
+
+		wdt0: watchdog@12800800 {
+			compatible = "renesas,r9a08g045-wdt", "renesas,rzg2l-wdt";
+			reg = <0 0x12800800 0 0x400>;
+			clocks = <&cpg CPG_MOD R9A08G045_WDT0_PCLK>,
+				 <&cpg CPG_MOD R9A08G045_WDT0_CLK>;
+			clock-names = "pclk", "oscclk";
+			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "wdt", "perrout";
+			resets = <&cpg R9A08G045_WDT0_PRESETN>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
 	};
 
 	timer {
-- 
2.39.2

