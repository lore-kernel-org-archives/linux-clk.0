Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EAF1E04B1
	for <linux-clk@vger.kernel.org>; Wed,  6 Nov 2024 08:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730881224; cv=none; b=Uz58HEE3Xpkg8ijb1zltWsM/HfI81zAFiTM28kCmkXS7NShBE0Wq/2FvCFgwIvJHaLzYrad3AnC4hN4pqb27gjWUOT9vKk6nQW4XoMPNtxH2jbD8lqkiAbtHzm5SMaFq50RDcnbUc3Y98Yb/7A3QaZvJYSgA6W8fHUx90ZIHjLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730881224; c=relaxed/simple;
	bh=8yJI0mYXsz5dOwT6BjRGT+xWsu+mizxUkLmCvM+DzJs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F95fz99+jpvlAGVlYJtiPToEuBOJj2TWzxklPEipxSyfYGopQz24cHWQdKtjYXqbqewNbZ3ChyoL+nZDfCfWQxPkkivZp1ZEErPsZMK2PDymsMZSwkANv9P+QOndjB6H/Q/vOSPwc7WSfZ+oEOpgCLGtznfGCbVp4LjtI4TGRCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=eV+t804Q; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="eV+t804Q"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a99ebb390a5so111916866b.1
        for <linux-clk@vger.kernel.org>; Wed, 06 Nov 2024 00:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730881221; x=1731486021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4rBv1tlenlzUf0GNpxBKVr1uH/zXhu88znHCFxv/0Ig=;
        b=eV+t804QqBhJhyq/mdr2EfUt6o63zlxxjnoQEQtNi7eTtVt9AcyrWDQrtzi3R4qpFn
         Pvz1J11I08z5/14NPkwbp9RyvOQIBHdh+HuHVr6Fjx/YvqKzTW3cvrDB8+44IqtXJCk2
         JCLehX07a7g5q0H/p8C5/l9GPpvSk+imCj4zn6QvZ8Un+nNiCLaPnu7yFLgW0E6eXhdy
         06IIr7P5q1YzLsb0e96H+cQ3nU4z1WV7AXP9XdZGRdXAwuxBC1w5tqNezgFXmgw2G9dV
         aEZjcWvmpQRaM9D6xV0tO7Dx11VNc57zPjqz/LQFLZh4hqnQJs14AYsRB56OUCzMHxrK
         GqpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881221; x=1731486021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4rBv1tlenlzUf0GNpxBKVr1uH/zXhu88znHCFxv/0Ig=;
        b=HgLD2NbwehYQv3JUTHTKK/oHdiRd2n/WFNfG3H9Wf8ECEEupx7aT7NtoEhZqCttnPC
         x9hmvRxCm6AgktCzF22930ZLwRJtAq118UU6Ypfxrp+kX6YeqhN5L/66y4fRWVWlVVyl
         1GYwJcyk1eQcVS09NIxrmsnHu/MZUr3q54d2j7gNaF2n+k0cw+s7U45eOAr7E4v5diDr
         XXDGRRGeSbKAQz0SWZj+GlgENawk5MGhmfu9ugY48V6UjpsOBzVNHLAcIHU0UQiDU+wq
         Xjxz0O4fd0ekRrP3OaVaYhJn8S3ekLPYo7nKwf+iop5++K9HAIlFnBQQALrZuAyWf2OM
         O6XQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVdlXM/iLgtiKNBy4vec5FUG8IewvVUusP/I6HAmvaO09151QHwXQ9MeRiTTXT0VDasE9bWHWGSVk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCbZKuyH9gqEoFB1UiCbxiPOSjweW/1OFltLRv1HzkrEo4m6l1
	kiRtf4WTWovcNlxYBQBWuGJ17aEPn/JgN/uOsgUOHctqV/1Qs9rNBb8PYj+NicE=
X-Google-Smtp-Source: AGHT+IGxd/t66BkIJdhTWGthBklD0jFljSoqbTQh4Ur+Q8xUdEezNOGFGS6kLVKbq+iHDtdgEplMKA==
X-Received: by 2002:a17:907:c0e:b0:a9a:1575:23e3 with SMTP id a640c23a62f3a-a9ec663c7admr178655466b.19.1730881220768;
        Wed, 06 Nov 2024 00:20:20 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a2dbcsm241369766b.40.2024.11.06.00.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 00:20:20 -0800 (PST)
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
Subject: [PATCH 30/31] arm64: dts: renesas: rzg3s-smarc: Enable SSI3
Date: Wed,  6 Nov 2024 10:18:25 +0200
Message-Id: <20241106081826.1211088-31-claudiu.beznea.uj@bp.renesas.com>
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

Enable SSI3.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi | 26 ++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index 4aa99814b808..6dd439e68bd4 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -64,6 +64,11 @@ vccq_sdhi1: regulator-vccq-sdhi1 {
 	};
 };
 
+&audio_clk2 {
+	clock-frequency = <12288000>;
+	status = "okay";
+};
+
 &i2c0 {
 	status = "okay";
 
@@ -94,6 +99,11 @@ da7212: codec@1a {
 };
 
 &pinctrl {
+	audio_clock_pins: audio-clock {
+		pins = "AUDIO_CLK1", "AUDIO_CLK2";
+		input-enable;
+	};
+
 	key-1-gpio-hog {
 		gpio-hog;
 		gpios = <RZG2L_GPIO(18, 0) GPIO_ACTIVE_LOW>;
@@ -151,6 +161,13 @@ cd {
 			pinmux = <RZG2L_PORT_PINMUX(0, 2, 1)>; /* SD1_CD */
 		};
 	};
+
+	ssi3_pins: ssi3 {
+		pinmux = <RZG2L_PORT_PINMUX(18, 2, 8)>, /* BCK */
+			 <RZG2L_PORT_PINMUX(18, 3, 8)>, /* RCK */
+			 <RZG2L_PORT_PINMUX(18, 4, 8)>, /* TXD */
+			 <RZG2L_PORT_PINMUX(18, 5, 8)>; /* RXD */
+	};
 };
 
 &scif0 {
@@ -171,3 +188,12 @@ &sdhi1 {
 	max-frequency = <125000000>;
 	status = "okay";
 };
+
+&ssi3 {
+	clocks = <&cpg CPG_MOD R9A08G045_SSI3_PCLK2>,
+		 <&cpg CPG_MOD R9A08G045_SSI3_PCLK_SFR>,
+		 <&versa3 2>, <&audio_clk2>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&ssi3_pins>, <&audio_clock_pins>;
+	status = "okay";
+};
-- 
2.39.2

