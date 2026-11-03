Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695242;
	b=Rm0FWNj4+QcO4lGM4wz9HDrD8ohjtz/Jwgra6DIyazp7jeooAXryrCnIUTlXOBbbX31o
	 xJ0dJDuH1ikah+S0xfZ1vnniwkpr/cKyyQs0jLc32qe5b6VeCrW30prrle+5opeA2HYO4
	 kk0EAJ4E/L9h17Ja+9iowAvwHBQ7IOYiVennxMDLRaSYgGbZzNAbu9xgZAKq3xoLnbrnU
	 fAYZ21T349sLyJUJB/TVZIHEvsOWIgvpk+TxG7bR9iXPy97diC3z/j5NPk55F4qb7cgEJ
	 G9GyL5Z9gQRuuzCHl8JeRAEVyYsQnAJ7Hi0oVuUXdOBccL+JmrCgd7IAH3giCGODbGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=eGQwnQ2neaJQ1jlowOf5tkGQBWxndnEwh30xNQGSIkQ=;
	b=PLKPlhFHDMo6cw5uVe4QbnzV2NGFq8XC1Kq2weeAlDz7mH+PPrXY+0+ZKjjUJLx72Kf8
	 pZ/vpZCBIOg/T7Q+wPLq4cURtDz4xMv10HaD6OP0wUdDkk+e6q2rNKnnxtMahX2BammEQ
	 OFbUxd8ZonFabMn00SFmGy9bR3+rSZcTl1kcjXZ0H1irHauCJUlMs3XWH0ksmyONhljzW
	 MPLmC5eS8UrJnh6PGgYFXKmgmWdvYXRXaVycCfYOQULGW8gg80oIsH+jYWychtAeNPg5x
	 aIZrrt5wovnHt+evbOxD4P1gDlpnbXYyn9daEKe40DULAk+V/Crtm3kucqXf1Pyu3CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rVBCXhox;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9358A606B6FF
	for <linux-clk@vger.kernel.org>; Tue,  3 Nov 2026 08:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9358A606B6FF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rVBCXhox
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6de1ca1b05aso2877473eaf.0
        for <linux-clk@vger.kernel.org>; Tue, 03 Nov 2026 00:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793695240; x=1794300040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eGQwnQ2neaJQ1jlowOf5tkGQBWxndnEwh30xNQGSIkQ=;
        b=rVBCXhoxhmxcS16Rq20RgtufsPsPsfPY/X4cIh38MFyg3Ep65ewQXsub1G2U5YcDmy
         ZCf2cwSJyWoRmQtmJZSwBlslK7OPJkX3Up1+7lZeQdfp9XFh7Nu/3Jc/0P7ZQlGA1Mum
         fhlONm9vM5YxgiP0e2aX6ob1VgnC8beVvVfjyibq/72fwBpEbxSzYIQF/Bp3476FaaNL
         ZPkd4y4pAaX7D/QPZCUxpFtsPpoEczYnzQkZYVUAemz2pwzhDH+NFRLovA27zeoMpVnd
         OWNy84whZBEoGPR7Fu99JC+wW0/tWJwTCKjBjxXrnvDqWXUgqiw/v03HbsGT55OV4Yld
         Zbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695240; x=1794300040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGQwnQ2neaJQ1jlowOf5tkGQBWxndnEwh30xNQGSIkQ=;
        b=K93UXLZi2HlCvY4R7huVuLIyy9xKg+htCaH3Vt0Jy53W3HUdIx3jL+slafUA9p/6Hq
         gmWVXNVCsmZSslHSQSn5saOoFWZZo41Taj8GOxMfm9xi+TiJ9QR8P4z7L6IHVNClFaHY
         X+qTkL5Gdex5FhGFNA9a/vAKL5Iz7WaHGbnTUcqzPZrPw2tyriZt6jvOgFpL/PpM80RW
         N2zpMZG6C42h+rJMMdpmsvm5xRi6N16t06VJ1KLsk0aTAcE9Mc19zVKUEpW0DeLEh5IB
         Lasf6wT1oKKfSP5c3izgWrc1yfCM0U5OYEXRHVpe0qlK7BZJ05ZpzDabmjJhUsyuscIy
         3Deg==
X-Forwarded-Encrypted: i=1; AKwUvBypSScHFZefPtWATNe4lVqOSR9DCJ7+qqUDpbRmIxAYmgJ5hDTO0Rt0nboLiu9S9eiSCgB9uUIQc7Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+204nbwUnN5RooI0vGVfUHylxX8dX2h0xur4OgtZe63SEGchEZ
	zO1X2TCFfHQLCHAoynAxpAHu1r+B237IOjeDU1liiXCMSaBDPv4ndmBU
X-Gm-Gg: AYBFou1VOLUvXyGMkq2K78r2Barf+q57TtiI+RHui2WX0nB1K/thKswZKNkmlkC8Pso
	+rMjJoU2PmLkoeC3oRMZzhWF1CkX6++7dE6Gdk4OzTmy+lyMnPHnFNfUwGfWWxkS5hNA6bKzf/W
	fluAn2wtpYkXL3IgX2n16Ye15C7AH+r+7eae+zR4fj+mxHSYT9awo6zA00eFi25dOhzHLwwrx5G
	/0gppmR8lfM4a8/IKPZrDRycYfhHrsgGu6H6vbwa6AXD0tHHSAneFtzIeflwQrmt+Lj+5Fy7IN+
	qqrQaks5vucOJLME4c0LygejSQ4NfgjEgzvx/y9+5YP7J3T/CvX/GQ15Ph+Pv3/0PDQRyLpwfev
	K6ySa69AM0VSII3L2kute749mnzjKkDvLg3j9hRA//nyMoEdALaOH06RLCponfM50m4wK1Myg+s
	5mJ7yV+oCE/LznFLZY1hNX4avy9bFxP68MUEdpe3dwG5Mfk1M0vcnPL2Twqj3XnmmC1Wpv0NZ0i
	u/xUxoy4j24dNIFVTZmFR7x0U8lBYGLqXIQFT76sXUsuKH5wgaan//BvUlKBqk8AV4NQMBjNdTF
	oiwuB2tK5lyCSj1l9KfEfebwcKflVa/i7rh8GlUJRPEkRV0v40bOoBuYags1p1bNlJPs1R+HTMP
	hRl/Alj5PLIfWvUlmShf3u3q3E1op8BhzqnTznLVMTP5SrSuSTFrQNVi4P6VQblM6nC/FQ0Oea5
	rLZWPGjDshsEzjxHutyQ6aSAxpr8zK9Zv503JWekFl2aO94IW4WtKKjgUpRSappfW5+fmX5jbi
X-Received: by 2002:a05:6820:221a:b0:702:778c:ec5c with SMTP id 006d021491bc7-714f29d36c6mr6837555eaf.53.1793695240569;
        Tue, 03 Nov 2026 00:40:40 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f3081097sm10520397eaf.13.2026.11.03.00.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:40:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 01:40:29 -0700
Subject: [PATCH v11 4/5] arm64: dts: allwinner: h616: add PWM controller
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-h616-pwm-v8-v11-4-07abb59575c3@gmail.com>
References: <20261103-h616-pwm-v8-v11-0-07abb59575c3@gmail.com>
In-Reply-To: <20261103-h616-pwm-v8-v11-0-07abb59575c3@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, 
 bigunclemax@gmail.com, linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
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
index c6b3a3f8359a..b6580f0c6e0f 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -293,6 +293,17 @@ watchdog: watchdog@30090a0 {
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
@@ -397,6 +408,42 @@ nand_rb1_pin: nand-rb1-pin {
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

