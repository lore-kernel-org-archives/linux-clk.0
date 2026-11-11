Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395246;
	b=qgFJBduklzhi4adoH4Ke2+yG03J+CYpRZwmQDZscJ8CJ7PyhdcHx2Fxppa5tJICq2XkI
	 1Z23eudIjQCJ07eaRnErdM6bRHNAgHVvCBAojIwMjq0wi3UnYcZOH4J/VExt+7mHvkd7d
	 sHskNJHYHZvlAVT4mC6xkKFMeSaVeu3+UOetODzEPLsa7FAMrtuD+oRwJt7qqWpu4Fdya
	 nPMq3NcRDssZH67RBU9YVW/H2VspYGkoEh+DF2ZuZoUgHBDMZj4FzwiALfl+4i/gvJc4o
	 eDu2tHWOS/0zi8QBSWaa43cZ+9Mgrp0eMVdqGDddWKvOQz2KZDxz/A2VPPvUD570ZLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=1DKdyJESssw+eqxRBb106Pb/gP3e4B2hJY3u/Tbu8Oo=;
	b=xenvZEuJ5mPV92ciZXsgMgU5zLwMVJZ+ffInhtIUYJYepY95UayfAT0aZsIooeZVFeEf
	 5FnubS4myla8XsyHuCPs13uo3jxHYMBw3r0CAnfCJyDzIbAD3hZZf3nYjwOrLZ7eIR0jA
	 i8lfiOR0SIIXeffNpDiUvqO3Gg2qOj/SL1A8fGSkfNidLWSJP+TAw8Iymi1mWfQJcS9m5
	 0jwigAVkpZZB/3jbj93ghIVCSLjBUb/T2dtDrHC8p7dDYjTuxgHh8oRdXXAL8WqaC0c3P
	 W1cxEMA/zv0y232HJzDOklSU9rSeWt0PSRZrtjNcBX0PU9fFtDkMPOAYS7Bkdf9JTvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hZbazZ2x;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7792B606A897
	for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 11:07:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7792B606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hZbazZ2x
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so38583785e9.3
        for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 03:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794395244; x=1795000044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1DKdyJESssw+eqxRBb106Pb/gP3e4B2hJY3u/Tbu8Oo=;
        b=hZbazZ2xx1xzRrcV2f+dFJ2skZ2Lu5V8v37Yd3xAvwy6+zV3qt9jdA3Y51aNt8JDqm
         GB3STnUMinZtNkXoIyPF8xoVeX97EPsffn4uNE82NmBLDRD4aP5P0ZdqCIqzlJ/po07W
         JI0EJTonArtRGK/2hss6Oy5v4S0jOZfaQG4TF/mDN/CFY0IUR5kvAJU1SzPUgqgyhOSt
         1AlzMu2GjwleFEAw7pmj/Gs27zS2/hbN0O1lLNWiU90tiL2wehYxPCWopVqPLPevXmeX
         pTkEmOetKS3TYYcbXr+IiLbI5czzgttJSokxjR9OeQetqaDWVkpM82qBMB7cbSQi4Rof
         jAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395244; x=1795000044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1DKdyJESssw+eqxRBb106Pb/gP3e4B2hJY3u/Tbu8Oo=;
        b=pKfusofXo4pCSUOiMrfxAjjeQLg4hlbp0ZfAcVoHbwvtx2FSYSY2YORLJPNborjJNU
         t2FzAB5mZYZ9TZ97ywkFEZaIeMuEqV5148UFRxRCk9wm82JEiEzvMvfHeSUcCF/8g7uz
         PaBzYu6BLyAza4kCIctgp83mMFw5RLU+kqeRz3qCileZg28twi/ws+s05kr9fF7Fo1Yw
         rnHgRumtAaaqv+cE0DwERV0c2dda+jAUQQa5pjRWLTyM/jKTvyyZU58DcTbC5469IFSp
         XJdd3SMiIk3ByJxxU1s2Te9nTulDGcU8lECYErtut2Y2w44JCGnxIrlzLIk2AqJRGdlJ
         KLCg==
X-Forwarded-Encrypted: i=1; AL+hErHyPSFQJG7WJU5uSvmCuZhiiKvcLgiRyn/OrmJbqVGKlg5pmoBQ53cZ8sJUQkCbM082qPyi05FAy1w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pLTuc9Hr4BfbAxAeHS59sTFyiwpZv1BSrglY2dLApcmYu+K0h
	5kheBa9Mf1V/C+7SZbmOqFTym10qk/CbUxTL4AAh+Z9u4a3TjLgR2rL8
X-Gm-Gg: AYBFou1xMnKia6H5p1yuvDkEQEdPCWdRrWEvKbe5IR/h9fSFjTVsh+7xuGwFlVaP3MR
	NgF/MLm0IlNVcQXseJQVifzTxCHN6dmO45IB9h7P5Ju56BjFL98AqxjQ8RcGf8LuXTOmouYZxNe
	JTGT3Qfo41ecPoplXyC+jHyetZHt1eD0kfq6ntKCi8bpWVu+c8yki4y5QXj1fyKjTBvAvmC4uoF
	gJIsehxZyGD8d1XMGyPszLRAib9+DSrVvHO/xGyj8CUp3xiZQ+T/cEi/wrpntgHMKq3G9pLDGWM
	+jxr+7y6Z7MqDG5xfYsd97kRE5aQXDx9Q65cz6ADJ7ZnF5yuvywVS/JP+t6uqq766qAWGH3FoCJ
	rrIJ3b7GhZdlQpsGzBBclM4NLiTWfmKZfrzyigMRjfuUlP3lGpu0UnZZplCkt/YVPB4jOu1PGFt
	kYpUwJ/fvf1EBXe/8AQSiDgNFaUgNIC/DuzkrCuNwUCJdJhL4xau2eg8UXq+vsOyl68BqbKz/nj
	PaDyH5AJcFE0q0goIh8U9DC8SIim8cKpHha5o93UwMyut7LJwmQs9BYV8LTVkKeMUdPOYwIEwme
	QYalQUvisGu1llQsimDYo1CuVdYR8P7VA9gyCTst7O5/SgsTtkEocQOKKKhOVYW0OCHStRlFEo5
	dQfxTanQl2PkUhi7vxkeGj9Cs1hfsMAfBXITm6HbY4MUxiY6sqyI3AQ/L5AyPf/wNfMGogxsF4t
	IxyX774Oy5
X-Received: by 2002:a05:600c:1986:b0:4a1:fa21:fd90 with SMTP id 5b1f17b1804b1-4ba09377221mr34575625e9.9.1794395243848;
        Wed, 11 Nov 2026 03:07:23 -0800 (PST)
Received: from iku.example.org ([2a00:23c8:254f:fd01:783d:786e:fe55:f40d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0203a6b0sm146727295e9.5.2026.11.11.03.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:07:23 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v9 3/4] arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR access
Date: Wed, 11 Nov 2026 11:06:59 +0000
Message-ID: <20261111110700.3331225-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261111110700.3331225-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261111110700.3331225-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The WDTDCR registers for wdt0-wdt5 reside in the second register region of
the CPG/MSSR block. This multi-function block is now exposed via a unified
syscon regmap interface.

Replace the direct mapping of the individual WDTDCR registers with the
new "renesas,sysc" phandle property pointing to the CPG/MSSR block syscon
node.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v8->v9
- No change

v7->v8:
- No change

v6->v7:
- No change

v5->v6:
- No change

v4->v5:
- Added review-by tag.

v3->v4:
- No change

v2->v3:
- Renamed the "renesas,sys" property to "renesas,sysc"
- Updated commit message

v1->v2:
- No change.
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 258c74c57b75..472cafe7d4b2 100644
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
+			renesas,sysc = <&cpg 0>;
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
+			renesas,sysc = <&cpg 1>;
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
+			renesas,sysc = <&cpg 2>;
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
+			renesas,sysc = <&cpg 3>;
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
+			renesas,sysc = <&cpg 4>;
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
+			renesas,sysc = <&cpg 5>;
 			status = "disabled";
 		};
 
-- 
2.56.1

