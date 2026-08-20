Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E14420E023
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 13:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787230955; cv=none; b=rc/+s/kYU7P+jnCbz+WJ59PPGL8OKDNQumWGdnoRQehkluE6IR9qfVPv8LsspIh+jQ2Z7qLChxVZ3SnAWgT4aRS98jI9kXhV4JDAV3QzTkPGLSAqSrqgj9jeZBRSCB0sjo7nHRxy5N342UBjbBWgk9VviYNy/bZnciAAsh6uDEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787230955; c=relaxed/simple;
	bh=WTaTT030ZqziofZKLRvlnNQqm+oCFioHNX1xQWgwNDI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GUs14Xbln7EAraorRBGpUHKywKnWILmtXsBdt3GhsmM5JHIgDI3FeWWWlWZKbvwl/XYEpgKjv/J+6R8dSluaOu9i77hAWarVPd6Zr+jJ0cx0S5+96H/rHmQk95Rwe0cGbAK1PsWiW1hvkQgcvESL6EdkRld4GQBTMhv2adGtojE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za; spf=none smtp.mailfrom=ffroot.co.za; dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b=QOlaZ1Yg; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b="QOlaZ1Yg"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-499b57cf2f3so2098225e9.0
        for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 06:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1787230951; x=1787835751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lJQEYfDd5lCDevCn6r75/uRZma7oJzqLkyHUzsb8FjE=;
        b=QOlaZ1YguVjqPJZ9kfvfoe4G3lbJ2t67gbjdxbnJoYY9Ya/KqT0MJtYM9WpPVQwUxV
         VVf7OEA+ik8I+PkiP0Hj2ydkt7ywSoZyQ1WvqYsfH+3E+Iy/7N2lLDKUwg2yWWOU5tCz
         hJnlWBbx2Jur7DYE3QgPyW59H6gulsTo9BaHAob6qwHsL8e1wIh6wSAfma3yNR8K60k0
         IJx5zNuNZKmUvq1fSmn6LtXvfLpVR4Tpjt/N7/75XI4u/jiPHFrT8CP6x7gyrU84Poso
         wSUbPRwbZzOPWi1nKbPSXwsSZExleP9FFNmS/ZKDf2/aS30q0jYMLpTuE9Ggn9o2qzhJ
         qO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787230951; x=1787835751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lJQEYfDd5lCDevCn6r75/uRZma7oJzqLkyHUzsb8FjE=;
        b=BVLkIxbJBKRWsw/ejaD5YWrv9F+ZsbHTGOm4kzcTB+f6ZizVX6xoo0rMOOlCn/F10S
         rkkYFhlxlAyddPPSkZ1xB1xcZiprJgnzYC5i+aKFcPsLPh/e/i1uKtnrt82rNVcx60RT
         leOVr80oggbtZWeqkjV+tLQ/UpQ+7nw2FTk9f396PxoVXCDskzWtukA/nbixCYPumDlg
         QYXhwNkLSpHVb3FDXfrTSOkgL7EK1/E/K+kSmBkZYifzAbWMIvFj5cEaNA8wk2/O8jiR
         POMpBxKt0138KOvMXJnXDF09Ft42vmvDMknb/Mtdv1ULHjLNLYHFnRyOzv4zD6zK+5At
         rzLg==
X-Gm-Message-State: AOJu0YzJ77LOg4omXjROJGFWL3w51TcqLEB2Gxw7gxjOXDiJYgwX9D6E
	2i/b/3CMCvzsmjXgmMqXtVgxo1QOOaPo4WewOeNe28vo9kvQSMt1ls9MJmBqOCQ83zznErcm4K+
	l5mtl6nk=
X-Gm-Gg: AR+sD1091G+spWXGEllMN2vCGJhojzRuRCvadZ/yfwqEuuMqFkvI19AgPF0e8eOcS6l
	vKsRFIIsisCL7vzMXNS+H5iSwIkaFIUrP5N7a3ff+Bq6dTIpObU+RSVxJYoaSh5Jmhk+jWzK/y7
	/djh+I5tIbAl0tR3yGs81Uan0YDusWORzbgi4uKhn6SieUfFDWVDiTNAk9dHV/vnIth4kx8bL+1
	gVOlgplTOL0Jvy24+qfX75+8Ldi83sXnu2R4yapGFS2bTAcF0AH9yD2ukuXzQdFxTNUc2v9VoJM
	RilVEeCEfapokOEEW1FcWoq/uCMgT+jrFvi7gctfJi1NQOOO2QlkIRUyZDFSqEOpgngf/F41yuv
	bOgDlxR7G730+tWuz+NixR0Wj188SXPtf8wPIyPlqr/2Qo/SsqYGmozNaSHRapO0Q+tL17PJZif
	WeW/BxlBsA90DqRe3i25c1jxpWzvweR1JEe6P7c4my2DYODx7+Cp69CHj8n7uNdp1K1ReWeUrkB
	/5CAeArEK+xbF6TZNvihjvo
X-Received: by 2002:a05:600c:1d15:b0:499:b2ce:e394 with SMTP id 5b1f17b1804b1-499b2cee3femr55797285e9.5.1787230951264;
        Thu, 20 Aug 2026 06:02:31 -0700 (PDT)
Received: from dev-ag.figment.co.za ([102.33.165.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b1441748sm13584333f8f.8.2026.08.20.06.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 06:02:30 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-clk@vger.kernel.org
Cc: qinjian@cqplus1.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH] clk: sp7021: fix infrastructure clocks clobbering PLL provider entries
Date: Thu, 20 Aug 2026 15:02:24 +0200
Message-ID: <20260820130224.1584902-1-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sp_clk_gates[] array previously included 9 infrastructure gate
clocks (CLK_SYSTEM, CLK_IOCTL, etc.) appended after the 64 DT-visible
gate clocks. The registration loop used the array index directly as the
hws[] index, so infrastructure clocks at positions 64-72 overwrote
hws[PLL_A] through hws[PLL_SYS].

As a result, DT lookups for <&clkc PLL_E_25> (index 67), PLL_E_2P5
(66) and PLL_E_112P5 (68) silently resolved to CLK_RBUS, CLK_IOP and
CLK_SDCTRL0 respectively. The L2SW Ethernet driver believed it was
holding the PLLE outputs, but was actually double-referencing already-
critical infrastructure clocks. The real PLLE outputs remained at
enable_count=0 and were powered down by clk_disable_unused(), causing
an Ethernet hang on boards with fixed-link MAC-to-MAC connections.

Fix by splitting infrastructure clocks into a separate sp_clk_infra[]
array and registering them with a dedicated loop that uses a local hw
variable rather than an hws[] slot. Since these clocks have no DT
consumer they do not need to appear in the of_clk provider table.

With the provider table correct, the L2SW driver's devm_clk_get_enabled()
calls now hold the actual PLLE outputs, making CLK_IS_CRITICAL on plle
and its sub-outputs unnecessary. Remove it.

Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 drivers/clk/clk-sp7021.c | 42 +++++++++++++++++++++++++++++-----------
 1 file changed, 31 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/clk-sp7021.c b/drivers/clk/clk-sp7021.c
index 1d067b0af8a7..50c667cbb3dc 100644
--- a/drivers/clk/clk-sp7021.c
+++ b/drivers/clk/clk-sp7021.c
@@ -124,9 +124,14 @@ static const struct sp_clk_gate_info sp_clk_gates[] = {
 	{ 0x97 },
 	{ 0x98 },		/* CLK_ICM: Input Capture Module */
 	{ 0x99, 0, true },	/* CLK_AXI_GLOBAL: AXI interconnect, no driver consumer */
-	/* Infrastructure clocks: all default to enabled in hardware but
-	 * have no driver consumer, so marked critical to prevent gating.
-	 */
+};
+
+/*
+ * Infrastructure clocks have no DT consumer so are not exposed
+ * through the of_clk provider. They are registered separately and
+ * marked CLK_IS_CRITICAL so clk_disable_unused() never gates them.
+ */
+static const struct sp_clk_gate_info sp_clk_infra[] = {
 	{ 0x00, 0, true },	/* CLK_SYSTEM:  SYSTEM CLKEN    mo_clken0 bit 0  */
 	{ 0x03, 0, true },	/* CLK_IOCTL:   IOCTL CLKEN     mo_clken0 bit 3  */
 	{ 0x04, 0, true },	/* CLK_IOP:     IOP CLKEN       mo_clken0 bit 4  */
@@ -644,25 +649,23 @@ static int sp7021_clk_probe(struct platform_device *pdev)
 	/*
 	 * PLLE and all its sub-outputs are used by the L2SW Ethernet switch
 	 * (50MHz RMII, 25MHz MII/100M, 2.5MHz MII/10M, 112.5MHz MAC fabric).
-	 * The L2SW driver explicitly claims these via clock-names in DTS, but
-	 * CLK_IS_CRITICAL is kept as a belt-and-suspenders guard in case the
-	 * driver consumer reference isn't sufficient on all board configurations.
+	 * The L2SW driver explicitly claims these via clock-names in DTS.
 	 */
 	hws[PLL_E] = sp_pll_register(dev, "plle", &pd_ext, PLLE_CTL,
-				     6, 2, 50000000, 0, 0, CLK_IS_CRITICAL);
+				     6, 2, 50000000, 0, 0, 0);
 	if (IS_ERR(hws[PLL_E]))
 		return PTR_ERR(hws[PLL_E]);
 	pd_e.hw = hws[PLL_E];
 	hws[PLL_E_2P5] = sp_pll_register(dev, "plle_2p5", &pd_e, PLLE_CTL,
-					 13, -1, 2500000, 0, 0, CLK_IS_CRITICAL);
+					 13, -1, 2500000, 0, 0, 0);
 	if (IS_ERR(hws[PLL_E_2P5]))
 		return PTR_ERR(hws[PLL_E_2P5]);
 	hws[PLL_E_25] = sp_pll_register(dev, "plle_25", &pd_e, PLLE_CTL,
-					12, -1, 25000000, 0, 0, CLK_IS_CRITICAL);
+					12, -1, 25000000, 0, 0, 0);
 	if (IS_ERR(hws[PLL_E_25]))
 		return PTR_ERR(hws[PLL_E_25]);
 	hws[PLL_E_112P5] = sp_pll_register(dev, "plle_112p5", &pd_e, PLLE_CTL,
-					   11, -1, 112500000, 0, 0, CLK_IS_CRITICAL);
+					   11, -1, 112500000, 0, 0, 0);
 	if (IS_ERR(hws[PLL_E_112P5]))
 		return PTR_ERR(hws[PLL_E_112P5]);
 
@@ -689,7 +692,7 @@ static int sp7021_clk_probe(struct platform_device *pdev)
 		return PTR_ERR(hws[PLL_SYS]);
 	pd_sys.hw = hws[PLL_SYS];
 
-	/* gates */
+	/* gates, directly mapped into hws[] for DT lookup */
 	for (i = 0; i < ARRAY_SIZE(sp_clk_gates); i++) {
 		char name[10];
 		u32 j = sp_clk_gates[i].reg;
@@ -706,6 +709,23 @@ static int sp7021_clk_probe(struct platform_device *pdev)
 			return PTR_ERR(hws[i]);
 	}
 
+	/* infrastructure gates, not in hws[] */
+	for (i = 0; i < ARRAY_SIZE(sp_clk_infra); i++) {
+		char name[14];
+		u32 j = sp_clk_infra[i].reg;
+		struct clk_hw *hw;
+
+		sprintf(name, "infra_0x%02x", j);
+		hw = devm_clk_hw_register_gate_parent_data(dev, name, &pd_sys,
+							   CLK_IS_CRITICAL,
+							   clk_base + (j >> 4) * 4,
+							   j & 0x0f,
+							   CLK_GATE_HIWORD_MASK,
+							   NULL);
+		if (IS_ERR(hw))
+			return PTR_ERR(hw);
+	}
+
 	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
 }
 
-- 
2.53.0

