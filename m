Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184AF1E7C13
	for <linux-clk@vger.kernel.org>; Wed, 30 Oct 2024 11:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730286113; cv=none; b=p/i9NYm/fkzvAoHB8JDjydmiuj0Z/SD5AYs4Qr3V1erbLzGssXaW0meNcaaNxiYCQs6fHnlVKKwjVecCWFkWxebw1HiljwVwUnb+D/ICpnbHngqFwDczckyQny5oOfqPx5sg5bMlDc9KohNdthUhDN2uN1igzqWoE886gm0aSkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730286113; c=relaxed/simple;
	bh=6xtMMXXDmhpyzfk9l5ztEozds8JDDcUbVhXj7fK5hCs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hq7CQyvYI5icKKjPKM+j49t3NyZuDjJo0LkfMoUvOHdhYXog00U0i7ti+qAMnQzWH/IVEXBCoAM+QV33WyPRlw1OlRrDFAfZ5M+7GWqzxF32o3/oGutW0lkghr/l306K0lcKe1HJAmhSP8P/WY99DM44ru2orvgqfYem+8Jido8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=YRVfF+Hi; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="YRVfF+Hi"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539e7e73740so5500481e87.3
        for <linux-clk@vger.kernel.org>; Wed, 30 Oct 2024 04:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730286109; x=1730890909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0RaA8Oq2TnPgWUFVlg85ZPuyptoCXBTMqrBfg+ChE0c=;
        b=YRVfF+Hi6Z3/PDT/xE0Phm/DZyL7RAzyRtfHEyOEXtf+jh9N10C+mTTZhnNk0t/1my
         1C6THXVhpJ7w/iMnJTe16oXnW8pcSzFuhmxM/on42bxrubxEcxPOlp6B4QL8AfcF5xYF
         4cxz3iPMjKitUeNrQrnmpfLuM36f4iWReroEETEr01LjKWROaPBOqt9IaRWITH8Cva1t
         1O+ur8MkDZ7+ESNHxu59Vz+YKlY3H0C56FcBlGlcrN2apGEkDK+P1ja38Hy/Ly6vUNj7
         C7PliKFJAqkCw3CPyVZ86eJ4gzsDQ1b5TartIv63kS7/uSMt60l7XxS3Mkl9CUu+C5is
         XMWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730286109; x=1730890909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0RaA8Oq2TnPgWUFVlg85ZPuyptoCXBTMqrBfg+ChE0c=;
        b=PLylmMmpNTNpdafQATOTYG7AUXVaa2GHgs4Ql16BebPbdxz98pW1PUQjavoFGJB1hJ
         nKRjQ1Ch9gCANPXWSWoUbytHrdrS1b/DDt8zzbzcyf1jGZKhyuWqRi7pBQ/WXiigKI8x
         f+34QlbbEj4qfNlQ9SambIgo7bgYzjDD2HfVHGyFSH8rV8fN6PzscNLKx+661ZMAuys9
         5yyMBlU+lstdzfzwzxNfHgiDvC83h9rKyk+nAsvnCxfVrIvQrkhl1YKIG8vFeEeJTVcH
         cpxCqivkQQKQFXgDrO8qA9gVz0KfTWCYg4/Qi68ItymLFLG1gmsQAW+Fl0VYCy6dTiJU
         R3RA==
X-Forwarded-Encrypted: i=1; AJvYcCX/sTTYvxVSG+XR8acLipaBNL3uN5h9SkeNHbtF4wukjvnyz8pVNIKL+nLeHfVIuKER03iOd884CcQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ2CbxdKqBX07BLerwTrwUEMJ7sLR4wW7yAR3+0iwSNbKGeBDY
	Wc+YEI+Lft2wYEa7CqkSkaaayVhUGt5ZMN/gfgld+Vrw6rZdtZ6amhJgaiyCXi4=
X-Google-Smtp-Source: AGHT+IGLcUn8UrUCFSXa2wdI7F5DblgU1h3Tlqu+CabGKPz2NXZLaP7HRpfptZfpKopeGY3o0sPrRg==
X-Received: by 2002:ac2:4c4b:0:b0:52f:ca2b:1d33 with SMTP id 2adb3069b0e04-53b7ece170dmr1555512e87.20.1730286108705;
        Wed, 30 Oct 2024 04:01:48 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd99edebsm17956935e9.45.2024.10.30.04.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 04:01:48 -0700 (PDT)
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
Subject: [PATCH v5 07/10] arm64: dts: renesas: r9a08g045: Add RTC node
Date: Wed, 30 Oct 2024 13:01:17 +0200
Message-Id: <20241030110120.332802-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
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

