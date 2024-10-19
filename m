Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCC11E0DE4
	for <linux-clk@vger.kernel.org>; Sat, 19 Oct 2024 08:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729327694; cv=none; b=rXRLknHUfXKPtznZ/EyU8nz64NStOpy9Cygp8B+8+HdOMldRHYQj3FiwbKUfrlwsJ+naLvaX/1vOOTH+0dPO1aiC+TO3UOEBxI2SpXynnKMOSDZW2OtKALtYqJF+3qibTERqPMNpUAx9ZGiiSILnQhM9TNyRWx0io6pd5qSnwo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729327694; c=relaxed/simple;
	bh=QkgHvw9IBOeGPAakrzCTmrkD96bz5qPFYSsEtoUc+6s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S/68KbNlDQvnIDfdDWyI2PgBQepycPxpxxt+oeM1Df/qkz2knsaYgb5O3w/mg9TMB5vkvBv8mYEqDRpL0T75GCeuTpHqh4djzIZUjSf0CNfxtfM8vwou8buOcXYEbzSEuxv7/mj9ZISp92PVxkqUsGVQZQ611IXEIa9KBIKH3dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=JC/05x2I; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="JC/05x2I"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4315eac969aso15005135e9.1
        for <linux-clk@vger.kernel.org>; Sat, 19 Oct 2024 01:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1729327690; x=1729932490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i1BDFdSyg41e2LABdQN1el7m1GZPq2Uu7y0UUTGsVos=;
        b=JC/05x2IHqKMY4XIqE+GHpMTkBvG0/11CN9YZc3OVSjOKYWFvQ1atbCGQaWR+GH59t
         QkZz4ydXhituuzlsJ/l31CPa6n1HuCUjFdebymIKmmL5wg3/wqwGUFMw0CX4NlRkX8qq
         Sd+5hCBt5o1Yv3jZ+y416VU5R3oH/rCdgd6TjG+FelftvsAsACKXFVxUDdqQjOW2ABny
         tgjIs6e+Gq3Uqr+IR0Xcwf8bzvs2m8JWl9SL4tkg1XnPVdc/XTAEqc7Sr9CQO4MXGTmI
         GVL7DMuGZS0pPSXJxA0k92zPplTIEg7+N1jgULjon7iXnk1ECU/SVao7m/vrKAYvhwiU
         HxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729327690; x=1729932490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i1BDFdSyg41e2LABdQN1el7m1GZPq2Uu7y0UUTGsVos=;
        b=Z7OYtXunstL8s+2hECAYTQ15efz/zQIRFjDIy2gLUI6qdq90ubd9yyW0KoN1cs86E0
         NzptkvCXrbrC9o4x8jMc5G37XKJIbWpl98XZsdDiOWYbdMNnDPyypVxGDHR32SuOX+em
         7KnlCLOoYlqQWH0P1vBP8QZb8F/vjS26QbA5rxoBOA+vhOVgEyGmWGhMIlzZgvE+8omM
         A7aQR6OYKwUjG6IN7DOrLRTJdYkeczk1vCQCmhn0ZDnFp1HsGwuBF8enVRgPeJYt1Jvi
         22mlT7csnHF8Xsot5V5IUDXHaNQMgntS3Kq3InQMSCNPswfkaolENYQgV11Rr4pzi9ZT
         jkqg==
X-Forwarded-Encrypted: i=1; AJvYcCWjfmw1cXKlNHO9bV4OQk78oExXKi0CLJU5f7R8QFtxX/sS7NuUQavyKvulicbWamc+hntX95MlrNo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqivNLrIbXOzHbQ9k2YEPAx0kXOseMFQNNvzPdnZd5z2DueQtL
	kCMy62PTgT0VE/zVFUOffi9ko4concA8RWtOTXhLj0OQDRul2/Oy9ngQGtcdfRQ=
X-Google-Smtp-Source: AGHT+IGHzPKJDiCrpkrv0zEGse3U3VvdpNmMFQCy8z/QXuS15hpNd6JHm2gDYDjdinG8u1jiTCFuqw==
X-Received: by 2002:a05:600c:3b85:b0:42f:84ec:3e0 with SMTP id 5b1f17b1804b1-43158721801mr65450245e9.9.1729327690371;
        Sat, 19 Oct 2024 01:48:10 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf0eccbasm3898731f8f.81.2024.10.19.01.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 01:48:09 -0700 (PDT)
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
Subject: [PATCH v4 11/12] arm64: dts: renesas: rzg3s-smarc-som: Enable RTC
Date: Sat, 19 Oct 2024 11:47:37 +0300
Message-Id: <20241019084738.3370489-12-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241019084738.3370489-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241019084738.3370489-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable RTC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

Changes in v3:
- none

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 6be0ffdcb87e..939820a925d6 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -347,6 +347,10 @@ mux {
 	};
 };
 
+&rtc {
+	status = "okay";
+};
+
 &vbattb {
 	assigned-clocks = <&vbattb VBATTB_MUX>;
 	assigned-clock-parents = <&vbattb VBATTB_XC>;
-- 
2.39.2

