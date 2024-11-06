Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A561E0E1F
	for <linux-clk@vger.kernel.org>; Wed,  6 Nov 2024 08:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730881226; cv=none; b=ZjrYF6GK/UKnbaYBp84WXAzR7pLLW5tt995uloYFbUxN/ZpfU6E1OkuXAm3MEopebPEYxcY87aSVKeKOyvjQ6o4tfSqzoB9EmcEXo4k0E+H5Vd/Vtg6LYv9PFmTOQso912DWJoN/aItcyw/n8RkW133TTm6v3DWh4WHnffU3Di4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730881226; c=relaxed/simple;
	bh=6ZBS8yoSl8e7ZPTGMg2UyhR7znZ3Gc2T8qHVSpD0i8U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=METlwPlhB2VC/7TKSyxWBTX3wdrOi3RByg4r3PBeXgOC8FlHtHrUC2PYdrCzsSE9Spzrq9TxkFLOza+9VfDZ7SuKsjrit506CnyrizlPXZtNutBW8R0pavTfUJQ9GWFIswpuzv74aKf+eRBtuxBKcJNlTvqHl1HTaKApplrucOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=GlHz16Qw; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="GlHz16Qw"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a9e8522445dso662095166b.1
        for <linux-clk@vger.kernel.org>; Wed, 06 Nov 2024 00:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730881223; x=1731486023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBiWX6XkkMqXMqcrSsPCTgbOs43GqvRK4CKUfvJFsTU=;
        b=GlHz16Qw2aO92U/o5c8JeSPUcTCOib6PKq+0gmKujjQ5auyDXFm6cIpL6V3Juad9n4
         0XGTGGTaHWsX1eJRig5ZGzpUFV8qwYS4EJiEqgEIqKn8SvkA3pJoyy+j8PnD8+SF9bz9
         gXM6FocTS3PUt3yXH6DQdFIYsi5+itTBnJgebjDb3IQWRVgu3iWkiifXSFa6pP/dzvDO
         dAD9X/iHzVRKxZZ4Uvz7inxrstjClygriM4Fd7FRgxQReFFrdlO0Q+J+9F3VawEnB0Jh
         EDrQ9l9FBAb4r++RnPxBzncex6oRD9Iyio9D/EZk265mDp53brX1NMcpuKP/pUzaydtc
         QIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881223; x=1731486023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MBiWX6XkkMqXMqcrSsPCTgbOs43GqvRK4CKUfvJFsTU=;
        b=J24oz/q79fAFdQgK/2VktYyrugUshmFlYyczhOElqrkizNez6ftK5wyuJ88WNPUNee
         3MhIQ/Lch3BvV0H9cYEyYublI79ec1OFLTJRWbdWGyPJlXOaBXQYKLZXi+AvnUZaBT4C
         WMApXpBVocfsIlXoOwW1/N76vzw2JTt86DI6h+p5bOI6UGFDYrHhZpzwP4jJQn3qtvms
         1wMfxQ6PL1zqsz9xf5PWH9nT2THwK+648gcfvPartrhFtM4unSvr8aVElM518uwriLDX
         W1D/cxLJiV/vr106Neb+Epiq25hFEADKu4A7J2RQMGUWQbOS3HrDEGz/o3V9EsDpWBsP
         bzmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWm/ZfSAVg2tt2WNJ7iFUpM9BK/SSKu3BB9R8eQVRZe8VPWStVW0PJRjqZSvowYP1TLtGiA9pDNew0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv9Zrk8FPg5ad75Kd37oMMX9d5emraMkVpZQDyuV/CAtUJTozw
	OMvYpd8865dX0oF3yppU1uQYj7Bs8boyFL4iT0a0uGiYwEgi85m6ZiUORhAv6QQ=
X-Google-Smtp-Source: AGHT+IG7wiJJ9E52zFHeR6gwhEEB0zfvQGumHjoKijM/1DIeDaxswQrTqJ71Q4hjn7DJ8sgHmyJ14A==
X-Received: by 2002:a17:907:3f05:b0:a99:375f:4523 with SMTP id a640c23a62f3a-a9e6587e27dmr1931943266b.44.1730881222848;
        Wed, 06 Nov 2024 00:20:22 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a2dbcsm241369766b.40.2024.11.06.00.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 00:20:22 -0800 (PST)
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
	support.opensource@diasemi.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	Adam.Thomson.Opensource@diasemi.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 31/31] arm64: dts: renesas: rzg3s-smarc: Add sound card
Date: Wed,  6 Nov 2024 10:18:26 +0200
Message-Id: <20241106081826.1211088-32-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
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

