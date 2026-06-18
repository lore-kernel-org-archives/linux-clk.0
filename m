Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A63A2C325C
	for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 18:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781806796; cv=none; b=AxQ9Pu9o7mfx4L3wHFcbhAV5W1kbpTFvXKY8c7pxPKLHDd+HBdE3/aOf/MziKaXA7turWnY4A5OAYyjRa0Je9upkDl4aex9E0Z7ZjK+4l6kYHY5O4aTjLAIbD+Qr3KxWB6ymB8nNamVSTXbsgagOzFE2Cs8CwEETCPm6OfNxcCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781806796; c=relaxed/simple;
	bh=FVIPY1tpmqUCfjcHpr64kdi2gllDdfhZLzamW+VAut4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nu4+COehr2bNs0VEtaHpKb24IrnKgUa/GgV3+az8wrhPC7Xzf//Zq82wC45UftuRB0Vi5tW1dxvWhRdbDq2bZzjJnjEgQufsTEjgTxuPhzLo2UV2Aq9VhBXrhBGlWsngkJEiOoCtex9G2eP96wEipurC6YrukI4o5yIFRmwt1i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=covb9dzq; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="covb9dzq"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4921e4dd62dso10149635e9.0
        for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 11:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781806793; x=1782411593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8jEq3xPdR6OLs4jvkvbhYoDUoAuNjkoOpaFOrvr2Puk=;
        b=covb9dzqsN83Bov+qRdEzYnZoW/3GP56vUakvzrMpq7XHCMAdjoR9KcfGuHKWfSlLA
         aXno/YVIIC4Wkt/XeiPFxXBf9usgJ3Y6e0ZKHu+Y3f75bvqXFE0DagE14IRiwpzyE9hS
         Uu1lnkwYB1R2OuZMgqS5TUJXKjSQM2kZf7jL4Zc+iQ5rIPkMyRrwVcvYBzSLHbQYv8OI
         1vPzElfpeTUIo+S1tUbSvZhN5AVfqfi+nlRkDaz2jhcePoXZ0tWE2EL3m4J1g016T149
         BK7MRBAHmal3vSSxujtDvrRVdj6kAL9YxNTlBTp9eMaX8ovey1E5keClSeL+diO5N38y
         kSWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781806793; x=1782411593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8jEq3xPdR6OLs4jvkvbhYoDUoAuNjkoOpaFOrvr2Puk=;
        b=Qn33yhpPOc0l2fAD439jiUrZ6G/1V6fcu0E1YnIrTsVmQ07BHmAvZ5HrHgpmp2EQeY
         SqUgEtlV3KJGQc3SZ8yvmr6dwLyCf4Bzzpa2gLPdcAgyXT4fCGoI3Mb0OyvU8eCxSVDz
         AEpW52Y2FJoXn3T72ffwjBT56wE29JIXagT+0V9pznrG424T/2NlB843CAcJHT1OJHtE
         SxvhwlZYvfQ+B4i5T7xWrTNBH/zTJS0LRcZoF5Fe6Q6i6u0LZMdSdJMSdnpWfpeFuWI8
         +yLDFd3ohp7zN/jiuGzi2KKMF3i/8t6gxScWJT38i5p+djhA6x5qReMdLA5y5yI9Z52b
         9DsA==
X-Forwarded-Encrypted: i=1; AFNElJ/VfpKrhvfnW3njJu7qr1M+bhgR/9Cf70MlLgf0RkUcj9NIKTN00OdbkWmLcHEwDXWMSnwfOjsyj40=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlPOCpQycoy4iARlTWB5b00HJj1qAeI2kOJmOLv3bWcNqI+lQF
	/848+ZNxcfYOBEpvNqcRUqJEwZstJW/tmi4C/xWsVI704/xM/vAIOCHl
X-Gm-Gg: AfdE7cmTMyPxppUpWCQvTr1zH+JrJe5y1MdnsquS4N1O5EGlmU7wsOwVnPtZgD7bT9n
	PEagwzMUJvcku7qeTZcILmIRCtiQFdzYeBGxhk0nsiqcv9TRNOmg2fYoYVdWd/UlcZGqPYFe9f7
	mapvCZGRg+dPsoId40medUiA+srsM6xqmC3NBBPkMBK1QGIEWJARbvd9/47/Fkp6ydgRlRfPVJF
	8bsPxXF69Ky+4XdBgDxpZI3EK60KbUVlme0MUeiL0P7UzsXrh9Gf1qQ/QXS6TzGPU4exUJNkowP
	nQ0Bjicf7jT0/UVMywAFy7tmz0BppYQVxhsmY5xlf8yk9lWxZ2wu3fvjhiLVuB1DtUzLiNNNa2f
	wrBFiQkFmPIcpp9+Ahoe12dgzyzNGNGJR6Fq16/PEiucjw5fn3nB775YTi4GYKw5fzK2XfBKoFm
	z25H0c0d+rzlxTa7AQcFwlw5yirBhUf/NtAkzsLb00+V1TjdYHJuUsbSiJEY5YFRIHMifCa/6fm
	cHl42sNJwxtNAWUycMSm136vTFpPpOC7pEVlA==
X-Received: by 2002:a05:600c:c04b:10b0:492:2ffd:8a74 with SMTP id 5b1f17b1804b1-49240a38ba5mr1602745e9.12.1781806793083;
        Thu, 18 Jun 2026 11:19:53 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3bf7:d534:a488:f67d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-465090c42e1sm869435f8f.11.2026.06.18.11.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 11:19:52 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 1/5] clk: renesas: rzv2h-cpg: Use per-SoC PLL reference frequency for calculations
Date: Thu, 18 Jun 2026 19:19:45 +0100
Message-ID: <20260618181949.3036280-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618181949.3036280-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260618181949.3036280-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Introduce a per-SoC PLL reference input frequency parameter to avoid
relying on a hardcoded 24MHz constant during PLL configuration math.

Add an input_fref member to struct rzv2h_pll_limits. In the core
calculation helper rzv2h_get_pll_pars(), derive the base input clock
rate from limits->input_fref, utilizing the conditional ternary operator
to fall back to 24MHz if the struct field is left uninitialized (0),
and drop the obsolete macro RZ_V2H_OSC_CLK_IN_MEGA.

This abstraction permits the reuse of the common PLL divider logic on
newer SoC platforms like the RZ/T2H, which feature a 48 MHz PLL reference
clock input instead of the 24 MHz signal used by RZ/V2H(P), without
disrupting existing platforms.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3->v4:
- Fixed MHz to Hz for input_fref in the doc comment for
  struct rzv2h_pll_limits.
- Added RB tag from Geert.

v2->v3:
- No change

v1->v2:
- Dropped RZ_V2H_OSC_CLK_IN_MEGA macro in favor of direct use of the
  input_fref field with a fallback.
- Updated the doc to specify the default value of input_freq when it is 0.
- Updated commit message
---
 drivers/clk/renesas/rzv2h-cpg.c | 8 ++++----
 include/linux/clk/renesas.h     | 5 +++++
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index e271c04cee34..fff89f2bdc0b 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -218,7 +218,6 @@ struct rzv2h_plldsi_div_clk {
 #define to_plldsi_div_clk(_hw) \
 	container_of(_hw, struct rzv2h_plldsi_div_clk, hw)
 
-#define RZ_V2H_OSC_CLK_IN_MEGA		(24 * MEGA)
 #define RZV2H_MAX_DIV_TABLES		(16)
 
 /**
@@ -242,6 +241,7 @@ struct rzv2h_plldsi_div_clk {
 bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
 			struct rzv2h_pll_pars *pars, u64 freq_millihz)
 {
+	unsigned long input_fref = limits->input_fref ?: (24 * MEGA);
 	u64 fout_min_millihz = mul_u32_u32(limits->fout.min, MILLI);
 	u64 fout_max_millihz = mul_u32_u32(limits->fout.max, MILLI);
 	struct rzv2h_pll_pars p, best;
@@ -254,7 +254,7 @@ bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
 	best.error_millihz = S64_MAX;
 
 	for (p.p = limits->p.min; p.p <= limits->p.max; p.p++) {
-		u32 fref = RZ_V2H_OSC_CLK_IN_MEGA / p.p;
+		u32 fref = input_fref / p.p;
 		u16 divider;
 
 		for (divider = 1 << limits->s.min, p.s = limits->s.min;
@@ -335,9 +335,9 @@ bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
 					continue;
 
 				/* PLL_M component of (output * 65536 * PLL_P) */
-				output = mul_u32_u32(p.m * 65536, RZ_V2H_OSC_CLK_IN_MEGA);
+				output = mul_u32_u32(p.m * 65536, input_fref);
 				/* PLL_K component of (output * 65536 * PLL_P) */
-				output += p.k * RZ_V2H_OSC_CLK_IN_MEGA;
+				output += p.k * input_fref;
 				/* Make it in mHz */
 				output *= MILLI;
 				output = DIV_U64_ROUND_CLOSEST(output, 65536 * p.p * divider);
diff --git a/include/linux/clk/renesas.h b/include/linux/clk/renesas.h
index 0949400f44de..798bb0b54bab 100644
--- a/include/linux/clk/renesas.h
+++ b/include/linux/clk/renesas.h
@@ -53,6 +53,9 @@ static inline void rzg2l_cpg_dsi_div_set_divider(u8 divider, int target) { }
  * various parameters used to configure a PLL. These limits ensure
  * the PLL operates within valid and stable ranges.
  *
+ * @input_fref: Reference input frequency to the PLL (in Hz). If set
+ * to 0, a default value of 24MHz is used.
+ *
  * @fout: Output frequency range (in MHz)
  * @fout.min: Minimum allowed output frequency
  * @fout.max: Maximum allowed output frequency
@@ -78,6 +81,8 @@ static inline void rzg2l_cpg_dsi_div_set_divider(u8 divider, int target) { }
  * @k.max: Maximum delta-sigma value
  */
 struct rzv2h_pll_limits {
+	u32 input_fref;
+
 	struct {
 		u32 min;
 		u32 max;
-- 
2.54.0

