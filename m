Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663C41DE88B
	for <linux-clk@vger.kernel.org>; Sat, 18 Jan 2025 12:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737204085; cv=none; b=t5FhtaEEZvyDjwmdH8a3eoKIK95uYJkzf8zW++biiQVLt6R0rYbj0OhgpuLD/TKkWVKtr34b7rz/qbRHh92oURU+GSWxhFLSoUXLdEv33C+PIae39j0eS2BbaF/9BRaqJ8tXTe2cCVPqa399hz82ScZ16M+bk4C3pfrI+IeMilI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737204085; c=relaxed/simple;
	bh=CxRffncRwH3IUaOFkDWEP7ifdyjoZqiynS9duHP0Dxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BTekrO6fVpSYNlSJII8211Xg4pvWg32wX3SXzMpFN5QpV/86oM7J287ikkL0u13DhVL4XyudKioSwLqj/3gndn6fvKMs/fYYyOEWoDZBmX93cJXaqpeKHUAz8P3PZ15AJcnqY5N1GyTgq22PORIlvCffdNu72T2ImE7b28k2P6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=l80XUToH; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="l80XUToH"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aa679ad4265so795493566b.0
        for <linux-clk@vger.kernel.org>; Sat, 18 Jan 2025 04:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737204082; x=1737808882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJL+gbh4MVrHU+PAYDL4LrbInhBcvCC67N3SxstDEjg=;
        b=l80XUToHQsGdWmlFzmtC+kl1MiFZZjwzIVPhc0sXP5TC0SV8MATVfpsmvEMvhVi+OS
         nIo/xPIkH3ppmM7s1ZiUNP4V4fajBFQn94BoKr6eZSEu5HAS9ZNnglV/l2PV/VLJCCt7
         mLXoHv23X9bIlcYJQWWAeFy8iFcgu7MsDnFPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737204082; x=1737808882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJL+gbh4MVrHU+PAYDL4LrbInhBcvCC67N3SxstDEjg=;
        b=kcgG6qPICcq/GzzAsqtxfPm0jNnK0e4sfDxoX66pt1z9fJUe64yXk3tBiecpBuTJfG
         uMvo/r716dXqtaXxJvdIzPxEn2uy0VIW/3E2Bzx5MQ395O/nsYFetdvzG3Mh/lCycNrP
         biQXX0k7DBbEkLGq95sljC6w7ufFHaRVGJ2XS1z4kU8KbwrXsYsanIp1y1k75IkVeT7d
         b6dzrOTPRN7o4DOd4J8GS/pvRoUPC7sbxDi4j7O+3mkUDE45aIe4KIJis4Ja9tYkwhFr
         IyULrHnopmBM7Z5OI0MIgIa2fqE6VkcXUSyiZwF83SZ947ngKgBa2LaQFWkI7CElyegO
         EUgg==
X-Forwarded-Encrypted: i=1; AJvYcCXIER9ycaohULNlezTnhzaMreA5jdymqrzmrYVXoXgNmYsaSmHydRlZWWjbEri3+He6Tlgu1rr22UI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf8QqxJEL6pJzjoiYZl4m8PBfg484WXD9jtZK9cvARM+9Trw67
	JphzEomHNL0JxcbZ21R22vgB0j+rzcWCLKhgJO8LcoQOd6E+2J087QFmvF6/VgE=
X-Gm-Gg: ASbGncsWAaQyziSn+neMaiZ4qt1jezG6rGQr2tivvOixrUU1HNhOFms2O3IBsXxKipC
	50o4h9Hgc9iyAOgDzR/cRkBfYTBlhtGp3pI6wXyHNuviEO4y8ZxV5HqyUtSSA/NH2iRPpzOG8Kg
	QnPI5np9PZKAglGAwuHS6W1GIAewpKd2qzC8OmCYMXE3DqhQw81uRK2UqOcMaataqpuCCFwJFLr
	GLu+o09tS6ZRPEHqWine8MylevW9aYJaYWz2QE4ES/2kPZSsiGuzycTO36kmpKsU7wJL4q1Y/jU
	sfeNnJbIuwre4LEnzB8E1fQutQwwJDT+0ZViqAU3K4c4xTY1fBkvW/Jnesaeq/t2dUypha85D3N
	ZMf4t3pKwDSR6dMqLHPuU7zSdPKnqt1LrUAsC
X-Google-Smtp-Source: AGHT+IFakVVyb3qn2Ua9YGWtJbN5eKC5RFuNg5nEGxiu48GboLMu20VoxuWeB6dsBEEmvDx4fcRxwA==
X-Received: by 2002:a17:907:971b:b0:aab:ef03:6d46 with SMTP id a640c23a62f3a-ab38cbabdc5mr485286466b.4.1737204081750;
        Sat, 18 Jan 2025 04:41:21 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-30-28-209.retail.telecomitalia.it. [79.30.28.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcd73dsm332562366b.178.2025.01.18.04.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 04:41:21 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Peng Fan <peng.fan@nxp.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v9 18/23] clk: imx8mn: support spread spectrum clock generation
Date: Sat, 18 Jan 2025 13:40:01 +0100
Message-ID: <20250118124044.157308-19-dario.binacchi@amarulasolutions.com>
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
Reviewed-by: Peng Fan <peng.fan@nxp.com>

---

Changes in v9:
- Add 'Reviewed-by' tag of Peng Fan

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

