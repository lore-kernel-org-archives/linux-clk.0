Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3806240399
	for <linux-clk@vger.kernel.org>; Tue, 10 Dec 2024 17:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733850661; cv=none; b=Bj+261m6RZr37cev/nhLH6VcN2p9H/r4idVJhZsXI9dk32t+8a4L6/JCfxIbuTml/PNqxOp4vRTpFe+qkn/qzWlINgKuCXdEUIcZ4swjSgKktk3zU7fGT60hSEwNUizM2nY6+DEI6Weqf6sC3Pd+43v2AGFTc93jt43+38UvWx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733850661; c=relaxed/simple;
	bh=CcnOmZ4wJdtquX3MvcxFwHJDSz8ukso3gSLgf6pWQno=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tt58a8EQDzpI7Tpt/whiL//BWcokB5UtGV7zebWOfpA4A/gGNQGtQvS7XghjuQ8WAmA9iSPDIFbdc/VJMsT6MoX7NmgANzkB8gWWNYbAG6kKB+Vb6ed7WyvcHvpQbdHX42Vzv/oCIf3TDsHSB0J7yjs+zMw1+dH43oP3R2G2Ibo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=LZNfVXPt; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="LZNfVXPt"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d3ecae02beso3811749a12.0
        for <linux-clk@vger.kernel.org>; Tue, 10 Dec 2024 09:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850657; x=1734455457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbHdnNXTXnTR3tThfeMauJ9l0Itp93/txTopWT8Ines=;
        b=LZNfVXPtYDVS18Yte82iCw12NcdAvZnLHfH3EW0tVUQORbtzxAdRtpnj10pIqOl9PE
         jEM+YR7r98GwCsRLVjrqYGp+AMLP/Pb3LcgNG9TvRFS/VjnWLEU07nbYGiHoPbW86tw4
         XBdk0blKN11toswsFbluz7EVLXbNbJZ6Glb9b1iQ6bKtIr8EhZj0Cl8jlG3gjBrK5oEB
         LhVJ/Sue+fkM/6mpWiNVmdF9aPodprZmZTaDZoMzqYeZ+xxvXnplF+FuA7GpUhwqXrf0
         XkDmk80PKQkWf9Uc5VrSpDU8l79JRUh1FaGhIt1Q/HFL8EVqSQ+wriTSX0c8caErCh0G
         xhjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850657; x=1734455457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qbHdnNXTXnTR3tThfeMauJ9l0Itp93/txTopWT8Ines=;
        b=VYs6PNSfRiT6lggp/Box44NKBVSwGAtc2ScAjMkrc01obkTb4/Jq94m8ucF+83DknI
         nfwrwTbhBVzXus5oS/L6EO2dVjUlOVLoZ8aJ5qoGpRJoIgzGpQB3g162N7joquoXFcg/
         AOwWNYRbp3a2kkMA4zM3QjOBbvIms/pIqy31gKWSRndMFTlVH1icoOdHNoYNgkLqDGqC
         dNVKHICrpuYNWhWzLPO+sqNYTObCoA1m//wokllvhW+UwjrxDavk9dsngue6EGvyecW4
         fozE/LbIUIZsvvJ1mZicAyGiUjRZETntZ0X3JjcNnjOIiHuOCSp2psFLLfQy6HyFXFaT
         d4KA==
X-Forwarded-Encrypted: i=1; AJvYcCW0QHaqlEeF+RUmfsDOzIldB1dYR/uckylu3O+1aO4X+NL0Wg9i8TgxZ3u3yYWBAS8WQxSlE/8UmzE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCyM4MQiv4twIydV8/RDLLVPXpFwwYlZgytNekGkyantsAZN+L
	FcLYvdFz7Dq2Cv/EJFKeWFH12bzTvaY81SDPGAE5qksEMcr87+aAw/aEiLWCw2c=
X-Gm-Gg: ASbGncvPkb9+mD99xyPntuxjkN/bdX3z3ACwpJ68IQYKuCd5IYJZsKCCERcIswDaxu3
	sixmRuwRMqQ5m4KbVFABdyVFVQfPAnfuNYve3xBVIOf/fE2el2Ce6gT7a8ZCw2ArVZHUj8kMQVR
	VsQnU28Q99qEbambPbkS1vS1oGWGn3hryqpWXfTGI9mtqSi8R34H5VnLUwqRuRKd2+DQaQOFOEW
	hpRiMztiCAY0mlHDZETKT37fqZZtvgJ83FmJtpKf82uZbOsEC1ectroCSEvJ7N9n+lpJBjzLcwm
	O81OsnLYhOs=
X-Google-Smtp-Source: AGHT+IFoRF8BSZrpYteUQ6a7MVI24wh97GfyVKWhabGoatai7X1+0ZapR3mbMn4ogZwncEoqa1pzEQ==
X-Received: by 2002:a05:6402:3705:b0:5d0:d183:cc05 with SMTP id 4fb4d7f45d1cf-5d3be66d0b6mr16199052a12.5.1733850657163;
        Tue, 10 Dec 2024 09:10:57 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:56 -0800 (PST)
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
Subject: [PATCH v4 22/24] arm64: dts: renesas: Add da7212 audio codec node
Date: Tue, 10 Dec 2024 19:09:51 +0200
Message-Id: <20241210170953.2936724-23-claudiu.beznea.uj@bp.renesas.com>
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

Add the da7212 audio codec node. Along with it regulators nodes were
reworked to be able to re-use them on da7212.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags
- dropped #address-cells, #size-cells
- moved #sound-dai-cells after clock names to align with the
  documentation example

Changes in v3:
- none

Changes in v2:
- none


 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     | 17 ++++++++++-----
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi  | 21 +++++++++++++++++++
 2 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 6e58d47d85b0..5ee9dac4aebb 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -63,7 +63,6 @@ vcc_sdhi0: regulator0 {
 		enable-active-high;
 	};
 
-#if SW_CONFIG2 == SW_ON
 	vccq_sdhi0: regulator1 {
 		compatible = "regulator-gpio";
 		regulator-name = "SDHI0 VccQ";
@@ -73,8 +72,8 @@ vccq_sdhi0: regulator1 {
 		gpios-states = <1>;
 		states = <3300000 1>, <1800000 0>;
 	};
-#else
-	reg_1p8v: regulator1 {
+
+	reg_1p8v: regulator2 {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-1.8V";
 		regulator-min-microvolt = <1800000>;
@@ -82,9 +81,17 @@ reg_1p8v: regulator1 {
 		regulator-boot-on;
 		regulator-always-on;
 	};
-#endif
 
-	vcc_sdhi2: regulator2 {
+	reg_3p3v: regulator3 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vcc_sdhi2: regulator4 {
 		compatible = "regulator-fixed";
 		regulator-name = "SDHI2 Vcc";
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index ee19c4155750..899d88467d79 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -68,6 +68,27 @@ &i2c0 {
 	status = "okay";
 
 	clock-frequency = <1000000>;
+
+	da7212: codec@1a {
+		compatible = "dlg,da7212";
+		reg = <0x1a>;
+
+		clocks = <&versa3 1>;
+		clock-names = "mclk";
+
+		#sound-dai-cells = <0>;
+
+		dlg,micbias1-lvl = <2500>;
+		dlg,micbias2-lvl = <2500>;
+		dlg,dmic-data-sel = "lrise_rfall";
+		dlg,dmic-samplephase = "between_clkedge";
+		dlg,dmic-clkrate = <3000000>;
+
+		VDDA-supply = <&reg_1p8v>;
+		VDDSP-supply = <&reg_3p3v>;
+		VDDMIC-supply = <&reg_3p3v>;
+		VDDIO-supply = <&reg_1p8v>;
+	};
 };
 
 &i2c1 {
-- 
2.39.2

