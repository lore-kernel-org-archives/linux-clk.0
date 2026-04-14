Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0018F31F993
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 19:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776196463; cv=none; b=NUQF9bPvprm8WygkCiI505G5/9X+42m4Fc+ikCTAC+dQvQWACTUMmrgQ2EJBfiAwzHgzfHo/zvUmwZDHkqCCWnUEa9ixH3PaRvmskD+6+C8cK0qHYoGAUGFkPFqgZCzMKPh4k0qIyK9H3OpgFzoHvoT3uPk8nY1uLoEvNk8nOQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776196463; c=relaxed/simple;
	bh=LSn3UpWfwQWxClYk23NT48+QAIlnEKcXKy1WIK6ir8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t8rUU1BQnBCZgfWVU4vCtTtMptF4yexPz/kHFc8E4BtifAtsdkVzdjOsQjvqN259+EJYsw2FF29XyTQkRJOVfJJL1RSeS2bhvGusJ1/SWT0KSt391v0iEIm3Tme41Mzr495I+vD5GPYv7EYK9/U3J+S+WrnGOOE+VEiCyNsutm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sCtH/v26; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sCtH/v26"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d7213b6ebso1770516f8f.3
        for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 12:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776196458; x=1776801258; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rx6Gs/k39gM6qSQMBZbg940nHO3jpX+P2ASmGy0OCbE=;
        b=sCtH/v26SF3aRH3wg4yn/Z9l7W7XTfUo9sWilkhoe0nF8pdzyOiOE42lhDEGjwcT6D
         IGSkXKkkRriIKMKZ/iSlZx7RCZreZqcO7LUv6JFc26vmZTU85afvrzWBuVXbK0PmrT30
         RCRUTWDsjHm/GRo70ERW0TtHfron+pGGZC+EHQU3W+S4ZIbzs365m4JQStyI7cSRS3GL
         4A/Wt6ITLEWHX8Ljk9Vcd7/IPpwPydRz8UkV0GqCQuHv4RvH/eqnwYvjivW+jftCF75M
         u3uJT7+sKeRVjKvOwaR+whSTXCkWxUB2DnApn6VPlbf2GkkdTbRIEBWJ7qHhmmHBoj1z
         EweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776196458; x=1776801258;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rx6Gs/k39gM6qSQMBZbg940nHO3jpX+P2ASmGy0OCbE=;
        b=FXq8lwJrckQhVSOxfa/soWk8YoGNEGpZfgb9d35Clkocg/t5sFetDNqLjS8xEqgNcO
         +Yu3COGTid14u/NsiRmlZF2cZNkiZjiVAMlGHUlkQYYiUz482AM1MmgIGg+COODrwaST
         bbW8w0KX3vK/yQDrWPueU0guApprYb7efBGbnhyupfLeeZDYYb08TbL1S3pUedreZj/E
         RRjNOcMWdR6HFrUDl+n3PHclbSVas0yLpTULMAOGsySniH/BrQZaVtcd+UN56P1bMg77
         LM5Y83tgrJo3BjCpnRT+z0MtRX0L57/b9mVXUJDPnbyzzC/PrF8lOtgVlhVdkAArWXlg
         Zg+w==
X-Forwarded-Encrypted: i=1; AFNElJ+JmmdJVlZit6vDPmeuNLoiBfik5VH1BsX+iI4S4X0M0mc7NvqTnoqGgcqur2wiKcJ51qNK/VSRpRo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKViUMOUF/AXs0yWA4/+BPTc9NkqslGBhM/RJbzguv2UtXrfKg
	k1E5200tglL4x6D0ZCtAIjRhz0lpS+a0LfwamkntMGM0gHnymgA4bLPm
X-Gm-Gg: AeBDiesXTytdWwkaBLEqsDJO0mzPsdZytHPazrEZFe7RNy97rsuBaGjeEPZlYEjcJ90
	gKel1TuFd+h1/pSZDy0+PNEEPpUanaD/984lXzA5zC2+IorVXgrH3EOLpLmFbbTB1S0dh+XELs4
	ICU5/xMqSAiyasK1Ioo5a0lwtNnL/e+B2Y2c226F8xl4p3eUjQj6vsdqNDXwKHIfopLZ3DOgb6O
	o+ePPaz6AndfoXda8IB6B/GQM8TqNk3+j1mS6W4FZJ0rOxZ6CcjRrgqDg9bApSCVAdxtrIqxP9s
	Qw8twXS7LHm547waXc/1GfVuOXh7kZwi3ePIrmNcgkbsEgt91euqlt2gJWomErswnP0jQ7grSST
	7C2NBb10M7HGNgT8WOvuMG1nkw9xbXwDn5xrCUIB3oFeKfNi1x+y51JXs7EyUFoEMvL0JD+AvOt
	whQA4SAGWpsDyE6lCUrHjj8cTsHEY696gdFvXhla3+rHi9L/lYFPCC2v4+GL6ilbZb6dV8vstXt
	UnlWpAG+r6BRzEM7djeBfY=
X-Received: by 2002:a05:6000:2211:b0:43c:fd92:f432 with SMTP id ffacd0b85a97d-43d6425968amr29336493f8f.2.1776196458135;
        Tue, 14 Apr 2026 12:54:18 -0700 (PDT)
Received: from [127.0.1.1] (93-143-58-160.adsl.net.t-com.hr. [93.143.58.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d7400708dsm25595266f8f.25.2026.04.14.12.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 12:54:17 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Tue, 14 Apr 2026 21:51:53 +0200
Subject: [PATCH 4/4] arm64: dts: marvell: mmp: pxa1908: Add reset cells
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260414-pxa1908-clk-reset-v1-4-94bae5f3a8cf@dujemihanovic.xyz>
References: <20260414-pxa1908-clk-reset-v1-0-94bae5f3a8cf@dujemihanovic.xyz>
In-Reply-To: <20260414-pxa1908-clk-reset-v1-0-94bae5f3a8cf@dujemihanovic.xyz>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Karel Balej <balejk@matfyz.cz>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4013;
 i=duje@dujemihanovic.xyz; s=20260328; h=from:subject:message-id;
 bh=kl4so4YGhRFTk6k5KZvqqawzD5p7cMzaSqktF31UoyA=;
 b=owGbwMvMwCW2z0j3+uHIyKOMp9WSGDLvzU68sktuSvCp0Ohk9bsnNbry6xribDI2aM+cl2Pgp
 3nYbqp/RykLgxgXg6yYIgvzUrlLfKnhEx2KbJNg5rAygQxh4OIUgInwVjIyrF5ZvTbw2TfG8PI7
 h5onnri4Yu+G38v4S0qOBslK/zY6xcbwP+kd5y0Wl+rbMmeufLL9vP7LaeFZmddqyiocpaIVbuq
 /ZQEA
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=9BD463017690089DAA8DC266275F544B3B1B4792

From: Duje Mihanović <duje@dujemihanovic.xyz>

Add the newly implemented reset cells to the SoC dtsi.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi b/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
index 5778bfdb8567..05b56a759e27 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
@@ -132,6 +132,7 @@ twsi1: i2c@10800 {
 				reg = <0x10800 0x64>;
 				interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&apbc PXA1908_CLK_TWSI1>;
+				resets = <&apbc PXA1908_CLK_TWSI1>;
 				mrvl,i2c-fast-mode;
 				status = "disabled";
 			};
@@ -143,6 +144,7 @@ twsi0: i2c@11000 {
 				reg = <0x11000 0x64>;
 				interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&apbc PXA1908_CLK_TWSI0>;
+				resets = <&apbc PXA1908_CLK_TWSI0>;
 				mrvl,i2c-fast-mode;
 				status = "disabled";
 			};
@@ -154,6 +156,7 @@ twsi3: i2c@13800 {
 				reg = <0x13800 0x64>;
 				interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&apbc PXA1908_CLK_TWSI3>;
+				resets = <&apbc PXA1908_CLK_TWSI3>;
 				mrvl,i2c-fast-mode;
 				status = "disabled";
 			};
@@ -162,6 +165,7 @@ apbc: clock-controller@15000 {
 				compatible = "marvell,pxa1908-apbc";
 				reg = <0x15000 0x1000>;
 				#clock-cells = <1>;
+				#reset-cells = <1>;
 			};
 
 			uart0: serial@17000 {
@@ -169,6 +173,7 @@ uart0: serial@17000 {
 				reg = <0x17000 0x1000>;
 				interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&apbc PXA1908_CLK_UART0>;
+				resets = <&apbc PXA1908_CLK_UART0>;
 				reg-shift = <2>;
 			};
 
@@ -177,6 +182,7 @@ uart1: serial@18000 {
 				reg = <0x18000 0x1000>;
 				interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&apbc PXA1908_CLK_UART1>;
+				resets = <&apbc PXA1908_CLK_UART1>;
 				reg-shift = <2>;
 			};
 
@@ -188,6 +194,7 @@ gpio: gpio@19000 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				clocks = <&apbc PXA1908_CLK_GPIO>;
+				resets = <&apbc PXA1908_CLK_GPIO>;
 				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-names = "gpio_mux";
 				interrupt-controller;
@@ -215,6 +222,7 @@ pwm0: pwm@1a000 {
 				compatible = "marvell,pxa250-pwm";
 				reg = <0x1a000 0x10>;
 				clocks = <&apbc PXA1908_CLK_PWM0>;
+				resets = <&apbc PXA1908_CLK_PWM0>;
 				#pwm-cells = <1>;
 				status = "disabled";
 			};
@@ -223,6 +231,7 @@ pwm1: pwm@1a400 {
 				compatible = "marvell,pxa250-pwm";
 				reg = <0x1a400 0x10>;
 				clocks = <&apbc PXA1908_CLK_PWM1>;
+				resets = <&apbc PXA1908_CLK_PWM1>;
 				#pwm-cells = <1>;
 				status = "disabled";
 			};
@@ -231,6 +240,7 @@ pwm2: pwm@1a800 {
 				compatible = "marvell,pxa250-pwm";
 				reg = <0x1a800 0x10>;
 				clocks = <&apbc PXA1908_CLK_PWM2>;
+				resets = <&apbc PXA1908_CLK_PWM2>;
 				#pwm-cells = <1>;
 				status = "disabled";
 			};
@@ -239,6 +249,7 @@ pwm3: pwm@1ac00 {
 				compatible = "marvell,pxa250-pwm";
 				reg = <0x1ac00 0x10>;
 				clocks = <&apbc PXA1908_CLK_PWM3>;
+				resets = <&apbc PXA1908_CLK_PWM3>;
 				#pwm-cells = <1>;
 				status = "disabled";
 			};
@@ -261,6 +272,7 @@ uart2: serial@36000 {
 				reg = <0x36000 0x1000>;
 				interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&apbcp PXA1908_CLK_UART2>;
+				resets = <&apbcp PXA1908_CLK_UART2>;
 				reg-shift = <2>;
 			};
 
@@ -271,6 +283,7 @@ twsi2: i2c@37000 {
 				reg = <0x37000 0x64>;
 				interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&apbcp PXA1908_CLK_TWSI2>;
+				resets = <&apbcp PXA1908_CLK_TWSI2>;
 				mrvl,i2c-fast-mode;
 				status = "disabled";
 			};
@@ -279,6 +292,7 @@ apbcp: clock-controller@3b000 {
 				compatible = "marvell,pxa1908-apbcp";
 				reg = <0x3b000 0x1000>;
 				#clock-cells = <1>;
+				#reset-cells = <1>;
 			};
 
 			mpmu: clock-controller@50000 {

-- 
2.53.0

