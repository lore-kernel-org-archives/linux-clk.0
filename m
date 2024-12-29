Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A39A1A00F0
	for <linux-clk@vger.kernel.org>; Sun, 29 Dec 2024 14:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735483867; cv=none; b=hPOY1pAQH2j4liJIDzDiMbRGJiJpLb8/zwSyacLYE1XisyW1UwUB/JNnP/mVBm82lUkScf90XKziunnj7yuDOYZVzKzACK60kVXVMFKUudcW5ipi57EC9m1/zMJtj3mmsRGmHBdJOvqa0uJR/vK+lh8aBlqxlqD5vtEUermlmC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735483867; c=relaxed/simple;
	bh=wAM96yqCW+lsz81e2QPgNILmLnuIJ654UrL1361ydeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q4qee0lJ7+9Gy2JFJ4ryZcL49KRUUrSBEuzZGqVHtXTFHkyHwfdBBY9F4L5Ec8V4U8zJOfxyEDFL6LIo8ZpYICZEyJ+4HvL/cUDDbxGtEZ2J0lJcrqvEPMFMhbOSAJWBDqGS4aUg2H9U8f795pSRC9T7ej6p7JftWjn+41GBpN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=AnviPi7l; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="AnviPi7l"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aaeecbb7309so709697266b.0
        for <linux-clk@vger.kernel.org>; Sun, 29 Dec 2024 06:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735483863; x=1736088663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wKU7hDbBAEhh5ugFEv8c2E//GwNCMwODyh4qXAxbC4=;
        b=AnviPi7lqL01/1x45KkXpYscaqjga4hdoUfhMvrDRz5dcKADU7+ZXkwZYAKnL89ffs
         /esfPcKq4m7fiMXC3Cnw8piXh+28YAdfpKMrYi6ZoTdeA6Vf1yah2z3igJuo6fKGQyVM
         MhBa6UAM8V9cO0nBisVfd1wOzbjMmPEDntWxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735483863; x=1736088663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wKU7hDbBAEhh5ugFEv8c2E//GwNCMwODyh4qXAxbC4=;
        b=civc7OWL7oUvCu3Ha1s7wDn4bs9/gTVUkk7m7o0AqbyAgs4+l/u5YLWFT9KeoL8s02
         +pS4sZLr8TjsktnMwyJkFTWjVqxiCKjI7/inWlMMk8Tgs+kbL3KWP4XrUF+93AAbBLVv
         uDjP7p/v/Lrd43hzFvCCKU99I+kHH/xO84AYSkJjqNGIKkRomLjC8xf0/YLWn01I6qIL
         V9wWeeU+BlfiPoUaOi/RcZmwuND7VKLUu1RS7ht/lYOGIS35PP9c8hIWaYu79XdADV5W
         cDRKwnSAMalJHeZDVqJUrHTrbmtO+/mLHl86HBSVUXBxLk6IuSA2EjDJkp2p0gLA9ZFJ
         m2gA==
X-Forwarded-Encrypted: i=1; AJvYcCW0+uxFnQ6x9eVt3NeSi6ZN73LID5aTq5zmzSnqDExCV5fbAOu+34twDkYji5Z2CbZvn8uwKKwAJdE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzstXshux9Y7AI1j6Sc7+eDayMzoDNhoPCinEL23nn0oQTrOXi5
	cYg5a9ayp/W3LWRV68hxFL7YImr0nx+zLIr6QGlAl18oyhEUfhpIUVyhsOwYoM0=
X-Gm-Gg: ASbGnctn4+xrZ725CZPZvL64o7PBnzc948rqEKHYpTjBm8cuK3+gzdounH9XwZ9w8l4
	kn2pLkz3aG6HuFIrfYOF7wI8+lpq3Yr8ZwckDLPGgUNt5Yp1kdbevSAlFLmeP8huYJ/E9MK+cOV
	erHO7BX/uVGuERnI1czBybAKO09/QqgExhMTAa8JqI8Rh5b/inWsrorABoDSn8RFvhPM/RsYYpO
	2Vjwhfe4ylOuiNRQ25FkN117Q2KggwiNy8CetFwLn3ycRpU4NF+gEJd2tbtZoddaz4o3pkhgAAL
	ivISDKkjDO0CY/A2uIVepg==
X-Google-Smtp-Source: AGHT+IGuXfjaRQPAunk4u+eEYZZYA62lhB0xm8g69aCXAJE2Mnda7O4OIdrZd531BTzMeroRuU5qFw==
X-Received: by 2002:a17:907:2d2c:b0:aa6:8b38:52a3 with SMTP id a640c23a62f3a-aac33787557mr2382898066b.50.1735483861073;
        Sun, 29 Dec 2024 06:51:01 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e895080sm1362084466b.47.2024.12.29.06.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 06:51:00 -0800 (PST)
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
Subject: [PATCH v8 18/18] clk: imx8mn: support spread spectrum clock generation
Date: Sun, 29 Dec 2024 15:49:42 +0100
Message-ID: <20241229145027.3984542-19-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
References: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
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

 drivers/clk/imx/clk-imx8mn.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
index c3a3d063d58e..090b5924fa01 100644
--- a/drivers/clk/imx/clk-imx8mn.c
+++ b/drivers/clk/imx/clk-imx8mn.c
@@ -306,6 +306,7 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node, *anp;
 	void __iomem *base;
+	struct imx_pll14xx_ssc ssc_conf;
 	int ret;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
@@ -344,9 +345,21 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MN_SYS_PLL3_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_SYS_PLL3_REF_SEL);
 
 	hws[IMX8MN_AUDIO_PLL1] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_AUDIO_PLL1);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "audio_pll1", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MN_AUDIO_PLL1], &ssc_conf);
+
 	hws[IMX8MN_AUDIO_PLL2] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_AUDIO_PLL2);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "audio_pll2", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MN_AUDIO_PLL2], &ssc_conf);
+
 	hws[IMX8MN_VIDEO_PLL] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_VIDEO_PLL);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "video_pll", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MN_VIDEO_PLL], &ssc_conf);
+
 	hws[IMX8MN_DRAM_PLL] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_DRAM_PLL);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "dram_pll", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MN_DRAM_PLL], &ssc_conf);
+
 	hws[IMX8MN_GPU_PLL] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_GPU_PLL);
 	hws[IMX8MN_M7_ALT_PLL] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_M7_ALT_PLL);
 	hws[IMX8MN_ARM_PLL] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_ARM_PLL);
-- 
2.43.0

