Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793820310;
	b=0fqS2VzYyRtzZswBjuHfFpkPSibY0AGHJ0RGnJj+ozL2XlCqVdjLE00A3PtzVZmHSQC/
	 +BrXHvmoQqa5MmtYz4CanFZ8FEEX8/Y82im1p68N4u5VHGWXCnl7uUP/BVUdKyfvrvp8s
	 uPppn2D1nnJoJT0s6v5shw8zriUXOt7WPeot+NjD8E3yu1S/zzIubJAWMosNXCNnT/SkS
	 Ty7sL02HPxnP4TLZ76/WLHtABygDggUITSV/TqmX0yW8hvswSZSowhSDKpBuxKZ07wYiz
	 N9+wJm7nzpK/vLjLeQJ8IOSDz9tdU5inJNfGiXEFyYWh8ZRPMwO6W1Toe4IIWy/wHvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793820310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=eGQwnQ2neaJQ1jlowOf5tkGQBWxndnEwh30xNQGSIkQ=;
	b=OGck0/l6kkJG6QUv0jcnrXEKEssqp3giSnTSTIL/Z4uIVAvTfa8kgB/bcpNitK45ZsIR
	 Ee5+XoA4Gx2lqprS0i/PAGC/k963nk4gCv+5rj6hRJAdQO2zkmhAfIjQV6JhXtixmaEGm
	 BOxA+9rFtNG32mOpURVb92TKR87sSGhKpfPvrPkUZSH/BRgOM5/AVqD79mDdHN/UgPdka
	 fYu8+mJ4fhmDTIQzcALZcQVTUbvO35iQLzZn22ddPXGLCFj6rk3cUFBZatPX3u9cROVSC
	 iA8XrxGzraVVZekE43wpPB31DKXBkg5XkjZJIvBVxtbvVA3+2VkaXSFPrxGwXxfNiiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xlkBuxiW;
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C9E607F2B6
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 19:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46C9E607F2B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xlkBuxiW
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-70059e4dab6so665083eaf.3
        for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2026 11:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793820309; x=1794425109; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eGQwnQ2neaJQ1jlowOf5tkGQBWxndnEwh30xNQGSIkQ=;
        b=xlkBuxiWK9mHFZ6iN9g5y0fn16X1yn8UtEixLRdZoFQcpS9PdMwLdnlMrc4WbhdhAk
         4SF8uJyzjT/KxvKs9sPQi70xklj1OFYTi9nUPICSitilZ+yxHJ50ss9xnE+zczj3FAJi
         J68fk/5fDuCYRUhQGTYbx+rrKWWtyHiczRhwTTbuCPgH2qnG1rmrjDb04FqMblkYZ1mc
         vicUzM5h3sq06bE8GkOhNKzef9nYi1s+jJTe/76FuZLPTctqdFP+KswhdQJuyBiyYjip
         KaREhMZd0iFR64nR/VgRuNUYXFNoQ3HqY3iAcnB3p5yGnyge/AdHM7M/JCQBb8e8vQ01
         QTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793820309; x=1794425109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGQwnQ2neaJQ1jlowOf5tkGQBWxndnEwh30xNQGSIkQ=;
        b=YZoOFH6m65mWEOSc7QZEzKoXtySSGouRfevwapv5TQKusiEEWdti1/ePt5/iuDaE5j
         Ft/YpjjKT9BxpVfzHrJwrsufFn4dvF0OXXlrHU/102cmMzYBj0U8a15uxOzDrL1Q1QR8
         6MzuCChuOdT0Lov24VMFORMG6TaAshH3J7C+g3pqiIa1HtcBJ1zSqsOUZwgGITFPwnqi
         LII4F6XTsyJRsKhH9LTzTAWYW+kMdBPFJzGdjJDt2RaxxFihEtTbUE4URL4G2xN3lNAn
         G9I4ZxxY8AkdLQC5hYKitY8bpynLG9TQEG1k98PpUNTEcsAastfqyWGCaZDPEfScxjKa
         TcOw==
X-Forwarded-Encrypted: i=1; AKwUvBzFrHaGbwZO4FHvUSZ1HGk4FGXPQRcuoFW7Hod+s4oh6LVDT9jEgZVzf37njP//LnCrqkHzI/Mk+Dc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Xsc1pWwy0k54Mey6dqN09FRSfE7EzmpkRWsBrft/ydgFtNwpN
	LZrgUZ0ZFqFCFoA3KgqZSqBNK+xQekdcRhEoIveC+wkT7gsJQuXhmJ8M
X-Gm-Gg: AYBFou0bDcP7up5aSSEhuChVaUveWiTfIKG3Se+JNtsqegoU8YEAsUdYEVxtZ5KGfp6
	eg7s99l3O95HhjU3cSNgq3hOTShtYjSpHtLHR3cTa9WTOVywqdpaje+NTe8qEayKdhRf0+dkww8
	YtJJeW/ZZj6kAemYG9L8qSAOtjHUnl+twZ7A/iQFsY+FeTEXBijebMGufNVtlpIvDfkO5YroSgs
	NHVQ51nRW8ZWFdUP7ZmzdlPUE6j+9usPLE76tzk/K5LPluqg0iERtNmx1Pie3kafk2731moOh/s
	8xabIbg7JMURHR23w+G+wb2SujSPPX04fOHtkPEWiQRZGyOAFwxfeZLYsjOwfIMTksC3nZH5oXF
	d4Pc11ZQya0oENGMN+zuPlXkJ1cR13UYBmXVA/wMjv3BuVDlHnoB1gozuBP9a9MIZZW2uZH45PL
	TppfhwY1Gr5WFGc+mMISh6n2vCME/VLIYngXa7byeSvacE6xsu7Uv4eX7iSjpfCiokuwoJOdEUt
	N3jOazwisFTMNsWCZMkljSC048y0i1QGaGaX+akrN6DlnEEiR5x5Qm99MX0v6MfCRicvim1KfB6
	z9tKnXlNz/pDS3wMYroGq2PEru8hhGKBDoDix/6Emm7K/oW4TKGFDqISkTUDPuO8m50PlK40OOl
	U4C4Abm923brvVpJ0M3L2KgT2RG2vQ9LA8MGkKAn5WM99ERyMAycaaVaBAlmbQ108covPvDmYi4
	KcIHEbBYRvVzyGeSOCtJtXIF5hdjrWdr09+Fgq1cEsdYozKWvQ0OWD
X-Received: by 2002:a05:6808:2218:b0:52b:7641:33a6 with SMTP id 5614622812f47-5640deea502mr12233182b6e.14.1793820309111;
        Wed, 04 Nov 2026 11:25:09 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9c7bbcesm2328723b6e.1.2026.11.04.11.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:25:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 04 Nov 2026 12:24:54 -0700
Subject: [PATCH v12 4/5] arm64: dts: allwinner: h616: add PWM controller
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
Message-Id: <20261104-h616-pwm-v8-v12-4-8ed39b0dba69@gmail.com>
References: <20261104-h616-pwm-v8-v12-0-8ed39b0dba69@gmail.com>
In-Reply-To: <20261104-h616-pwm-v8-v12-0-8ed39b0dba69@gmail.com>
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

