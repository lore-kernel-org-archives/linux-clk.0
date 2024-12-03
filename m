Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166F91EBA18
	for <linux-clk@vger.kernel.org>; Tue,  3 Dec 2024 11:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733224436; cv=none; b=C7gEB552v6aRR2l9H+tnKNfpsSMPSGqahXgvt9mZTi8j2cfYsAa4b93oOHp3c/KQknxfZGb7Iksw8+KbWlzEvbJax7fwwpqGeTuFxxLUnYbaPIkXkcfnO53omVqyJN/Yl0OS0v11ZyGVaUsyVh4Kijt1Wub7htjcKVrbeAKQEtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733224436; c=relaxed/simple;
	bh=0RWKxWCQeAUkrUJFrLhqBUBh6lxnKv7/MFVIEYtMO+U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M1kONliIpsUJEsR/4dvRDrGtqo+AVbrXdksrMGYwcE/iaJMYB5WRq29rRHr/YmLDljDrrZ4AdJXH9tPNkBZwgNv2BCUICaOATLa7zLziauM3kqS2AkQMut2ugYp9hDjNnOuFtZ4jcB0U1MelhCnjbmIKgGzwJTU6DyHNyuiKSCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Nx4o1wDE; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Nx4o1wDE"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385e27c75f4so2262434f8f.2
        for <linux-clk@vger.kernel.org>; Tue, 03 Dec 2024 03:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733224433; x=1733829233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i9XAExanV+siqAAbgBdWw0e9Y1JvqrWgK8obB5pD8Sk=;
        b=Nx4o1wDEcbhoSNmdPZiE7P7pEV4ju2GlNxz2KiS3SctIYgmE0C6CMSk3o1pCSsrj7m
         clZXwyFZTxyBUh3sxNU1E7V+mr9LakWIZhyXa6dH4TNtRBqmFk/WEsEaooBqKmg52Qv+
         63Zc0cZLAvGxTdRGpUHqYU0hsjpXHG3aMSmTdSzFhohpWjbMMU1tU7EiDi1u04sHQ49U
         OC99MbMon+jRgN1dZte3iW2Ij+Za1WToExy7gs/l74FxFCLnChd6sODFPuWR7OXuxyMC
         8fkfS7AfrwgNA5EeY9T4sreKlSzQd3VqsW/zArNHbIzNZ3Te2NUA3vvau/kgzHFhMLs3
         b7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733224433; x=1733829233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i9XAExanV+siqAAbgBdWw0e9Y1JvqrWgK8obB5pD8Sk=;
        b=MpJLYfsCzFK/9tBuvbQ+f8DXcLFwBNm1BeeMtl3XaUEc9Ak4xjhuc9UhyoMpigMBN4
         JwO1xUDycsX5VVQmeVKJpekc046ug32ywx4KyxJKsxSdhnDnq3cRF2qt1fplS6vMp/MB
         J2pzhciSI0qfDWDFrixaWlMeInXk25ifV/UC5x6IQEX337ti4gacSnIIQLiq+C66ohy7
         cpFkfj+G/o9SxOES9JNS71AksmVZfhLjRu6Ie+XLF0idK5FG3LaHSRGYYOnHG2x932lf
         GD0wtvWY28PR+wxlvHVvAdAM/POVWrFmJK+H05JivPXUrLUKu8hI/cp1jw9UflGOwFL2
         1zCw==
X-Forwarded-Encrypted: i=1; AJvYcCVN9ECtwFlWFCZjSTlZFHxJ7L67bZ+CVVOmLJDh8moQPPM1DbgCex2VBMUys93DvaIklfP0ON7O/Qc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZA1l1+CLAMMRd14n6lsjIJiNVAMMHq7EBzhdMBMwIz3cvpZON
	WOWMLRWDPH/jot4XINRr0ukoEJSnebyDqVmvyon/bmcOIo+79aQt137jqGbG6Gw=
X-Gm-Gg: ASbGncuS8MwIDY4p6zvjHZskkVkHT5zaGeDXd+TGxfEPCR6CLPMkCpr7+DH+15NlPIm
	i1cAbnXqcoDOQh/yDzcAuNU/uhIGQkNYQSpQhhwuC6yfCIayGpoffEtc+I5UNLZtf1pmJxf2/0s
	J5lN+d/HoSFkVkl2/nKwQXqElKZNnj5ytkTOFBkTHsezu2//pX7GqF7GjPWUmGHBq+Fh+WELXpJ
	xxBS34uQlaiVzCFxMwBO2AgYzA3lf16tntIm51//tF1Qi3R6cmLD6Kid/OGp4JuUPXe+BliY19U
	MA0P
X-Google-Smtp-Source: AGHT+IEKmVs+/nwio7D/PxwN9jwAmSI02uLtYHs9PSiGSHR3pj+ROWkZ8tyKGP6cC6ABLIzTcqNnGA==
X-Received: by 2002:a5d:6dae:0:b0:385:f560:7924 with SMTP id ffacd0b85a97d-385fd3c696dmr1336591f8f.4.1733224433588;
        Tue, 03 Dec 2024 03:13:53 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e0117069sm11794315f8f.60.2024.12.03.03.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 03:13:53 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: prabhakar.mahadev-lad.rj@bp.renesas.com,
	jic23@kernel.org,
	lars@metafoo.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 13/14] arm64: dts: renesas: r9a08g045: Add ADC node
Date: Tue,  3 Dec 2024 13:13:13 +0200
Message-Id: <20241203111314.2420473-14-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241203111314.2420473-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241203111314.2420473-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add the device tree node for the ADC IP available on the Renesas RZ/G3S
SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index be8a0a768c65..eb57a52d2086 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -87,6 +87,59 @@ rtc: rtc@1004ec00 {
 			status = "disabled";
 		};
 
+		adc: adc@10058000 {
+			compatible = "renesas,r9a08g045-adc";
+			reg = <0 0x10058000 0 0x400>;
+			interrupts = <GIC_SPI 312 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD R9A08G045_ADC_ADCLK>,
+				 <&cpg CPG_MOD R9A08G045_ADC_PCLK>;
+			clock-names = "adclk", "pclk";
+			resets = <&cpg R9A08G045_ADC_PRESETN>,
+				 <&cpg R9A08G045_ADC_ADRST_N>;
+			reset-names = "presetn", "adrst-n";
+			power-domains = <&cpg>;
+			#io-channel-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+
+			channel@0 {
+				reg = <0>;
+			};
+
+			channel@1 {
+				reg = <1>;
+			};
+
+			channel@2 {
+				reg = <2>;
+			};
+
+			channel@3 {
+				reg = <3>;
+			};
+
+			channel@4 {
+				reg = <4>;
+			};
+
+			channel@5 {
+				reg = <5>;
+			};
+
+			channel@6 {
+				reg = <6>;
+			};
+
+			channel@7 {
+				reg = <7>;
+			};
+
+			channel@8 {
+				reg = <8>;
+			};
+		};
+
 		vbattb: clock-controller@1005c000 {
 			compatible = "renesas,r9a08g045-vbattb";
 			reg = <0 0x1005c000 0 0x1000>;
-- 
2.39.2

