Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB0D19CCEC
	for <linux-clk@vger.kernel.org>; Fri, 17 Jan 2025 15:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737129542; cv=none; b=tDDlZFULiVKtDrE+JMci28VLeLHCmnqc7rPJRKGZRIW0wva0vxbHsx2aeRXddVCY7xNLhXJWRzpbDhlbge6mgz9VAJTtmlsLbIs7GLyj1bg1pENeKJmmtrYXnKtfTwt2hCreHn31LpAH5eYTuSsNxIHqdAsq3ZGobzrlqrLY9aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737129542; c=relaxed/simple;
	bh=kjINnfrAI9Q/3kKsDXxY3oSmO93qEYxej4qAkFSN56g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rd056U3raxbxwH3XvZIcQJHNe1fpP9Nx78IQLrI3+wSfTVcqFwXBQMtALng5lHPbd7qeFyfYfkkoeyeXpzCM7pTOBjihyb1s6feD7fdjLFoBooDq/Czy9xXjUpXJsZD40JgjLRyhbHIUR0brQb4t11wb46SWGOmPPH6oDeeAC5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ZZyvumqA; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZZyvumqA"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43622267b2eso21933725e9.0
        for <linux-clk@vger.kernel.org>; Fri, 17 Jan 2025 07:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737129538; x=1737734338; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JZgWfYcl0Y7q7GLRHkSuwJI29tObEi0i8LhHvO7mET8=;
        b=ZZyvumqASmXVspcYTsDT7npc5oJPVnStcaCAPmv8xfCYppA6WqL1GJLus2IsgIwEOE
         skRqwHvjiMnHLer07XEcNCTh1Z2oQKziXgevQsWK+ax59X8p9fgfqvhaF+KfxurVct/F
         jBz52lQhSuXh52bYTIKlxfSOHEGL6X+F4qpm5bqTi6Fktc/De8xFx0F+uV359r/08xar
         uuJzn22Bn2cR5Z3KTtAxQt3fz6YN4dMxon9lzi/E2xI+ErNKfkMcMy8h2FTGARFIsnNq
         GjWzCYwf8b+kf7RzicywF3l5cZKqpzu+HGt9KJQfg3mQjUez/dmclueNnEaIw58BYLiX
         3fOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737129538; x=1737734338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JZgWfYcl0Y7q7GLRHkSuwJI29tObEi0i8LhHvO7mET8=;
        b=umGULl/ZgwI6NugVk6kc3tZfazZZvshyibeSQnC4cjaf9jDNfR4TCkGWbPWnlso750
         nqXqTRarmD5JpNCLVrTCAut9oy6xfaUpi9ei4KQsnmSAGdS+fF4U4jmz+Fsdx7C93FNr
         1aHONmGxlSVCbtBho6pVSN+ThS6i+X6nwmj/k5ynV6hEwuqMIbKaeJ21puLKn70QP/3q
         8NF5qMFMmFdFcJ0TidEhfkGw9NvpEd06ZN0u/1tcAn0n4V7Bj+Zn8InflnF9b3D4CJsI
         9dRQ8WPFg4eKQi+NWF3CMu6k/FXtwhNJUxvSDhz4sPiyAQiNEkQHHy2nC4+w7T6k+Aex
         ChfQ==
X-Gm-Message-State: AOJu0YxwHwpjG7pRByXlJ4LtwvQ9g+NxDk+M8G7g4/9s9LxN6s2FgWSE
	Z4mkb7VRM3V7WJFPEVWWDVaz9dOq1q3qwAHu6kUtOU1U9FHoNWEKVrVYAkyIM4I=
X-Gm-Gg: ASbGncvZssGcuICZ0X+1YpU3kkuHsXqY+bnDL6TGaSIvSOmjMuyjxsSQf3BFHvNcDtI
	vxlQc97K4yhC0jr+kM9wjGka5JBA2NJ04gdXsdx3DELTr23nioJ1xpK1n6hv8tyZOtE3byBxytS
	sCBmuHV8GKQ2lO/z5Y8Ny53M0hiy8AD2FV7/Esj+l3jIt+bPRA0FzdvB7WYChJ03c5svuUxksYn
	1wdROXX9x3ZnpJOciLn63GC/DVT9plbwfiAS1hD+Bq8ppQd+zFLnD5phj3jiHdepVqgm9k=
X-Google-Smtp-Source: AGHT+IG1q33fs+KVW9RoZpITbOTAERwi/Qrs/bMhSVo+O25h9Rzl486JZ10j74BPtv3JPq3CtoOFWw==
X-Received: by 2002:a05:600c:3b26:b0:434:a0bf:98ea with SMTP id 5b1f17b1804b1-438913cd4a1mr32341835e9.9.1737129538284;
        Fri, 17 Jan 2025 07:58:58 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:b019:599d:2d51:f3c7])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-437c7528076sm99382195e9.25.2025.01.17.07.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 07:58:57 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 17 Jan 2025 16:58:33 +0100
Subject: [PATCH v2 4/4] clk: amlogic: s4: remove unused data
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-amlogic-clk-drop-clk-regmap-tables-v2-4-d1f77cb0773e@baylibre.com>
References: <20250117-amlogic-clk-drop-clk-regmap-tables-v2-0-d1f77cb0773e@baylibre.com>
In-Reply-To: <20250117-amlogic-clk-drop-clk-regmap-tables-v2-0-d1f77cb0773e@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3977; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=kjINnfrAI9Q/3kKsDXxY3oSmO93qEYxej4qAkFSN56g=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnin48q2Eofw3aXzoZm/XCT2+BvcA49CIxRaNuf
 GHWDOBwRaCJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ4p+PAAKCRDm/A8cN/La
 hZCID/9JeS1XobTuZ2C7R9yy9weAaMjxw3YkRyVZznE6t25Cef2eTV8J5GScomUNOZUYtYe/HkJ
 MhLkGnbCPpLAW7gTinje3L3OIO68myR6euP3NLlYRMIN+q5IcNDbS104c5Yj4H2HvsW1GoKLlet
 dK8VtSmN+FZRbEMmR1JcoctDpt6DCQzaHFCqFzjqqYNXTrgWaAoLWpKdlTDc/lmx57pF5QoVF+g
 LTfSuo73WDGJosr+4utVQvqlkoBV7/3+cmubwwfRg0Ct/n4cH6WmD9vN3jbSygUq1u4oY9NJnLd
 6iS7inGwRhDW1ZBgstaKoUXQahF0N+nduQTDhWN2InROHU71cr1Nmt7hyZA680VvDOpj/yDduZj
 5rgY9ChsJy4Gi+BdTmBCp+rh7gR6Ro4G92KY2ELpj3jI6I6lADa6uN8LOqopz9k4xKNZTfnMthN
 gdbcgFYGiP+T9ywnrUlRa3QohUN+70cEy0rvCJQ+uYt/N47LVypWPE0MFG9AQatubPQegtQkC65
 5VBxPKL3JmugZuIjUIVRJjxQFF8KKihvcBNYfsTUhvduPu3zvfj4RtBwfPXRf2GdEbcwqon0Ljt
 eIQvXfj9mrI6KNi6zuXJQtMndLDYPnGX2y896qbD5BVdZ344gjhsl+0u8O1C5yiE27+u89vdt/f
 4tV3tRvB6em95JA==
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
index 6a736e32e0ed8e2e8a37fbea94f9c5a90ea95fa6..853053b5f0689399a0224d263c30a985df6e1652 100644
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

