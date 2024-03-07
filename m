Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612C312EBE5
	for <linux-clk@vger.kernel.org>; Thu,  7 Mar 2024 14:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709820473; cv=none; b=KJvqcjALqJFGm374xIfr0nUpWztUbnbbPPrEalGCGIjRFtrYGkPOsAWaNhleCnWGtbEvTs9AGFXAQgwXCBxNXDesyTdWHbUNgB/QK4u1EqFXRW41fr2JLKL3muzlvxLpsCwzumB58yE1mCnePaFmk0s5lmcSzKehUTqzo4H02LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709820473; c=relaxed/simple;
	bh=XwJePHR8JwAlM46pqy20irY3849tfnaYAJPxlYfkslU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Kbujp2569QXc80bYPtuhbs6BQOi6dqxHYwjPAnmuQvIQd33PNO0+iT++E0U8Si+XbhiVfBHKxkvagizhCDhovddWsGk5OHYpTgBKvhRwwkTlfyXI/P0R23TsM/VIwUKfbowCqyIudIinNkTLsgJeX0qy0JoqQ+rTobHlAS60XEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ZEPoQr9I; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ZEPoQr9I"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a2f22bfb4e6so153876266b.0
        for <linux-clk@vger.kernel.org>; Thu, 07 Mar 2024 06:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1709820470; x=1710425270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B3CLBaLmfGzBk9sYN2coRPBc2x0uVbMYMLbwW+J65ZE=;
        b=ZEPoQr9IGxV+X8SiFgRIA72A9RoqSxqAukvzTb5bhTJuEj1tC9OODVQLNIjoDtIJmr
         TVDoyi3bBqJBuPr8ZMOcsFaTjTuNDAACJ3XKgBVn8XD437OfWPoAcfbue43/0xri6+lM
         cKVfxDn9u6A97UIIsItF4tGpJVEe4w+FlHlrDCNIsWIvdtwHaPmVBDlF44xG1pq7Ii2Q
         jmPgN1N62cUX2bjqZZBIRn2kIBwsRJA/pqm3qsvjv5FAtjWByxhOcvy/9hXXp1pxwMlB
         N7Jgwbabs18SFo5gn5/mVBWOG+0rVdk1vs5cTZ7kgnhc/lZ0764+erEBVnQc4DMyzwWM
         oB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709820470; x=1710425270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B3CLBaLmfGzBk9sYN2coRPBc2x0uVbMYMLbwW+J65ZE=;
        b=fXr3WXADsOi62xl8FLVcIGoq0PreF8fK3RbREBJ8YGISGl9j3F05lr29yYJ4IGuTbO
         Tt7FUX2IUi5wwjl6D5A/SW9dUltUgcrNHmnOUUTiBTxeTqLCcSdz7bOwMbNS7H9kq9yS
         ueViuwBWqqELIruvkbu6GFn/uVvT4w1lx3Y9LeL5qr+LiKBSkHl3xStQ6A574ENW4SGF
         lL7FVhSGOYb80aFyzUcW8oqNt6WPS8LuXuxP1bTyhDnlEr+b5NmcX7DKsK8J56YhEz+8
         eRObzGnKPwhd49jxAhmGipF9THWE6Z2D5C61ThFkXvwKJosiwSUhvByba2lvczty+0HE
         Wj1g==
X-Forwarded-Encrypted: i=1; AJvYcCXB8vEWsWJPs46wGFzhc0KuZ12MW9JQbcCH35rA7AOGgbv4QYGdTR3NHEqZg1Be2G1/L6O7/ihhBcs3Fw31zh7dplXje8J/MAIz
X-Gm-Message-State: AOJu0YxVMdYTy6z4rMtqKRsr+o4XBn7XmgzNkYzciBPClMMUMeQQU0j+
	+E6RqYWXiG2jg0g4SbmbO6/gkT68MuWIr4IKMFlBTPTzGcHM3XiOCYB/EISzRk0=
X-Google-Smtp-Source: AGHT+IGatn/XfS6VmNx5vTLwO1xoHqWIlZ0V06r/HAylNfXwQY9U+fAaiRRmKabEpEgvfWd+vnD2vQ==
X-Received: by 2002:a17:906:3846:b0:a3d:ed30:11c8 with SMTP id w6-20020a170906384600b00a3ded3011c8mr12781367ejc.15.1709820469848;
        Thu, 07 Mar 2024 06:07:49 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.38])
        by smtp.gmail.com with ESMTPSA id v23-20020a1709067d9700b00a42ee62b634sm8200648ejo.106.2024.03.07.06.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 06:07:49 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 03/10] dt-bindings: clock: r9a07g054-cpg: Add power domain IDs
Date: Thu,  7 Mar 2024 16:07:21 +0200
Message-Id: <20240307140728.190184-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240307140728.190184-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240307140728.190184-1-claudiu.beznea.uj@bp.renesas.com>
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

Changes in v2:
- collected tag

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

