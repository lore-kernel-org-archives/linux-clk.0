Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196C122259D
	for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 17:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734715077; cv=none; b=jRyEv1DKbdIZ838/TEJptG/K+pL/gzBi5p7KgbmemWIBQs+iPL4xL17Zv2v1yZbGS/hC55HL4GBP56sElHXg3FNCA3ncMAb9EIGJU77T0KN3cqR2S27X4WIOo2w4deaMElpfLoxgy4Tb2oXFAZkjYcF7FNPmAOnIu3HOpd023Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734715077; c=relaxed/simple;
	bh=tvh8JlfNuT44ThrGDFE2JBh8kT+71CwmF8GtX4Rjbzo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E07hkiwAb8WwDVHU9X19BhigSeEmrvzdSXgLbO5159w90pjpFdloBcGF7qsfgI/sPuwL7+2sVZF1cQ/aC+Hy0pbme/vPcPntVzQJhxIbPdDsAXAY2sKAZ/2GzHYrnmrZOWkSoscXG2G4/J0vZct2Hb6EFpEJEhLQM3GqPfZVHpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=g4iTOmc3; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="g4iTOmc3"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3862d161947so1122530f8f.3
        for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 09:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734715073; x=1735319873; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cgs5QNP7O8iugv52YTWDU3oFoGi5v9FMjpGDuCdwf+k=;
        b=g4iTOmc33QswFgGUlUrOh+hQZzkLu7WXh5TTeWMaMzalyzbwm3XIox34bup61rshxe
         JzkITmuhk4Z7b1Kzy76GLbaDbTkcEHNR9PchSLog+Z7yFPXDC8VUNgeGB5xm8EV1c/nK
         qlrQipH58Ta9MADXL8WyLO1zErXw04AFMvUfluR/iHXf2WEZjskmOnH4MMVgVsfGohrN
         l3ky6Kbv2p5fpwDFH8fH9La79pSw1MZsoNcznXPEbHRrJZtRb69MwNFvcxlr/SQ7MXv0
         9OlUQqiJEMIoGgjsV2V5yJaTBeE4xuSLRFhBII2xTH6vehwm5i/pqSzoLWWjx4pncPy+
         7voQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734715073; x=1735319873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cgs5QNP7O8iugv52YTWDU3oFoGi5v9FMjpGDuCdwf+k=;
        b=bPIzis6TWOmGrzuj95wzgVtxwYaFmz3T9oLAObrNdyUnsjpv6N4eETiHPA8zEUUbso
         qlf/3CcVpObKO9n6SKChOLiqezBRojGVCpZpZOIeeJUR0Ycw7FhC8vV9LLGUgBaO7duc
         eFigAxfobkFd4Q7jqnpIyiL9hix38jHD8qtg0U2mph3ycruOJTMPikgRxNqlYjO13soS
         BURAo1mjCPPleednn/yVolLo5sNVGcptmlK/XKJAadgd+wCRExSLbDFHGOUkWwxplxcW
         O65Q1NqKkg5j1SQMF6DPuSnB8c5EoDm8iMqDLSKY5ylodJVpAxHKgWNiRMweIPzdkkqZ
         DUpQ==
X-Gm-Message-State: AOJu0YyLpCjKEUfPETfDVcYewO91IwORpV7/AhN4ZMonKqcJ8sVTSM9G
	7s2AOLjbS99gYGlEknssBr8L5Eme5LAfoLCf/g4FmiN3HUASYOgwnq36yZHfyWQ=
X-Gm-Gg: ASbGnctnWE9jGot8tULABF0tkOD5CXFLxG0OA6SAKwJGxJggX02CeaJfOxTr6Wc57cw
	TThqQ+Agq6U42v2g4DTrMMaheCthLRQW4JIKehyWIKOl4APq7ELN0aXbm4dWJhO2izrI3a89KOV
	qlGV76TVo1E+SaRGTWPSQoTDhiNUibM/M2A8uyBGgy4kyuC6xIjbv03+Hr2RRfqSSy9nGRc1GrL
	ArQcgvPmBx8KxwFXuMpTgTOV8JPBToAE2o4aKD0sBmHNdnfIyV2/r1xLssOxspgCEj+XWc=
X-Google-Smtp-Source: AGHT+IGYlzQLR4J9adpke1hx6AAFsWeyzGPiUR+SyMcWO2IVMtoisGzuqWJuHjjRKM9zNCOgImfvIw==
X-Received: by 2002:a5d:598f:0:b0:386:424e:32d5 with SMTP id ffacd0b85a97d-38a221ea939mr4106400f8f.14.1734715073465;
        Fri, 20 Dec 2024 09:17:53 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:c000:46df:1e3e:983f])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a1c8add5asm4432847f8f.107.2024.12.20.09.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 09:17:53 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 20 Dec 2024 18:17:44 +0100
Subject: [PATCH 3/3] clk: amlogic: s4: remove unused data
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-3-96dd657cbfbd@baylibre.com>
References: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com>
In-Reply-To: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3977; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=tvh8JlfNuT44ThrGDFE2JBh8kT+71CwmF8GtX4Rjbzo=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnZaa8huQnimyWNluiyiI+CqSpsbYXDeVZSFdL+
 Ho18RI74oqJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ2WmvAAKCRDm/A8cN/La
 haBXD/9AGOS2JTSDO6JJiE8kB1oiX8eb7GTQH3ESwZO99Ez7orpE9CFgr4umREPh6u+yUUQIIsi
 VuJW6e5VJoBA4G6Ueh9SC9IFQF/u5FsG2KGWz18UCo+u7mCL8A+OSt6yZunQtV3uMplGPy9+O+p
 q52jusn0iNnjqVM3gtuBYcl85n4c0FkUhdqpac0rsedIl5KdIrCKe3d6ks05QGYab+exnrWQMNa
 31zoRaSJ7JL2ljimtgjMjYloq4h9XlsrTII/JK1kbHCePAuajq7RLrRNjfri3OQJglSUNekRorz
 PFAjLgfdfFTeIa7f/jshO04/RaSMl6jUcSJNLGLxvJ4M24v5jUPmNeDL7HL0UFpcmk7PA25QOi8
 c+Kqfd5GPduZ6s4SI1Dp6THKlPH+n+CuVDTvwk18mnvOvjPSCJMNFIJByEkWmx3rWcW9nJ5SKWh
 XyzvmHaUg2p5jOm77UHUnE2TqR8lAtQ1IFPnM+hcTrJc9FRHyDnSFKZetihmgnUNOoRGf8p2b3W
 VHjgPcvpUykOmIJAQOdUjYUVxDxtQdSOs038LZq5BSpTggX7zsAmXu5Bhr4Iw5MGapneO/VDUhr
 WVxqUruSDsT6SyNc/ABvI4PSj+nQmwKsZRrEbhsz2GKyOVCugml60Kf+thdSZg87fW8MVPj9B3a
 xJKiAoUM1rwzd7w==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Following the removal of the big clk_regmap clock table from the
s4-peripherals clock controller driver, it appears some clocks are unused,
which means these are not exported or even registered.

In all likelihood, these clocks have not been tested. Remove the unused
clocks for now. These can added back later when they have been properly
tested.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/s4-peripherals.c | 112 -------------------------------------
 1 file changed, 112 deletions(-)

diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
index 91c7b10c2b68c626dd1d6164ea855370aae71485..72b990fc0de8e4e2c83d0fc3b4c6e3fc1fc96367 100644
--- a/drivers/clk/meson/s4-peripherals.c
+++ b/drivers/clk/meson/s4-peripherals.c
@@ -3129,118 +3129,6 @@ static struct clk_regmap s4_gen_clk = {
 	},
 };
 
-static const struct clk_parent_data s4_adc_extclk_in_parent_data[]  = {
-	{ .fw_name = "xtal", },
-	{ .fw_name = "fclk_div4", },
-	{ .fw_name = "fclk_div3", },
-	{ .fw_name = "fclk_div5", },
-	{ .fw_name = "fclk_div7", },
-	{ .fw_name = "mpll2", },
-	{ .fw_name = "gp0_pll", },
-	{ .fw_name = "hifi_pll", },
-};
-
-static struct clk_regmap s4_adc_extclk_in_mux = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = CLKCTRL_DEMOD_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 25,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "adc_extclk_in_mux",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_adc_extclk_in_parent_data,
-		.num_parents = ARRAY_SIZE(s4_adc_extclk_in_parent_data),
-		.flags = 0,
-	},
-};
-
-static struct clk_regmap s4_adc_extclk_in_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = CLKCTRL_DEMOD_CLK_CTRL,
-		.shift = 16,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "adc_extclk_in_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_adc_extclk_in_mux.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_adc_extclk_in_gate = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = CLKCTRL_DEMOD_CLK_CTRL,
-		.bit_idx = 24,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "adc_extclk_in",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_adc_extclk_in_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_demod_core_clk_mux = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = CLKCTRL_DEMOD_CLK_CTRL,
-		.mask = 0x3,
-		.shift = 9,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "demod_core_clk_mux",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = (const struct clk_parent_data []) {
-			{ .fw_name = "xtal", },
-			{ .fw_name = "fclk_div7", },
-			{ .fw_name = "fclk_div4", },
-			{ .hw = &s4_adc_extclk_in_gate.hw }
-		},
-		.num_parents = 4,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_demod_core_clk_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = CLKCTRL_DEMOD_CLK_CTRL,
-		.shift = 0,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "demod_core_clk_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_demod_core_clk_mux.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_demod_core_clk_gate = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = CLKCTRL_DEMOD_CLK_CTRL,
-		.bit_idx = 8,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "demod_core_clk",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_demod_core_clk_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
 #define MESON_GATE(_name, _reg, _bit) \
 	MESON_PCLK(_name, _reg, _bit, &s4_sys_clk.hw)
 

-- 
2.45.2

