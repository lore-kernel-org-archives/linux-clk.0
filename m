Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9637E2609EF
	for <linux-clk@vger.kernel.org>; Wed, 11 Jun 2025 09:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749634803; cv=none; b=KLeLkO7bup2KXLkwmauDyQiPgLP3jRAT5ahU0op7AubWUd0NIKaKCxWu4jYF/jWimdcghQoL0fTTR3E/WafAoin2vzTt9qXc1V7S8lIgU/9Sg1ZGz7f72xyFnpqBRiNqPZY0HyAaZYjnQpYeA4bPpb8UJKQvE35NG7SLabb2iqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749634803; c=relaxed/simple;
	bh=F8ZsRYc4t7D9nMCh4U8wknMtX9Zqpdj7+tL9h3vM9d4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EwQVQCN3B5GrjBgoNYZUxomA7xzUJ4misGvQigIa9frrT1R98dQIJo09izlYwadsQt9TBrz2X0tgCM0hYvIgWsw28fZgsRymmkUyX328+bnxORGuMmEYjK8pbGDZfY/Ygw5jUuyCMZTe8Vwk5NFMe7H/u+U4ysCOalpft6ppCpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=S1Js/26N; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="S1Js/26N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=mTyIkW7jrdC/3TA5WvLd1QxAsTPlEc6dF3FZAR7ZyJk=; b=S1Js/2
	6Nyksfb+uAsGIY1dB5q87IMCGrFBSsnNkoz64xBZAwmUvbde0IZAwhrkMPlt0vi0
	d9rF/4TOJ07FvZ801IGyFKRo2/90szeZ6TWXwaF8+TZYAv4SXpTvigx9uhlsU+iQ
	eLufeJitKO2ADWXi8cJP0tGlQlV8/sUKAKXN/CvgKUOsz3WgqoOkg5vohJou9+8S
	4CF2uaVSFFE0Ob4AKDmMH+4O4jQXLt9UZYYIkHFP/bEGJybPirgYJ92nRDmix3sC
	GnMdknEPsM9hTf9rn3pBch/daeqcJDmIoIh/9P1lcv2RnvI75hWGS9YvJPZ79Dib
	uQNW9oOeuv/W4kUw==
Received: (qmail 3186393 invoked from network); 11 Jun 2025 11:39:50 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Jun 2025 11:39:50 +0200
X-UD-Smtp-Session: l3s3148p1@OHklmEg37LAgAwDPXy2/ACpZfVCNKldR
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Subject: [PATCH RFC 2/7] clk: renesas: r9a09g047: Add I3C0 clocks and resets
Date: Wed, 11 Jun 2025 11:39:26 +0200
Message-ID: <20250611093934.4208-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Add Renesas RZ/G3E R9A09G047 I3C0 clocks and reset support into
cpg driver.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/clk/renesas/r9a09g047-cpg.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index 21699999cedd..3e50447ed9f3 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -160,6 +160,12 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
 						BUS_MSTOP(5, BIT(13))),
 	DEF_MOD("scif_0_clk_pck",		CLK_PLLCM33_DIV16, 8, 15, 4, 15,
 						BUS_MSTOP(3, BIT(14))),
+	DEF_MOD("i3c_0_pclkrw",			CLK_PLLCLN_DIV16, 9, 0, 4, 16,
+						BUS_MSTOP(10, BIT(15))),
+	DEF_MOD("i3c_0_pclk",			CLK_PLLCLN_DIV16, 9, 1, 4, 17,
+						BUS_MSTOP(10, BIT(15))),
+	DEF_MOD("i3c_0_tclk",			CLK_PLLCLN_DIV8, 9, 2, 4, 18,
+						BUS_MSTOP(10, BIT(15))),
 	DEF_MOD("riic_8_ckm",			CLK_PLLCM33_DIV16, 9, 3, 4, 19,
 						BUS_MSTOP(3, BIT(13))),
 	DEF_MOD("riic_0_ckm",			CLK_PLLCLN_DIV16, 9, 4, 4, 20,
@@ -239,6 +245,8 @@ static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
 	DEF_RST(7, 7, 3, 8),		/* WDT_2_RESET */
 	DEF_RST(7, 8, 3, 9),		/* WDT_3_RESET */
 	DEF_RST(9, 5, 4, 6),		/* SCIF_0_RST_SYSTEM_N */
+	DEF_RST(9, 6, 4, 7),		/* I3C_0_PRESETN */
+	DEF_RST(9, 7, 4, 8),		/* I3C_0_TRESETN */
 	DEF_RST(9, 8, 4, 9),		/* RIIC_0_MRST */
 	DEF_RST(9, 9, 4, 10),		/* RIIC_1_MRST */
 	DEF_RST(9, 10, 4, 11),		/* RIIC_2_MRST */
-- 
2.47.2

