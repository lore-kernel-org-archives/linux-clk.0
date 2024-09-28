Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209FC19FA86
	for <linux-clk@vger.kernel.org>; Sat, 28 Sep 2024 08:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727512706; cv=none; b=DJvcz81kCa8PO14M0jWhadDOStwbHcEJ3hAnuJBlnkoVS0qBBT7GS8ZtdSFZD4YKM4AH8bCE1jMCRly1O85+NQG3HWmqB82YXopoJyjuOtnRXMZlsP5MWGgnN1sHBTixtxxLluRIZLEovGwvH3wW19WNbgRWfFMuRCera+DpqEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727512706; c=relaxed/simple;
	bh=V3GcAzqNjwMg5/Hvh9jUbJqltmtUfAEm3aT6HuannLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PbEv6a52TJkXn2hWvv4ufKOFk6nAvDwrf6GXx6ckMjReuuf6y1/vPvt6ft1lbQZu+7lmMeMmTB4wfbnfzPlcblGHoDMQd5yqnMbIlPXi9vLniqermnONdloc2L0LOyAfwKqGHYTvU2TcaP3po4ivrvofbIvlPuEE36VP+jaULlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=qiSANEgL; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="qiSANEgL"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a93b2070e0cso326362866b.3
        for <linux-clk@vger.kernel.org>; Sat, 28 Sep 2024 01:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1727512703; x=1728117503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SqdVHCjP2z3b3GmppGHkZvxobZmXnCslqoKDvGYxVNw=;
        b=qiSANEgLeOLGWQyy5tnnP6VXs0nVQe/dPqlz9M3tZaeTLRNTj2PVG2InewFnFt3XbO
         7NSgi6bIUGpdy1kyJLaXbpNIYrawe7VFbx2eHc8pkMi64I3clIT68CFMedBFQdA/fSuE
         WowWWPiwlkjhpLcIDROVbNN54lFHWDoSa/FfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727512703; x=1728117503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SqdVHCjP2z3b3GmppGHkZvxobZmXnCslqoKDvGYxVNw=;
        b=VeRN02uIwXi03WCYGHNYtqkQFisCoo6CqusUwL/XNL1TPb3ifzlDDeAOiOaqJNsaET
         Ru/xFC03HYy9ni+alfjhSlf6FSrwBwWu65cZZjmq8vT2OrbcmS/MFL9YcUcLx7t3vuU3
         lDv5UjsR0dW14bBqQ8kC/xHl22F7aQr3ycs/FOy+EZZOaYPMAbtK3jtPyumzg+lvr3/s
         NJCFUtI2q9eCg49+F/VJkU771Zs5hsIgiNPOoYnO5ZPh8BXSz+yj41iQtw7E3HCg5LIW
         h7cnHpWyinFV5opCcTJYo9wZpxRQ7kloAh1PME1UGkJlVWv3N8vBbvE7QscwmP7lZAsG
         iMvg==
X-Forwarded-Encrypted: i=1; AJvYcCWP74HT841VgfBGMmeBkHz2WLdLsRH+6aatLON01Q7hrVAo0IFxwDDRGLJvxp/pNXscF9YCWY6lm/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKDSSEwlJe04tAoKek84sKh0Q4dhaQ3Mr/mNo+ZyeApJ4KqcOF
	pPtwLF3nEOuEAs0mFHEeYpXNE8mUDH5CMoU7h8djYpSSavea3mUAlBONBcVPOPI=
X-Google-Smtp-Source: AGHT+IFep0uHWu7o5r2mN7w6qghEp9xGMWpGJDUw5UfEylXMOmM7N6REhb0d7hr9vD0ZU94R0/JpCA==
X-Received: by 2002:a17:907:74c:b0:a8a:3ece:d073 with SMTP id a640c23a62f3a-a93c48f1b54mr526812266b.10.1727512703361;
        Sat, 28 Sep 2024 01:38:23 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-54-102-102.retail.telecomitalia.it. [79.54.102.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2947a48sm223679466b.118.2024.09.28.01.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Sep 2024 01:38:23 -0700 (PDT)
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
Subject: [PATCH 6/6] clk: imx8mp: support spread spectrum clock generation
Date: Sat, 28 Sep 2024 10:37:54 +0200
Message-ID: <20240928083804.1073942-7-dario.binacchi@amarulasolutions.com>
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

