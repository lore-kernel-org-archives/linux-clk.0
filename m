Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2527F2E090C
	for <linux-clk@vger.kernel.org>; Fri,  4 Jul 2025 16:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751645695; cv=none; b=pZfUq06OQ3hnbaW31Zv1Zm18fcHrRldnY9ZT4YUtzswr5R4dQZEx55he7zrDG5HmidtDnTvWFH03CZADMHVrksrfq6ut9ol2rsfLRwoAx1VHfqpwm8tzRbMEjXupqyFUxSEx30tDhfNzApoKKzxrviQ9oq1m3bfpcrsqbQ2UYQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751645695; c=relaxed/simple;
	bh=WguPuQh3/mnSf62tuhpCluxDoAVKFv7lhwgnIqAg2mA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XCCjgO1lyJYOQEhkfuYanXICWom0Plt8WSRi7+UYmIy6nmmCSwlew3uziuHNPv0iCrz+7GDUZ88QKV9RVP/hgRZjt3dKNvRuWOIIoAQ1BCbJlp8Z3cvAAfftybzLlAYMK5GcSXri1P04Rih7abAxSvZsAw1ugr6309QEAT60C88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=kNsxm4aQ; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="kNsxm4aQ"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60780d74c8cso1704037a12.2
        for <linux-clk@vger.kernel.org>; Fri, 04 Jul 2025 09:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751645691; x=1752250491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDg1DpjdtfK3/pj3Ed0aWvzIW/qZbuuI4Dyv55kxUjI=;
        b=kNsxm4aQzR7UeO/Sg2pPhSVSa/aBvxxcStZmcjSqc6NnX6y3RNzAaB4a45xbKHnCl6
         OjURboHgmHjDqY0UcT2awnFZGMJTtMLgk4gziU9qQ1TbNb1ouWGsB0xtNEBHanWq6CCF
         q/Y79U/XX6PK15ZK8mFb2I8UBmyDe5kH9xPMaYfoTl4Efw+y1mwOm8Q7wIfxYRT3fq/E
         E7AGP/eBjdDMmFSw8+yuMCJWyTbqmGIoBpk47m6t+rDEJKGFXtngaFACVEuEICuXj/rC
         bEI4NbTz+Aq672q6ZUiVP3nJCUIDvcghA1Ta/+BjifYq48r7l2WRJq0HWJWH+SJ4QjYo
         4GzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751645691; x=1752250491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EDg1DpjdtfK3/pj3Ed0aWvzIW/qZbuuI4Dyv55kxUjI=;
        b=Pi6Uykg5n2L+auJVtLcNeNT2Y+ylQXDxGBwCD8duDKeiTCMKh7jj+fP3ut6EG5/YsU
         qqZOrEkb8nukDMgoq8It+H/We/NGT8WSN33KQaxwiQo9azScT7NyLCCFiTmZIUpDhTiq
         ddfEBCReFCNja2OSXYE7cY8c0l0CZ4qrKKuCXpGqp6IQtKeBfWZkXd/f5s3QtF7Aem3z
         bPF2Hbajt7jTtdNiGNAyfQX+8r4Ads6esL1DHiiwLd7j3coTLObsbRRVCyBFx5Bv1+N8
         Galq04M797O8tKql0xrr5y8D3bZs57H1M/VdY1DcDkG6pZdNIGacL+YL4rsfTQiEhUHQ
         gQoA==
X-Forwarded-Encrypted: i=1; AJvYcCXo2zUM2UfNkIS3xkL+jihyWQAHq+YzM85+zQW8pj3BVccNVs2hrIeCPxblRCPQitY5Hx9GK1QVk5c=@vger.kernel.org
X-Gm-Message-State: AOJu0YygzsIzTWy5jMvLda4cqjbiI1dN/eIIWPJ1oe6DWXyrQuyoQlMm
	rea7CUdI+xGiDRwRZ1ljJ4Vy2QnQI9/TsVwRBfgtMy4a7ra0FBwLLa62c9hMM7D07f4=
X-Gm-Gg: ASbGnctI5sUS2FR2TrGop8AbTiN6Q8CrhYq7q6dc87Xv50b65BQW+Xgt/HagitdTMEB
	nHOgUX0fZ6CxvHNwykc/Cf+AuKwnGPy4Ea+eTKIgN1dAXZqHHngnVqknCGstklMok3fqFkeAtB8
	AMJAmBlZaNaHraFGKM6BWV8oGqikr5IJLgWzJfk0bYl1HZ0XywIlg2kAj5Mqw6ZJCGODlQkja6D
	kNRFUmFTZKb8CM2qLRAXbkmlAaqNbavsrbUUjAXxup6VGQdBJAIT8klVIpmoVeyodfIT/zayivi
	+r49qLML9Mb9DteyobPIFh6ka6zTivhSBHBr2mj9ls94BodD7oy2xtDKnnacFhqH9e1mDPRfxUk
	WwuJ+Ss/+TSj9V9A=
X-Google-Smtp-Source: AGHT+IEZfr0ji4LDK9KAfq64DmhYMTWRTB1pQDXq1rT0Tuj0QwG5y9ROAnPBq8wcVt6C4csWmuVLvQ==
X-Received: by 2002:a17:907:9621:b0:ae3:a717:e90c with SMTP id a640c23a62f3a-ae3fe695451mr259268966b.23.1751645691353;
        Fri, 04 Jul 2025 09:14:51 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d9215sm194703766b.2.2025.07.04.09.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:14:50 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	lizhi.hou@amd.com
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v3 8/9] arm64: dts: renesas: rzg3s-smarc: Enable PCIe
Date: Fri,  4 Jul 2025 19:14:08 +0300
Message-ID: <20250704161410.3931884-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
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

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags

Changes in v2:
- none

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

