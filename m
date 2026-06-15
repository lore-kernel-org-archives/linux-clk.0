Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249E8337BA3
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 10:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781520533; cv=none; b=HAI3/CzB0ZpSC3i8P0PbVa2E6hjfuFkCXzuWeCEaOEvcOIFVVsHT8thlMP8GmQVr1nZEP8XbAL3SKppKo+eMcEi47TBOBBvBeXLbVnttMnxRWpEUdyzM5ZZk+hmVf0I5JgRMUo3fz8KsBNNMBpJMY6tn9YkrGqBC1ml3Kj0or1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781520533; c=relaxed/simple;
	bh=+yugR+VkpeDU1YTmH2+IVHiaYwR9RbHN8mN26aejHOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lbm+AUG6NMMuXX3k+NWegQJU+G22a2L9ytEBCq67QU/i2ohLArQbYI4OWyIoB+DYpI/5bm2J93as3UuKKdIwQYAH+BDHg5V254eBZB9g5a9F7vb2ttDEC0EJi2w2PaNM/k79DeKnGkoPciLq+U/GFv+ktv17nbpj+IKXd5jhBtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G812gQOh; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G812gQOh"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso30820025e9.0
        for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 03:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781520529; x=1782125329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3hGZ4SH9tCHny9E9iOba0SMLuDEJ7JVbxNU+JthER5Y=;
        b=G812gQOhXXiX9CLdYj94wCGmVr2cAOmAFfgptXEvUjJqErsoKiXVwD9u+l4i4VLTt7
         67NoMfYGq2bRzt0HF3Xlp286m1r4Y2SmfMfRcky6nbL19CjBW2v92FhJ5xyetPkB4oHP
         vZ6mHYbVymgZ2gQ1Sx8vguYFRk340O8/9lv6Xda/ib63vlzfEcy5ABp6WfbSnY4Y9ZY4
         wK9nMBjjO41ra1hwQnAD+HdgOiVMOy6HFLx+4CygxTxMWR5wBkR+Tm0cXKN0DDzEDkz2
         CzDR8wiTwmCk6v0Fb1QkGOeyeH76mlYV/kTYG2QBpJJeokw7wVDfq6FFocORl5XI8wsH
         TIwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781520529; x=1782125329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3hGZ4SH9tCHny9E9iOba0SMLuDEJ7JVbxNU+JthER5Y=;
        b=rZj15JbLMK6NjvyB+f5B1at+poHlcGTqWd8ZXh+C3QJem4SwN+x8tgVz639XN/SxQi
         xPlooZYW3k8VTxf+4HWU7JpFNrgw6NgxAoU+uJkK02vKnLLfCJvaOXM+MNcmxrwPuEHj
         igLTRorotbDWxvxVdcNu47R8YVUEP3oJLSaLpjrvHjcdFtsvbjhkcPiNiEA+lDc2lLwc
         313D6ZLmrkBRk3OqSpfRcXHxvwQmosPku1yXlynhYfiLbf+sCGldBUP1vH5s9raDHgvV
         XuBvERp1M8q6UZgYXt0wlBPiIZuQ3CWeRY1HxVDv42zjvlHTdbD+Rsa+o47rzVQwkceg
         7zdQ==
X-Forwarded-Encrypted: i=1; AFNElJ9WpaGhwNxBJlqYmdfWqnKppyQ6okeG2ViqHNayBkZx363gA8FqvG/QHh359q9V/exuwyttVyWRSJ4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw8tPYQieTICvbWzm82Ht1un/bf1h6epZQbv3nECdght4V1vv4
	z7t7XQmUSeUflOh2s3mK5O9GenU+JQctH3orHfu2Ijx0ceLy8YAihX8S
X-Gm-Gg: Acq92OHQcR+shtZpInZlVrHmNkLF4C39A/WgjbbEoiJP34gh+Ma8z7rrgx2wd55jZp7
	mbAlhue3AGeOqw5bgZQd0iGEODd7UXlJXGW5nIwOP4N8OJS5Mt7BalEGJmdh3v8Zwk+P2GewnD+
	ddq7jOlgct0sRduzwGrPWFNVi2ugWamQGW9Nq0YOxzanmweivrEinK/UIwvfwZ5sWOBsXVmBL/Y
	AKvz6ITH7/Prbvbo8CgGl7q4q8XUa5TWXG8wQRzcNnMdkXFKs0CwaZACf5TdbZBmpUreA42L/Km
	LCn22jQvscbHnrz8EGbWSggAFvpvsh7GkpN82oKN/27KNFif25uBS7L46VmZBfMhIEWiiAHFiRy
	beKH38ku0IySxAFJeWRAPFJVv7PrGtghzTxUnmiXbdsHGTq64xq6ZJo4mff3ZKzui5vJuuTWCf3
	CpBTesS2nyFc8QonimDNXqEnhOyW7ZXyrnNX6Wjb1yoYknBjgpeGyps2bPOEgfycCaPmh+y9skW
	N49U6l3+Wwh9A1ZszJHGupm7K81O+sq0Jsv
X-Received: by 2002:a05:6000:1788:b0:450:ad00:86aa with SMTP id ffacd0b85a97d-4606ce33976mr16781374f8f.15.1781520529439;
        Mon, 15 Jun 2026 03:48:49 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f1cdsm34812464f8f.11.2026.06.15.03.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 03:48:48 -0700 (PDT)
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
Subject: [PATCH v3 1/5] clk: renesas: rzv2h-cpg: Use per-SoC PLL reference frequency for calculations
Date: Mon, 15 Jun 2026 11:48:41 +0100
Message-ID: <20260615104845.4122868-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

