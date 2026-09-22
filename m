Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C55015A85A
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 00:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790035612; cv=none; b=CodTp3jdaPS5rsXgWZfNdcv7W+2XKSKUbKDKks5/idGfVG9kacB6sOviB24SoxIStbW1UgeJGdglCceacDnOQa2zixfFGTzIKOQ93i3JI3E7/sW6vXGtdOugnfDwaDW62Ll435lwVibJZnIhJqzsVS3NIrND8kwfI/adoGK2rEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790035612; c=relaxed/simple;
	bh=cxjDKZ0MA9VUms6JcpknLJlKdT7ZoJ5aaylgo7tCtYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CBykBcYe0Xo1Fjam25wx8NAObOMyT/LkpZyuKeEXuNwAi0UY6xZETinUlaqnD/adcq5ZWa/SssDBidjusjZJhAXKAePtUYMNoP/Spm1KqpibXnKlFHzzY8cMgz+mt6DhQdY2rWqcU8Zq3YbBHX/MzqyrQ+cxJQCWcVLE8GrvWI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3BIvN8Z; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3BIvN8Z"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-46accbdfb21so3741041fac.1
        for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 17:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790035609; x=1790640409; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FHj476tA2byKc8arhZaw8Ci81fHtdMiGqz0hVZIDFng=;
        b=K3BIvN8ZXhwBGh/bchwmAw3pbw7T2OJvYXmeHOQJFW95gOixgjGzaeTiCWez2GIcsZ
         dvtum3l0mGVupRLdCNCHSPk8wg4TI9HtWCIHzIILFLZ8w/CMyqty50OxoONoiWN9vilf
         lTifV9+xXl3DqBkFys7TgV50F1e/3Ms2fNyRT3ox8jRlss+aHSPeauxGUGY3REZB1Hr9
         H1mC06G77vRUPExHtcEuHToUIrnEYocbT4PFnJH1IoR/MKBpL798GHpL8fCxqAvjqrq/
         pr1JunWA0c1FsGs59Qq79knmn1kTAS822xFe57rXw1vV06YFS54Fhup+5acv4PpBQbOd
         1XkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790035609; x=1790640409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FHj476tA2byKc8arhZaw8Ci81fHtdMiGqz0hVZIDFng=;
        b=YURNemMOR4Ft055QpDE5iWik8n3O/wsVCeuR2lnvjHYmvbEjAvf8dB+D6dDUf+JsSc
         Ljd+FYrtTAz5Q0o0kd5t1Xds93Tf+yoWwBmSmaL4Hfro+QRJXK50Nh8lYyLqWd5cUNSN
         8SjvbBYjIV0mk8UKI4UgQECNAKdrFPc/hSARj7KJDHzm+i3a+Hnq/dbmHR+ZHSzt7L1w
         7wCR3wLOgUgKcw+3pzLtoG3Az5cZECdwtvYGlj/vQgfdvOaWoOos3SY5VaK0eMc4gbxC
         ZtV9foLN/ctZbr3gdDzRETHeQu/HSZzkiIbIeHNs71qeHZCkqWrwcgqfybmPmoaDFWUD
         8MSA==
X-Forwarded-Encrypted: i=1; AKwUvBzBLXFf6jWExziFgyRawbCdoOBtImKt0Y15YyseVYncmBvtLcHTUoasNx4nwp1dSOol0hRGKTIU47s=@vger.kernel.org
X-Gm-Message-State: AFuF++nMCEecTuTLBdE5z2Q4ByA9JWDKeHbSLI48fiIXW4RIENY1dH14
	+lFmawzz7NtpJDyOMY+WtQ/N+U3yBkmzUnwcWMAQGe2ygtTgsSCTSB86
X-Gm-Gg: AYBFou0t2Zrkz1FWv69YeonRt46dANzyLM7jBvAqTqSSYKTSOVlvdcHIv8Cszp0sLSq
	fRobK3jnoWqqExBeMSK88XGLIKg70rSUecTDg9oFUhBexS1/Pxw9h4QKjXULaUBKK+AIWVXVFjP
	+XFIpJd9A/8x0zxcYU6vggASttcLIqhQ5TPLrpbz63GHAb6mcPP0jKQI8NMFYlBHk3oJf+Gp7SS
	zzCbBWRhKqpIe2UWkMsLMI8hNtlTgve7OFEgA3/ub/2kxQLmc/hHvVcfblHv0KZ0ifCGG5BHQ1Z
	0GtbgZpeGySuoSZgGlmSmdDVH4c/9fDb/z17TSnKrndp3cyZtL8HcoVdG2cqgvnZ6ITuG4Y5wWW
	zrnLyU95DWBQFqmCJAkGoKb6xAQq61cyDJL6M6BRpKMdXTzpG0MXxvIR0l+GVquVOYbQ2GjL6Yr
	CcPOkPTeXUfyeFjOYVB9OwKPTd6h2gy5IOrZpwNnMZL0dItByUtrLZ1SN1+M0FKbAfnjiXZUtPA
	tCWJEkn9lgYoh01aww0+Uh357f85S8Eq3yUJKq3b5LHb89Ms/HSneYg6DNrBLpQRYnHY/EXP+Ha
	+3+/zjo/VjZkWj+GxArBWapzjGj0RTx9PM9QWf8QXQwPrRgA1DpFpxjFifElQytxyE89g4vnzMf
	z3G8E4oFNBfQeEkM0icSw
X-Received: by 2002:a05:6870:21e4:b0:464:c314:ddc2 with SMTP id 586e51a60fabf-486e4bbce38mr12349868fac.8.1790035609185;
        Mon, 21 Sep 2026 17:06:49 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-48f7280cf14sm801683fac.13.2026.09.21.17.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 17:06:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 21 Sep 2026 18:06:33 -0600
Subject: [PATCH v9 4/5] arm64: dts: allwinner: h616: add PWM controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-h616-pwm-v8-v9-4-37bec6201ff5@gmail.com>
References: <20260921-h616-pwm-v8-v9-0-37bec6201ff5@gmail.com>
In-Reply-To: <20260921-h616-pwm-v8-v9-0-37bec6201ff5@gmail.com>
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

