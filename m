Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAC02D057
	for <linux-clk@vger.kernel.org>; Sun, 29 Sep 2024 17:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727630879; cv=none; b=ST8j1yyd+ntUMPmkY0qQumplSzn36muLUTA4G3ifGD0fdpOI0KtWvg5WaT178w9cJ0HX7bQiuXlzA5v7/9vekNP1/Y/N+5shG7Cu7711Eb65GcG9I2LwO7NYJsIwpLzcUAhLTMgWoWte2yOso8JZiCjaXPBGOIxJkec1xCNrEfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727630879; c=relaxed/simple;
	bh=Ug7wY8jPGPHXKlaEJWDLzwP2YJRZZ0pjcvr+/Y2WFTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P9Mxtz3NQC96WB1zsqcYEP2OsNVpawKyJHKbWa7BS8FBz5PPSYfgdVNm6trp6r+9B75XMfW4x5iW1EStFTcpbeWzPuR3dxSfwiM+SR/8LQraSOIDFF7v0bpu24dVWR5XsSU5YTJQ9DBCUll2EEr+3af/WlWIQ4scsUBi+B8P1FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=mjd9rIgy; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="mjd9rIgy"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a8a6d1766a7so520899666b.3
        for <linux-clk@vger.kernel.org>; Sun, 29 Sep 2024 10:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1727630876; x=1728235676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0iBp/WuiGBbwsQFlblUsJsTztRh00umfcE38KK4N/I=;
        b=mjd9rIgyX9GxmSpEmUu7uwgD2LDP/qz66a0VwV6m1I5pXL5w6KlKTcDFKd4sy0LA6O
         SHIY8R7bhLuLzI636+w9O5cNQLadR8VK7LcqxgUSLdY0GqLtBxy5ofdyd9DSTTpKf5Xd
         hhs2AQIVkO2MnxB6xjDGjSWevJAhcJTCj3J7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727630876; x=1728235676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y0iBp/WuiGBbwsQFlblUsJsTztRh00umfcE38KK4N/I=;
        b=ux5fT9PLo74xueTb6cFc8sKoOTdeIBr/gxvij+qf+2h72CuJeaZjs7/CxNCSgrtKSs
         xTOr8WDHm6I7+yUlzYjCGMMVPNXm1C9kytPNzbDyh5RhxkVDv0D4T8J7vMbRw/MOdxXc
         x9OYwKUx+ea6Cv+5ooi9IlG7xxE2fD5E5hzFMYOnHkAeBeAmo1FTes+JjcOZBYA87u6c
         xFEUPVSbI0z8p7lZsFxXPh8Xge9+1RBfYu5SeMxh3gWBoaC86f27DGNqbqmhXesHk8sM
         jvDkGFsvkao4y6aBqKwNjSlvyIPY9SjO2fkyZKCa19YRX76xnHduYQ7sAiss9Y4aaPSc
         RYpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDibXqUTQI2yR7jFLegzsPlx7sdbjArtt2G1GA7i9vPSvbnRPZ2Eq7Mu6F9MhwiiV2m1jgqQrt7zw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGQ+m3Q0LVlzNpzB8BTWLzgC8xiThP1gCkPzXlm+cexnFzmRV3
	tJQzx5cQILtLNAht91VJLYyiU1J7MFuxE0XrYGP9KWRUM6x8X3uJuJ1aDE6GFmk=
X-Google-Smtp-Source: AGHT+IGLXVyYvBPaOSAKwxQv4nClWIr3rmZocj2kb4LCU/k1nVaoIjd/hf0Piycmvcx3tLSB+8EClg==
X-Received: by 2002:a17:907:6d20:b0:a8a:8c92:1c9c with SMTP id a640c23a62f3a-a93c4967869mr949147066b.29.1727630876427;
        Sun, 29 Sep 2024 10:27:56 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-54-102-102.retail.telecomitalia.it. [79.54.102.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27776a1sm403176866b.8.2024.09.29.10.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 10:27:55 -0700 (PDT)
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
Subject: [PATCH v2 6/6] clk: imx8mp: support spread spectrum clock generation
Date: Sun, 29 Sep 2024 19:27:16 +0200
Message-ID: <20240929172743.1758292-7-dario.binacchi@amarulasolutions.com>
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

 drivers/clk/imx/clk-imx8mp.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index b2778958a572..460e8271def5 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -410,6 +410,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np, *anatop_np;
 	void __iomem *anatop_base, *ccm_base;
+	struct imx_pll14xx_ssc pll1443x_ssc;
 	int err;
 
 	anatop_np = of_find_compatible_node(NULL, NULL, "fsl,imx8mp-anatop");
@@ -449,10 +450,14 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MP_SYS_PLL2_REF_SEL] = imx_clk_hw_mux("sys_pll2_ref_sel", anatop_base + 0x104, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
 	hws[IMX8MP_SYS_PLL3_REF_SEL] = imx_clk_hw_mux("sys_pll3_ref_sel", anatop_base + 0x114, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
 
-	hws[IMX8MP_AUDIO_PLL1] = imx_clk_hw_pll14xx("audio_pll1", "audio_pll1_ref_sel", anatop_base, &imx_1443x_pll);
-	hws[IMX8MP_AUDIO_PLL2] = imx_clk_hw_pll14xx("audio_pll2", "audio_pll2_ref_sel", anatop_base + 0x14, &imx_1443x_pll);
-	hws[IMX8MP_VIDEO_PLL1] = imx_clk_hw_pll14xx("video_pll1", "video_pll1_ref_sel", anatop_base + 0x28, &imx_1443x_pll);
-	hws[IMX8MP_DRAM_PLL] = imx_clk_hw_pll14xx("dram_pll", "dram_pll_ref_sel", anatop_base + 0x50, &imx_1443x_dram_pll);
+	imx_clk_pll14xx_get_ssc_conf(anatop_np, IMX8MP_AUDIO_PLL1, &pll1443x_ssc);
+	hws[IMX8MP_AUDIO_PLL1] = imx_clk_hw_pll14xx_ssc("audio_pll1", "audio_pll1_ref_sel", anatop_base, &imx_1443x_pll, &pll1443x_ssc);
+	imx_clk_pll14xx_get_ssc_conf(anatop_np, IMX8MP_AUDIO_PLL2, &pll1443x_ssc);
+	hws[IMX8MP_AUDIO_PLL2] = imx_clk_hw_pll14xx_ssc("audio_pll2", "audio_pll2_ref_sel", anatop_base + 0x14, &imx_1443x_pll, &pll1443x_ssc);
+	imx_clk_pll14xx_get_ssc_conf(anatop_np, IMX8MP_VIDEO_PLL1, &pll1443x_ssc);
+	hws[IMX8MP_VIDEO_PLL1] = imx_clk_hw_pll14xx_ssc("video_pll1", "video_pll1_ref_sel", anatop_base + 0x28, &imx_1443x_pll, &pll1443x_ssc);
+	imx_clk_pll14xx_get_ssc_conf(anatop_np, IMX8MP_DRAM_PLL, &pll1443x_ssc);
+	hws[IMX8MP_DRAM_PLL] = imx_clk_hw_pll14xx_ssc("dram_pll", "dram_pll_ref_sel", anatop_base + 0x50, &imx_1443x_dram_pll, &pll1443x_ssc);
 	hws[IMX8MP_GPU_PLL] = imx_clk_hw_pll14xx("gpu_pll", "gpu_pll_ref_sel", anatop_base + 0x64, &imx_1416x_pll);
 	hws[IMX8MP_VPU_PLL] = imx_clk_hw_pll14xx("vpu_pll", "vpu_pll_ref_sel", anatop_base + 0x74, &imx_1416x_pll);
 	hws[IMX8MP_ARM_PLL] = imx_clk_hw_pll14xx("arm_pll", "arm_pll_ref_sel", anatop_base + 0x84, &imx_1416x_pll);
-- 
2.43.0

