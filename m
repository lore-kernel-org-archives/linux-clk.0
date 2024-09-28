Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9C519F42F
	for <linux-clk@vger.kernel.org>; Sat, 28 Sep 2024 08:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727512703; cv=none; b=NydIV0GG3fk4ruo3+s5nPKcmTKwKrX7ByuFfnDzITNVCKLhBFOeZ/g+S/FP0I7aXBKDFCzL8DX2oN85hRo5Q/nqEjPB+7WJ7xon51iPWIWl+XMvLQBvV37vqVIcOWXmsUydO9rG8Y6PIbN5y2PO/o1A87aMKSQQiaHIAeOsM6pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727512703; c=relaxed/simple;
	bh=WnBuei5JYuZ25wbUZLj6WluWlAFoI6AsCHTUlKHiiiE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FBcq0MuUSnrM7Jw7dTLJP/3LYtKiUwkP/Yy/VOSszu7GpMyu2UGUlNp2NRYlm3ksY3wItOKCycH8OlFXEVvusP+GKN4l+J1MCbrX2qkYCCsEmAFp0Z/DqhGbpR7maRYWMH/cW/3zZZ+KekEuFsMejQeV9VrCVQFlM0QD1N6F2ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=M0n7efuV; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="M0n7efuV"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a8a897bd4f1so389491166b.3
        for <linux-clk@vger.kernel.org>; Sat, 28 Sep 2024 01:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1727512700; x=1728117500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8yZI1Cll/jgswR1C/8/RE7gUqkNMAx5u3jKxacFOTcY=;
        b=M0n7efuVqvwCip0fimXsaUiwqMbH9OY9N7K1nhpprD+mLIu1by0mYx4xHS7DDgf0Y5
         qWMSJqpFyJ8FrY4zYtILHZpEcfQNIhw+pWYqz09AVcDWUAcwmJYYULLe90/8Dfqnlohz
         9CM0cJi0Q+MUi16FHIqCtzhLEy5z29m2g10ac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727512700; x=1728117500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8yZI1Cll/jgswR1C/8/RE7gUqkNMAx5u3jKxacFOTcY=;
        b=lF/BBfgAmFv9FzOkYKnWbCMwdyMWWAG444okIlErvydDblOUCg8YXC6XiGKD2BYJOE
         gnnULwnUsSWdvnXgHn1ILamqLX569xo/k6FXVr/Q5K80gOZGFRIvTiQ2ygchGNcFQscd
         V8fmGSGXgaYp0rRxZe/ICPJ1oZW/3wb9kJsQgmNMIyMp0y4vD0rFexQ35Hm+TvxrgTmT
         TCJRg+HkK0d0jNmYnl0vuZ3RtVpsTbXZjkpQZUlMpXRZpzCpdwdglKXdKrcoxAydN/gQ
         eC/bj7hkNSI5Upvgv41oVSc41d4SG6p8kwNoUKkm1r8Jp4ki8TMIMKqFW2VNPJT2IDhF
         9FRA==
X-Forwarded-Encrypted: i=1; AJvYcCV4FNlpJjsVhrkxmeKWi/cfcSJAJlnnEztZHw0Q2PFT5wE5RwFohRaK6NWQCVPoYLiY5JUPPgK6XHk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzD4FTFTjJ3XI2lqsL6IXeEcALWlQkW+sr8SqHFwqTDxc/LSXC2
	yZq1zew7ZClMBj2sfKMLiziEv3azPifCMxStEnWg6DJrkXX/yVUt+lx7VWz/o2Y=
X-Google-Smtp-Source: AGHT+IEpHCIIkW74i8daN8Da+0LfjBKkKzdVA5122EIzP6PQGBfEDmDMRqPpOckP0H6LzAyxWWQDkQ==
X-Received: by 2002:a17:907:3203:b0:a86:851e:3a2b with SMTP id a640c23a62f3a-a93c49299e7mr544249166b.29.1727512700295;
        Sat, 28 Sep 2024 01:38:20 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-54-102-102.retail.telecomitalia.it. [79.54.102.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2947a48sm223679466b.118.2024.09.28.01.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Sep 2024 01:38:20 -0700 (PDT)
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
Subject: [PATCH 4/6] clk: imx8mn: support spread spectrum clock generation
Date: Sat, 28 Sep 2024 10:37:52 +0200
Message-ID: <20240928083804.1073942-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240928083804.1073942-1-dario.binacchi@amarulasolutions.com>
References: <20240928083804.1073942-1-dario.binacchi@amarulasolutions.com>
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

