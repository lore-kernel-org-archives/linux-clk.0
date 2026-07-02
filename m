Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DC5481A9E
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 12:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782995502; cv=none; b=B3RU8NAtYPyuvQXA41/28V9QQjPLK3gSYOw1I47nCDbZC0iknQtx36Xm8XKQ30ha5iecfyQ6R3m9tCzt4jNMmQ2+hJvFvh3FLF+4KM3JmOWTnYmprCzC04qDWxxbgkRQeKXIN6ZOpXcQz9Pa3a+FEhm+wVwI+QXBKVatPUq3WF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782995502; c=relaxed/simple;
	bh=L2A0GzKH9EPwF0QTXt3G5lEq4T6+Kmo+xZFk8aeRjsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qeLQ/jWYdzG+DGtYreUv/8bvKdPfSNlJOtaQLnRammUbHbC/Ves38x3F2YJApBLki0dpIQsgfKu5d8OTyyWLrykt60srYwSoj33LSySnUhH4SHvA6iHtO5GonLnhnDwZq+cIyHPMjzCf44GaKxEi7ho0V/SnWMtv2bQcpAtPk0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nl7zuOUD; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nl7zuOUD"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47362928f65so1723259f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 05:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782995492; x=1783600292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6muIoukBpYJpCaryUIHW0miALiF24vbZVpFhaej9tM=;
        b=Nl7zuOUDjVjahQ9dDysYVGddey8LPUUincNs70vHHLxrUhvAK/n0MxF1ookRgz+K4Y
         3XU1vwdPkM/ezoWGldoo2uNnM4nhugmAB2ZuRo8RzJor724W0XzmSwGenJdrjmwmSaPx
         5JQLy/QQV6YFlQfCcWhjzHAlNve0Xz6+xI+nz6hLhT4H8GTma5ojeP48OFBEs1/XGZro
         LTy0y1eaDfuBSghS3C0u0w1MRZp4fuX/vNmFunh7cAMNd+ost1CcwGyaslejC8CCEa9d
         zb2OGN2l6/9QB9pcuWg8aHfZ5le8j1xj+Vmeita+si9mPRyhEfic5RjOyvJKEMfCTlQQ
         EYHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782995492; x=1783600292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L6muIoukBpYJpCaryUIHW0miALiF24vbZVpFhaej9tM=;
        b=NzVTe/AIH2Tlm3TcESrg3nMh2yiZ2NpYrK/Jz9dNAw5+AMjZP2prErEOC5Emom4UcZ
         oq5Hd0o4aQCXwlngQORO0xkijtwSfJNpTMeASpxjBLSxRO502fVrchcMtMG9gYL5bN/M
         tuAc4GTMsBGBRs+7vKPmE3+Izoq8w88rt/rscagS7mcoOm0+j+qLjqFLVKWfWjPCb2dh
         iJXsQJGB5+TFDgtDRthrAur4Svg1hKdv/CVBnNayW05CGNm4UjPmx4HxAi1cl75Z693/
         mhQqfXdvjtLsXdyn8/5DWw+c0W2O6HNxCVzLyP6J0V6Gz4RYkijWIydYvKW+2NtkESEY
         UJIQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqz25Ad1I42FSCd3ND1Nh0DB7zTHtQ1G7aN2GOQIOH2CNM9io5ezv55ae/IcLUB+lI8bpMq4q1CjIk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0esjFmB61jXEiYYq/3BNf0fmf7sxM0TDIduTa0ec6FWsYJJOw
	XdKS1gcDN2c+XUemab+mxw6HpTK/DUYOrSBCzJakKonYx4wOUhaaCuJ7
X-Gm-Gg: AfdE7ckmFDxS5PH0ch8Osiq2utdk7+7BBOvo1g/jYcU5ABTq90n7mlh8Q2v01AiVx5e
	bycmhBgdl/Mw5d06PMPWDVsNEwlwxmcCYZfezFkoU90aHK9cxZUJvLPipNStRPfEt+mu1CSbFBZ
	1gkTYy1DVRFXxyEK9OtbHk4LPNvLHjJc25mZOibDSjcKOm6DFbMhAFluD0hOvnAj3VQCqYjScGh
	Z5GEd6LXZqZqHHNhMI9rvsy8Abv65bD3nTERBZVEFOoG0YzZPlzLD9V3srJxCMMEVo9aByCCcUO
	NwNOxNVsoEnrBd65i6V9wnzCSXreC8PljudHQT3tlkvyJGK7rjKs0pKOvLWKvCCdpjD71YwkAe9
	URIwQc2xYPZeaNSLawUaWA3E8qWlY9KcpZdTgHZ5D+p7CLblczxPRaMUp0xH8tcRFT2EYUlbrYO
	afmL3V2U0TCnwl4Gz8whlX+cFcrMexb9ON2ShGtphk0avUqoC1Lomu39XR3GL6svw0iUBnLvOt6
	yilW0P0MmL1kiiMJy5RsGgs0Eo=
X-Received: by 2002:a5d:518d:0:b0:46f:7d90:8128 with SMTP id ffacd0b85a97d-4775a2efbb4mr7323330f8f.14.1782995491590;
        Thu, 02 Jul 2026 05:31:31 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:7a4b:58b4:175e:8c2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477ddf0f433sm9772923f8f.32.2026.07.02.05.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:31:31 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH RFC v2 8/9] arm64: dts: renesas: r9a09g077: Use SYS syscon for WDTDCR access
Date: Thu,  2 Jul 2026 13:31:11 +0100
Message-ID: <20260702123112.161160-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The WDTDCR registers for wdt0-wdt5 reside in the second region of the
System Controller (SYS) block at 0x81290000, which is now managed by
the dedicated SYS driver and exposed via a unified syscon regmap
interface.

Replace the direct mapping of the individual WDTDCR registers with the
new "renesas,sys" phandle property pointing to the SYS syscon node.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No change.
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 6f4c1086afcd..27e0e278ab47 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -327,61 +327,61 @@ channel1 {
 
 		wdt0: watchdog@80082000 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80082000 0 0x400>,
-			      <0 0x81295100 0 0x04>;
+			reg = <0 0x80082000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sys = <&sys1 0>;
 			status = "disabled";
 		};
 
 		wdt1: watchdog@80082400 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80082400 0 0x400>,
-			      <0 0x81295104 0 0x04>;
+			reg = <0 0x80082400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sys = <&sys1 1>;
 			status = "disabled";
 		};
 
 		wdt2: watchdog@80082800 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80082800 0 0x400>,
-			      <0 0x81295108 0 0x04>;
+			reg = <0 0x80082800 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sys = <&sys1 2>;
 			status = "disabled";
 		};
 
 		wdt3: watchdog@80082c00 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80082c00 0 0x400>,
-			      <0 0x8129510c 0 0x04>;
+			reg = <0 0x80082c00 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sys = <&sys1 3>;
 			status = "disabled";
 		};
 
 		wdt4: watchdog@80083000 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80083000 0 0x400>,
-			      <0 0x81295110 0 0x04>;
+			reg = <0 0x80083000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sys = <&sys1 4>;
 			status = "disabled";
 		};
 
 		wdt5: watchdog@80083400 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80083400 0 0x400>,
-			      <0 0x81295114 0 0x04>;
+			reg = <0 0x80083400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sys = <&sys1 5>;
 			status = "disabled";
 		};
 
-- 
2.54.0

