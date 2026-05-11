Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3254CA28C
	for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 18:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778525476; cv=none; b=psBcTO7EcL13MDZXo87qjxorDEp4yDlogtwh0oXmmfBuG1Vi9J64OZKXVrsuXRClf/2mjLuuvLXgVxh3VZdUb+yfCCj+WCD5+eLR8MgZw8j0f6HVQW1zrxjVxbG/4d1E5pD2M6NeEBLjMOc4tV0YwjmaqlgpBM54zrP8YXNgPp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778525476; c=relaxed/simple;
	bh=gsf8O/A4uFSb5xiWCs8Lvej9IiVzo6qsPV5Xik3YnM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tEs2RZLTyiAT1+gN1v9ULPKol94zw8dmQp6wx2uhG1L8wrvN/dE3ACTF4WUTJDbzaR8V6v/hrSfzUVi9imBjhTlZ1By1lVG1SoDztC3ipBO0ACnlH0X+I4XEwxWZ8sdeBEvkTawrEdDFdJrJHo7eqbBj0KlV7qF1CI4xoWwmMZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iW8fr/QJ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iW8fr/QJ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48e82c23840so12022845e9.3
        for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 11:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778525472; x=1779130272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVviRRXyOpOFqlFXNeMmtSmK6+R7+16vmQsfofx/k+I=;
        b=iW8fr/QJHIGZrqwSG9m2vdDynRDk4XZ9gDphPceMVvXcAndcHtWTMyfaKrMuJRZZvk
         HSWyWGrH2ZeJK6MYOcb9xheOOQrgREkwe01fISC0p7UFXs15HfSfgHZNTaOfGhecVRt3
         djtXXUBMT5swzisvwnuWAouDLoMu0STFMhuWjWwwjbeF5KAt+MRPZsedZCZqxFr3G5Cb
         WRbQo/TgY/P8oXnFov/vzKw1pw3UgOn2CGkgswniulACvCame7PghkMKv6n/7k1NVwxA
         73WxA2Eff8Oc3q45c7QNgcokOpUxrxHeTq8tuJipy+UAVP8hqI+3jyyBoyZSmZ+YF7o+
         ljTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778525472; x=1779130272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jVviRRXyOpOFqlFXNeMmtSmK6+R7+16vmQsfofx/k+I=;
        b=SvggRR2a9HbvtNA8Y+NDLBCa0m79d/RFXcTX7BxP/i5WcitK7pDI9DPUNvw2k53yFk
         2Gr0es/0cbXMjWLf94uYz+gg/nK4GvzHrWueuIucpxp+cPDa9mvDuBJnZNgB/LTMPYm2
         blOw6Is/mNy6E26sOOdPeWV0HdIuJOKVZrx7gg38z1TJy4h++kGTdcD0epuaudCoB9iO
         YSaR1nkgtJejCe4BUZouYPIXatg/sVGH9uFen3AVr4dVAa+/fVuWGmjcs+3MH3f674/B
         A0yf2c7GKk9Q7BqpmO+c0HJ2LMb21PtAssL3rwTGtMhfc42I4mGZvhG7kDw3XM7Iqa8T
         9w1g==
X-Forwarded-Encrypted: i=1; AFNElJ/gC1McD9d33rlrfKV8ALbGvSN+AvyvwWb1rVUviOdRWWwhHneNnwRpU7EUED+5aQRsxkSfD4rxv+c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDXRL28G2Z99xbn4d3qoxCbgOLx62GstPWMnCMoc8nDQYj2Up9
	+z0Oex/jRFMvTTcZNrJu20iEZXa+mqbj8FPHuvfmTmZZTDhdW5P2AGB2
X-Gm-Gg: Acq92OEvbWtif/7MoOLHHjbqT6Fy6wDVDovOowkH5RMP+Ehov0xFy26E3E/UB3pZ8hA
	3PyjphJP3WsOqyRWks4wvN0hWD6ubPFG8HRC+pPpcCUcwzLGm0eqCt3SoCfjWU0u2Y9qAAIieCO
	rymn5hrxkq8JG4AxCWpYkpLWSXBrPAM5Xjgv4SKi7WVzjV2nSIzt7bY+OquRh1Ol994zRIKCB0r
	+TJQ88N0EJEMsOLARcz6McWkfgVH0gOZ6e5u8USnyGXenIjoCq7dWwOSbmAj6+hfqous0B49Ivk
	h/sB9o1Z2PsssOo0oeIqtNGySXfEri7LRa9gclMV1oIrjZSnDpLrINDteq6Kq/coeJeyXPvtZo1
	f4QnVmrlXPYQ+dqMZDuukzO/6+2p9AMCaMOx6h+5+hdCC5D8vyy3QSmLvmDiyL+o18zAY3uAGna
	IBvibVP8Eq/pmoADLzZTfSRnOiqIqKHQUJIqthZSM7BmVTlNyL6KGfY2i+QZ9MkuLm1AAK3IAtM
	kAva+x7HaXzMczqjfqxuRWTb/2jgsJsW5vUQw==
X-Received: by 2002:a05:600c:8b0c:b0:48a:7a10:4f47 with SMTP id 5b1f17b1804b1-48e51e0a620mr407790805e9.3.1778525472435;
        Mon, 11 May 2026 11:51:12 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e687:6094:b849:9886])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f3cf0cdsm854775e9.2.2026.05.11.11.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 11:51:12 -0700 (PDT)
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
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 8/9] arm64: dts: renesas: r9a09g077: Use SYS syscon for WDTDCR access
Date: Mon, 11 May 2026 19:50:57 +0100
Message-ID: <20260511185058.1926869-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511185058.1926869-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260511185058.1926869-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 59e5de743826..b076bea9cb70 100644
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

