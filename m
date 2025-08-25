Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57ADA304BB3
	for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 14:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756132039; cv=none; b=fXjdQs0yYNXESluc66ZDdxs17255DkLVsUkGblA2so5j4YFj1ZZO/1vcMlKgjd3aWDfG3jq8lgPPvddrTQxKg+4OtghG41E8gSNQ4bQuOeo6rxjDxWzlPMHA3IIJfnXmckZ3AbxRaFr0DIyRFq+e43IQbTcuVLlJh6ukucklA+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756132039; c=relaxed/simple;
	bh=suncESI2oSW1jGwgW8HALT/gxYfqW5NYgFG0TK2ZRwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X18pEUZgk6z3cl9FuvcCnn5WO7buTtEJDbi6UPgP2HrtFLGqXf+LZsT9JMv4Iq/J7AktotGWwfD/QB+JOUIDWPrbVFFkc9wHsOEDH1pbt1MgfB6RleaablbZZOaE53W8VedLh6FZeEhT/40879/OkZ/A54aIKXRHyoBEW9Ordao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vgfd8FLz; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vgfd8FLz"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3c79f0a5c29so1604015f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 07:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1756132033; x=1756736833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wmj4+KeJRz5xK/o1A5pSjOswraJHwrE5iHoxwCs+mmQ=;
        b=vgfd8FLzTLvULW5s1Ttkne+HaQReqPad1N3AXFPaioDQMKwXrRSNVhzFAbXcpBTybH
         wNyg5hngDROUVwD9a3izRNjbJnS5DA/ictcO82AH2IBOY/dc3+04lj70nzOO4YmTikT+
         D7OlTkAO8cttwKvvTABoXkEHhtlOtNfwy7cy0u54DoEk2S/g+Si7mHifEX/elo1lRoHk
         2WsOQiLJGO5qB+RBdEO/zLaOhzFhgmS7O4a0kFRH9npqVMdNs+ar2pbSwJoaEaXIfU3k
         pCzNrNNEyCRoD+e0Bq3xYoplS8Ib8KsaBGdx5585Xun3oNnUQNu79bt02dfXG98VS01o
         m3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756132033; x=1756736833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wmj4+KeJRz5xK/o1A5pSjOswraJHwrE5iHoxwCs+mmQ=;
        b=Ddz3wRIiTEtaThPKC1jQj/5zcg3r3G1Bel0yilwRWLhY2PM8EhfyANKFBRGdTL2nVh
         b8dBqJMMwi6+gEashbOsbG47RTR/aO8ELhaBfOr6pv8Ag4X76B0ydRxAfARP/wRZBR6r
         VJpXG1xfVydxORJSvLNkAml0E4nx2vZuLe2ryv8vJ9nVjXQ5ii8ajn9Bp0x5bXlQFvL6
         eU+q9ori965/0daTkaBEQGkmxkYqP68PPirAXMp7nveFCKg5VKkcq7moR+KWR6pbujHx
         gKgesM1wrqscOyc6EasUbmdCsgq5qeGBWp5vf6qFvCl/W8GWjw+ibPvejpDOdafz48Uf
         WttQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2nDaNHJ+tyz0clyGUL8o4Jr4suKixTwV4D/gu6qE6SYjvYeKhVDxRB7abZBdCcYpZR4HYo8f9TGU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhVfvm3cXkyCt4HaEcUdsV4netVaGQYH5FH2M81ur0EBsLhGkd
	90PRcvqqxZKmJu7rkCpld4UreVUEfaSBasL4p5/UmFuPQXlLwA0KW51IcTQtlI8Pyik=
X-Gm-Gg: ASbGncuXdRP3Ef++JrB0LuM6meokTXp1hh+NOC16Gehfhcq62ZtmOeUonyCbZhSae7w
	F1WhvK56zb4qeitNuk4YN27xHs/jtfotIUJ1KTGykawtNigdeIThhKLeBGBLHCyEe8+8dQv5hEf
	7/S2OF1OHTvL+YpjEL4UREXvw3iOoWthaBMP4UYjTp8jKVatwCr3MAEkOkkQC3bUSL34oTGYC9M
	OOLx4CzVQGuuSYlvTT5pHbXNvqtN5uPnYZYfcZebpsBtGBkDoqx7fopoYmd4WL9FnMbDFF6QtQP
	mxOpLaFAkfnkPsytyY/qIATcjB2d5yKP8q9eOQ/h2jhe6slumACV8iHgcofsQptlNLtdt6slPUg
	pBA5RuQCcgmtcIrgCNgMtu7MQJvwlX29Wem2W
X-Google-Smtp-Source: AGHT+IGnZNd0TF8B+2qH0v2ERRAcEJzB1LmVzNbD2rj+M2fJbkxWf2Ryny9Bv8Zv7wCD4HSuYBiLDw==
X-Received: by 2002:a5d:6ac7:0:b0:3c6:cb4:e060 with SMTP id ffacd0b85a97d-3c60cb4e54amr5981665f8f.34.1756132033426;
        Mon, 25 Aug 2025 07:27:13 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:b261:baab:ed3d:3cb6])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3c70e4b9e1fsm12634462f8f.14.2025.08.25.07.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:27:13 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 25 Aug 2025 16:26:35 +0200
Subject: [PATCH v2 10/12] clk: amlogic: add composite clock helpers
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-meson-clk-cleanup-24-v2-10-0f402f01e117@baylibre.com>
References: <20250825-meson-clk-cleanup-24-v2-0-0f402f01e117@baylibre.com>
In-Reply-To: <20250825-meson-clk-cleanup-24-v2-0-0f402f01e117@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2898; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=suncESI2oSW1jGwgW8HALT/gxYfqW5NYgFG0TK2ZRwc=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBorHK2LR9cAulu/Dg7wzveWSkLYkNJ9hi4wbYHo
 pFJxTH5+cWJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaKxytgAKCRDm/A8cN/La
 hSDrD/9Qb0PyVOZn3hszgeqgrG8upaAQ55iBmu/kHai53eku7dMNLCgo/GSxS12i1nnj8NSriLW
 ErB6hHemrtB7p9fYVUslxB/hZ9MISdi7tRa1yZjB6FuxI8XE+mZUICX5tmrea/cNAxFLAGcnQlN
 63CIJ7+aYY6X0vM9nQIrY4D0gluWYwi85q2rxa4VaD0z7DzmhXUjKIF6XaztRJxp4rl4Zz54u+g
 P0Px1NL0pQdh3m1V4ADCp0hlht2Mnzvxneei7m4Mu8jAdo8K1TjrabWY8mAWheTSZ0JCSyg6KJi
 WvlFlQcKiK6nsgepnfrp+MXo2+/dpljD8J+K3zwkmA65txvZMac3NcBacKTG2ToB0oNKzFqOiRO
 TijnFU8ByjWNQOhGlD/H3vfpxvxIV5Rglm8Ds6CBqTLTFPEPc1iFTE9E41mrWxLok/nvH8ov6vQ
 hPfIhHKuIgFGlxtEZsqxcY9WiPpqIMqaQyzueRkUhy+j7LTEhT8+kSduPZUUsKYRwFnZFxcTMYk
 XyKrwLv4GAN4/x6tEqqXKSPmolH2SND4jkjse858xq0S+3Y05806RQL0270Q4/6IOLKcstu4hZE
 5VHDw8Ltk2K0/Psd8SrPWGv2XkA703A+IqUiQuQ0kc7LPsCvpD3crNQrMt3bDU+csrYlXJ1V78w
 eaM64tYtmmBuiWw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Device composite clocks tend to reproduce the usual sel/div/gate
arrangement.

Add macros to help define simple composite clocks in the system.

The idea is _not_ to replace all instances of mux, div or gate with those
macros. It is rather to use it for recurring and/or simple composite
clocks, reducing controller verbosity where it makes sense. This should
help reviews focus on the tricky parts.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/meson-clkc-utils.h | 57 ++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/clk/meson/meson-clkc-utils.h b/drivers/clk/meson/meson-clkc-utils.h
index 95d9f85f7ca22f63a16f8665d6f7a250b21bfdb8..ddadf14b4923781d8807546f35a1ba2e6a8a894a 100644
--- a/drivers/clk/meson/meson-clkc-utils.h
+++ b/drivers/clk/meson/meson-clkc-utils.h
@@ -48,4 +48,61 @@ struct clk_regmap _name = {						\
 #define MESON_PCLK_RO(_name, _reg, _bit, _pdata, _flags)		\
 	__MESON_PCLK(_name, _reg, _bit, &clk_regmap_gate_ro_ops, _pdata, _flags)
 
+/* Helpers for the usual sel/div/gate composite clocks */
+#define MESON_COMP_SEL(_prefix, _name, _reg, _shift, _mask, _pdata,	\
+		       _table, _dflags, _iflags)			\
+struct clk_regmap _prefix##_name##_sel = {				\
+	.data = &(struct clk_regmap_mux_data) {				\
+		.offset = (_reg),					\
+		.mask = (_mask),					\
+		.shift = (_shift),					\
+		.flags = (_dflags),					\
+		.table = (_table),					\
+	},								\
+	.hw.init = &(struct clk_init_data){				\
+		.name = #_name "_sel",					\
+		.ops = &clk_regmap_mux_ops,				\
+		.parent_data = _pdata,					\
+		.num_parents = ARRAY_SIZE(_pdata),			\
+		.flags = (_iflags),					\
+	},								\
+}
+
+#define MESON_COMP_DIV(_prefix, _name, _reg, _shift, _width,		\
+		       _dflags, _iflags)				\
+struct clk_regmap _prefix##_name##_div = {				\
+	.data = &(struct clk_regmap_div_data) {				\
+		.offset = (_reg),					\
+		.shift = (_shift),					\
+		.width = (_width),					\
+		.flags = (_dflags),					\
+	},								\
+	.hw.init = &(struct clk_init_data) {				\
+		.name = #_name "_div",					\
+		.ops = &clk_regmap_divider_ops,				\
+		.parent_hws = (const struct clk_hw *[]) {		\
+			&_prefix##_name##_sel.hw			\
+		},							\
+		.num_parents = 1,					\
+		.flags = (_iflags),					\
+	},								\
+}
+
+#define MESON_COMP_GATE(_prefix, _name, _reg, _bit, _iflags)		\
+struct clk_regmap _prefix##_name = {					\
+	.data = &(struct clk_regmap_gate_data) {			\
+		.offset = (_reg),					\
+		.bit_idx = (_bit),					\
+	},								\
+	.hw.init = &(struct clk_init_data) {				\
+		.name = #_name,						\
+		.ops = &clk_regmap_gate_ops,				\
+		.parent_hws = (const struct clk_hw *[]) {		\
+			&_prefix##_name##_div.hw			\
+		},							\
+		.num_parents = 1,					\
+		.flags = (_iflags),					\
+	},								\
+}
+
 #endif

-- 
2.47.2

