Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793726469;
	b=Px+9vanVtfpHzDEKRS11Ywb9cUUWI5vGoY96l5rFKwtfw5a/OsKdIaLSZoiXkpMgWe2f
	 szPNQ+asFDlAqNH9Pd8Hv+xdUSOtqFvtP3/HOIkQcdVgjghKvMbzLkkj1mVtJJIStrUrF
	 qFjBhCXySdVIxYiXfZMZCLaVF9sCIFntr12AzyYRxwmi+bWVOqZugroLh6es/7RdIHt6+
	 NgnogaRCGyTpQWt7v03RmEv4wGm/00jlc2YlEXEyJKCJacq+WsGDrT7ACqKJjv+lQ5BAq
	 ztXZQSJfk0rc/6iOZffJjzIEm8Obrc3Nv3WqJqfgTqRrqE317e125Zr6aQ3M0MSKBgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793726469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=YRJWMzSGYlnaqtlrj8LCuixaQN8tH2t79cuf24+aN+Y=;
	b=RPOcXxZeHouAgfz/DA8sr8KaSkaNNv5sNo0nnjW8R5v76r0pgqlJX5ykJJ//6P6Hy5bH
	 slXd1wqMWtr+0jyCXgAhBhvwkvMD0qPwwXzUbfx33EoqO4lL4zKbeR6Asg5oaIN05RnDk
	 PdoSkG4H8OVqs+fzXcIgyZUoKzMWKTki7vPst6U2v38+sLJZEmIG4alZsx/0jq9FTwmQJ
	 Y9MXaHj/Ht60Mad9abrBStTz/cZ/80PLzWHYKJC9kDctM3wsJY9OSvF4dOx/eQFvkL4a5
	 EWNrzxiy1/vessP+g+XMppkIKLaOc0obeWeVujP08vHrCKfoR7ce38DF+jay38nEcWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jwkYJ8wl;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C69606A33C
	for <linux-clk@vger.kernel.org>; Tue,  3 Nov 2026 17:21:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26C69606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jwkYJ8wl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so37980115e9.3
        for <linux-clk@vger.kernel.org>; Tue, 03 Nov 2026 09:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793726467; x=1794331267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YRJWMzSGYlnaqtlrj8LCuixaQN8tH2t79cuf24+aN+Y=;
        b=jwkYJ8wlDlYG9o84FOcTQ4NQ6oscx4Dvo00D+pCChoyTRAs00KWzFbG2mOBrxhs/03
         Gi297RrQ0KqFikF1nw53tV8us5skacalWaeRqECCNbGXoghnnkfEKnmK+JcX9MD2zEZf
         pP9wc77uY2MWeq+bWpaWuBSBxur/6kuCrkcjkC3n56b3Ghscr7yhwxep0R/zQ3PfITPi
         F8n/qq3F7B2hjNENhCzxM/dj70w63pyJJYZ0Yf0RU2DEzxgRmkLP5NFDhLd/+VDJwHbK
         2ykswclurcheodT/plINbakI3TsEN5Z/kyyCZSBw+A6LOpKFNZsL9BXrSWUPoTBNjJbp
         tulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793726467; x=1794331267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YRJWMzSGYlnaqtlrj8LCuixaQN8tH2t79cuf24+aN+Y=;
        b=Is2b4XHnkaF6L/1H7tBSEWIaRoUzTh8ZBnEcpAnvNYo1J2om10kkzTN+232kNvDr4S
         BKldiGBhsT20/FkCsd2ZwRoY9xDGyxcdDymh/qQuD/T+2WzRtZp+QSS32u03b4HBekIs
         CO43NiA4rN+SyOGqDyRl06HaKs3wQgTGscP98d9uFU0KghLgvsACvSfjam64CPwr7m3d
         szHp6mAWZcUcYKVxNTZhc3L5Sng3fo7qZtl+GxsJ7Xx2/4ohNjo0+xUdtPHwtefvcf3s
         BiFTG6H4s2HEfT94Ugf9qSSjax1j6UXHh8IgCWm/NSpeYi5ERArcGuEKSeWZPuiXHhai
         zbNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxfg243mzs3dDCM+fWhzzw6GNZUED892a72v97nIJiRE2xzfvT+kN2VifLWr8fn/GUaAI0wF2ZhNo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZXj7ibGG/9T2eKVs/P9fZfIJEJnvuchgD+bIBJe5IZq/7XYfi
	+8MXpiMs0IJH8PD8R5BVbKd8EcqE3riGxSlONtxQXiqa68HDDJdmD5il
X-Gm-Gg: AYBFou0iF4tGWPQgiUeQNU/EEJ3iBLTGPw6FFPf3pa/kRwpyBIoVKaVtj2kJTVLjCQR
	0MqvKLTfWz5x0RtmRshUe7dIGxExa8udpMggyUzpS+Cuir9NvwsCfoPM/+LvtvWdF/Z0kfmAxUC
	yUrSvyJLzV/lXiVXZf7Kc8oSUp498UKH1YO6HwqyXDc+Yuq5e7k50ZG+IsUCu2vW1at0+Pjy8sq
	9K8sL7YmKa2yquqKC2t5rs1tGYtyPFkvw4YYt/y+xpp26w2ADiEcqWABaII31iqNmIO1s8/vu8q
	JkL8bzSX4EmefiUufyEVS+qmyzWW5bXEg9b+m9rNJ/5/FAb7uleRrT5BdvrSbPYU9MEEzFS5s4b
	WwDv9nlpp4+QEiG4J8eVTyl530FLrCi/AwH59tNLLtBZsrhj9GCsQCuHuoNq2Bh1wj4MFAdXhuT
	6hSf0JjImNBwYZvzXDtS5WRxfx8hUvXo3tX6NKrre4bKkO5YpZd6J1Y4+e4aJ+t4UXUmqcUz/z1
	WpRvPL4I8H/bAOHdiZvt9JbVJLdrJZ1/oIpUwyGNhyHMdUB71//aqlH9x0m+Pr402owFNkqZH5a
	5c5ymwbQos89kDkyZs2s02c5vtI6DD7nY8Ec64yIYhSfqW4H7LKy1yPYmZGAVhJtB9WBclaIxwQ
	AsmZnXLs//f2X4Y56AYNn0ynwHlfIl1NbLPcLRmRcFFLqZdxddEVx/UMsr1ucJQ==
X-Received: by 2002:a05:600c:871a:b0:4a7:d9b1:b684 with SMTP id 5b1f17b1804b1-4ac14ec7947mr322064755e9.2.1793726467464;
        Tue, 03 Nov 2026 09:21:07 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:8b77:19e1:26f7:89f2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac08b72579sm8800675e9.2.2026.11.03.09.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 09:21:07 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH 2/4] clk: renesas: rzv2h-cpg: Add validation hook to PLL parameter search
Date: Tue,  3 Nov 2026 17:20:55 +0000
Message-ID: <20261103172057.617203-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103172057.617203-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261103172057.617203-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

rzv2h_get_pll_pars() returns the candidate with the smallest frequency
error, which can be unusable for callers whose constraints come from
downstream PLLs, such as the MIPI DSI driver.

Add rzv2h_cpg_get_pll_pars_validate(), which takes a callback and its
context. The callback is invoked for every candidate in search order and
the first one it accepts is returned, which is not necessarily the one
with the smallest error. Rejected candidates are never returned, so
false means none was accepted. rzv2h_get_pll_pars() becomes a wrapper
passing a NULL validator, so its behaviour is unchanged.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/clk/renesas/rzv2h-cpg-lib.c | 61 +++++++++++++++++++++++++----
 include/linux/clk/renesas.h         | 22 +++++++++++
 2 files changed, 75 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg-lib.c b/drivers/clk/renesas/rzv2h-cpg-lib.c
index 4b59bf60edb0..a49add2f2fc3 100644
--- a/drivers/clk/renesas/rzv2h-cpg-lib.c
+++ b/drivers/clk/renesas/rzv2h-cpg-lib.c
@@ -62,31 +62,47 @@ struct rzv2h_pll_div_pars rzv2h_cpg_get_cached_pll_pars(unsigned int dsi_instanc
 }
 
 /**
- * rzv2h_cpg_get_pll_pars - Finds the best combination of PLL parameters
- * for a given frequency.
+ * rzv2h_cpg_get_pll_pars_validate - Finds a combination of PLL parameters
+ * for a given frequency, optionally accepted by a validation callback.
  *
  * @limits: Pointer to the structure containing the limits for the PLL parameters
- * @pars: Pointer to the structure where the best calculated PLL parameters values
+ * @pars: Pointer to the structure where the calculated PLL parameters values
  * will be stored
  * @freq_millihz: Target output frequency in millihertz
+ * @validator: Pointer to a structure containing a validation callback and
+ * context, or NULL
  *
- * This function calculates the best set of PLL parameters (M, K, P, S) to achieve
+ * This function calculates a set of PLL parameters (M, K, P, S) to achieve
  * the desired frequency.
  * There is no direct formula to calculate the PLL parameters, as it's an open
  * system of equations, therefore this function uses an iterative approach to
- * determine the best solution. The best solution is one that minimizes the error
- * (desired frequency - actual frequency).
+ * determine the solution.
+ *
+ * When validator is NULL, the function searches for the solution that minimizes
+ * the error (desired frequency - actual frequency) and returns the best match.
+ *
+ * When validator is provided, the callback is invoked for every candidate in
+ * search order and the first one it accepts is returned, even if it is not the
+ * one with the smallest error. Candidates the callback rejects are never
+ * returned, so false is returned when none is accepted. This allows additional
+ * constraints beyond frequency matching to be satisfied (e.g., derived PLL
+ * parameters must also meet certain criteria). The callback runs once per
+ * candidate, so it must be cheap and must not sleep.
  *
  * Return: true if a valid set of parameters values is found, false otherwise.
  */
-bool rzv2h_cpg_get_pll_pars(const struct rzv2h_pll_limits *limits,
-			    struct rzv2h_pll_pars *pars, u64 freq_millihz)
+bool rzv2h_cpg_get_pll_pars_validate(const struct rzv2h_pll_limits *limits,
+				     struct rzv2h_pll_pars *pars, u64 freq_millihz,
+				     const struct rzv2h_pll_validator *validator)
 {
 	unsigned long input_fref = limits->input_fref ?: (24 * MEGA);
 	u64 fout_min_millihz = mul_u32_u32(limits->fout.min, MILLI);
 	u64 fout_max_millihz = mul_u32_u32(limits->fout.max, MILLI);
 	struct rzv2h_pll_pars p, best;
 
+	if (WARN_ON(validator && !validator->validate))
+		return false;
+
 	if (freq_millihz > fout_max_millihz ||
 	    freq_millihz < fout_min_millihz)
 		return false;
@@ -191,6 +207,15 @@ bool rzv2h_cpg_get_pll_pars(const struct rzv2h_pll_limits *limits,
 				p.error_millihz = freq_millihz - output;
 				p.freq_millihz = output;
 
+				/* Take the first set the caller accepts */
+				if (validator) {
+					if (validator->validate(&p, validator->context)) {
+						*pars = p;
+						return true;
+					}
+					continue;
+				}
+
 				/* If an exact match is found, return immediately */
 				if (p.error_millihz == 0) {
 					*pars = p;
@@ -211,6 +236,26 @@ bool rzv2h_cpg_get_pll_pars(const struct rzv2h_pll_limits *limits,
 	*pars = best;
 	return true;
 }
+EXPORT_SYMBOL_NS_GPL(rzv2h_cpg_get_pll_pars_validate, "RZV2H_CPG");
+
+/**
+ * rzv2h_cpg_get_pll_pars - Finds the best combination of PLL parameters
+ * for a given frequency.
+ *
+ * @limits: Pointer to the structure containing the limits for the PLL parameters
+ * @pars: Pointer to the structure where the best calculated PLL parameters values
+ * will be stored
+ * @freq_millihz: Target output frequency in millihertz
+ *
+ * See rzv2h_cpg_get_pll_pars_validate() for more details.
+ *
+ * Return: true if a valid set of parameters values is found, false otherwise.
+ */
+bool rzv2h_cpg_get_pll_pars(const struct rzv2h_pll_limits *limits,
+			    struct rzv2h_pll_pars *pars, u64 freq_millihz)
+{
+	return rzv2h_cpg_get_pll_pars_validate(limits, pars, freq_millihz, NULL);
+}
 EXPORT_SYMBOL_NS_GPL(rzv2h_cpg_get_pll_pars, "RZV2H_CPG");
 
 /*
diff --git a/include/linux/clk/renesas.h b/include/linux/clk/renesas.h
index c1582ed9bf69..c846d926020c 100644
--- a/include/linux/clk/renesas.h
+++ b/include/linux/clk/renesas.h
@@ -192,10 +192,25 @@ struct rzv2h_pll_div_pars {
 		.k = { .min = -32768, .max = 32767 },			\
 	}								\
 
+/**
+ * struct rzv2h_pll_validator - Callback structure for custom PLL parameter validation
+ *
+ * @validate: Validation function that checks if the computed PLL parameters are acceptable
+ * @context: Opaque pointer to any data needed by the validation function
+ */
+struct rzv2h_pll_validator {
+	bool (*validate)(const struct rzv2h_pll_pars *pars, void *context);
+	void *context;
+};
+
 #ifdef CONFIG_CLK_RZV2H_CPG_LIB
 bool rzv2h_cpg_get_pll_pars(const struct rzv2h_pll_limits *limits,
 			    struct rzv2h_pll_pars *pars, u64 freq_millihz);
 
+bool rzv2h_cpg_get_pll_pars_validate(const struct rzv2h_pll_limits *limits,
+				     struct rzv2h_pll_pars *pars, u64 freq_millihz,
+				     const struct rzv2h_pll_validator *validator);
+
 bool rzv2h_cpg_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
 				 struct rzv2h_pll_div_pars *pars,
 				 const u8 *table, u8 table_size, u64 freq_millihz);
@@ -210,6 +225,13 @@ static inline bool rzv2h_cpg_get_pll_pars(const struct rzv2h_pll_limits *limits,
 	return false;
 }
 
+static inline bool rzv2h_cpg_get_pll_pars_validate(const struct rzv2h_pll_limits *limits,
+						   struct rzv2h_pll_pars *pars, u64 freq_millihz,
+						   const struct rzv2h_pll_validator *validator)
+{
+	return false;
+}
+
 static inline bool rzv2h_cpg_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
 					       struct rzv2h_pll_div_pars *pars,
 					       const u8 *table, u8 table_size,
-- 
2.56.0

