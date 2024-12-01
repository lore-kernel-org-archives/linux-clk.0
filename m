Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15BA1DE4E7
	for <linux-clk@vger.kernel.org>; Sun,  1 Dec 2024 17:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733075277; cv=none; b=JgEXCCvOPI9ewnUGvrDcgLBOtRTC3S3zuiNc5zPRROEJCH7H4vuayv8TELgy65ESc59sBgurxc5OORGPedBJUgmYo/PBWbMp8IQo+8WVDz/klRgC8hwHxO5VrZzgHdqN8AWSwP3hCQkcueQo6jkAA41DdubwZriTHSonXouCr9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733075277; c=relaxed/simple;
	bh=nZATu35jIwNzMOu/q32E4DVzYvYaOeYv03dex6aotrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tuCtrz7dWcmquWeXXJ3QAakaOK21X0i005wrwt+Qe+JOLYNvo13rsssHST4cEYP20SBOkvHGuQeb/ix/UppiJ0AZ/Vtv7cuX+QrRrIpCBSqbLyDNoD6CP5EX5eeTjbOLYpE9zb3eBpWxgFCwI1puS0MJkpNpxpN2YHYprO/onx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=CLYHiAyO; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="CLYHiAyO"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aa560a65fd6so600348066b.0
        for <linux-clk@vger.kernel.org>; Sun, 01 Dec 2024 09:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733075274; x=1733680074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9yTySfaJQhr7Fo3SgjYPb/w7zlE9/XQ3JsIQbT3gRE=;
        b=CLYHiAyObbKP6HMywAKiV1bIWLXQCxW9s/xw30x4/aWcsfnmhdsQxXHLMfGEuTvoUL
         T3utnjyDpyvvS7R1Pm4zdI6y+FTjQKIJMmEXEtFNgYgGxlHtQwsc2d+lIEBoy2tAlrHn
         RKxyIkuY5OgzULvB5F7pcWpfN1kvhDYR0oJis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733075274; x=1733680074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N9yTySfaJQhr7Fo3SgjYPb/w7zlE9/XQ3JsIQbT3gRE=;
        b=Nkrci+bCba6Cg7xwPaUQeTizBBUEPCWr4uniix3rPLeyOQRY/n0z5wu2+Eawf94RuJ
         UKXWqjVvMU3OLpdIm6Hxt9vCfv5O/nthr9WfNQWNS/ZVqydzJbEV5FNfXEAC90eQ0lwu
         01XrlQDcmUmV8dIg1EfIMh/8NiHoi4zLwrhjnWA+JSahbdfEFRZKvV1cfyK/ws/F9nd+
         VnO0m/QpuHcS3TyIEICo71lRM2AOHzJYHWzmHwGV6sguN1q3yfZA/swQSc7BwiP3EcP1
         JDL1rCNRgmsqdGaOOxHlH26v9g6gWKwnSCnbNjOmMCGvfgXDsY5n1WMY5OGBFEKn0XOM
         +m4g==
X-Forwarded-Encrypted: i=1; AJvYcCXyHQ4IIMDEfevqlbXypYIeRYzegjil0/0MVROUhd/qdaLx0wctVNypE3OFsSY6GQQwGpllyN2mCYU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCpskxkoecrjKbkowdyVLBEd3o42Jgt5H9Z977OhLTs5D6JxI7
	iaxLpyCOz1vPmlDG7X0BKG1HaCRNEaL2Ji7kqravhYmVl6MA8c8nXG7kMXEGPXI=
X-Gm-Gg: ASbGncseiyScHNBu1LYL1bx1vDHbgUxyG9JgOKSSwA9zZGIghoKKJ90Jn2npQXGzB2L
	/6fNKNF5CD5jOCM/6J8Sn1UuJJcax5i4i17Y+E3FZAMr6Wr6+0DNZUizi+CvIAT2vl9J/krIbqH
	sThiVfEW5N82BLefC4G+zaDt1uvUBVfMBL30uEUCJQqxJujimNgUzVHxaaonP5XI/FOi/oMHe27
	cj7jVN8/A3cTuobTPp8OY1RQCw1TrAjOgTmU3Y2H0MU1Om13r9jX38KQDcXZ7nLq+B9zslehmja
	E0pofdMwTb3LjM8VYss2cOoBZENzlgQ+9G0CfBZrZDH/uOz/uuBTl7GyrkI2HsBH2Ql4TrSYj3P
	BLWoQuo1phcuaUoXB
X-Google-Smtp-Source: AGHT+IEHR1z9laXzqUjryQO8q5Ffq5yH85Q8LM2nOnrBHdiW2uHs2gYFItB4lX4kLCeuRgS8cGojqQ==
X-Received: by 2002:a17:907:3683:b0:aa5:500f:56b3 with SMTP id a640c23a62f3a-aa5945ea088mr1602165966b.18.1733075274323;
        Sun, 01 Dec 2024 09:47:54 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a78esm415220066b.163.2024.12.01.09.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 09:47:53 -0800 (PST)
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
Subject: [PATCH v4 18/18] clk: imx8mn: support spread spectrum clock generation
Date: Sun,  1 Dec 2024 18:46:18 +0100
Message-ID: <20241201174639.742000-19-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
References: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
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

(no changes since v1)

 drivers/clk/imx/clk-imx8mn.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
index 588cebce6c9d..c61368e724f7 100644
--- a/drivers/clk/imx/clk-imx8mn.c
+++ b/drivers/clk/imx/clk-imx8mn.c
@@ -306,6 +306,7 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	void __iomem *base;
+	struct imx_pll14xx_ssc ssc_conf;
 	int ret;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
@@ -338,9 +339,21 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MN_SYS_PLL3_REF_SEL] = imx8m_anatop_get_clk_hw(IMX8MN_ANATOP_SYS_PLL3_REF_SEL);
 
 	hws[IMX8MN_AUDIO_PLL1] = imx8m_anatop_get_clk_hw(IMX8MN_ANATOP_AUDIO_PLL1);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "audio_pll1", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MN_AUDIO_PLL1], &ssc_conf);
+
 	hws[IMX8MN_AUDIO_PLL2] = imx8m_anatop_get_clk_hw(IMX8MN_ANATOP_AUDIO_PLL2);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "audio_pll2", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MN_AUDIO_PLL2], &ssc_conf);
+
 	hws[IMX8MN_VIDEO_PLL] = imx8m_anatop_get_clk_hw(IMX8MN_ANATOP_VIDEO_PLL);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "video_pll", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MN_VIDEO_PLL], &ssc_conf);
+
 	hws[IMX8MN_DRAM_PLL] = imx8m_anatop_get_clk_hw(IMX8MN_ANATOP_DRAM_PLL);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "dram_pll", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MN_DRAM_PLL], &ssc_conf);
+
 	hws[IMX8MN_GPU_PLL] = imx8m_anatop_get_clk_hw(IMX8MN_ANATOP_GPU_PLL);
 	hws[IMX8MN_M7_ALT_PLL] = imx8m_anatop_get_clk_hw(IMX8MN_ANATOP_M7_ALT_PLL);
 	hws[IMX8MN_ARM_PLL] = imx8m_anatop_get_clk_hw(IMX8MN_ANATOP_ARM_PLL);
-- 
2.43.0

