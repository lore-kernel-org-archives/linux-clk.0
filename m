Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531B524353E
	for <linux-clk@vger.kernel.org>; Tue, 10 Dec 2024 17:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733850665; cv=none; b=Rw8IOxcajt2b9ld0+F8sm9rDIsJOf9bI3NwmZ/t+nUfB2wPO0TxTlRQonJ/PNtOeICvWl6K12ximksLzvz0GjrZ7ip5DTdWJBZwOnjUKs0g5TSgPGIJkOU+kUOPwycZcSSZt2TLNEneQtQ5Abwkd/5ewx4ECFvkEd70Jb/g3FQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733850665; c=relaxed/simple;
	bh=hJDCv1TyaQlo/L0tvA82G+IiLtzZURDjCsIXt6YWZzI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EnFp4m1wyRlFVgzvIAbUh+oqUX2SBbvoZNi+iXMS6m6ILBFylMH0QeIGmYL8c1m3FleLvatYJ0KCmhqrKPgkIEaC/gLjA1mSBryD3GxjxiqrIFeCAseqKnu+VstStqQddnwmwWUmZE8Z6rQq64jGyc8sUZx8ci6WDuKPVIEuG2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=H4Oo73oc; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="H4Oo73oc"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5d3cf094768so6587767a12.0
        for <linux-clk@vger.kernel.org>; Tue, 10 Dec 2024 09:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850663; x=1734455463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TwyXnruxyE1MIUM59wwP+urrQ2EdZ5O+ybJnem/vHTM=;
        b=H4Oo73ocUU6EO5L86bsbLakxd18SGRoMb/J2jzJtaIAmNhotmttFlW/TmdIeordbJZ
         Dq+bShklzmdfREDBwuxJjDLed5ej3M+XFdsU4eDmnuGhRUVNt+PJ40Ionl0av+NKnuam
         20kW6ycQNBXnYADF2aarxkcua1Z23wHlFv4RkB10Mzt9g4G4T1wVBNpetas+bTy1Y/ra
         QxlTvkMagWUEayvqovJIrXb6kvLmnSdz5LF+mTMRyfpXgNdPR5z4JALaPwtMfAI4Jqk2
         ssmNkWomPf8q8YXmUV3JnL5oqVsbP/qx81usGKG8bDL3iWU+IqMU+2BeYTV4XYrxA9yj
         pM7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850663; x=1734455463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TwyXnruxyE1MIUM59wwP+urrQ2EdZ5O+ybJnem/vHTM=;
        b=R/henB4mjkilY7p0hkfxym7YXuzZnIsBvZNBM1tUYMOgP8qxNuZ69aAFIaJgMIYRzP
         VahEFqfhhs2zUuzU+P6GlEMlOBqyxVXUvH7WqkEdNEm87RJknAdhICom5cKcz1iqkf0d
         +nRHCx2POwfcJMiPPWhxBvW2QIBELaqrNLZLKJorOaeLb0+zulIV1+7nHE8VWlLmEAdA
         +KaF7/Z4I6lAAfNNGuh6h960fdUIsPnCBYgu6EZ5tXcl5WzK8QYLdatamGOc1Ubup5ja
         cMDu52/kwjjZy+H3bDJamK2bCiSjhJtnZGPKWOJkNZlSeJMzf+ds3f7XSNH7CksKaza0
         uqzA==
X-Forwarded-Encrypted: i=1; AJvYcCUNk5d57bOBF0BPt4CvlX9QxJ+w90g3miCHhQV3wAqs2t953blC8co91a1NqR4IrA7jVN0/LkX8c28=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhJ4ZhmGuvkKpxmg1PMOrJ/v2F8bNmHy/n/WqQOzR6tl6PLdQJ
	F0MQu+vS7QyIShq1L4ci01Z4zFzldJR517CYWJ5Ypa3IzxC6zjQVU7m9aXopwkk=
X-Gm-Gg: ASbGncv4tHZkALT55BhCayNmLQjzzhKrelNEE/rSdZP/b/uvxw86FPwnlfUkSTE/ZRh
	6hPLtPkCkzmSIpVxQlHvdEOsxwYrqpPGypBWuw/vdBqVDcy3Y+ToCfYzEkbbuNX6DefH6IT41C8
	1sUlm8UKW2mS4xhKa2KIeP+IqEnXIXRrqUGLKLa++l31Wbio2rCehf3d4VK1J1TsjHryYbs+VGN
	TJzDh6X7S/65hh7WQCWmFmG2MXbk3cEyu+xqVUzPOTV7vu6dS+mAK7eSdjD/dNmms5uWKpY8NxK
	qW8EZhj3
X-Google-Smtp-Source: AGHT+IGQNruuJ2fmbhGEBR6v4EYtbwtUlKzpp82KdDiJC4wYZhl0SU6OosybB2Txg3S5RjOBSBjG+g==
X-Received: by 2002:a05:6402:3490:b0:5d0:d5af:d417 with SMTP id 4fb4d7f45d1cf-5d418502c64mr5890914a12.1.1733850662767;
        Tue, 10 Dec 2024 09:11:02 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:11:01 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 24/24] arm64: dts: renesas: rzg3s-smarc: Add sound card
Date: Tue, 10 Dec 2024 19:09:53 +0200
Message-Id: <20241210170953.2936724-25-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add sound card with SSI3 as CPU DAI and DA7212 as codec DAI.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

Changes in v3:
- none

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index 1944468a2961..5329f3461990 100644
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

