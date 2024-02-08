Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403E476408
	for <linux-clk@vger.kernel.org>; Thu,  8 Feb 2024 12:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707396233; cv=none; b=H0QTuzR7/avymhbjsa74IpV9L0dX025JFxs3CVa/BV13Px21p0/khT/HDQ2OHeVBV/2ffAf5hMsIUNYGuSEbCoWFO9eZ6ksjedcXij3qIHGn43/+0sb+hr8zhxijJ6rwBJBauBT3K/v0DMsYYbH3gVwCdoM0iyTUJxnwS9Wykpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707396233; c=relaxed/simple;
	bh=AyaaNH9yUH5TOfV/Vf9mtFGfTApVsa4nreCNtA8vcKI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Jr0Pz1u1nYdUrNKTPBEME2hlV8sFIN5bW7ckjCLUe+J+8y48XkOyo2j/Io8gNHAi9VrcUmJZgAsLBMaaNVB+PNMm0uSBigDkPx/rt6C1KFxz3X8Kuzbtz75GSIGgqiGF8dkmR2Gyn91cd30hTVjEH+/jEo3emF4qC0NR63DYsFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=L4298ZVn; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="L4298ZVn"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40fdc63f4feso16583355e9.3
        for <linux-clk@vger.kernel.org>; Thu, 08 Feb 2024 04:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707396229; x=1708001029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+fOhTxwLR2CTPTSVgD2JffQTM0OmlAEFcQjojvDRSHE=;
        b=L4298ZVn4rNJPetgx86TJYdMUXeOsiDuLAb3OaqGeswyIm8ZXesrHmNNfLNvbbIrCm
         D1HUK82E2UzFjtMEPIjNo3pn5RcmMj57Z34MkLJXndwnn6g2f0olxnC6tW3PTijN2dzO
         +cB620MUXMRdKzZ2YzDHoozYPqABI35VaTWUAA7rXzeawCe9eeKsw+G347F6n0nD7/iO
         pA50z/bw6P68O10n7PCrBiyZ+PokCbFGZnrPFnhtMcodAnTrPk8JdUu46ohRgoGVD6XN
         eT1h5vDGxKKo7xgsgcSzJqgw5XIjbfYdSzZpd6Gl6INgwqR4exCP8yUFrDiPDYapxk60
         fZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707396229; x=1708001029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+fOhTxwLR2CTPTSVgD2JffQTM0OmlAEFcQjojvDRSHE=;
        b=gNGUDuFBnV0fTK7hDnt1082/keYHgQGUtak/+PcKl0xE4n9KOwwv8j8/uIY6Mvjdib
         RM6MRq9fID1DKIG3F6gUehBD2EeElfCjEFV1uN8sico5DI+8GIWS9H1kzvRWaGkEo8iy
         qIu7APeWqER0qdPcSCTTINfc/FoWozvp8V1jvYBUcRIWJpKXNXmkIvwefbBPRfJALeax
         gsNvbN23CKL9d7moucsHbSMl6Ih5dz0ruQNENAKfszrS7T86SZnm4sHvGxfGTmaAT32h
         DvCXIwJe8Hxh8Ww0u844Z+q+8MUfbObLPCqARmPiHZIvMRaQ61IK4WRzXXbVDdzm798b
         tvWA==
X-Gm-Message-State: AOJu0YxUJVhW49JiA258FZKnE8C+YerRqecTkDQ1LFj7928s5Hob6Sgt
	OtqtnAdQwVX2GKpJLx6Uc3epgkjhZ7VGNAUjZ8m29dhhGuyNBuIjHHX3xi6nzEg=
X-Google-Smtp-Source: AGHT+IGZ/OcDn9XPGfMMCWWCJdAhmDANv8WANS2E3UnxPczVABByOOstT6S9Z6KhZwZJ2T+fQBSfSQ==
X-Received: by 2002:a05:600c:548f:b0:40f:dcfa:49eb with SMTP id iv15-20020a05600c548f00b0040fdcfa49ebmr7243377wmb.38.1707396229587;
        Thu, 08 Feb 2024 04:43:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUBGegHiGd58BcX1RZ1tU2XrzC4XJ2uIY56GpOH5CUKNnLUQ32L1rzWwPkYY1gRkvK9QOZlvuLRzSwUwfoOtxf3Yn/CGM5hrvd+/mlPXAWQB+uYAjQJf7GdRedlZS51D8gwnJmiPMyRAvORjBw6l0GaTn2Acb+jKzY9hK9ytAm37t3EkZZJ7huTI+mFTZv8dgfclwL3dnOEfVydrTyDo4ogdUWpaxKujw18RtsDAH7vyReJbGYbGgds+w/e3EZoLFYGD9voFY1qdM3V7736ARiEtIKRWUwBqUvjD8bjXLIOjtBlfPOwVoNXvgszzeIYSfVQnHdDQ8CI48DICoefkYbeJUES2qdexQqIG6+YpeBB2bEIqkU/j2Jb9BErQyE5oxRbXEYa2yjYbJLgtm70UJ3FXn76E64liZPIV0HEs+/W61fZRiCuLS5fvxuEno6bjXAOD+dIyy7wPvcuV53AlXBLAGfAwCFbibz0cHn7o/XRnoJBO+EXNTZmAPNLguOFRmZ+X54ZI4/Svre1rJWyymuxZseki5Z3e7P1w2pOVC6jqRuYyJggIMlUZHmYfO793sc=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.45])
        by smtp.gmail.com with ESMTPSA id o13-20020a05600c4fcd00b0041047382b76sm790244wmq.37.2024.02.08.04.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 04:43:49 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 03/17] dt-bindings: clock: r9a07g054-cpg: Add power domain IDs
Date: Thu,  8 Feb 2024 14:42:46 +0200
Message-Id: <20240208124300.2740313-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add power domain IDs for RZ/V2L (R9A07G054) SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 include/dt-bindings/clock/r9a07g054-cpg.h | 58 +++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/include/dt-bindings/clock/r9a07g054-cpg.h b/include/dt-bindings/clock/r9a07g054-cpg.h
index 43f4dbda872c..2c99f89397c4 100644
--- a/include/dt-bindings/clock/r9a07g054-cpg.h
+++ b/include/dt-bindings/clock/r9a07g054-cpg.h
@@ -226,4 +226,62 @@
 #define R9A07G054_TSU_PRESETN		83
 #define R9A07G054_STPAI_ARESETN		84
 
+/* Power domain IDs. */
+#define R9A07G054_PD_ALWAYS_ON		0
+#define R9A07G054_PD_GIC		1
+#define R9A07G054_PD_IA55		2
+#define R9A07G054_PD_MHU		3
+#define R9A07G054_PD_CORESIGHT		4
+#define R9A07G054_PD_SYC		5
+#define R9A07G054_PD_DMAC		6
+#define R9A07G054_PD_GTM0		7
+#define R9A07G054_PD_GTM1		8
+#define R9A07G054_PD_GTM2		9
+#define R9A07G054_PD_MTU		10
+#define R9A07G054_PD_POE3		11
+#define R9A07G054_PD_GPT		12
+#define R9A07G054_PD_POEGA		13
+#define R9A07G054_PD_POEGB		14
+#define R9A07G054_PD_POEGC		15
+#define R9A07G054_PD_POEGD		16
+#define R9A07G054_PD_WDT0		17
+#define R9A07G054_PD_WDT1		18
+#define R9A07G054_PD_SPI		19
+#define R9A07G054_PD_SDHI0		20
+#define R9A07G054_PD_SDHI1		21
+#define R9A07G054_PD_3DGE		22
+#define R9A07G054_PD_ISU		23
+#define R9A07G054_PD_VCPL4		24
+#define R9A07G054_PD_CRU		25
+#define R9A07G054_PD_MIPI_DSI		26
+#define R9A07G054_PD_LCDC		27
+#define R9A07G054_PD_SSI0		28
+#define R9A07G054_PD_SSI1		29
+#define R9A07G054_PD_SSI2		30
+#define R9A07G054_PD_SSI3		31
+#define R9A07G054_PD_SRC		32
+#define R9A07G054_PD_USB0		33
+#define R9A07G054_PD_USB1		34
+#define R9A07G054_PD_USB_PHY		35
+#define R9A07G054_PD_ETHER0		36
+#define R9A07G054_PD_ETHER1		37
+#define R9A07G054_PD_I2C0		38
+#define R9A07G054_PD_I2C1		39
+#define R9A07G054_PD_I2C2		40
+#define R9A07G054_PD_I2C3		41
+#define R9A07G054_PD_SCIF0		42
+#define R9A07G054_PD_SCIF1		43
+#define R9A07G054_PD_SCIF2		44
+#define R9A07G054_PD_SCIF3		45
+#define R9A07G054_PD_SCIF4		46
+#define R9A07G054_PD_SCI0		47
+#define R9A07G054_PD_SCI1		48
+#define R9A07G054_PD_IRDA		49
+#define R9A07G054_PD_RSPI0		50
+#define R9A07G054_PD_RSPI1		51
+#define R9A07G054_PD_RSPI2		52
+#define R9A07G054_PD_CANFD		53
+#define R9A07G054_PD_ADC		54
+#define R9A07G054_PD_TSU		55
+
 #endif /* __DT_BINDINGS_CLOCK_R9A07G054_CPG_H__ */
-- 
2.39.2

