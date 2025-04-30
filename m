Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A0725D202
	for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 10:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009199; cv=none; b=mXD1fJVOpOzWlQHWu1lR6xo4NaWisiZIHafowTY6ZZnxQA0QBMQviiKBbvdEJzBr58hvYIx2CKPRDmt75EH0vSkoyF5W0R/NMD8JdDY11R7H+xsZsjFx0/fOUadbeV8GePJxGWz1w1ihTjbCH/v5Da4MPf4OCiV8RVAg/QWRWpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009199; c=relaxed/simple;
	bh=EGBMN18CVdfmHkc+brVcq+MVtXLfo7+2eoARAWS5P4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZEj4J3P4Ak8GT3XgB8HHtr7wAZW/bus4Qv3cxHBvr/+2bnF3TGZKc8NzdhwLx5VUYr2dj4JM45CyyVsm3Yh1qyuVe1WRXazQMV75GEY4P4J81CJZ6VJWKkll1uHv36G2rbxXdac2LdJ3qEXQtutRrdeQrdFkBhojZrRzDRHHDwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ggiA4Hxo; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ggiA4Hxo"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac2963dc379so1059636666b.2
        for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 03:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1746009196; x=1746613996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XLzaKZV14Vn6EMb9E2bHvEtZk0V2ql8+6m7239vNBfc=;
        b=ggiA4Hxo6OuwqDkz3I+mb/Y6975pyRApoNvAqYV1u1V7Bx+45217nLDBqPT/YQMzJ8
         IyAuOo7S/DQoiXfmzHTWe70XSYkgpOaOQa275zJytBz15KA6UJiY3l2expo3O6lc3NWr
         zqpM0YT3aaFc+soUoBnmj1/Ins92ihEPwFo99iXeiFIepqw+O+T8ZFOle4uoOtIf3ddH
         AE371+2rHn+8BZ8krOa4w28GE7Ve3Sj4Wb4wAOfMRifRzgdM+p5qBx0XFMyQq3PsEUi+
         AZqEOKkZsXYeSWTe3qkLuXj2nAcKUoODH2NIbWKC2RGk/QP3GEmqpxPzTvb6btT6rriL
         Vu2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746009196; x=1746613996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XLzaKZV14Vn6EMb9E2bHvEtZk0V2ql8+6m7239vNBfc=;
        b=TzSprHauFaO1IJzKJQRJUGUrdWautMltLP3N1kMc+WwDuKL4dZbKWlfTpgf1hZAeDe
         iwLYFb6D1SbsKqkXOqixVEcq7xdm+7suqM35Uiakf3OA2Fb9YY2d1DmMPrAnloiVXAb/
         /060RtGG7axRG277DpN8+sorHmCBq6mXnazyTt+mzubYp+8uqi2662Ym/MjIc02J3mss
         6UD/4gyFr3E1HqZGXXWiKSFoX0f15ZrPiUhnLGTBD2JXYlrTxTcVDKbW9mZo7Nf/yb4e
         vKxyYvyyj9autA9Qs6igT6OA9gud0Dv2iR3LKr7ygQvU0BuQ03X6OOqKW9VTDqmrOgxb
         Snng==
X-Forwarded-Encrypted: i=1; AJvYcCWMevCD43T10pQDwmxMWEY0NX9x4gXQ9/bQAXvsjAL40C5vc8HZ68zqEF+tJ9XELZ9ukHRTgfBBdPw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeIr/2bVvpIncqbyqZt/jcGbcTqZ8HCUmfkZ/mo17KnQzT503P
	hCEn+byRIsHJsbajYhf11BZqf91nQm+4oldP1O5ShHWISBkact4/tg6juiZMd1o=
X-Gm-Gg: ASbGncuY5fI/MS/X/mPFSSgUa/SlMQ1fEgd0pyQmd90G4dLK0USj6CzU7AGjhKm+dIo
	XG2ftwT/rJQGc1RVCyyOcGdMjx3/28OJhgs9UexevXtTeRuwZXOl6DAc6elzbMvpQ3a2rcKIRDD
	iUb3Hp/heYYFdhzxNZ9aYMb6vjo1tziTxUEgZ06dk4JvKmjQbd96psOxY6Wcbke9gBUKZF3HHUa
	Ld2ESkLrsvzHT7JCo5dJjsL+SDEiRvRzhe2Jihl3JnWsBZOcCk7aXEjb4uV6pFlAMsQVoQE+vcU
	Xh9rQIV7Xc9Ig/VsCYYmmkxwrYqlhG96Tobrk9O0qAxFtLotuYdKW2mTRxPBptcjDxJmNMI=
X-Google-Smtp-Source: AGHT+IEKSM0IXh8jKv5O+IVSv4mJ6z4oh82fv68+fLwY5atxsSRsGcvPXRiQe2VBDa9mA8yPM7H+KQ==
X-Received: by 2002:a17:907:3f0f:b0:abf:6aa4:924c with SMTP id a640c23a62f3a-acee21ae83amr165748366b.17.1746009195599;
        Wed, 30 Apr 2025 03:33:15 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed6af86sm909390366b.133.2025.04.30.03.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 03:33:14 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	saravanak@google.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 7/8] arm64: dts: renesas: rzg3s-smarc: Enable PCIe
Date: Wed, 30 Apr 2025 13:32:35 +0300
Message-ID: <20250430103236.3511989-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The RZ Smarc Carrier-II board has PCIe headers mounted on it. Enable PCIe
support.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index 5e044a4d0234..6e9e78aca0b0 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -132,6 +132,12 @@ power-monitor@44 {
 	};
 };
 
+&pcie {
+	pinctrl-0 = <&pcie_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &pinctrl {
 	audio_clock_pins: audio-clock {
 		pins = "AUDIO_CLK1", "AUDIO_CLK2";
@@ -159,6 +165,11 @@ key-3-gpio-hog {
 		line-name = "key-3-gpio-irq";
 	};
 
+	pcie_pins: pcie {
+		pinmux = <RZG2L_PORT_PINMUX(13, 2, 2)>, /* PCIE_RST_OUT_B */
+			 <RZG2L_PORT_PINMUX(13, 3, 2)>; /* PCIE_CLKREQ_B */
+	};
+
 	scif0_pins: scif0 {
 		pinmux = <RZG2L_PORT_PINMUX(6, 3, 1)>, /* RXD */
 			 <RZG2L_PORT_PINMUX(6, 4, 1)>; /* TXD */
-- 
2.43.0

