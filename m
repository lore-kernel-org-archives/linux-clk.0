Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706CE4317C
	for <linux-clk@vger.kernel.org>; Sun, 29 Sep 2024 17:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727630876; cv=none; b=kHZHkislTNIXMdSPHJ20vZx8eWMeNsc6v9/svkdWQSR0cnh1DqVwHIfZSXb/rarUaOo6nSN9F9vF4lqnyxIz7ThPCBH2I2p55BSS0w7aAUoHxgRO4pgKTtGYc6DNZTvcaqZDOFkT/tFbpCjaoKgzL+KSw0OBzYmHt4UADQV0jnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727630876; c=relaxed/simple;
	bh=Wgv+/HWcXNYqtqEA0RPOt5fYJas9b80J8xiOGZ09A/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WZZs4E+kkDCN/sLI98Hz9+QPuc3TW9VKrMH9A1rKjjvyptCA7gADyFJG5ENdm0vZpG25tY87ulvIJzUMQom+fPJbppcWXHHZII1EL640wHd7mnDOn7dpSNOby2DovVuiCPzC4b8k2hmaPI/wN78psHhYZLMRFmJxlgL3D86nsiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Hq6lMwtA; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Hq6lMwtA"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c87ab540b3so5189991a12.1
        for <linux-clk@vger.kernel.org>; Sun, 29 Sep 2024 10:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1727630873; x=1728235673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7j0vOxwdIuLpD77WK2SWPTcyyL5hPZ0rRLo8GOdwiU=;
        b=Hq6lMwtAD2DChcr9h7guiteIt3KzsZ8OPvy/nms2/DZXqdEBgWP4U7QhUk2iAw3Q8/
         J+3n6zBQXZeTBSjybcZwJhSXJNwD/rxk+xH8noweSDvrB6rfNe9WsYZHXO04PqUO6lPp
         06d+K05AzwfBPsIyxJDd1OGAnOVKjUl2g501A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727630873; x=1728235673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I7j0vOxwdIuLpD77WK2SWPTcyyL5hPZ0rRLo8GOdwiU=;
        b=BoL0MKh4sRRr3JXi3LvCv1ubuzfwGz2Cl6Tp3ztnPpY9CZRUe8eBAY3P8gM7bkMnpq
         /fAYNGQpOQ1xU4CYlIKhS/qQKNSoio6Q+N+GyoeoCTX7Lw2lcnY98B89hVZlqoVZHOMt
         0c1xUDkpmHzbK0q7algCUEOarLuw5W1dOsQ8tqX2+jp3+5gdiKT6Pjj+nzVs+8aMVOHr
         H5y6B/mVXLJFbeFLxaFQcqwy/KX3Nub/Ko+N00/H4HMkCLKyt8EoCProBNLz+rmS5KHz
         waFgEZAoG9i6OHdsAykfZQiBO1dFmchyt0hhid8LHZL2yWOVQtXOcGaxO58cZ0EDGuFP
         MQZA==
X-Forwarded-Encrypted: i=1; AJvYcCW/0ezk9KoGXSJeJWNdMRkIWRDEFD+VeYqoFtme6DuqVTuNIOTwXa5gq2aKPXncSDLqPgsD5XkjY5Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yywrpr1tvp07sqdrarIQ3xLEQIMrqUg1Ba73+OpDwH5GqnqpCk1
	OCiOFNAsIyudP+zccfGn8sbY5ZIFIaESrezkfvwqgcbe+stVDLGgJYuXDG6yOSA=
X-Google-Smtp-Source: AGHT+IFGFzdbP7v+VVZM0XVmIyCLSRIrz892t1qCo04UZ5WzOKuy2d0YwcdtUYh77K2CgaYdMJ8Ffg==
X-Received: by 2002:a17:907:749:b0:a8d:41d8:14ad with SMTP id a640c23a62f3a-a93b1679b22mr1493843566b.29.1727630872356;
        Sun, 29 Sep 2024 10:27:52 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-54-102-102.retail.telecomitalia.it. [79.54.102.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27776a1sm403176866b.8.2024.09.29.10.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 10:27:51 -0700 (PDT)
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
Subject: [PATCH v2 4/6] clk: imx8mn: support spread spectrum clock generation
Date: Sun, 29 Sep 2024 19:27:14 +0200
Message-ID: <20240929172743.1758292-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240929172743.1758292-1-dario.binacchi@amarulasolutions.com>
References: <20240929172743.1758292-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch adds support for spread spectrum clock generation for the
audio, video, and DRAM PLLs.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 drivers/clk/imx/clk-imx8mn.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
index ab77e148e70c..b33590a9b7b7 100644
--- a/drivers/clk/imx/clk-imx8mn.c
+++ b/drivers/clk/imx/clk-imx8mn.c
@@ -321,6 +321,7 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	void __iomem *base;
+	struct imx_pll14xx_ssc pll1443x_ssc;
 	int ret;
 
 	clk_hw_data = devm_kzalloc(dev, struct_size(clk_hw_data, hws,
@@ -356,10 +357,14 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MN_ARM_PLL_REF_SEL] = imx_clk_hw_mux("arm_pll_ref_sel", base + 0x84, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
 	hws[IMX8MN_SYS_PLL3_REF_SEL] = imx_clk_hw_mux("sys_pll3_ref_sel", base + 0x114, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
 
-	hws[IMX8MN_AUDIO_PLL1] = imx_clk_hw_pll14xx("audio_pll1", "audio_pll1_ref_sel", base, &imx_1443x_pll);
-	hws[IMX8MN_AUDIO_PLL2] = imx_clk_hw_pll14xx("audio_pll2", "audio_pll2_ref_sel", base + 0x14, &imx_1443x_pll);
-	hws[IMX8MN_VIDEO_PLL] = imx_clk_hw_pll14xx("video_pll", "video_pll_ref_sel", base + 0x28, &imx_1443x_pll);
-	hws[IMX8MN_DRAM_PLL] = imx_clk_hw_pll14xx("dram_pll", "dram_pll_ref_sel", base + 0x50, &imx_1443x_dram_pll);
+	imx_clk_pll14xx_get_ssc_conf(np, IMX8MN_AUDIO_PLL1, &pll1443x_ssc);
+	hws[IMX8MN_AUDIO_PLL1] = imx_clk_hw_pll14xx_ssc("audio_pll1", "audio_pll1_ref_sel", base, &imx_1443x_pll, &pll1443x_ssc);
+	imx_clk_pll14xx_get_ssc_conf(np, IMX8MN_AUDIO_PLL2, &pll1443x_ssc);
+	hws[IMX8MN_AUDIO_PLL2] = imx_clk_hw_pll14xx_ssc("audio_pll2", "audio_pll2_ref_sel", base + 0x14, &imx_1443x_pll, &pll1443x_ssc);
+	imx_clk_pll14xx_get_ssc_conf(np, IMX8MN_VIDEO_PLL, &pll1443x_ssc);
+	hws[IMX8MN_VIDEO_PLL] = imx_clk_hw_pll14xx_ssc("video_pll", "video_pll_ref_sel", base + 0x28, &imx_1443x_pll, &pll1443x_ssc);
+	imx_clk_pll14xx_get_ssc_conf(np, IMX8MN_DRAM_PLL, &pll1443x_ssc);
+	hws[IMX8MN_DRAM_PLL] = imx_clk_hw_pll14xx_ssc("dram_pll", "dram_pll_ref_sel", base + 0x50, &imx_1443x_dram_pll, &pll1443x_ssc);
 	hws[IMX8MN_GPU_PLL] = imx_clk_hw_pll14xx("gpu_pll", "gpu_pll_ref_sel", base + 0x64, &imx_1416x_pll);
 	hws[IMX8MN_M7_ALT_PLL] = imx_clk_hw_pll14xx("m7_alt_pll", "m7_alt_pll_ref_sel", base + 0x74, &imx_1416x_pll);
 	hws[IMX8MN_ARM_PLL] = imx_clk_hw_pll14xx("arm_pll", "arm_pll_ref_sel", base + 0x84, &imx_1416x_pll);
-- 
2.43.0

