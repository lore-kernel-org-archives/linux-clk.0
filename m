Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BFD1E2613
	for <linux-clk@vger.kernel.org>; Mon, 20 Jan 2025 17:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737393412; cv=none; b=e7JtDjT6WArIq8qgqwZE+n947qaD/3cIYP5rR7CGqE4amcfk7eH9TVJtkrqs18k8Qky5PgrX8VvIPcPz3NSZkU4JkP8TdUgaEyCULvmSk2A694rXEjr6StafO4R/RjCnCivOk1ustAPgfecItNOGUKRXqZRoZ5eQi+fNxnhgvi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737393412; c=relaxed/simple;
	bh=J7Y6Fp4+iqMqIfQq3Hnn537f1r3kZcJaD4ddKCmmXtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oJ5IPuMAGzJcxUSAvatkJzNF1Vfn+zbEoEopeTt3KqQR6dO9X67PS/Ae+jS628SMVXbFLw236lnERiX4YV3KdmbxhO+7m63400rVZXVGooKfkDL5a1vqLrSmhKvBkAdKfomJ98RamqR6in8tPdpz231FA75qKnS2hWlGEK0AfYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=a1+bkqTt; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="a1+bkqTt"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43622267b2eso47109505e9.0
        for <linux-clk@vger.kernel.org>; Mon, 20 Jan 2025 09:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737393408; x=1737998208; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zy0IE3lDkOJmEZbfzxIyV3pw1iHxHTRFthowgi2frig=;
        b=a1+bkqTtj0BkOWpnaxbenAzOfORO+1wUH8NsJC1gqvFAuIhU3Ule7B/ByIg9uUZQW5
         BgGG5a51GYQq4XySisQaJRUf7qN/EgAMiga6J2AW7PrVufdTqK36nCSPkv1iFwS/POHM
         GbFuhuIQ3029PSKz2f91meCIZ9z9NL8g0LL69H/stSOhstZPArV4QTNyLnmj09qn83Fe
         +2LDCUMfm3IZrjP0EtvXNi8avM9BOEsyHnMANZwPJDVZ5bqcKVg2CXx8O00hSqat3/k1
         ce0Z0pxdZUnYg9p/Ln4BDYdpKMN2iEH9EyvuqGuZNWGrQ74uL5TUDmXGP6O0zOJB96W3
         3E3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737393408; x=1737998208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zy0IE3lDkOJmEZbfzxIyV3pw1iHxHTRFthowgi2frig=;
        b=NeXutXbZ+gxJKPg2/7/WQQJirelkWUdULnTW/eYK5TfDNukF/qHJaCQyfXUMjhsDVF
         7QpFH77vbZmyT9eQTp7NLMjxKXntNhepC0xMazeT9NdYEQgbGkvpRB2LyNRLs+Mc5XTX
         v01dCUwyJu0dJmgUQdw1QElLyCDiRoMuXVxOHLitFKHySLElWGFb5/0ZrcZS/YwTKYbP
         HquT/RY4IpA6XMimWdR4rXoud0rh6lWk0vsJvGYq19+NgAsQ7Q1Lno2f/EQo8FJw3QTa
         2LZ+uZa+ubosi++DhpykBP6sSbRDAM1pS1TGF4Kpz7pjqJECtMS9r7JkhX0/3D7n970u
         5eqg==
X-Gm-Message-State: AOJu0YxCzEjg34FJxL7AtSpCei412oVI9gvQTjPF07LIdY9AvhImSQEy
	GtFo+tJJgVgjq9knC7qFRt1ZhZXxL5gUd5VgRsaflIKUHiog/bNW04aQTFfkZmo=
X-Gm-Gg: ASbGncvqkKoRal/6CVps+M7oH4pZkUtj8KiGkb8ZF5wJAMYT32YErrrrcAA2uHAVuD4
	8Yw/rwLRjeK1BxU0cB4Vi2AGX1guufcOvT6Frwb3il7XcIIPaIVR53uFSXqH2s0E1ZV6j64J+yR
	R5cTlcdEk+d/wTnL3ae7sP+qhjI9iRyIpE43LCZt1xhuCE8D7EgfpkGMNkDAnjpl4Xzm0LP1LOG
	wiZYTfh8FmBMxbnUzDHx97oxQqW6CGaVjVpIqW8iC/E6fqHuKYvEz2In+Wl1EINiUzmXGPnH+U4
	93azyxKV
X-Google-Smtp-Source: AGHT+IFY5DPWP40kn2YE2hfzn5IShoB+jBqP5C8IE7mj9UvjFLQNXC7FFM6GCKi20FV/1FQ4AsYs8w==
X-Received: by 2002:a05:600c:1f8c:b0:436:fb02:e90 with SMTP id 5b1f17b1804b1-438913cdaa8mr152617415e9.10.1737393408342;
        Mon, 20 Jan 2025 09:16:48 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:66cc:1b13:f78a:5738])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-437c75298adsm208629865e9.30.2025.01.20.09.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 09:16:47 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 20 Jan 2025 18:15:33 +0100
Subject: [PATCH v3 4/4] clk: amlogic: s4: remove unused data
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-amlogic-clk-drop-clk-regmap-tables-v3-4-126244146947@baylibre.com>
References: <20250120-amlogic-clk-drop-clk-regmap-tables-v3-0-126244146947@baylibre.com>
In-Reply-To: <20250120-amlogic-clk-drop-clk-regmap-tables-v3-0-126244146947@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3973; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=J7Y6Fp4+iqMqIfQq3Hnn537f1r3kZcJaD4ddKCmmXtk=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnjoT64OhzMylXK7S80fv+A6bFKs/lGqharlcVS
 tH/hOFeOB6JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ46E+gAKCRDm/A8cN/La
 hW37EACoX2ZfZnDa/X38DZwOqeh8ZuhGamXjGCNbVY/Z/WfrR249u2iiH9j/R/Psui7oR1mA9Ld
 X42+U3Hn6T+JnjBI+EDHXbrWvJ4Rfhlty4X//QmgkRRJcrLXtMC0q39qIScOV2Y3aL7U8HRVKrk
 p1YJFwoZv3CLgTzbjOPhdBu3a7v3K/4bXx8mMOaqjHo23AkxHeWbQ18OwC+XNCGv5p2u/ZbsmHn
 rKiOgy2fkpxpp6D6nptKau7C0ip4FycM2q/vEle0ECO5MMNiHUcmS4kH1Q9WlkGoG8wo+Oo0pLJ
 fjhKa/qo51vCTBIgoVALhsxCCul22x95Uk+vRcUX833T4XXhr7FID+3Jwi89OnGbawYPfStl0wO
 so6HWxgoco3l/gmUCGEvRx9DBOcQ0Ykb4CZPsSYoGUcKLsmrsrrqFxbaGP8s8WEUotr1/W5dott
 HVdMsSX5QVdjw8Z0Ap1ubUm3sRwq85Fx8clqUHQ+eZgs/LVXk2GgX29SI7yAHVjViy+pqcIL6B8
 fEs2fnOU19zKnW+kq+yA8hjuTYTodoURRq6SIBoYeYD+9fd8M5toULw85BQGNy+flXIPgG9u6XZ
 XO+emPEYYzXC2BZceW7kchSb2kV8W8gZ2X0SoFtAD7VMMSov6Hr1Hjrmqz6aE+oFgHan8FTg6Hz
 4UAkYQMvR7xlk9A==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Following the removal of the clk_regmap clock table from the s4-peripherals
clock controller driver, it appears some clocks are unused, which means
these are not exported or even registered.

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

