Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672C52FF483
	for <linux-clk@vger.kernel.org>; Wed,  2 Jul 2025 15:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470067; cv=none; b=NCHBDYTEkdRNmm5qS8UBTw6ySe7jbiUIh0XHKmXWQVVmV9TeXSiUQk4a43AVES5TJ7KPErgHc6/RZX3WAnB1mJgWBg3MhOmmaDqRK0evDEXz+Sb53Rq0zdwp/dl+62rx4Lw+7hi0UYu17XlfvRijJ1s3NyNcQ6H9U6wtHJdXTrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470067; c=relaxed/simple;
	bh=0XolTSN9OEuc3oqxZff5/9uDdWtVO1N6nfCdJuJ8PzE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NERaC1QXs1EQwTkdVA/0L4k+gD3pQ+IzZRThvmPu1Xuvhvdhpbja+iPDRWdc8uSCv5YQz6Ck7uA2xSwWAaULAIz2jxhVsUXPeAR17PDfyxjufu+CMMVb8tNnkCJLhIzNDVBbu0QoNLms1G65duUZ5a6K6LAywDmerit63qV6HAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mIIAVkVo; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mIIAVkVo"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a5123c1533so2610505f8f.2
        for <linux-clk@vger.kernel.org>; Wed, 02 Jul 2025 08:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751470059; x=1752074859; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U5S+iEa8IdsVyvXDRXqAUiD8piNfUvjAGL8/4g6Co+g=;
        b=mIIAVkVo5CKSntHdm2qhjidkisH2waspgGQRgq9Hgv6TlZTew1cnf7I2po2VJC4ihB
         3iEjU1fe7iN2IVCrEILgGXRCwTVNDH5XYhHJuTyanD4ExWQRKXdVK3KvkT0rmXdiDa0u
         c2Kh578qgo3GaoDVv22Karx3BDd4HGH9vPeeDH+Gxl45kO/G02xNjKBi0wIYYyDtbMQT
         u3fD8XbL/AVwYrGbsyIufXbMAH4uDRVZHi3UJWlV6uJa7VInwZERg/iXc2ih5Yqt09aP
         HU7BafpBA7sht7e481yldN28qZaUb9dgJVKGdLzxr+reOz+OWZmGMJQ81p2/AF2YHwMv
         4M4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470059; x=1752074859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U5S+iEa8IdsVyvXDRXqAUiD8piNfUvjAGL8/4g6Co+g=;
        b=pWdfx1sFC3aBMNBbBdya4V8nJVZGDghAdGEi4aZJpU8dN3/LT5tCwUdqKv1Msswuzf
         YzVz4yxSeshki3PIihYBCc+mT04V8jNF0lLGKnaEYnqWHBVxEjcv2NdYzRXhwWGJvHHZ
         l2wHohNAIj680EURzSKLBfb63De3Z5uc8y+PPhHv57lRQ4i9GnvjIz+NP7HxNL59Twat
         1GhFQTtBpo9QgNJ7AobYTA7N6Loe+Undvyiyx/6v2pRwOd6m5hXZJwp4fmwCPhjL6sJ4
         QBPSj41kajCvyhw0ywdJC0fgGRyqdtnpuLpfo5EWHN5H1IMBEkiLUashuQQOM3sQw728
         elwg==
X-Forwarded-Encrypted: i=1; AJvYcCUYx6M2VDutsBcKyxbXHEMVofZg5/DQKU1srELI9BY5rDvbmr6L6BB4+wYBzxHeqVek6fH1HbarNco=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzRLC49Qy10j9B5/jUcng0gISm+cGsxJ3u5asbF4LVQ/RiuaUG
	HsZN91gOCK+UOMwtwpVNZ3X4LJc/OFAi8pDgLqXFgM8KTrt3x4zBYBHWj8WW9gUgNTY=
X-Gm-Gg: ASbGnctseGMoBc5hhMdEypTW3OXMp7zBggaJIjAUPxVW978/3TY5j8Mf5VCD5Ghqd/T
	PK3AJRep7paoZgYs4io9rxmk6E5zYLNbc0LJC9NfUvxYg0rLcouIAESWs6PgBgSwHw52y5brs76
	KKAmFA4DfU57UNXd1bBfPpVan9uSj7WKEnMEHcnj/o6WqDAag9IF+vTYiLOaaa6CkWlwVFHNjfI
	4BealzEnyZ6io+mFlZ7c3k4ciaCXIFbAflOhCspkfmcCi7X2DCHBfkFDYp5da/2WkZiDVbQ1ABl
	WxjFS64RWHwYwenmJUdBCqH8HDY1kqvgxhNIKftUZl3wyT94Y4z+Dx0tH8RJQXhSDYbTDFRHvR3
	k
X-Google-Smtp-Source: AGHT+IFzpF57eta57Xgw+2HTRnLf235Ya6f87nGG+nlvfqjZNxIWnB/0q/88pGWrsxwwrZqhdy02pw==
X-Received: by 2002:a05:6000:26c2:b0:3a4:f52d:8b05 with SMTP id ffacd0b85a97d-3b2019b80bcmr2882664f8f.35.1751470058520;
        Wed, 02 Jul 2025 08:27:38 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454a9bcf35csm869205e9.20.2025.07.02.08.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:27:37 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 02 Jul 2025 17:26:23 +0200
Subject: [PATCH 25/26] clk: amlogic: align s4 and c3 pwm clock descriptions
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-meson-clk-cleanup-24-v1-25-e163c9a1fc21@baylibre.com>
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=23797; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=0XolTSN9OEuc3oqxZff5/9uDdWtVO1N6nfCdJuJ8PzE=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoZU/N3en7Oc/O38sMsx2hNRLUUGOX1T7ReZLnf
 uwsaFyRd1CJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaGVPzQAKCRDm/A8cN/La
 hYGrEACHTf4xN/DA8h7vS15XupFyMIp1q9fdcBeoKHtfzn3qICLzUdhIBzq+3Tj6AHEBMvudmI/
 H1x0c0cjzh/iu2TD0p+JQeaF/RZhlwQRSmi/YZXrL8jKmwC4+OzrUfWRAgNL9kv45MZKrtBMpt8
 gNI5hHEW46XFuyYY0qjcnTYqn0Vu5ha3Ill4pGjDVpgaNXMYmqNuXwfGD3HrDndkjrlDzP9rkMA
 86+2iEAssPmjgAA23WW4xlK/NTMzNXRAQFRjzVhmu9IFsunjY/ZNjsToFOETU2NP/XBARPNm4Hn
 IeWBdNHlmbGWozc+VPpr58ykEtEb32Xy9lUa/RRMtZwWODNGgKCF1WkDsScuZ41B6Hr+QPmuM9B
 Mp5xymNXwNge+G4LURTLSjvV6NVxNw0Ail1T0cy+djTwuTM9j2QEOtjGzIhNTEdqS9kNXZvgqDe
 EmRMQZkJ2kYAPuXjKg/hn0Wq4FsxZnzFCo6ek7XRXkEc+sRM/ySQIwNKleHM1ZWu9PVAKDGMQcd
 iImhYGQ6vlWqroQqfElWzytyfzFgf5JYiW2FlPZgalyXjOr3AeW1NhAnoBLe3XUqzmWEbxULtKi
 O+y+mES7i2EcMMt1xNXis6qjmEq66Bcef3WOJZf+gLbG/VZO6tLgoNThiS5vkoD6Bm61UMGdc2p
 2K9FT5XnwZspk5w==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

s4 and c3 follow exactly the same structure when it comes to PWM clocks but
differ in the way these clocks are described, for no obvious reason.

Align the description of the pwm clocks of these SoCs with the composite
clock helpers.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/c3-peripherals.c | 204 +++++----------
 drivers/clk/meson/s4-peripherals.c | 508 +++----------------------------------
 2 files changed, 103 insertions(+), 609 deletions(-)

diff --git a/drivers/clk/meson/c3-peripherals.c b/drivers/clk/meson/c3-peripherals.c
index 02c9820cd98655e57a290859b595cf09d39e5fe3..fd35f9b7994720d069c5f72142d6064790d40b60 100644
--- a/drivers/clk/meson/c3-peripherals.c
+++ b/drivers/clk/meson/c3-peripherals.c
@@ -48,6 +48,15 @@
 #define SPIFC_CLK_CTRL				0x1a0
 #define NNA_CLK_CTRL				0x220
 
+#define C3_COMP_SEL(_name, _reg, _shift, _mask, _pdata) \
+	MESON_COMP_SEL(c3_, _name, _reg, _shift, _mask, _pdata, NULL, 0, 0)
+
+#define C3_COMP_DIV(_name, _reg, _shift, _width) \
+	MESON_COMP_DIV(c3_, _name, _reg, _shift, _width, 0, CLK_SET_RATE_PARENT)
+
+#define C3_COMP_GATE(_name, _reg, _bit) \
+	MESON_COMP_GATE(c3_, _name, _reg, _bit, CLK_SET_RATE_PARENT)
+
 static struct clk_regmap c3_rtc_xtal_clkin = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = RTC_BY_OSCIN_CTRL0,
@@ -512,146 +521,61 @@ static const struct clk_parent_data c3_pwm_parents[] = {
 	{ .fw_name = "fdiv3" }
 };
 
-#define C3_PWM_CLK_MUX(_name, _reg, _shift) {			\
-	.data = &(struct clk_regmap_mux_data) {			\
-		.offset = _reg,					\
-		.mask = 0x3,					\
-		.shift = _shift,				\
-	},							\
-	.hw.init = &(struct clk_init_data) {			\
-		.name = #_name "_sel",				\
-		.ops = &clk_regmap_mux_ops,			\
-		.parent_data = c3_pwm_parents,			\
-		.num_parents = ARRAY_SIZE(c3_pwm_parents),	\
-	},							\
-}
-
-#define C3_PWM_CLK_DIV(_name, _reg, _shift) {			\
-	.data = &(struct clk_regmap_div_data) {			\
-		.offset = _reg,					\
-		.shift = _shift,				\
-		.width = 8,					\
-	},							\
-	.hw.init = &(struct clk_init_data) {			\
-		.name = #_name "_div",				\
-		.ops = &clk_regmap_divider_ops,			\
-		.parent_names = (const char *[]) { #_name "_sel" },\
-		.num_parents = 1,				\
-		.flags = CLK_SET_RATE_PARENT,			\
-	},							\
-}
-
-#define C3_PWM_CLK_GATE(_name, _reg, _bit) {			\
-	.data = &(struct clk_regmap_gate_data) {		\
-		.offset = _reg,					\
-		.bit_idx = _bit,				\
-	},							\
-	.hw.init = &(struct clk_init_data) {			\
-		.name = #_name,					\
-		.ops = &clk_regmap_gate_ops,			\
-		.parent_names = (const char *[]) { #_name "_div" },\
-		.num_parents = 1,				\
-		.flags = CLK_SET_RATE_PARENT,			\
-	},							\
-}
-
-static struct clk_regmap c3_pwm_a_sel =
-	C3_PWM_CLK_MUX(pwm_a, PWM_CLK_AB_CTRL, 9);
-static struct clk_regmap c3_pwm_a_div =
-	C3_PWM_CLK_DIV(pwm_a, PWM_CLK_AB_CTRL, 0);
-static struct clk_regmap c3_pwm_a =
-	C3_PWM_CLK_GATE(pwm_a, PWM_CLK_AB_CTRL, 8);
-
-static struct clk_regmap c3_pwm_b_sel =
-	C3_PWM_CLK_MUX(pwm_b, PWM_CLK_AB_CTRL, 25);
-static struct clk_regmap c3_pwm_b_div =
-	C3_PWM_CLK_DIV(pwm_b, PWM_CLK_AB_CTRL, 16);
-static struct clk_regmap c3_pwm_b =
-	C3_PWM_CLK_GATE(pwm_b, PWM_CLK_AB_CTRL, 24);
-
-static struct clk_regmap c3_pwm_c_sel =
-	C3_PWM_CLK_MUX(pwm_c, PWM_CLK_CD_CTRL, 9);
-static struct clk_regmap c3_pwm_c_div =
-	C3_PWM_CLK_DIV(pwm_c, PWM_CLK_CD_CTRL, 0);
-static struct clk_regmap c3_pwm_c =
-	C3_PWM_CLK_GATE(pwm_c, PWM_CLK_CD_CTRL, 8);
-
-static struct clk_regmap c3_pwm_d_sel =
-	C3_PWM_CLK_MUX(pwm_d, PWM_CLK_CD_CTRL, 25);
-static struct clk_regmap c3_pwm_d_div =
-	C3_PWM_CLK_DIV(pwm_d, PWM_CLK_CD_CTRL, 16);
-static struct clk_regmap c3_pwm_d =
-	C3_PWM_CLK_GATE(pwm_d, PWM_CLK_CD_CTRL, 24);
-
-static struct clk_regmap c3_pwm_e_sel =
-	C3_PWM_CLK_MUX(pwm_e, PWM_CLK_EF_CTRL, 9);
-static struct clk_regmap c3_pwm_e_div =
-	C3_PWM_CLK_DIV(pwm_e, PWM_CLK_EF_CTRL, 0);
-static struct clk_regmap c3_pwm_e =
-	C3_PWM_CLK_GATE(pwm_e, PWM_CLK_EF_CTRL, 8);
-
-static struct clk_regmap c3_pwm_f_sel =
-	C3_PWM_CLK_MUX(pwm_f, PWM_CLK_EF_CTRL, 25);
-static struct clk_regmap c3_pwm_f_div =
-	C3_PWM_CLK_DIV(pwm_f, PWM_CLK_EF_CTRL, 16);
-static struct clk_regmap c3_pwm_f =
-	C3_PWM_CLK_GATE(pwm_f, PWM_CLK_EF_CTRL, 24);
-
-static struct clk_regmap c3_pwm_g_sel =
-	C3_PWM_CLK_MUX(pwm_g, PWM_CLK_GH_CTRL, 9);
-static struct clk_regmap c3_pwm_g_div =
-	C3_PWM_CLK_DIV(pwm_g, PWM_CLK_GH_CTRL, 0);
-static struct clk_regmap c3_pwm_g =
-	C3_PWM_CLK_GATE(pwm_g, PWM_CLK_GH_CTRL, 8);
-
-static struct clk_regmap c3_pwm_h_sel =
-	C3_PWM_CLK_MUX(pwm_h, PWM_CLK_GH_CTRL, 25);
-static struct clk_regmap c3_pwm_h_div =
-	C3_PWM_CLK_DIV(pwm_h, PWM_CLK_GH_CTRL, 16);
-static struct clk_regmap c3_pwm_h =
-	C3_PWM_CLK_GATE(pwm_h, PWM_CLK_GH_CTRL, 24);
-
-static struct clk_regmap c3_pwm_i_sel =
-	C3_PWM_CLK_MUX(pwm_i, PWM_CLK_IJ_CTRL, 9);
-static struct clk_regmap c3_pwm_i_div =
-	C3_PWM_CLK_DIV(pwm_i, PWM_CLK_IJ_CTRL, 0);
-static struct clk_regmap c3_pwm_i =
-	C3_PWM_CLK_GATE(pwm_i, PWM_CLK_IJ_CTRL, 8);
-
-static struct clk_regmap c3_pwm_j_sel =
-	C3_PWM_CLK_MUX(pwm_j, PWM_CLK_IJ_CTRL, 25);
-static struct clk_regmap c3_pwm_j_div =
-	C3_PWM_CLK_DIV(pwm_j, PWM_CLK_IJ_CTRL, 16);
-static struct clk_regmap c3_pwm_j =
-	C3_PWM_CLK_GATE(pwm_j, PWM_CLK_IJ_CTRL, 24);
-
-static struct clk_regmap c3_pwm_k_sel =
-	C3_PWM_CLK_MUX(pwm_k, PWM_CLK_KL_CTRL, 9);
-static struct clk_regmap c3_pwm_k_div =
-	C3_PWM_CLK_DIV(pwm_k, PWM_CLK_KL_CTRL, 0);
-static struct clk_regmap c3_pwm_k =
-	C3_PWM_CLK_GATE(pwm_k, PWM_CLK_KL_CTRL, 8);
-
-static struct clk_regmap c3_pwm_l_sel =
-	C3_PWM_CLK_MUX(pwm_l, PWM_CLK_KL_CTRL, 25);
-static struct clk_regmap c3_pwm_l_div =
-	C3_PWM_CLK_DIV(pwm_l, PWM_CLK_KL_CTRL, 16);
-static struct clk_regmap c3_pwm_l =
-	C3_PWM_CLK_GATE(pwm_l, PWM_CLK_KL_CTRL, 24);
-
-static struct clk_regmap c3_pwm_m_sel =
-	C3_PWM_CLK_MUX(pwm_m, PWM_CLK_MN_CTRL, 9);
-static struct clk_regmap c3_pwm_m_div =
-	C3_PWM_CLK_DIV(pwm_m, PWM_CLK_MN_CTRL, 0);
-static struct clk_regmap c3_pwm_m =
-	C3_PWM_CLK_GATE(pwm_m, PWM_CLK_MN_CTRL, 8);
-
-static struct clk_regmap c3_pwm_n_sel =
-	C3_PWM_CLK_MUX(pwm_n, PWM_CLK_MN_CTRL, 25);
-static struct clk_regmap c3_pwm_n_div =
-	C3_PWM_CLK_DIV(pwm_n, PWM_CLK_MN_CTRL, 16);
-static struct clk_regmap c3_pwm_n =
-	C3_PWM_CLK_GATE(pwm_n, PWM_CLK_MN_CTRL, 24);
+static C3_COMP_SEL(pwm_a, PWM_CLK_AB_CTRL, 9, 0x3, c3_pwm_parents);
+static C3_COMP_DIV(pwm_a, PWM_CLK_AB_CTRL, 0, 8);
+static C3_COMP_GATE(pwm_a, PWM_CLK_AB_CTRL, 8);
+
+static C3_COMP_SEL(pwm_b, PWM_CLK_AB_CTRL, 25, 0x3, c3_pwm_parents);
+static C3_COMP_DIV(pwm_b, PWM_CLK_AB_CTRL, 16, 8);
+static C3_COMP_GATE(pwm_b, PWM_CLK_AB_CTRL, 24);
+
+static C3_COMP_SEL(pwm_c, PWM_CLK_CD_CTRL, 9, 0x3, c3_pwm_parents);
+static C3_COMP_DIV(pwm_c, PWM_CLK_CD_CTRL, 0, 8);
+static C3_COMP_GATE(pwm_c, PWM_CLK_CD_CTRL, 8);
+
+static C3_COMP_SEL(pwm_d, PWM_CLK_CD_CTRL, 25, 0x3, c3_pwm_parents);
+static C3_COMP_DIV(pwm_d, PWM_CLK_CD_CTRL, 16, 8);
+static C3_COMP_GATE(pwm_d, PWM_CLK_CD_CTRL, 24);
+
+static C3_COMP_SEL(pwm_e, PWM_CLK_EF_CTRL, 9, 0x3, c3_pwm_parents);
+static C3_COMP_DIV(pwm_e, PWM_CLK_EF_CTRL, 0, 8);
+static C3_COMP_GATE(pwm_e, PWM_CLK_EF_CTRL, 8);
+
+static C3_COMP_SEL(pwm_f, PWM_CLK_EF_CTRL, 25, 0x3, c3_pwm_parents);
+static C3_COMP_DIV(pwm_f, PWM_CLK_EF_CTRL, 16, 8);
+static C3_COMP_GATE(pwm_f, PWM_CLK_EF_CTRL, 24);
+
+static C3_COMP_SEL(pwm_g, PWM_CLK_GH_CTRL, 9, 0x3, c3_pwm_parents);
+static C3_COMP_DIV(pwm_g, PWM_CLK_GH_CTRL, 0, 8);
+static C3_COMP_GATE(pwm_g, PWM_CLK_GH_CTRL, 8);
+
+static C3_COMP_SEL(pwm_h, PWM_CLK_GH_CTRL, 25, 0x3, c3_pwm_parents);
+static C3_COMP_DIV(pwm_h, PWM_CLK_GH_CTRL, 16, 8);
+static C3_COMP_GATE(pwm_h, PWM_CLK_GH_CTRL, 24);
+
+static C3_COMP_SEL(pwm_i, PWM_CLK_IJ_CTRL, 9, 0x3, c3_pwm_parents);
+static C3_COMP_DIV(pwm_i, PWM_CLK_IJ_CTRL, 0, 8);
+static C3_COMP_GATE(pwm_i, PWM_CLK_IJ_CTRL, 8);
+
+static C3_COMP_SEL(pwm_j, PWM_CLK_IJ_CTRL, 25, 0x3, c3_pwm_parents);
+static C3_COMP_DIV(pwm_j, PWM_CLK_IJ_CTRL, 16, 8);
+static C3_COMP_GATE(pwm_j, PWM_CLK_IJ_CTRL, 24);
+
+static C3_COMP_SEL(pwm_k, PWM_CLK_KL_CTRL, 9, 0x3, c3_pwm_parents);
+static C3_COMP_DIV(pwm_k, PWM_CLK_KL_CTRL, 0, 8);
+static C3_COMP_GATE(pwm_k, PWM_CLK_KL_CTRL, 8);
+
+static C3_COMP_SEL(pwm_l, PWM_CLK_KL_CTRL, 25, 0x3, c3_pwm_parents);
+static C3_COMP_DIV(pwm_l, PWM_CLK_KL_CTRL, 16, 8);
+static C3_COMP_GATE(pwm_l, PWM_CLK_KL_CTRL, 24);
+
+static C3_COMP_SEL(pwm_m, PWM_CLK_MN_CTRL, 9, 0x3, c3_pwm_parents);
+static C3_COMP_DIV(pwm_m, PWM_CLK_MN_CTRL, 0, 8);
+static C3_COMP_GATE(pwm_m, PWM_CLK_MN_CTRL, 8);
+
+static C3_COMP_SEL(pwm_n, PWM_CLK_MN_CTRL, 25, 0x3, c3_pwm_parents);
+static C3_COMP_DIV(pwm_n, PWM_CLK_MN_CTRL, 16, 8);
+static C3_COMP_GATE(pwm_n, PWM_CLK_MN_CTRL, 24);
 
 static const struct clk_parent_data c3_spicc_parents[] = {
 	{ .fw_name = "oscin" },
diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
index 3e048e645b080f9e5982ef908e3f9c43578a0b5f..6d69b132d1e1f5950d73757c45b920c9c9052344 100644
--- a/drivers/clk/meson/s4-peripherals.c
+++ b/drivers/clk/meson/s4-peripherals.c
@@ -62,6 +62,15 @@
 #define CLKCTRL_PWM_CLK_IJ_CTRL                    0x190
 #define CLKCTRL_DEMOD_CLK_CTRL                     0x200
 
+#define S4_COMP_SEL(_name, _reg, _shift, _mask, _pdata) \
+	MESON_COMP_SEL(s4_, _name, _reg, _shift, _mask, _pdata, NULL, 0, 0)
+
+#define S4_COMP_DIV(_name, _reg, _shift, _width) \
+	MESON_COMP_DIV(s4_, _name, _reg, _shift, _width, 0, CLK_SET_RATE_PARENT)
+
+#define S4_COMP_GATE(_name, _reg, _bit) \
+	MESON_COMP_GATE(s4_, _name, _reg, _bit, CLK_SET_RATE_PARENT)
+
 static struct clk_regmap s4_rtc_32k_by_oscin_clkin = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = CLKCTRL_RTC_BY_OSCIN_CTRL0,
@@ -2559,484 +2568,45 @@ static const struct clk_parent_data s4_pwm_parents[] = {
 	{ .fw_name = "fclk_div3", },
 };
 
-static struct clk_regmap s4_pwm_a_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = CLKCTRL_PWM_CLK_AB_CTRL,
-		.mask = 0x3,
-		.shift = 9,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_a_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_pwm_parents,
-		.num_parents = ARRAY_SIZE(s4_pwm_parents),
-		.flags = 0,
-	},
-};
-
-static struct clk_regmap s4_pwm_a_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = CLKCTRL_PWM_CLK_AB_CTRL,
-		.shift = 0,
-		.width = 8,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_a_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_a_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_pwm_a = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = CLKCTRL_PWM_CLK_AB_CTRL,
-		.bit_idx = 8,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_a_gate",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_a_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_pwm_b_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = CLKCTRL_PWM_CLK_AB_CTRL,
-		.mask = 0x3,
-		.shift = 25,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_b_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_pwm_parents,
-		.num_parents = ARRAY_SIZE(s4_pwm_parents),
-		.flags = 0,
-	},
-};
-
-static struct clk_regmap s4_pwm_b_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = CLKCTRL_PWM_CLK_AB_CTRL,
-		.shift = 16,
-		.width = 8,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_b_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_b_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_pwm_b = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = CLKCTRL_PWM_CLK_AB_CTRL,
-		.bit_idx = 24,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_b",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_b_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_pwm_c_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = CLKCTRL_PWM_CLK_CD_CTRL,
-		.mask = 0x3,
-		.shift = 9,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_c_mux",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_pwm_parents,
-		.num_parents = ARRAY_SIZE(s4_pwm_parents),
-		.flags = 0,
-	},
-};
-
-static struct clk_regmap s4_pwm_c_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = CLKCTRL_PWM_CLK_CD_CTRL,
-		.shift = 0,
-		.width = 8,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_c_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_c_sel.hw
-		},
-		.num_parents = 1,
-	},
-};
-
-static struct clk_regmap s4_pwm_c = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = CLKCTRL_PWM_CLK_CD_CTRL,
-		.bit_idx = 8,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_c",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_c_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_pwm_d_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = CLKCTRL_PWM_CLK_CD_CTRL,
-		.mask = 0x3,
-		.shift = 25,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_d_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_pwm_parents,
-		.num_parents = ARRAY_SIZE(s4_pwm_parents),
-		.flags = 0,
-	},
-};
-
-static struct clk_regmap s4_pwm_d_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = CLKCTRL_PWM_CLK_CD_CTRL,
-		.shift = 16,
-		.width = 8,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_d_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_d_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_pwm_d = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = CLKCTRL_PWM_CLK_CD_CTRL,
-		.bit_idx = 24,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_d",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_d_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_pwm_e_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = CLKCTRL_PWM_CLK_EF_CTRL,
-		.mask = 0x3,
-		.shift = 9,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_e_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_pwm_parents,
-		.num_parents = ARRAY_SIZE(s4_pwm_parents),
-		.flags = 0,
-	},
-};
-
-static struct clk_regmap s4_pwm_e_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = CLKCTRL_PWM_CLK_EF_CTRL,
-		.shift = 0,
-		.width = 8,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_e_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_e_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_pwm_e = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = CLKCTRL_PWM_CLK_EF_CTRL,
-		.bit_idx = 8,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_e",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_e_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_pwm_f_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = CLKCTRL_PWM_CLK_EF_CTRL,
-		.mask = 0x3,
-		.shift = 25,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_f_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_pwm_parents,
-		.num_parents = ARRAY_SIZE(s4_pwm_parents),
-		.flags = 0,
-	},
-};
+static S4_COMP_SEL(pwm_a, CLKCTRL_PWM_CLK_AB_CTRL, 9, 0x3, s4_pwm_parents);
+static S4_COMP_DIV(pwm_a, CLKCTRL_PWM_CLK_AB_CTRL, 0, 8);
+static S4_COMP_GATE(pwm_a, CLKCTRL_PWM_CLK_AB_CTRL, 8);
 
-static struct clk_regmap s4_pwm_f_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = CLKCTRL_PWM_CLK_EF_CTRL,
-		.shift = 16,
-		.width = 8,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_f_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_f_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static S4_COMP_SEL(pwm_b, CLKCTRL_PWM_CLK_AB_CTRL, 25, 0x3, s4_pwm_parents);
+static S4_COMP_DIV(pwm_b, CLKCTRL_PWM_CLK_AB_CTRL, 16, 8);
+static S4_COMP_GATE(pwm_b, CLKCTRL_PWM_CLK_AB_CTRL, 24);
 
-static struct clk_regmap s4_pwm_f = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = CLKCTRL_PWM_CLK_EF_CTRL,
-		.bit_idx = 24,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_f",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_f_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static S4_COMP_SEL(pwm_c, CLKCTRL_PWM_CLK_CD_CTRL, 9, 0x3, s4_pwm_parents);
+static S4_COMP_DIV(pwm_c, CLKCTRL_PWM_CLK_CD_CTRL, 0, 8);
+static S4_COMP_GATE(pwm_c, CLKCTRL_PWM_CLK_CD_CTRL, 8);
 
-static struct clk_regmap s4_pwm_g_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = CLKCTRL_PWM_CLK_GH_CTRL,
-		.mask = 0x3,
-		.shift = 9,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_g_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_pwm_parents,
-		.num_parents = ARRAY_SIZE(s4_pwm_parents),
-		.flags = 0,
-	},
-};
+static S4_COMP_SEL(pwm_d, CLKCTRL_PWM_CLK_CD_CTRL, 25, 0x3, s4_pwm_parents);
+static S4_COMP_DIV(pwm_d, CLKCTRL_PWM_CLK_CD_CTRL, 16, 8);
+static S4_COMP_GATE(pwm_d, CLKCTRL_PWM_CLK_CD_CTRL, 24);
 
-static struct clk_regmap s4_pwm_g_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = CLKCTRL_PWM_CLK_GH_CTRL,
-		.shift = 0,
-		.width = 8,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_g_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_g_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static S4_COMP_SEL(pwm_e, CLKCTRL_PWM_CLK_EF_CTRL, 9, 0x3, s4_pwm_parents);
+static S4_COMP_DIV(pwm_e, CLKCTRL_PWM_CLK_EF_CTRL, 0, 8);
+static S4_COMP_GATE(pwm_e, CLKCTRL_PWM_CLK_EF_CTRL, 8);
 
-static struct clk_regmap s4_pwm_g = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = CLKCTRL_PWM_CLK_GH_CTRL,
-		.bit_idx = 8,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_g",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_g_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static S4_COMP_SEL(pwm_f, CLKCTRL_PWM_CLK_EF_CTRL, 25, 0x3, s4_pwm_parents);
+static S4_COMP_DIV(pwm_f, CLKCTRL_PWM_CLK_EF_CTRL, 16, 8);
+static S4_COMP_GATE(pwm_f, CLKCTRL_PWM_CLK_EF_CTRL, 24);
 
-static struct clk_regmap s4_pwm_h_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = CLKCTRL_PWM_CLK_GH_CTRL,
-		.mask = 0x3,
-		.shift = 25,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_h_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_pwm_parents,
-		.num_parents = ARRAY_SIZE(s4_pwm_parents),
-		.flags = 0,
-	},
-};
+static S4_COMP_SEL(pwm_g, CLKCTRL_PWM_CLK_GH_CTRL, 9, 0x3, s4_pwm_parents);
+static S4_COMP_DIV(pwm_g, CLKCTRL_PWM_CLK_GH_CTRL, 0, 8);
+static S4_COMP_GATE(pwm_g, CLKCTRL_PWM_CLK_GH_CTRL, 8);
 
-static struct clk_regmap s4_pwm_h_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = CLKCTRL_PWM_CLK_GH_CTRL,
-		.shift = 16,
-		.width = 8,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_h_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_h_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static S4_COMP_SEL(pwm_h, CLKCTRL_PWM_CLK_GH_CTRL, 25, 0x3, s4_pwm_parents);
+static S4_COMP_DIV(pwm_h, CLKCTRL_PWM_CLK_GH_CTRL, 16, 8);
+static S4_COMP_GATE(pwm_h, CLKCTRL_PWM_CLK_GH_CTRL, 24);
 
-static struct clk_regmap s4_pwm_h = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = CLKCTRL_PWM_CLK_GH_CTRL,
-		.bit_idx = 24,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_h",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_h_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static S4_COMP_SEL(pwm_i, CLKCTRL_PWM_CLK_IJ_CTRL, 9, 0x3, s4_pwm_parents);
+static S4_COMP_DIV(pwm_i, CLKCTRL_PWM_CLK_IJ_CTRL, 0, 8);
+static S4_COMP_GATE(pwm_i, CLKCTRL_PWM_CLK_IJ_CTRL, 8);
 
-static struct clk_regmap s4_pwm_i_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = CLKCTRL_PWM_CLK_IJ_CTRL,
-		.mask = 0x3,
-		.shift = 9,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_i_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_pwm_parents,
-		.num_parents = ARRAY_SIZE(s4_pwm_parents),
-		.flags = 0,
-	},
-};
-
-static struct clk_regmap s4_pwm_i_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = CLKCTRL_PWM_CLK_IJ_CTRL,
-		.shift = 0,
-		.width = 8,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_i_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_i_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_pwm_i = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = CLKCTRL_PWM_CLK_IJ_CTRL,
-		.bit_idx = 8,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_i",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_i_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_pwm_j_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = CLKCTRL_PWM_CLK_IJ_CTRL,
-		.mask = 0x3,
-		.shift = 25,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_j_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_pwm_parents,
-		.num_parents = ARRAY_SIZE(s4_pwm_parents),
-		.flags = 0,
-	},
-};
-
-static struct clk_regmap s4_pwm_j_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = CLKCTRL_PWM_CLK_IJ_CTRL,
-		.shift = 16,
-		.width = 8,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_j_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_j_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_pwm_j = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = CLKCTRL_PWM_CLK_IJ_CTRL,
-		.bit_idx = 24,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "pwm_j",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_j_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static S4_COMP_SEL(pwm_j, CLKCTRL_PWM_CLK_IJ_CTRL, 25, 0x3, s4_pwm_parents);
+static S4_COMP_DIV(pwm_j, CLKCTRL_PWM_CLK_IJ_CTRL, 16, 8);
+static S4_COMP_GATE(pwm_j, CLKCTRL_PWM_CLK_IJ_CTRL, 24);
 
 static struct clk_regmap s4_saradc_sel = {
 	.data = &(struct clk_regmap_mux_data) {

-- 
2.47.2

