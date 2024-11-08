Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8FB1F890B
	for <linux-clk@vger.kernel.org>; Fri,  8 Nov 2024 10:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731063080; cv=none; b=GJh6aOqdlwI6WOdKJ2kYkqXuhbztzRgnCz7cBWoNVo9CGid/e5n8uCop0Z9AvUT/rfVq9UvdP1B57u4RBElWhnmIe7e0wy50mziU7PF2vDgU71Us34UikyO0u9sXd5gAiju1ffhjXyl6qvwR/cD2NeUKDGIjTQff8A9bX89SM20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731063080; c=relaxed/simple;
	bh=FwNBb8PJKDitrkt9zMvuYiryGV3LO5HO7z0/y1frDmk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jyqqSI/QCX+FLpfvXWLvi8VhYlC1LUvBjI7EPcDtHGsIGPCV+69KLX1smQ93WgYX35/ugE8YKgkH4AhfJGUHPAncSCKZG9ZuYL31HwGH357u2Q1cnc/YwAz1oxqXwd8o9e9monqZTNrc9H1dhqt/oFaXjiAPYiab72KvRtwepQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=L4No0hir; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="L4No0hir"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a99e3b3a411so522327566b.0
        for <linux-clk@vger.kernel.org>; Fri, 08 Nov 2024 02:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731063076; x=1731667876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Yv9S6ASNoJOmHUs/658HSVVjNOTRq4qk+h2A23x1rM=;
        b=L4No0hirQsa0zWYexQpA4aEGhpsFi9xkR5Ds9DbAAfqRnqtl1h3tR1vflk16FPLZra
         DLexmGk2PSxNQCrfFtJ1n8OPTl7POoT0kbhcrX/XT/xN63zbNBtG9fmy4jJARTQoEQqg
         hOQJlJMWdWfhYLcfSIZ7Yg5D1StHa7fQkr1T258iuP4VQpE/yZkxRLMiKsCF1ZUWoUSs
         epQDTinBxJ9zHXIJQJpGJbnq3mHUVx3uQ9xBT/Yfdb/7brzHZyGBiosZHU6pb7FHfs8m
         NhzXHV9RlpWi1rKATds1xz0zkezuhyTCoM8xJHUCLYlLoBBVDccv8/U/8PyaYZnk9RWQ
         LCOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731063076; x=1731667876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Yv9S6ASNoJOmHUs/658HSVVjNOTRq4qk+h2A23x1rM=;
        b=sYi56pBjBZ8/A8TFhIFFZsmrenEXJ1/kVKynwBgLGRuoyPZh4Z88Neo1fs01B+G/WZ
         O1j6jWtVHWxmXJ3vWt8d4/I80KMvvnMIhHpqsgcRtGHqk1jc6HQvBCnD4dKedJbfv3sv
         +jUZ4nJcXufvesgW5x1mbblRvPu/Hb3MnE6jsG5Yg/nJJAFyMEczN+StXzTwIeVFHqnw
         USzGOUyfyg72cAErics4agIIEaYItglfH+PLbSH1HWgpXTuU1pkoAr4M+RaSOx9xSR4I
         qZIqnGE40b2pboqG3rLJbG0oEu0gYiohSdcFaryq+/hsnvz9gnzYlGg76teMjZbU+xKt
         H04w==
X-Forwarded-Encrypted: i=1; AJvYcCUwFksRH/q8GbrqKmI0xJB57Jj1rKPFIsmPNvJ/PWFWjUjTk4lPyEO94a5It1tXno5TztFdBiMJNWQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQVs3kR63K6IVvjpwaKh2dBvV1NC1P6H9ctfS2qIVtGvFelevB
	N5uzLTZ2qnxoEl+8qhqiWiAYB+rliTDtLne85JAkSlK2zEglBNik/ke86G3tggs=
X-Google-Smtp-Source: AGHT+IFuBqaKmSlpAgIXdyExoaT/W1PzCgtdHUGxj4xhW8TXs0GWnsMiDurm3/upr/LpAR0vUHYMIw==
X-Received: by 2002:a17:907:3188:b0:a9e:c4df:e3c9 with SMTP id a640c23a62f3a-a9eeff97fcemr219403566b.24.1731063076495;
        Fri, 08 Nov 2024 02:51:16 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0dc574dsm220464866b.101.2024.11.08.02.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:51:15 -0800 (PST)
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
Subject: [PATCH v2 25/25] arm64: dts: renesas: rzg3s-smarc: Add sound card
Date: Fri,  8 Nov 2024 12:49:58 +0200
Message-Id: <20241108104958.2931943-26-claudiu.beznea.uj@bp.renesas.com>
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

Add sound card with SSI3 as CPU DAI and DA7212 as codec DAI.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

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

