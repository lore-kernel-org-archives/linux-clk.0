Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBD744E655
	for <linux-clk@vger.kernel.org>; Tue,  4 Aug 2026 21:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785878864; cv=none; b=fm5l9/Fvu8j/vYdmhi/jwbQCPnyQVYLZ/k10keTHxnF7KHyGJTzWTB8viXYFu3eAteWlNVI6brxXB7oWhUCB6fpZBRbnKS2Dxtfyec0GLJblu7yYFQdkxU8d8uAJTy4Itue2rNFzaY6GpAq4F0tEHJMZc/Dj50vyagEYHAfPCHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785878864; c=relaxed/simple;
	bh=cxjDKZ0MA9VUms6JcpknLJlKdT7ZoJ5aaylgo7tCtYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=exyrVNuIQO8AZFGB16YTrX5nDDzZUH676MfW9YU7zofZgjlDeMMLp4ewEVZUyoi2SfO6hEPDlZRzqIyGLdBR7Mr/8QT/p382xzlThHgUmjf+zMXemq/vU4JHh6Mbp8H1RTD0Ap0SsgLFYLTcUD4KUc6PqmtZjnHDRO2PTHgFDo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sm/IF/JY; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sm/IF/JY"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-495c63c4141so185386b6e.2
        for <linux-clk@vger.kernel.org>; Tue, 04 Aug 2026 14:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785878861; x=1786483661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FHj476tA2byKc8arhZaw8Ci81fHtdMiGqz0hVZIDFng=;
        b=sm/IF/JYVXJICXHtjQREnjIRxnzY2X0IFDSWmrRuK3h0uE40KoPKytp4Z1FvJHIzER
         MfYDVl+l/sHy/om6mCDg0EFEQ+Wz/czBoq2LgNdhE6c4HKn8SDbX8Kl/UNEe4wjw4+yT
         u5brBKitFiu+5yTW4hgl20kFCwLExg/jvgFz+vOw43SZobznKx8gmSU4JOzbrVLF6k33
         9YT713jOihYsVetiBtlp8FrT4JwWf3CYANjCtx4B3pQTd7a5zvEukNz4fQxSFwLkabs4
         9HmX6R81JHdaWwD2nlM6HO/FKNgeLdpacU+pOSw6eh6QLpa2tP/D5NnRAG1Lf5meeAf9
         8/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785878861; x=1786483661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FHj476tA2byKc8arhZaw8Ci81fHtdMiGqz0hVZIDFng=;
        b=S2hw43wbKSj9TrhRltoi3aOLWJtQm4PkjPZ8Tgjy/WSqLDQVCneixIXaxh7rzZ4s1w
         d4Bo3IC55R988oTqI5DVJIqSYx06oYS1C6KEOEeNomwp84+k2JtMHPIZ6reoPCJPm0l0
         Q/eHP6IV0Waw2R50dQnIFdPMFGuOXmu7EbWywbPFzAFQX2tj0Yi0eQbIregr6TiuZb1Y
         AuXqWANTM3PhmhQC1vNwv4rCSLDn7T4QG4l0hrVAktyp4WfKc+HknUV+4P6n48/UuqrO
         Wy78VuTvigZa8CX5QxsI1Q6WX3n5FTfswfCkRuUSEAxnQdhEo1ouA4ZjWoV/PhuvTxKC
         hIPw==
X-Forwarded-Encrypted: i=1; AHgh+Ro1c9HSw11m+YI3GzZ+VjT4gql3cB+28+eXvPKgYMU6yCWGDbHVXqsdz5q84oznEqyMD/P6MlSEl/o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkXLUeRItfHjrUhM8jeWsAWJs2Z8l+8dcnLcKY1OyhLKkCffTn
	7NnRF+/oON9A/qPYLg26qPaYBXAzjHRFEkMEaZH/4AFcRaYjpbJ6AKp7
X-Gm-Gg: AR+sD12AspOj4ShfJGgY3o2vjUrkrUSscH9J03hnmyWGvsYAdJGYk6YRray/qcv8sFU
	RTyaA3u9xzmxjKedbkO0p4T+iQEtQNvllCfJgKIpbqmgz6OVgcUHAa72LzTUgTR0dLrnpE1TbJD
	c5j3NOdT/UOK0b7qVS36aHT5lNxBNcMFV3rdI1bKACx4PbKk3cFNJv7DpuzLAaJBiIY2sjLYSFG
	/siDpC3mOjeX3sBesPox89wEjvcQFuIe2PLh9rkMM2r+ABIiLUurTIA6CPbZg5cSVdXGgwSFm06
	oTno+OjLeM4Ee3IRqR7Y2SmY+yasmKNEw6gGmqAzbDkjBq10pBuyFnG8PZJY7vvGQmkuTArtSwp
	jXg0BfFZoVZWxv9Ui289l7xJpMJq6xH2gyaSbaOO+fYMGpGgBh14ox8OSRey5KuLOMFZpIxeq5y
	gv6XAJ1c5dxQfFynlqo6x025CXh1b/0GIu8omMeL2LUUl4LiI7QYj6aW/mrdavIxofA6ytSQPdr
	hHDj3DpdraEeDy4lE4Gu4mB5GmTPe0DQxtMjvxkSJwbDbASDCKPyfDPSAJEHc6p0HqnbPuXiM9F
	KRaw58gfjyH0hGfOuXFsyRG6umLaiqzYJAmg0VGSI3viPHxTn/MD92HD7x9X4Oezf0dCrW/4ZHF
	LO4fGXsw1Tj2EkkEC
X-Received: by 2002:a05:6808:1646:b0:496:559d:5474 with SMTP id 5614622812f47-4afadfb0140mr961793b6e.8.1785878860975;
        Tue, 04 Aug 2026 14:27:40 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4afae7c50e9sm451659b6e.17.2026.08.04.14.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 14:27:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 04 Aug 2026 15:27:26 -0600
Subject: [PATCH v8 3/4] arm64: dts: allwinner: h616: add PWM controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-h616-pwm-v8-v8-3-db37ab8624ae@gmail.com>
References: <20260804-h616-pwm-v8-v8-0-db37ab8624ae@gmail.com>
In-Reply-To: <20260804-h616-pwm-v8-v8-0-db37ab8624ae@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, 
 bigunclemax@gmail.com, linux-clk@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

From: Richard Genoud <richard.genoud@bootlin.com>

The H616 has a PWM controller that can provide PWM signals, but also
plain clocks.

Add the PWM controller node and pins in the device tree.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 47 ++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 1598e86259ab..90fe56a1d3cd 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -281,6 +281,17 @@ watchdog: watchdog@30090a0 {
 			clocks = <&osc24M>;
 		};
 
+		pwm: pwm@300a000 {
+			compatible = "allwinner,sun50i-h616-pwm";
+			reg = <0x0300a000 0x400>;
+			clocks = <&osc24M>, <&ccu CLK_BUS_PWM>;
+			clock-names = "mod", "bus";
+			resets = <&ccu RST_BUS_PWM>;
+			#pwm-cells = <3>;
+			#clock-cells = <1>;
+			status = "disabled";
+		};
+
 		pio: pinctrl@300b000 {
 			compatible = "allwinner,sun50i-h616-pinctrl";
 			reg = <0x0300b000 0x400>;
@@ -385,6 +396,42 @@ nand_rb1_pin: nand-rb1-pin {
 				bias-pull-up;
 			};
 
+			/omit-if-no-ref/
+			pwm0_pin: pwm0-pin {
+				pins = "PD28";
+				function = "pwm0";
+			};
+
+			/omit-if-no-ref/
+			pwm1_pin: pwm1-pin {
+				pins = "PG19";
+				function = "pwm1";
+			};
+
+			/omit-if-no-ref/
+			pwm2_pin: pwm2-pin {
+				pins = "PH2";
+				function = "pwm2";
+			};
+
+			/omit-if-no-ref/
+			pwm3_pin: pwm3-pin {
+				pins = "PH0";
+				function = "pwm3";
+			};
+
+			/omit-if-no-ref/
+			pwm4_pin: pwm4-pin {
+				pins = "PI14";
+				function = "pwm4";
+			};
+
+			/omit-if-no-ref/
+			pwm5_pin: pwm5-pin {
+				pins = "PA12";
+				function = "pwm5";
+			};
+
 			/omit-if-no-ref/
 			spi0_pins: spi0-pins {
 				pins = "PC0", "PC2", "PC4";

-- 
2.53.0

