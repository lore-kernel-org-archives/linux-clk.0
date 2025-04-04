Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6E51F4722
	for <linux-clk@vger.kernel.org>; Fri,  4 Apr 2025 11:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743767832; cv=none; b=PSZfG2KJu9NZVb69veQXqq4LZcT1JnZ3iXBdHzOr4Pg0nRTe2EU+Ec77sysAihmTmYFLZCvAYFPN/mp/ySuGeK4W6HlguQqDacjwcheYX5KzzlSlVvJnRXLeVruJ0V0MjYja5hK9v8SnhUEsnP2Jdj8cztTBHsiNNRr6K0xiLiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743767832; c=relaxed/simple;
	bh=bQj/x/W9Ry/V3hdmp39LWSNOcVVmkCtarcvTt5OTXVM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LLdZFV7LWhL+9IsFBk4uiM7zlHiStutYOT7Pbi1fcowqhAI4rr9RCBSV57IgnaL2HLJc3LnGbJZEp6THnoz4no1ooRYDOOvJsvAGcRmibHrLuHijqeXTcNJ8BzMCIe3cRlaqXxwLDhYfEcztgPCQMs1OJOlp9hMdogogLaVATQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hZNiA06b; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hZNiA06b"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43d16a01deaso1615715e9.2
        for <linux-clk@vger.kernel.org>; Fri, 04 Apr 2025 04:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743767829; x=1744372629; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d106TqNSzkY12ISczNEwfjZ5zhpWhqK85bfmJ3moKtE=;
        b=hZNiA06beLwy8+fLoWXZekNTymYZOmLlPAaajLxN9YPDRFXGdEpMIpv3PUiGgUglHU
         EnzM1JWSGx4a2C515kKtGhvX3HO50C5YyGiPKpAc1U5Udx29H2hLE3gKMPOAVN8jmzlD
         Lpkv0VW9mWxZjjW97aOOsteFUvCm7Bo/eg1luM7ObMR799sJtlf0PxAeHkNciVqjAMsT
         JmLEH3zZzY0+XRhnb64yvnbNSnsTsWXgRijhwT6olGTDlzHm3GwxFC3KaeluQd1NJV9K
         nEHWgMyYIaTncs+ZXBAqFcWACltH0dDSMf6P+Hi1NG00JLMvt6WJLhfz7F8y/EELFuX0
         we6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743767829; x=1744372629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d106TqNSzkY12ISczNEwfjZ5zhpWhqK85bfmJ3moKtE=;
        b=gMJrq/txxeonOv19OJeVpgBSZZkMhW+tOscCM+VU5ZnajIu0RHK2tkMO+1d0F2F4wM
         X3XDS2JfXFZgOi347BJZxV59XpX4V+sOd+vMPIRlUUqwTorarb2ivj4AHGINyWiXWzic
         FR6UROmXpxLPgrarB+F98IlJ1SUAo4YVDyH3jVPzDgosbrHG6GYcHL7JPDxX/2YS0KKS
         74GVpcAOKe6coH2gVj8QjTsZq4RgN5m373tbk2N5lwxpojkYRaPHhbrNm99g3uoHpgqD
         c96q4bNipjLRcZBw71IL6Yy9JJloGoq8RR9HV0SsQ8w6D5rfX2fJ1zfIlnsr13SjNXXp
         4eWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwIQmHdcZdE2jeukgGmUaO1yC26AixSLxeZrupi+r5TBkWasNuEZGfUN8kx/rhVogzz72HDgele/g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2sYc6K4oek4r6QUJAn/I6gGNPmaHJKj4WPVGAwNUzslmRKWU0
	wEorsjfkZE8Qw+STnikwjqy24iWeLw99bHanVeo+IEz5asmbWNNsjITFrZe4n3M=
X-Gm-Gg: ASbGncuEZmciXo9A+G9b69ohWtVocmth1tEr0KQjS7UB+lA5L4erL4yX+dbaz0ovD0b
	xGNMHIGxp7cNDibvQkjxbDmzlGCq51SEzNzf3w3vMM5HZZVWe724XLfNgMQXqomHBTVDyaZ0ORV
	D2Tgc1H/yLo+8ekOTGGNhaBhxkqHGzq7KK+2SzAJbxoEZoTUI0AWhV45nlcv9XdGuCiuLNzjI2l
	Dq2DQhqpswdLNanZwt9GMo1ymMS3lvgUfdmmrEcJTCaWix8sccVpZLrfeG6aHMwxka9sTFL0ekW
	w2KgkZd1c6udlLc/hU3m3GOCY24YjZdoeuDwukoGKDWgUXo+bLxbyJEoNDdUGb0=
X-Google-Smtp-Source: AGHT+IFUn3Ncq3UJFAd17WQ9Pi1CnRMlttoznJGCzpSMvyRtLW9B9mLaVZY4lCtohUQhqeiWfvicpw==
X-Received: by 2002:a05:600c:3592:b0:439:9ec5:dfa with SMTP id 5b1f17b1804b1-43ecfa18f83mr8121025e9.7.1743767829072;
        Fri, 04 Apr 2025 04:57:09 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364cb9asm43842815e9.31.2025.04.04.04.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:57:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 04 Apr 2025 13:57:01 +0200
Subject: [PATCH 5/5] clk: sunxi: Do not enable by default during compile
 testing
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-kconfig-defaults-clk-v1-5-4d2df5603332@linaro.org>
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
In-Reply-To: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

Enabling the compile test should not cause automatic enabling of all
drivers.  Restrict the default to ARCH also for individual drivers, even
though their choice is not visible without selecting parent Kconfig
symbol, because otherwise selecting parent would select the child during
compile testing.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/sunxi/Kconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/sunxi/Kconfig b/drivers/clk/sunxi/Kconfig
index 1c4e543366ddb76c1669b577c1ac337dc1be616f..5e2f92bfe4120981ab68b175dce798ac8b3268b0 100644
--- a/drivers/clk/sunxi/Kconfig
+++ b/drivers/clk/sunxi/Kconfig
@@ -2,13 +2,13 @@
 menuconfig CLK_SUNXI
 	bool "Legacy clock support for Allwinner SoCs"
 	depends on (ARM && ARCH_SUNXI) || COMPILE_TEST
-	default y
+	default (ARM && ARCH_SUNXI)
 
 if CLK_SUNXI
 
 config CLK_SUNXI_CLOCKS
 	bool "Legacy clock drivers"
-	default y
+	default ARCH_SUNXI
 	help
 	  Legacy clock drivers being used on older (A10, A13, A20,
 	  A23, A31, A80) SoCs. These drivers are kept around for
@@ -19,14 +19,14 @@ config CLK_SUNXI_CLOCKS
 
 config CLK_SUNXI_PRCM_SUN6I
 	bool "Legacy A31 PRCM driver"
-	default y
+	default ARCH_SUNXI
 	help
 	  Legacy clock driver for the A31 PRCM clocks. Those are
 	  usually needed for the PMIC communication, mostly.
 
 config CLK_SUNXI_PRCM_SUN8I
 	bool "Legacy sun8i PRCM driver"
-	default y
+	default ARCH_SUNXI
 	help
 	  Legacy clock driver for the sun8i family PRCM clocks.
 	  Those are usually needed for the PMIC communication,
@@ -34,7 +34,7 @@ config CLK_SUNXI_PRCM_SUN8I
 
 config CLK_SUNXI_PRCM_SUN9I
 	bool "Legacy A80 PRCM driver"
-	default y
+	default ARCH_SUNXI
 	help
 	  Legacy clock driver for the A80 PRCM clocks. Those are
 	  usually needed for the PMIC communication, mostly.

-- 
2.45.2

