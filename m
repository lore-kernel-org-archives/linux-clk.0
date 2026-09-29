Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30AD51DAEB
	for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 10:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790679060; cv=none; b=Bg5QaWUXiLUPU3ZV4szNKsAsy9942XCSxg2HrxGuiT/krL/o+R+LOn9pVwT7f38g047NY6MT7BSgcH5g7HumiGSNMhMgnEM2cvktYXyr6sC1dQcOVI9/aEKm70r/1wADvN60q4N687wt5pC+DUnynXf/knSzPSbi2NF50CFuiDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790679060; c=relaxed/simple;
	bh=TOovBp7AJBZftG0dksjLHjN9+gQXUXQNB4O63AGk+ss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B95KomEoyfgqTxr62gWpZ7rmpMA+TPb7gXUWLyTZpANLJB6zvncH2DUSth7UUdyRqbcsddx2Z3cPLoS7FnZVlHTWqa6IYvSnkBu3uUA9vGk/4MjiDhGH2fcrHRYAeqEMN9JucludSZ0VGj/ADCvEaBl3myRasOOnZiNDbE2ed+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fy5Z9o1+; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fy5Z9o1+"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a006bb267eso9830045e9.0
        for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 03:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790679046; x=1791283846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZeymYWRbDO3OTFfGWiJn5j86DHN1mxMvxZVS6ZWxjik=;
        b=Fy5Z9o1+6rFj/DLN5HPvef30XCjxQw8YdkdmsVgTljsFa8YSVTW4s8OaIyKKA/LCCU
         K217Q4NoQglY4O4T+DbJA+BZAs1Sa3+nta761vifETRk7P40b7tZOSyVlzecwlIdRU+j
         xHFetuSDWUJ3JVi5gOlfcBZtt7tPoA2qHbt8sax1a7CWiv0v0b+1paUawzmjvWtuvQnG
         FModt5W7Imw7nzlKa50hQ5QVexPTxmENbkw85PGc7ZuNR0iBgKcODwOSZzcHyeQXp2QM
         Qofa+MWsuNJh7vwStLC4QkK31YcY51PaGXGD5wvgJbpbmgBp0Htv81ilKHTBC8/iAOlt
         mGMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790679046; x=1791283846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZeymYWRbDO3OTFfGWiJn5j86DHN1mxMvxZVS6ZWxjik=;
        b=1ePi7ydyWqsM1ajrfQFExzR4VADAlU3FinaKYqaZbgN0VIzf25ladWivOobeoCK5B2
         yGfvGBbz+1jrnMZ7V2Dp4NUUnXxnpXa+valtKXEvalfwg7QHQHk8+a8mNGui/fOziZXm
         lftvZg7wOkr5E9NaCzAlN+Rx2NWvXQldLndudeW3FwmPP+DH7pfVeXmZs2CMN5LhXn1j
         yTxYqS20le+3/c1+YeQr+akI0kaWbnKLvnt3bFnMlzPS5RD+ox0UC5SKJB3MQrRtM1r1
         XLH12WneDA3Gm8ScxtzEjT1dZ5K3VpYI67h9TgQFegQhtyw3cgcGXTWALblTUCVVpXmp
         HT7g==
X-Forwarded-Encrypted: i=1; AKwUvBzj1VriALHfuyi2XrndbmG3RgAFdE6+K17liH2gdiNJeBQOmJYUxP43dkSz/VXCZznCFnDl708h0H4=@vger.kernel.org
X-Gm-Message-State: AFuF++kBn4RjJZQ0jKA5++gdsVz2HohK2ASWdzXlWrpI0VG586uX1XQr
	4QpX3KOiAle+xV/wDuFBRX/tAwrI22woXAAXtQWqHkeNwlzXcpt+1Y2i
X-Gm-Gg: AYBFou3REMobrq34uuxFHTdD8FMYNr5XhFrAtH9Updhvsnem5QQ8ESMWSQN+46dYqca
	NNd7B3F3fEDV7h+ffZC6tUFqvfiZSS8DDvo5us66Dbjffm8QBhR2fpnB+w6erFMbQlBvV/2pAY5
	79eCADyaxQ5kUGxWM3g6rcV5WZS9dAkmK3DmwzY9fY5rG0cHhMMv0gedy2DBQAAqM4epSD13s3/
	mT3GqteBCRlPQh6z4DYHSlz1QRBiVGaWUOuV+tsavsvrwX6rREr4/TdwujbtPNsgszYl84ZgAOo
	IZhBnNPkHsEW5vKE3ikhmaR3yciutP8Afy4c+XA3elH94Ni5+xXFhSnbZxkDt0Ro69xMCohNmKt
	wwLAK4EmXPDSXIPT8Z26+mN1kxf1KHnlZ0pGTYCNDnh0mrf/neBYWF6eotj3f55lNwNsSXx8FMV
	R6Ih3rX6c062AaimeL/zmYABQ+4fHAAlY/UgHAV+heoN5i2wP3oRqQIDnuXjfXJiEoFtt/MxUgX
	MEPZq8fv0Md3+VTKx8pCnf442uEy92FMgSvguC4Ccn7RMN+2n79PLcOVjOwmD5iwoamNCeGb682
	/qCPKJ0yc751rTtqfctxDfEZr0xN
X-Received: by 2002:a05:600c:c48f:b0:499:bf8c:cfd1 with SMTP id 5b1f17b1804b1-49fe66bdfdbmr282392825e9.2.1790679046003;
        Tue, 29 Sep 2026 03:50:46 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:10d5:21e1:1aae:c9d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af5058c52sm3516303f8f.19.2026.09.29.03.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:50:45 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v7 8/8] arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access
Date: Tue, 29 Sep 2026 11:50:21 +0100
Message-ID: <20260929105021.542730-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929105021.542730-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260929105021.542730-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
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
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index 68c8daed557b..abca7aa89458 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -327,61 +327,61 @@ channel1 {
 
 		wdt0: watchdog@80082000 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082000 0 0x400>,
-			      <0 0x81295100 0 0x04>;
+			reg = <0 0x80082000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 0>;
 			status = "disabled";
 		};
 
 		wdt1: watchdog@80082400 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082400 0 0x400>,
-			      <0 0x81295104 0 0x04>;
+			reg = <0 0x80082400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 1>;
 			status = "disabled";
 		};
 
 		wdt2: watchdog@80082800 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082800 0 0x400>,
-			      <0 0x81295108 0 0x04>;
+			reg = <0 0x80082800 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 2>;
 			status = "disabled";
 		};
 
 		wdt3: watchdog@80082c00 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082c00 0 0x400>,
-			      <0 0x8129510c 0 0x04>;
+			reg = <0 0x80082c00 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 3>;
 			status = "disabled";
 		};
 
 		wdt4: watchdog@80083000 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80083000 0 0x400>,
-			      <0 0x81295110 0 0x04>;
+			reg = <0 0x80083000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 4>;
 			status = "disabled";
 		};
 
 		wdt5: watchdog@80083400 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80083400 0 0x400>,
-			      <0 0x81295114 0 0x04>;
+			reg = <0 0x80083400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 5>;
 			status = "disabled";
 		};
 
-- 
2.55.0

