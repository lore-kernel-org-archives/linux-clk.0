Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4E819B5A7
	for <linux-clk@vger.kernel.org>; Fri,  1 Nov 2024 09:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730455074; cv=none; b=jbDkfIjwlVSwGYdQZCgiUYaKl0b34FF3HImq+LU4NDjEykpv4caaNI0IQ1UXL9/IQPSqC4rb3yhbBnjlaT9N7pn92grc3Cs5Y7cB89zGzveSr4v4mo/Hjf3z9iutz9wYNd8qe70wSCskkBegZ2lUB2FSLCsEZrg75KT0N4WiKcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730455074; c=relaxed/simple;
	bh=yYP16zEPx37dhW8+zaOISLjIJmbRtcBg1hLt5dlVY3E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ITjFX4c52TdXk/bu/hP8sfsycmcKSHTbqoL01Rlw6YZopv9/tyecAJs2zJGYgwwqHJOVDU6i6+D1phzsc8BHGTVKZib/vG0mwINem6KFZkvMUvoI0F3sEMClezY295AZH8WLp84veCjsWbGIphiKA2K1Uy4dzw0gQPh917E0F1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=IPfmRM/w; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="IPfmRM/w"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c948c41edeso2191919a12.1
        for <linux-clk@vger.kernel.org>; Fri, 01 Nov 2024 02:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730455071; x=1731059871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfW7W38u73oXDY58ExSVjQCRIYrMmZQTfpbBo08M7pQ=;
        b=IPfmRM/wztKMJUm8ACyqj3S6WT9GBWFyM/hsajp6AbUFzqhNIN19B1zb3MDDlrWVNG
         0BiagiavrNGcicUaNdAOMObAIe4Kw6ABB4Jzw5yjVIsut0uYaVBKD80E4fGRoDO3E+hN
         ZbkdFFcy43kwDVCjTxNmHdd1BE/4EE0NHxBQJXGGmtQRmozzO7q1J131KYDHiw90K30D
         zr7xsq5YUslit+4cIoyYa706URXy/zyJmaDntaNyV1Rhnee/dSoPWHBJP/9akFAS9kBw
         a4deFpwE+QXzaVT3aV3AybTqmRFtPSUYTW6G4zh664bjvwwxJZOlnlIWNq/ECrnjtdH8
         o6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730455071; x=1731059871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tfW7W38u73oXDY58ExSVjQCRIYrMmZQTfpbBo08M7pQ=;
        b=C5keNL8j4laQbVXMzvjXxfn+wJw8yaNNDD2R3LmZe+CLFOpf2dsGrk8IPP4gWVaLKR
         fRTLkQAxXrXIj+4YNyiZIoLGEMoAGkfZq0T9oMjtTxM0xlwUXCuphGT0PgjuEm8Fi/Zj
         SnQzs51ukZbPK8ZvuuBZEVrVboh31K00QghGig0p/QZvVczaUJM+NJR2xy8gSfqkn8gh
         8zXCTVuAB2Q+j7h0w+hXD+/hUEnlAL0O1nBSGrkuF6E75tcg8wVyjpAZezyAEJXsXNjD
         5y4M2nf3H0DolmXUPLcpQh+nuvg9oSWL2Ip5iJTI3q/grTnuWpg/aRK4pdYyffVCg7rg
         mVAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVN9JqxIMcUFjiZkBWS+5aipU7+mX5taQjcZDjTI8nMIgHwq/AoE3+mHbs+T8PKTlLe1bq1gAkDPGo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcbqEVUwPPELl96dyALXkiGcljjftLvLQYp0LRH1iBFUTVEpw8
	eeTtNKakxqdg2CZr2lAHpw1HFcYRMPwgoo9UVzvs5PaWDv1L2ZYRsR0oSiQf44g=
X-Google-Smtp-Source: AGHT+IFE0JHqlkVDmb2/TxlqXR6484r4+5y4byueSe80U+33dxBrQC5ZdYOn6F1eecNFW0u/e9w1Bw==
X-Received: by 2002:a17:907:97ce:b0:a9a:e91:68c5 with SMTP id a640c23a62f3a-a9e5093efccmr607271566b.33.1730455070606;
        Fri, 01 Nov 2024 02:57:50 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac7c8d87sm1364136a12.76.2024.11.01.02.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 02:57:50 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v6 6/9] arm64: dts: renesas: r9a08g045: Add RTC node
Date: Fri,  1 Nov 2024 11:57:17 +0200
Message-Id: <20241101095720.2247815-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add the DT node for the RTC IP available on the Renesas RZ/G3S SoC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v6:
- none

Changes in v5:
- collected tags

Changes in v4:
- dropped the assigned-clocks, assigned-clock-parents properties as they
  fit better on vbattb node
- moved the RTC close to serial node for ordering

Changes in v3:
- added CPG clock, power domain, reset
- and assigned-clocks, assigned-clock-parents to configure the
  VBATTCLK
- included dt-bindings/clock/r9a08g045-vbattb.h

Changes in v2:
- updated compatibles


 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index a1d5084b074a..be8a0a768c65 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/r9a08g045-cpg.h>
+#include <dt-bindings/clock/renesas,r9a08g045-vbattb.h>
 
 / {
 	compatible = "renesas,r9a08g045";
@@ -72,6 +73,20 @@ scif0: serial@1004b800 {
 			status = "disabled";
 		};
 
+		rtc: rtc@1004ec00 {
+			compatible = "renesas,r9a08g045-rtca3", "renesas,rz-rtca3";
+			reg = <0 0x1004ec00 0 0x400>;
+			interrupts = <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "alarm", "period", "carry";
+			clocks = <&cpg CPG_MOD R9A08G045_VBAT_BCLK>, <&vbattb VBATTB_VBATTCLK>;
+			clock-names = "bus", "counter";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G045_VBAT_BRESETN>;
+			status = "disabled";
+		};
+
 		vbattb: clock-controller@1005c000 {
 			compatible = "renesas,r9a08g045-vbattb";
 			reg = <0 0x1005c000 0 0x1000>;
-- 
2.39.2

