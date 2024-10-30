Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5D51E7C37
	for <linux-clk@vger.kernel.org>; Wed, 30 Oct 2024 11:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730286114; cv=none; b=XR1fEPYuAoFb1ZMT1yxiMk1VBMrmGXfvGBIfXsFtk2+HvNdRmS7VCq35trC5ErogMvQPTqsRPclQsK+brQG2OCy20fFGpQdY+ksI14/szAG3vE6t7hwq+AP8eWcBhb+FErlqvr0fihHh3WRtT7Z/Vc915X+xc1OyhxI54SLw83c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730286114; c=relaxed/simple;
	bh=KFwokuMw1FPK/d+QbmXe76gVKRCfIfuQJJ5Szt8cbuI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LjG1q5OLW+jLsw0FljZFy2HGmB3gJrkoADuecQGkiTVKu8ZqSd27+Mi5HB9DSwu11yDWSDxC+2gMdES7J99iKsW4mLHdkfflktXCVJuYjVyVYZj8VIxsIqyYrHXjbPm0t7kG5sHfzIyckRVkojPDcXrrP0rQ+Du2vGqqwRxEbGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=foML93mn; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="foML93mn"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43152b79d25so58159455e9.1
        for <linux-clk@vger.kernel.org>; Wed, 30 Oct 2024 04:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730286110; x=1730890910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LfEYLhjMDeZH0WbYlTTTFbhTtromhzFBfjXyLFGdvks=;
        b=foML93mneT8qrVZ+PgUgcJQrcxR7FRzYhY8fo2T4K0JWklN2z1amHp3EFZVrnHQC/t
         aDhpcHs825p5jQP5NrY3P2oU8OGPQrBA9zwEAo6bKnZdgvttGZ5eTErqFR2/YxPwJgcL
         3LCg3B79SNkqw+wBtcQCoBdUSf2NznvvdKS1vJP4ahROql24M7Z7ugrRMeqLPK62G7rw
         Q2ayJZ59BBTlJy39kSoGzSz2MnoLmYA7Lzzd4KLzEFicZaZcYOpOmjiv+LUlx2/VaSKn
         b7CSxPrjf7XSZGz+D/y4ftAFTipINhgOwpYSWG5XE2ZpU00XQ7bP8c6DBPMv//P3sbn4
         iTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730286110; x=1730890910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LfEYLhjMDeZH0WbYlTTTFbhTtromhzFBfjXyLFGdvks=;
        b=ZotGlHlU5OiPLQmtCE5xxpVc8QhiY9EYjKkIVpPg8zRPN5geySX0DB8X+N/lGaHM+I
         A3oWFm06o2Q3D8ZEKEyRHxwCYnFcZgcxxZEyCUnIgq/9t0TL8XDtdFtZNNkXa61mfQMk
         fOWsUynBz246HFZhZ+Mm1eRwSAJqhEC76O/qtbQR5Y5EvT3qA281licNs3W5NEUBzroK
         X+vtWwj8QO/wZ59tOCOEocqwHi5h5+xpRataN0L/uc7Ioi1pFH7O+G86/qNhOjl6bgKv
         336fqaD+YTXkNM0E1Qceq+OjKITkILpTDdcu1krSmoA/4LMOdQWu8CwH3V0cpI4imm8O
         jF2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWYFGuTqXeygu+E4UOrT+r8uelsXyp5ePpK051n4EJbDGu9hSHvmIoB2H7EJ08zPglZvAIkcRwC7tM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9eZxKtqhJ7k+/FBpIznpXoq/nirGa+UARJypp1WSxwZr2hHj1
	Dxt/xh/SkFziCNAfkOyEX2yj9errzPpIYP0lpBQVP96KZEP9GGg4+TQySmB6rIg=
X-Google-Smtp-Source: AGHT+IFSBbnTsjzeDFuXW2ohx80Zl9EjjF5HTT3F6o10bua6BUx513xSS7WM3daoN9qpwdEzGQrg/Q==
X-Received: by 2002:a05:600c:3ca3:b0:42c:bb96:340e with SMTP id 5b1f17b1804b1-4319ad317e5mr121837365e9.31.1730286110454;
        Wed, 30 Oct 2024 04:01:50 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd99edebsm17956935e9.45.2024.10.30.04.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 04:01:49 -0700 (PDT)
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
Subject: [PATCH v5 08/10] arm64: dts: renesas: rzg3s-smarc-som: Enable VBATTB
Date: Wed, 30 Oct 2024 13:01:18 +0200
Message-Id: <20241030110120.332802-9-claudiu.beznea.uj@bp.renesas.com>
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

Enable the VBATTB controller. It provides the clock for RTC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- dropped the status = "okay"; from vbattb_xtal node

Changes in v4:
- added assigned-clocks, assigned-clock-parents properties
- set vbattb_xtal status = "okay"
- collected tags

Changes in v3:
- updated patch description
- dropped vbattclk
- added renesas,vbattb-load-nanofarads on vbattb
- moved vbattb before vbattb_xtal

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 71424e69939e..30bb4f5a7dfd 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -5,6 +5,7 @@
  * Copyright (C) 2023 Renesas Electronics Corp.
  */
 
+#include <dt-bindings/clock/renesas,r9a08g045-vbattb.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
 
@@ -344,6 +345,17 @@ mux {
 	};
 };
 
+&vbattb {
+	assigned-clocks = <&vbattb VBATTB_MUX>;
+	assigned-clock-parents = <&vbattb VBATTB_XC>;
+	quartz-load-femtofarads = <12500>;
+	status = "okay";
+};
+
+&vbattb_xtal {
+	clock-frequency = <32768>;
+};
+
 &wdt0 {
 	timeout-sec = <60>;
 	status = "okay";
-- 
2.39.2

