Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC373A900B
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 20:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783024147; cv=none; b=NqmxGi61Sr7B9PQsQCauyD+N9ZutMo9FsOgJx2fqTXhnIQvLou33c8QfiNJyMlHXas3wm3VrGZO2XwbAAE6EXWFaEKMz1zxu1o+DbplS4kXqfnQKmehuMJLUtknpOnwSdO2HSPk/xUWprkWnp5TOj37A/yJGn5rn/tWcoDBwOk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783024147; c=relaxed/simple;
	bh=by1PdQn8rq3EWFTQ7qk7AhNTkSnPgbFBVoCfGLLbwDQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dby6Sky4NG2GaoLqwMOCTcB7taSuM6ONKd1E79kK5reRIupBceMhvZaoJTbDKwJx/6/+A0frNyr7M8OfhZia1jYHHoUILR0iHAjWJeSX/CeCDxDdAL5YrkVKdHlU0dJQFVWn0mzn4JekQA7qKG81Ica4IbHnvcFpNWJ5PbV6yco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p8ekLNhS; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p8ekLNhS"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso14404375e9.3
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 13:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783024143; x=1783628943; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ZbT0Bi0HBJMhnFqg3mGe9eR0Pi0hz39Oao8TpKg6R8=;
        b=p8ekLNhSfIbnuz77q0syUQU0Ju67n2hDsCIFo5zBGt0vM4jyOIfvZVhrH9nF4rCJyz
         ltDdXc0NjB0cnFi5oXIVniv0jApXd/0Aj/0MxhMcrWeah3eAzaK4OHLuVF5MuvGZOaHH
         R94C9EIhWQhRRQajeBX286oPYNovvH9fw2Bz4gDdtocYr50uKLb3SFBg1UW53l1bcW0U
         RKmZN4V3eM19vYohxFnz4x8S2EyN2newVom3axJeW2kMy0/ptujtoMXWotVGbNxLGYTe
         XSKZkMRoUAuWO/D1gT5hBcQp6gE3pG5b1GCikxR0LzGBg9NGgCoZfHXC1cjXy9NFD/W3
         6k7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783024143; x=1783628943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5ZbT0Bi0HBJMhnFqg3mGe9eR0Pi0hz39Oao8TpKg6R8=;
        b=pnKsDmx3lMrY+GRdEgVzDulQ/EqMwdPePRQ+i2OEJYXaSonI+k4JTsx1P29gG0QPpe
         1LJ02VfDe5ZVZcaM805WEYnNUPyykId/h4CKdj8mpiCB63lPj6vSrosw6nTcWjBt5P5c
         sqyKnWsigUn0AUuL0KJOYAoL0WQxYnUS+wh8e3wqOJIfSRNHUw8G6yGEEP5o+MbPeArl
         G0nHxYfShaMKXv2s4O//MIy5tdPSsRqStGXfZJXjkzJ34MmNrJir2j30VtSrQHXtsElc
         5U6r5B02YsQ+Zf39u/EYXwpYKg1K7Wp/MgCw5MAH5b1WKYfCPFxSCkJ8N6XSZB+LsJ+O
         82aw==
X-Gm-Message-State: AOJu0YwXgLn0XhczdBDkM5elKK5OFWaKdBRGzF6GhahDFiHq2li2Z0ZZ
	jMJATRsMHaur4La0e6jL4NwgWsE8jrxB0K2nVzR9hq4thz5Ul72ZqrTy
X-Gm-Gg: AfdE7cmTsrt4khuTjXEBvD3sp23jgMqOIp7W93pjN+9V1/7rp8aeLB4fz/H2Ig0iN+L
	AI4zY0bhNfjACpBbaPg2X+56TKLjtrcTZAXHKe7L67BvjCs9sXBAuwzrMgp0x5Jgt6IayCa4Tek
	IdeBQZnJO+/7CKgmT2zv3zpaqHdri4M9tPcNaPLQlKXbZ1Y1isjsjI22rXT+2VWoofV2K75VaCK
	ljfFWZ+Y1wxhaUe7S8oUvJG9+bihkPQj888d97AfpHKWDotfSF5Ctfz0bBjGDcQXBkiayeYdy0K
	Yhb/XpnOTqxyFCucEjJWv3ntcdEszpNFugc7jEt0Jy5vvBIXDUCJLdM/MH9c5Pk3UB+KFbG708B
	zqLCfn5iNxMWhiWbEGkEWk2NgcdBhfKWGaL8c9fTeShzhC77rHcH9XQqcpzSF0Kafq5AvZBZaDx
	sqmM/o4Nv8FKsUcVmXd1BR6RhzF7PjtlGbxg==
X-Received: by 2002:a05:600c:3510:b0:493:be08:c372 with SMTP id 5b1f17b1804b1-493c2b43923mr117304065e9.17.1783024142797;
        Thu, 02 Jul 2026 13:29:02 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6369488sm80321145e9.9.2026.07.02.13.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 13:29:02 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Thu, 02 Jul 2026 23:28:04 +0300
Subject: [PATCH v6 09/12] clk: zte: Introduce a driver for zx297520v3
 matrix clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260702-zx29clk-v6-9-377b704f80c4@gmail.com>
References: <20260702-zx29clk-v6-0-377b704f80c4@gmail.com>
In-Reply-To: <20260702-zx29clk-v6-0-377b704f80c4@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9992;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=by1PdQn8rq3EWFTQ7qk7AhNTkSnPgbFBVoCfGLLbwDQ=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqRsnqIulNFRiwg+UdkUVdRa6F/79AUzxOr1et7
 JIWRKnoLhSJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCakbJ6hsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJN9w/+I/fPh2R/ZIxrABtrq8K79gqbi+2Jyao
 nNgrHDil8+SWWUBCxRGtv50gCu3sMBz28787j5/TrJoiwRVPy+54IgpMmm2QzUM2TmXXNg4rzSF
 QQm85KmB6szVbYPIbTKOAk/8bLVfydWcoKpMMeUbyF2pd8NcSanV3t6up+CUK+kM5HkkLRTNI9i
 wcGkLKaSXwfUkrC03/K9xJ8LgZMMLoJ47v/6M1+TNyPUfk3YufKY1oXDXq0Cf0fE5skGZ0x9v+r
 0Lo4Lz2BNRrh7zsSsSMuyakFC+6HLC9K5fob2XAyEMH5a5ILKl8DvVdwrJ0c7xeeCFAC94q/HFc
 euMw02c9mhl3cgLiLSPV8hh716KRR6/iy3uZ4/neHx0kKbPyS78p2j4uCqK9rlK3L69rEKmD6ix
 JiX5ExM25rvfGAZ2mlZAes7C7dYgSbAUfSQZPrZkXP2OD7DoekfYgif960TNEbo/UJ6RmRm2Vv+
 9V7pndKaG3x+v9MMUr6Ct/Xacl9KMMSDLQJVHVkYfXOOq7nU/X0o+hU7+q/6m0m/osJ2Y+G+H2J
 B1dMi36ZFO3egOqshWadG+VfDvkX6YMdeylGeF2AFDNegsxAAZ0VdLB6aKBLbqqMi+3TUKZw3X0
 Re28DYMK5ePJEDhdVZ+2nmryDZSeC0+sUK9rIFui95Wdalyk8G4Y=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This clock controller controls high speed devices: CPU, DMA, RAM, SDIO,
Ethernet. The only non-clock, non-reset registers I have spotted here
are hardware spinlocks.

I put the entire set of PLL generated frequencies as consumed clocks in
the binding. Due to lack of a data sheet I can't rule out that the any
of the PLL subdivions are used.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Version 5:
Make it an MFD child device, remove aux device
Fix zx297529 -> zx297520 typos
Fix AHB_wclk -> ahb_wclk. That was a leftover of my old composite structs
Add SRAM0 and GSM_CFG clocks
---
 drivers/clk/zte/clk-zx297520v3.c | 176 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 176 insertions(+)

diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297520v3.c
index 6fc98f98cf9c..501f333b84fe 100644
--- a/drivers/clk/zte/clk-zx297520v3.c
+++ b/drivers/clk/zte/clk-zx297520v3.c
@@ -420,6 +420,178 @@ static const struct zx_clk_data zx297520v3_topclk_data = {
 	.num_gates = ARRAY_SIZE(zx297520v3_top_gates),
 };
 
+static const char * const cpu_sel[] = {
+	"osc26m",
+	"mpll",		/* 624 MHz */
+	"mpll_d2",	/* 312 MHz */
+	"mpll_d4",	/* 156 MHz */
+};
+
+static const char * const sd0_sel[] = {
+	"osc26m",
+	"mpll_d4",	/* 156 MHz */
+	"gpll_d2",	/* 100 MHz */
+	"mpll_d8",	/* 78 MHz */
+	"gpll_d4",	/* 50 MHz */
+	"gpll_d8",	/* 25 MHz */
+};
+
+static const char * const sd1_sel[] = {
+	"osc26m",
+	"gpll_d2",	/* 100 MHz */
+	"mpll_d8",	/* 78 MHz */
+	"gpll_d4",	/* 50 MHz */
+	"mpll_d16",	/* 39 MHz */
+	"gpll_d8",	/* 25 MHz */
+};
+
+static const char * const nand_sel[] = {
+	"mpll_d4",	/* 156 MHz */
+	"osc26m",
+};
+
+static const char * const edcp_sel[] = {
+	"osc26m",
+	"mpll_d4",	/* 156 MHz */
+	"mpll_d5",	/* 124.8 MHz */
+	"mpll_d6",	/* 104 MHz */
+};
+
+static const char * const tdm_sel[] = {
+	"osc26m",
+	"dpll_d4",	/* 122.88 MHz */
+	"mpll_d6",	/* 104 MHz */
+};
+
+static const struct zx_mux_desc zx297520v3_matrix_muxes[] = {
+	MUX(0,                             "cpu_mux",        cpu_sel,          0x20,  0, 2),
+	MUX(0,                             "sd0_mux",        sd0_sel,          0x50,  4, 3),
+	MUX(0,                             "sd1_mux",        sd1_sel,          0x50,  8, 3),
+	MUX(0,                             "nand_mux",       nand_sel,         0x50, 12, 2),
+	MUX(0,                             "edcp_mux",       edcp_sel,         0x50, 16, 2),
+	MUX(0,                             "tdm_mux",        tdm_sel,          0x50, 24, 2),
+};
+
+static const struct zx_gate_desc zx297520v3_matrix_gates[] = {
+	/* Both 0x24 and 0x28 bits 1 and 2 stop the CPU. There is also a bit in topclk+0x138, which
+	 * ZTE's uboot calls "A53 reset", which also stops the CPU. I can't really tell the
+	 * difference between matrix+28 and top+138. The clock (maxtrix+0x24) can be disabled and
+	 * enabled from the Cortex M0 and it will nicely stop and restart the A53, retaining all
+	 * state.
+	 *
+	 * 0x50, bits 0-3 have the DDR clock. A lot of DDR gates and resets are in 0x100.
+	 */
+	GATE(ZX297520V3_CPU_WCLK,          "cpu_wclk",       "cpu_mux",        0x24,  1,
+		CLK_IS_CRITICAL),
+	GATE(ZX297520V3_CPU_PCLK,          "cpu_pclk",       clk_main[0],      0x24,  2,
+		CLK_IS_CRITICAL),
+
+	/* ZSP aka LTE DSP clock. I think there is a mux at matrix+0x30, but I have no idea
+	 * about the frequencies it selects.
+	 */
+	GATE(ZX297520V3_ZSP_WCLK,          "zsp_wclk",       clk_unknown[0],   0x3c,  0, 0),
+
+	GATE(ZX297520V3_SD0_WCLK,          "sd0_wclk",       "sd0_mux",        0x54, 12, 0),
+	GATE(ZX297520V3_SD0_PCLK,          "sd0_pclk",       clk_main[0],      0x54, 13, 0),
+	GATE(ZX297520V3_SD0_CDET,          "sd0_cdet",       "osc32k",         0x54, 14, 0),
+	GATE(ZX297520V3_SD1_WCLK,          "sd1_wclk",       "sd1_mux",        0x54,  4, 0),
+	GATE(ZX297520V3_SD1_PCLK,          "sd1_pclk",       clk_main[0],      0x54,  5, 0),
+	/* I don't know how the cdet clock works. Card detection in the way the dwc,mmc driver uses
+	 * it appears broken no matter this clock's setting.
+	 */
+	GATE(ZX297520V3_SD1_CDET,          "sd1_cdet",       "osc32k",         0x54,  6, 0),
+
+	/* This is some "denali" NAND, not the qspi connected one */
+	GATE(ZX297520V3_NAND_WCLK,         "nand_wclk",      "nand_mux",       0x54, 20, 0),
+	GATE(ZX297520V3_NAND_PCLK,         "nand_pclk",      clk_main[0],      0x54, 21, 0),
+	GATE(ZX297520V3_SSC_WCLK,          "ssc_wclk",       clk_unknown[0],   0x84,  1, 0),
+	GATE(ZX297520V3_SSC_PCLK,          "ssc_pclk",       clk_main[0],      0x84,  2, 0),
+
+	/* Yes, WCLK bit > PCLK bit for EDCP */
+	GATE(ZX297520V3_EDCP_WCLK,         "edcp_wclk",      "edcp_mux",       0x64,  2, 0),
+	GATE(ZX297520V3_EDCP_PCLK,         "edcp_pclk",      clk_main[0],      0x64,  1, 0),
+
+	/* There are a lot more VOU related controls in these registers, but turning off the main
+	 * clock seems to shut off the entire VOU MMIO range.
+	 */
+	GATE(ZX297520V3_VOU_WCLK,          "vou_wclk",       clk_unknown[0],  0x168,  0, 0),
+	GATE(ZX297520V3_VOU_PCLK,          "vou_pclk",       clk_main[0],     0x168,  1, 0),
+
+	/* PDCFG. Like PMM, either clock bit will allow the device to function. */
+	GATE(ZX297520V3_PDCFG_WCLK,        "pdcfg_wclk",     clk_unknown[0],   0x88,  0,
+		CLK_IS_CRITICAL),
+	GATE(ZX297520V3_PDCFG_PCLK,        "pdcfg_pclk",     clk_main[0],      0x88,  1,
+		CLK_IS_CRITICAL),
+
+	/* ZTE's driver has a statemt to the effect of *(top->base+0x11c) = 5, with a comment
+	 * suggesting that this sets a 50 mhz clock. The clock code itself lists gmac clocks in
+	 * matrix+110 and lists the parents of these clock as 50mhz gpll output, but the GMAC
+	 * driver never enables the clocks. It turns out ZTE's code is highly misleading.
+	 *
+	 * The GMAC's work clock is definitly not any gpll output because it keeps working fine with
+	 * gpll disabled. The MDIO speed is mostly unaffected by mpll speed changes, so it is most
+	 * likely not fed by mpll either. All other PLLs can be disabled without breaking GMAC, so
+	 * osc26m is the only possible remaining parent.
+	 *
+	 * The GMAC Gates are left enabled by the boot loader and are required for the GMAC to work.
+	 *
+	 * As for the 50 MHz comment: See rmiiphy_wclk.
+	 */
+	GATE(ZX297520V3_GMAC_WCLK,         "gmac_wclk",      clk_main[0],     0x110,  0, 0),
+	GATE(ZX297520V3_GMAC_PCLK,         "gmac_pclk",      clk_main[0],     0x110,  1, 0),
+	GATE(ZX297520V3_GMAC_AHB,          "gmac_ahb",       "ahb_wclk",      0x110,  2, 0),
+
+	GATE(ZX297520V3_MBOX_PCLK,         "mbox_pclk",      clk_main[0],      0x88,  2, 0),
+	GATE(ZX297520V3_SRAM0_PCLK,        "sram0_pclk",     clk_main[0],      0x88,  4, 0),
+	GATE(ZX297520V3_GSM_CFG_PCLK,      "gsm_cfg_pclk",   clk_main[0],      0x88,  8, 0),
+	GATE(ZX297520V3_DMA_PCLK,          "dma_pclk",       clk_main[0],      0x94,  3, 0),
+
+	/* LSP uplink clocks. The PCLK is fairly obvious (disabling it shuts off the entire LSP
+	 * register area). The WCLK speeds were deduced by setting timers and qspi muxes to a
+	 * specific speed and seeing which bit in matrix+0x7c needs to be enabled for the device
+	 * to work.
+	 *
+	 * Due to the timers I am certain about the 26mhz and 32khz clocks. I cannot directly
+	 * observe the qspi mux frequency, so the clock rates depend on ZTE's qspi mux selection
+	 * being correct.
+	 *
+	 * Two additional bits are specific to sound components - the mux for the LSP's TDM IP is
+	 * in matrixclk and gets passed down. I2S has a mux in LSP, which can select the dpll_d4
+	 * clock.
+	 */
+	GATE(ZX297520V3_LSP_MPLL_D5_WCLK,  "lsp_mpll_d5",    "mpll_d5",        0x7c,  0, 0),
+	GATE(ZX297520V3_LSP_MPLL_D4_WCLK,  "lsp_mpll_d4",    "mpll_d4",        0x7c,  1, 0),
+	GATE(ZX297520V3_LSP_MPLL_D6_WCLK,  "lsp_mpll_d6",    "mpll_d6",        0x7c,  2, 0),
+	GATE(ZX297520V3_LSP_MPLL_D8_WCLK,  "lsp_mpll_d8",    "mpll_d8",        0x7c,  3, 0),
+	GATE(ZX297520V3_LSP_MPLL_D12_WCLK, "lsp_mpll_d12",   "mpll_d12",       0x7c,  4, 0),
+	GATE(ZX297520V3_LSP_OSC26M_WCLK,   "lsp_osc26m",     clk_main[0],      0x7c,  5, 0),
+	GATE(ZX297520V3_LSP_OSC32K_WCLK,   "lsp_osc32k",     "osc32k",         0x7c,  6, 0),
+	GATE(ZX297520V3_LSP_PCLK,          "lsp_pclk",       clk_main[0],      0x7c,  7, 0),
+	GATE(ZX297520V3_LSP_TDM_WCLK,      "lsp_tdm_wclk",   "tdm_mux",        0x7c,  8, 0),
+	GATE(ZX297520V3_LSP_DPLL_D4_WCLK,  "lsp_dpll_d4",    "dpll_d4",        0x7c,  9, 0),
+};
+
+static const char * const zx297520v3_matrix_inputs[] = {
+	"osc26m", "osc32k",
+	"mpll", "mpll_d2", "mpll_d3", "mpll_d4", "mpll_d5", "mpll_d6", "mpll_d8", "mpll_d12",
+	"mpll_d16", "mpll_d26",
+	"upll", "upll_d2", "upll_d3", "upll_d4", "upll_d5", "upll_d6", "upll_d8", "upll_d12",
+	"upll_d16",
+	"dpll", "dpll_d2", "dpll_d3", "dpll_d4", "dpll_d5", "dpll_d6", "dpll_d8", "dpll_d12",
+	"dpll_d16",
+	"gpll", "gpll_d2", "gpll_d3", "gpll_d4", "gpll_d5", "gpll_d6", "gpll_d8", "gpll_d12",
+	"gpll_d16",
+};
+
+static const struct zx_clk_data zx297520v3_matrixclk_data = {
+	.inputs = zx297520v3_matrix_inputs,
+	.num_inputs = ARRAY_SIZE(zx297520v3_matrix_inputs),
+	.muxes = zx297520v3_matrix_muxes,
+	.num_muxes = ARRAY_SIZE(zx297520v3_matrix_muxes),
+	.gates = zx297520v3_matrix_gates,
+	.num_gates = ARRAY_SIZE(zx297520v3_matrix_gates),
+};
+
 static int clk_zx297520v3_probe(struct platform_device *pdev)
 {
 	const struct platform_device_id *id = platform_get_device_id(pdev);
@@ -436,6 +608,10 @@ static const struct platform_device_id clk_zx297520v3_ids[] = {
 		.name = "zx297520v3-topclk",
 		.driver_data = (kernel_ulong_t)&zx297520v3_topclk_data,
 	},
+	{
+		.name = "zx297520v3-matrixclk",
+		.driver_data = (kernel_ulong_t)&zx297520v3_matrixclk_data,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, clk_zx297520v3_ids);

-- 
2.54.0

