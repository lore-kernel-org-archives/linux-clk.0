Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE103148D8
	for <linux-clk@vger.kernel.org>; Mon, 22 Dec 2025 10:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766398952; cv=none; b=jJX6uXEApIha3STb2BdpkM4WTkSm5x8hfDH4rLYn707rgcI50lpLZ0P9btJb1NgzpwhrQwa8osKVQvsZrzVBlBkKI2P5nPNn2lHJua3+pQzHnTlj64+7g/HsuCNLxshP7DuuOwbvH01l0r7Cuk+ndZTdoJ8m5tg/q5o3kYiFuUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766398952; c=relaxed/simple;
	bh=h92o4zwYNSX6815UCmoJUrl3OjU4KjoLxMi/xiWmdfY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TiBITMXGAvHprg+YcUX33Lvve2PmRgss7gJxXhrNSoGzuWw9PDWOrU8h3PnkBZVCQpoxbtfqWZE/IcOGBnthoiieUaxGy+fotGFY3T/7txG/fOqoc8V0eh/ukPCxH4zcptWKKHVDPq9SuZFJRxzWC/zEIYycbB0aR4GzJnvR+Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CogELlIc; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CogELlIc"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-477632b0621so23683915e9.2
        for <linux-clk@vger.kernel.org>; Mon, 22 Dec 2025 02:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766398947; x=1767003747; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Ju9j+YC1WJ2vWa+GZa2BXWls/TDlfesLoKVGyWNUzk=;
        b=CogELlIc2ubH7pzt5KZw4qooVsYZdBXQUe3lJYdN4F9KUoAmQtvtKv3R1agUgQLfNH
         NkJ7ml6jj6x3vxA98lLhg3XI7IK7j/Mm0DFW3A06v2xZWgSBvb7StWvcrRTli0XV/YiT
         +RV2NwLFfvMHnGZrXhyxtbNWowAejSIjGj5WR1aqmSK9T2/ZQCPXCrUi+ZqjN2ZJw/E0
         DluNspXNJmZZzIs/JjOmjlpyhOOz0URFN68UwmdbVSlVFErRYb8BIa88IYpu8xCrn3Nb
         efYDbo2o23MxvPCB2rJ+Pv8NNcOeAjP8AaVMaqoRrzDAF8M0lLMdQAa4DsyC3mPYHcEA
         Ybhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766398947; x=1767003747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7Ju9j+YC1WJ2vWa+GZa2BXWls/TDlfesLoKVGyWNUzk=;
        b=QU6HR5D+zkOne6lQKVVfaR62CNE0LBtuodkpwRm/aDVarLfBF1V7UnS83LeS2L5xcG
         M4dcVCkfGn7FfKGF2exMqtZOD6KP2aS6NIDxjq8qMpaT/vfY/Vf8ojxfqt09RMTxM9BZ
         9gcJvPl0QAtRje7NqfKVmIFrepZJ0dxS6gVWzb6lN64sC5b+0l4YALfcBKuSW3A781O4
         pWfPyhqO8V6DQWcwoyEl/P8vJC1Z6GbuqhYH3snFQoYXQQU3NjA/lPp3x3EMPIVeDrAt
         D0pwbv3aplPltxWPm4YCEj9weD8z00+A8JBAxdeV9OngHYzptov8HrvdrAHQYkq6f59V
         YP7w==
X-Forwarded-Encrypted: i=1; AJvYcCUqzKWN6kgWPc5umYAx2VjC1VvxoMjel4oXX2/Nv950hH47EBi/4EdK3L3wL/q+uBcAzT9wfSXub+M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxU/t4xeGDk3yYBEE/Ma+LAGDs/UtrKASTxa6NqxJQVbo9h1EAs
	Zro3nqWB1mp/4ohtXgLlK4OjY+g6SxDs78fAhLKtE+AVByMYDFu0X7tMs9RiFcgjq2w=
X-Gm-Gg: AY/fxX5Cg+A82xOrel+NjfSIeWhtuKhaJ1Xt9dQkhwBOGVTitiOCswtKZvC+ASVdbQB
	LNNGPuxTkfaaX+sIriISafcnMLvfX4kXSJLchdZD4jAswuvJLWYKknn9W8RQGMXV7CFw57GUJh/
	WjPRhmugDCmq301cycGm5JEfpDdCPnitIjk+CvyyLjj55KVSkupw9JRRmj2LQ1I5qFWJnlC8qQs
	r09dgF7T0hG66VI0K5w+Vq4XLIQ7NfmZyLjp+0rYmNpZzrfjcSw6elMayYFRO/hZpZkg9kOqW//
	y5bwX7DJnCalAOsz5MEosiMWF6/yQGwY78fQEwalR6zythCuzRKsl6eK1/dtTA2cEkKoG066yIk
	8jddMeGwtNuccrkzgYBXcfzKtuO3ItAVucD1QxDFVfbAk+ZhSuUwl+X10u1001Eh51FuZrQ5ogf
	6VczWcY6Cbjv95E73sx2MQfRdn7gxOyH3AYCOiJwc=
X-Google-Smtp-Source: AGHT+IGBxQCC0mhYfZCgatlSYEwZuZIabwAahMk3vvXTWTdnnwMS9fmadg7QIbWO/xNvrGz/StfC2g==
X-Received: by 2002:a05:600c:310e:b0:479:2a3c:f31a with SMTP id 5b1f17b1804b1-47d1956eb70mr105896795e9.1.1766398947266;
        Mon, 22 Dec 2025 02:22:27 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([150.228.9.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82feasm21082813f8f.24.2025.12.22.02.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 02:22:26 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 22 Dec 2025 10:22:13 +0000
Subject: [PATCH v7 2/4] arm64: dts: exynos: gs101: add samsung,sysreg
 property to CMU nodes
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-automatic-clocks-v7-2-fec86fa89874@linaro.org>
References: <20251222-automatic-clocks-v7-0-fec86fa89874@linaro.org>
In-Reply-To: <20251222-automatic-clocks-v7-0-fec86fa89874@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2739;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=h92o4zwYNSX6815UCmoJUrl3OjU4KjoLxMi/xiWmdfY=;
 b=owEBbAKT/ZANAwAKAc7ouNYCNHK6AcsmYgBpSRvdNO3GTfrxdRIea1vh38XYzq9WEqdQZckeb
 4xI+2khpGKJAjIEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaUkb3QAKCRDO6LjWAjRy
 uo3oD/jFBjbVbdVJydY7tkVyN9ygLHX3QF9rpzd4UmrLTUYFD1RJwAoeMMQnlvrkfbTPIvp/GSz
 XYCj3/HVMkmuk2FkhYnHnlptQaeJoZ8TDu1jlM+s4JpfXTpw86u0+EmKxkyjNIJDTYToIcWMdy7
 u4Qu2ulI6UdWSXz/5eLU8WH4vBHRVbh9bpsS0bO7fOjyl4mrUBDf4V1WcEFDjHDpGZFjwh5DUgn
 yUMM2RoKkqMSGMKMfllmg0rvTrcGr78IPmLBWvCLHBTGiVANACDt8eL28rlTC3ni+s6tIr4Al0d
 JeckRSnvrDFtNuZi6XS8BWnvoT9vB25nhH4I0mwWpMCZrZgRZxWDAnBIDYdJ+5dh6S9KARYVBzl
 mbyC4IpNvktltXeh12U0ParJEUuyckbPWm5sLr9yN/Ira31hqc40QXfWqhoNYN+03AZ6Stq+bIn
 XUMPiedabopU2I4zh3Fb8rAbGqpLKORm6OZEseO4Za3iuyvgVoupINFc6tIOV+ITyytUZT9QaZK
 I0Tq8Tzo5IcgffLEw27BFETG6N8xZ/4n1XpOrUnVx03fOElYVm/iTb0GFWdqG5B3s2oPAcC1hei
 2r98BF0PCj59lIAnHQa0y+DM+Y3RQ/lbfVDGAzTUYv5WLfZyx5d47+xIt5+s1UNQBRqCXwYBrE+
 /+tVrlBnP3c4/
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

With the exception of cmu_top, each CMU has a corresponding sysreg bank
that contains the BUSCOMPONENT_DRCG_EN and optional MEMCLK registers.
The BUSCOMPONENT_DRCG_EN register enables dynamic root clock gating of
bus components and MEMCLK gates the sram clock.

Now the clock driver supports automatic clock mode, provide the
samsung,sysreg property so the driver can enable dynamic root clock
gating of bus components and gate sram clock.

Note without the property specified the driver simply falls back to
previous behaviour of not configuring these registers so it is not an ABI
break.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v4:
- Update commit message (Peter)
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 9b38c2248016aa65293c0abf9ccaf20857d89693..2e25eeb0c2590b99ef98c7bdac3caa0c34161706 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -578,6 +578,7 @@ cmu_misc: clock-controller@10010000 {
 			clocks = <&cmu_top CLK_DOUT_CMU_MISC_BUS>,
 				 <&cmu_top CLK_DOUT_CMU_MISC_SSS>;
 			clock-names = "bus", "sss";
+			samsung,sysreg = <&sysreg_misc>;
 		};
 
 		sysreg_misc: syscon@10030000 {
@@ -671,6 +672,7 @@ cmu_peric0: clock-controller@10800000 {
 				 <&cmu_top CLK_DOUT_CMU_PERIC0_BUS>,
 				 <&cmu_top CLK_DOUT_CMU_PERIC0_IP>;
 			clock-names = "oscclk", "bus", "ip";
+			samsung,sysreg = <&sysreg_peric0>;
 		};
 
 		sysreg_peric0: syscon@10820000 {
@@ -1217,6 +1219,7 @@ cmu_peric1: clock-controller@10c00000 {
 				 <&cmu_top CLK_DOUT_CMU_PERIC1_BUS>,
 				 <&cmu_top CLK_DOUT_CMU_PERIC1_IP>;
 			clock-names = "oscclk", "bus", "ip";
+			samsung,sysreg = <&sysreg_peric1>;
 		};
 
 		sysreg_peric1: syscon@10c20000 {
@@ -1575,6 +1578,7 @@ cmu_hsi0: clock-controller@11000000 {
 				 <&cmu_top CLK_DOUT_CMU_HSI0_USBDPDBG>;
 			clock-names = "oscclk", "bus", "dpgtc", "usb31drd",
 				      "usbdpdbg";
+			samsung,sysreg = <&sysreg_hsi0>;
 		};
 
 		sysreg_hsi0: syscon@11020000 {
@@ -1646,6 +1650,7 @@ cmu_hsi2: clock-controller@14400000 {
 				 <&cmu_top CLK_DOUT_CMU_HSI2_UFS_EMBD>,
 				 <&cmu_top CLK_DOUT_CMU_HSI2_MMC_CARD>;
 			clock-names = "oscclk", "bus", "pcie", "ufs", "mmc";
+			samsung,sysreg = <&sysreg_hsi2>;
 		};
 
 		sysreg_hsi2: syscon@14420000 {
@@ -1706,6 +1711,7 @@ cmu_apm: clock-controller@17400000 {
 
 			clocks = <&ext_24_5m>;
 			clock-names = "oscclk";
+			samsung,sysreg = <&sysreg_apm>;
 		};
 
 		sysreg_apm: syscon@17420000 {

-- 
2.52.0.351.gbe84eed79e-goog

