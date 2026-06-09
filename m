Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1D23FADF6
	for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2026 10:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781002774; cv=none; b=s/ZXYYhuKu1bngWQDywd8RidEJPxbb/xQh+w8vR37sbpUgL5u0FGYDCxgP8R+vQi+Xisu3Heqxu+IMS/ALazihgBkf1v+Blz8tsxXQgf5Vme93ukvP7jmyp+0SKDN3Fvt6vObBPmy1jiFBYq1X42uhB1mqe5HjKH3Wf7NTI6TDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781002774; c=relaxed/simple;
	bh=b12c6iLXA4awrYB8q5Y8WnRZMEHvy5W3/61wkBqgDSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Iu5xyR8vz6tvEcVk97c6wwaoR/Ud1pzSKbBv5YKSMjupSVC7qF4MbQhepyCQvy68FQ8CXml/FO0oK0XRageWEN86FIfWzDJHlTEDDkHPdvM5ZL4pBMSa9BzNomUVsQRH1R4JpNM5xG8ogyG+ta8GO7TSEqowJQlk90qSzBpG/U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jvO46vda; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jvO46vda"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b43e2b95so44253085e9.0
        for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 03:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781002772; x=1781607572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ft0f5hArd103x4WKKQghd8evqBTe2UKtulu4qdVwWY=;
        b=jvO46vdaY+XxZ/k+EPYwtNeYo3jqPTvnjRcGOyHT09aqHAYz9hw9vPMguZH1Sm5cj9
         sAQWuPY2ryMrHAiaENoJXLOZn5UT0/JBuESXn+sH7sEBG9HEpVCGU/K/CI2CoH4eYLDZ
         8LbKQ/2U/tq3cqxTSAUCcqKYVCnffq2wVb64vpJ1N+M97uaA1+DcyCEbdO0sM0KqHq3n
         /gbvMLx0KtldwnHKCt3NmH+9rKbJlhmGck7l87sUj5W57sVjNefvYBSLCYvuOqpSw61y
         9xQaU4URoySjJwqFm2T1Ucv9YQ9LhsAEyn288d9xAyUsXW68WvK8Uwcqr3QNFb4ldcHm
         zTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781002772; x=1781607572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2ft0f5hArd103x4WKKQghd8evqBTe2UKtulu4qdVwWY=;
        b=A+APYfho/jIv19LUd7A+oS7QH7DDsLLvtJDijh45hMT0jhGxEsqZyXvzuSgpaE6fJb
         CH+Of3qMCht0CP32WNANtpIw0ft2ew5WFXTrDdKQ2Lp+/IbzuAF1rGHa5PLYXHIXcUKb
         FEGyOAaYNNdhxYzr6ZHBoIQUzgOmWMzZZ07fHlgYNAmm7yYlo9xK4U3F/nmVgcUMwR1r
         bpYiBiYQrS+gBOj6LXAHx0fCCAE59gM72VBIO/mEG6wRnPfWsNK/vDhhxsJfOxzyF9td
         DZ24R3QqqI5bzM51eAmZzXu2kb0ZXlIfOWOhIFgSAnwYmet8sy0U1ZuG53jQySOWOsDg
         qb+Q==
X-Forwarded-Encrypted: i=1; AFNElJ+u19yM/VMcADUHQJR1mrqGMKzDeitoKXLeNSxI5VDxeZN9NYDVKnSCakHuQzA9F+/f8LtHi3ychAA=@vger.kernel.org
X-Gm-Message-State: AOJu0YylxcL+4SBn7HywBJ8bdwvcy/oLIIwmWHIvtbg2sHUH87AeYLbF
	jyO6i4LdD9sWnGX0i++DggK6G3WgSn9R8GAtPk6AGmRzMSn74D6NNO6w
X-Gm-Gg: Acq92OHNPbz20VwZGIlHoYf8sgm6UW/cN+Gi8P7ygwZnTupMlKdeSCxcr85/GLrKV0U
	zd3zlVw7pErCQ8NZbrx3Ojz4oONIZAt6RZg8c/GdRKLhnfMUfLzJcECIck1k894HyqMRf5D6Adf
	6ie6N91YekC67uk9eb1Y6la5k5HZDzPZGjw3q310qSxbR46cpMJfryzlV5I3y8TrrmcJe0QIpvI
	eW/eyXMRhqbiQBKRY1Swdc6EfJC2+dbIiZvuLkfPIG0C9m0L1AlQzijMb2m+CDnVPjiJO3S+k3A
	/Z/6BtX2e7+2M3uKxkUbXaHL2FraFZYIUx+ifivfG000KgYIiFT8SDX5VXSmtQ1hgMMzbbF1Xz2
	sRRW7Y1va+REkETPn6M5v8i0AEE8BoGzKtZwswS6ASkrdEZ48MxSIso8mwImiK+j/JKRceKAnAC
	q5FOwnPlG7l3oqeZJjR/NoGKI2OZWfwb0IpiPvrpal9dXlht+mgIPU6RHEIeW6XbQ+ooaUDCqWF
	jygPGDEeqsbeQjoIvg6jc+ubxXo8RSgzNymdglTF1anYtmhITqWkOBNeQ==
X-Received: by 2002:a05:600c:82c3:b0:490:9782:3eb8 with SMTP id 5b1f17b1804b1-490c25f4963mr307728995e9.25.1781002771771;
        Tue, 09 Jun 2026 03:59:31 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:2b2d:6009:3bbe:fb84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3d663csm524250635e9.11.2026.06.09.03.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:59:30 -0700 (PDT)
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
Subject: [PATCH v2 1/5] clk: renesas: rzv2h-cpg: Use per-SoC PLL reference frequency for calculations
Date: Tue,  9 Jun 2026 11:59:20 +0100
Message-ID: <20260609105924.962573-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609105924.962573-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260609105924.962573-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
to fall back to 24MHz if the struct field is left uninitialized (0), and
drop the obsolete macro RZ_V2H_OSC_CLK_IN_MEGA.

This abstraction permits the reuse of the common PLL divider logic on
newer SoC platforms like the RZ/T2H, which feature a 48 MHz PLL reference
clock input instead of the 24 MHz signal used by RZ/V2H(P), without
disrupting existing platforms.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
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
index 0949400f44de..2aeff01150c3 100644
--- a/include/linux/clk/renesas.h
+++ b/include/linux/clk/renesas.h
@@ -53,6 +53,9 @@ static inline void rzg2l_cpg_dsi_div_set_divider(u8 divider, int target) { }
  * various parameters used to configure a PLL. These limits ensure
  * the PLL operates within valid and stable ranges.
  *
+ * @input_fref: Reference input frequency to the PLL (in MHz). If set
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

