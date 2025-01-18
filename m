Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B681D1DF259
	for <linux-clk@vger.kernel.org>; Sat, 18 Jan 2025 12:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737204094; cv=none; b=hSjQVlekbzBpOMHVJtJux15rroB414OTz/X6j3dmQW38vA3KI5wX+PsnaID6AoRECqLpnUrgfrJEryn/PTsL2eSHVICaT//dYtbdx8SBJFEBKlDhMcrdx95LLcI45TkCgvm/xH9kk92j+4GJhj5vVBjroU8NGNAGv00Xi9pmqAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737204094; c=relaxed/simple;
	bh=JvnB9XcgmJl41UfJoJnGQcnIZBMI1twZKprmYaAPr8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aH8QETtkG4/W73CYNzdEjXS2Xqm2ssFM0UtUP3XXmAn9/WHKdFF039V/f5pcc3rp+KoQGtBPsGPDSywktemDJRm/Z2zaBlAcrhAmLifsxGNr0C0eNiBWDlUVVNpqH88qkLB1q3PhrpvFJ0Lc3SzpesJqJz5zh651Kqd2JzFOlaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=XrAlnU3+; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="XrAlnU3+"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aa6c0d1833eso600074066b.1
        for <linux-clk@vger.kernel.org>; Sat, 18 Jan 2025 04:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737204090; x=1737808890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZvTKndiMkROVePKKMXmQxzHj6whXXjb2pDAXF1Y9+GE=;
        b=XrAlnU3+3nFhzEjIstSMD/epYlg5vHQd17D2I39RcIpdq0lD4bRcEm07kC/LebYOTg
         EIGDRJkQ9dTADUfU0SAyxUlh23bR0Od+nQ8RRgeFFcwLDIONmCMzwR1iG89747eQQi0u
         JpJZREz5aLh0zpUcLWDWfv3JZKABrAFZlvX70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737204090; x=1737808890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZvTKndiMkROVePKKMXmQxzHj6whXXjb2pDAXF1Y9+GE=;
        b=C9hAJP4iFPqzFboWBmy41CoLtkYDby4OMJNb6ixV0c8O//zVRtEhozU7jwuO7dBv1w
         a+Gl91Ya2LK/HeriAFCgmJTMy302Bv1AnN8WMvt7/sGIpZvH8HCy+hIKqwD9uaglDd4U
         8Lsq2rwqz8yjkt+FPF8DIXk0ELzDaGg5AVI1mdU4JlSFk1F1TQjqpIo3a21S4Fu0y6dw
         jvWnVpF/BjNqXDnTls3PYYsKJ6U2MhBU1C2jeaYK703Ahg8LarBnopg26X7KT91vvBje
         Id8YlrvU/ujpQtsXH0OeQkeXksWXb9uYhdKeA38bV7NlsW3zwOBXOStMpnv+Bm4Itj3j
         PMHg==
X-Forwarded-Encrypted: i=1; AJvYcCVLiJUWXRKkV32/PyyA73M2XMrDrYCGThfdeFhLPZIelhiYbNpnw2kgKFfydEVWGzhOd9FOhB4uYQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz072oSjG4TF954yVJPGNH7eqc1Qc82hplE97fGLuxY19JDZAbC
	RGRsMxUSoop1txigpvNcBciToFV02DvC+2ptx2N+27MWk6yOZYrNt33pWcLgmVE=
X-Gm-Gg: ASbGncs8Oxf0/Y/heG6TNgc2zRT5fjWFraTfMVxwUqst4Dtb9lE/EgX8cmbY32I3Lhb
	MICOsxbCpBszP9nco4mmmclK+LbcdtAyf60AR+LAquzUw2IUWKCGrUlhr50lSf1GaC0PPjwTHLN
	IcCCQbjflHPrAJZS/UAfaic2AOiZDALF4REH7+50lyFqaq94SyZUnqPfTukbF8uSxhPuOvRZaNg
	Q7Xu+M85fj47nIrzdNcyURBJNNE8eFdmzJrmMlPi7HgtxlsdVwcBPzqCDRUNgqD1l9HdLK1wHUI
	9UyKSM8/s7Uux2MIHoorOuc7Hk2TM+uqcWf6O2JzfGgLfONJ8g8JT/6fUUEBHkPS8cosX5LCI94
	xN3NFjIDZeK9N+49g8nHd8PlSvXxRIkBlH3eB
X-Google-Smtp-Source: AGHT+IFC/pqArB6lP+2fYPukqjbNk0HklO0cbxbWcFV3TF46oG+xZmBHJNyGCFzgAtJ5215kQXOiSw==
X-Received: by 2002:a17:906:6147:b0:ab3:9a57:f4fd with SMTP id a640c23a62f3a-ab39a5802damr320445266b.28.1737204089946;
        Sat, 18 Jan 2025 04:41:29 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-30-28-209.retail.telecomitalia.it. [79.30.28.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcd73dsm332562366b.178.2025.01.18.04.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 04:41:29 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v9 23/23] clk: imx8mm: support spread spectrum clock generation
Date: Sat, 18 Jan 2025 13:40:06 +0100
Message-ID: <20250118124044.157308-24-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
References: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for spread spectrum clock generation for the audio, video,
and DRAM PLLs.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v9:
- Add 'Reviewed-by' tag of Peng Fan for imx8mn platform patches
- Fix building warning raised by the kernel test robot for patch
  v8, 11/18 clk: imx: add support for i.MX8MN anatop clock driver
- Add patches for imx8m{m,p} platforms:
  - 23/23 clk: imx8mm: support spread spectrum clock generation
  - 22/23 clk: imx: add support for i.MX8MM anatop clock driver
  - 21/23 clk: imx8mp: support spread spectrum clock generation
  - 20/23 clk: imx8mp: rename ccm_base to base
  - 19/23 clk: imx: add support for i.MX8MP anatop clock driver

Changes in v8:
- Drop the patches added in version 7:
  - 10/23 dt-bindings: clock: imx8m-clock: add phandle to the anatop
  - 11/23 arm64: dts: imx8mm: add phandle to anatop within CCM
  - 12/23 arm64: dts: imx8mn: add phandle to anatop within CCM
  - 13/23 arm64: dts: imx8mp: add phandle to anatop within CCM
  - 14/23 arm64: dts: imx8mq: add phandle to anatop within CCM

Changes in v7:
- Add and manage fsl,anatop property as phandle to the anatop node with
  the new patches:
  - 10/23 dt-bindings: clock: imx8m-clock: add phandle to the anatop
  - 11/23 arm64: dts: imx8mm: add phandle to anatop within CCM
  - 12/23 arm64: dts: imx8mn: add phandle to anatop within CCM
  - 13/23 arm64: dts: imx8mp: add phandle to anatop within CCM
  - 14/23 arm64: dts: imx8mq: add phandle to anatop within CCM

Changes in v6:
- Merge patches:
  10/20 dt-bindings: clock: imx8mm: add binding definitions for anatop
  11/20 dt-bindings: clock: imx8mn: add binding definitions for anatop
  12/20 dt-bindings: clock: imx8mp: add binding definitions for anatop
  to
  05/20 dt-bindings: clock: imx8m-anatop: define clocks/clock-names
  now renamed
  05/18 dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
- Split the patch
  15/20 dt-bindings-clock-imx8m-clock-support-spread-spectru.patch
  into
  12/18 dt-bindings: clock: imx8m-clock: add PLLs
  16/18 dt-bindings: clock: imx8m-clock: support spread spectrum clocking

Changes in v5:
- Fix compilation errors.
- Separate driver code from dt-bindings

Changes in v4:
- Add dt-bindings for anatop
- Add anatop driver
- Drop fsl,ssc-clocks from spread spectrum dt-bindings

Changes in v3:
- Patches 1/8 has been added in version 3. The dt-bindings have
  been moved from fsl,imx8m-anatop.yaml to imx8m-clock.yaml. The
  anatop device (fsl,imx8m-anatop.yaml) is indeed more or less a
  syscon, so it represents a memory area accessible by ccm
  (imx8m-clock.yaml) to setup the PLLs.
- Patches {3,5}/8 have been added in version 3.
- Patches {4,6,8}/8 use ccm device node instead of the anatop one.

Changes in v2:
- Add "allOf:" and place it after "required:" block, like in the
  example schema.
- Move the properties definition to the top-level.
- Drop unit types as requested by the "make dt_binding_check" command.

 drivers/clk/imx/clk-imx8mm.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
index d39de0a81a6f..f8413f495d5d 100644
--- a/drivers/clk/imx/clk-imx8mm.c
+++ b/drivers/clk/imx/clk-imx8mm.c
@@ -286,6 +286,7 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node, *anp;
 	void __iomem *base;
+	struct imx_pll14xx_ssc ssc_conf;
 	int ret;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
@@ -324,9 +325,21 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MM_SYS_PLL3_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_SYS_PLL3_REF_SEL);
 
 	hws[IMX8MM_AUDIO_PLL1] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_AUDIO_PLL1);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "audio_pll1", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MM_AUDIO_PLL1], &ssc_conf);
+
 	hws[IMX8MM_AUDIO_PLL2] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_AUDIO_PLL2);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "audio_pll2", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MM_AUDIO_PLL2], &ssc_conf);
+
 	hws[IMX8MM_VIDEO_PLL] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_VIDEO_PLL);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "video_pll", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MM_VIDEO_PLL], &ssc_conf);
+
 	hws[IMX8MM_DRAM_PLL] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_DRAM_PLL);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "dram_pll", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MM_DRAM_PLL], &ssc_conf);
+
 	hws[IMX8MM_GPU_PLL] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_GPU_PLL);
 	hws[IMX8MM_VPU_PLL] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_VPU_PLL);
 	hws[IMX8MM_ARM_PLL] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_ARM_PLL);
-- 
2.43.0

