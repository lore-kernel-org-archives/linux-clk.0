Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64E31DED60
	for <linux-clk@vger.kernel.org>; Sat, 18 Jan 2025 12:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737204089; cv=none; b=a83lmQqpIa1/oMvzfsfZKYT+15I1xpigOIw2S9yQMLKOZRFeNtOmU1dvT5A56BXrR4UflKl8KN1LfprsrFerd3raSnZqEOPyaiAYzoIBYpi5M7WMYqE8QeuCs6J0u9t2ep9GCFaQPdnP/13f0RlVDDWbmIQxCW/aM2heQifH5/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737204089; c=relaxed/simple;
	bh=HjSEIAPz6maPpmKvBb0LoO5MDQbc6Gv+kkgBs4krCDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IvM4U79d7bkJaYyY68UCFZZBssEtduG435448oJxeNwNzzRyzSVpLAC+4mu+oD9tF5JPUmhrpNVCmZ0aGJrwNiF10tiyOwQKmijtnfvnmae9oRakw5ntvPL/lDmzLar03KSY8wc27HM4nEy5RI8axsSUgq+cDgzRtCSbUn4/VtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=dPwYhdMU; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="dPwYhdMU"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaeecbb7309so566114266b.0
        for <linux-clk@vger.kernel.org>; Sat, 18 Jan 2025 04:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737204086; x=1737808886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vDdCPdsn7drrDVs6gkBxF2bAHBnCBAUvlTFeTtU0PY=;
        b=dPwYhdMUVFYsfRWQeWGTCLIvV7RfoUoIa0DyzHNTjz/SAU/tsRIw0TyjqkXf8pLET4
         gl/wWz/Z5/hZahPLXApa75b1h/K2Dv7deb82sMGOPNykN+GFaiIUv4VbzTd5Nn9wdN+P
         aWUmWufMr29/aVWY8EeVlMeEg/w8xhR+ghFVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737204086; x=1737808886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6vDdCPdsn7drrDVs6gkBxF2bAHBnCBAUvlTFeTtU0PY=;
        b=EJnrvihVPQwLbf/PWfeeZxCDxygYPZsLsHfbhmC5V8dsKKBepnVz5NvBh4dhHo5nCN
         Nb+pfozn/3mf61VbKqQkr8KlPWhbHLKGBSGtE5zXG0w6lewZJqshSwAZQpsQ8OOKm8Mm
         DPgBjkcIk5gmqCHytDxXg2yn2fB4ljYt3tGrIl6zLqO6wGWnEJhMg9DolO5N9tvqxNvD
         hZwK+Lu1Qlowe8YK5GEH9EgUV3Rbte4HydY8Qo0mAT1CkehU0kjtmsBl3oK0k8V40JzA
         GuM5f1WshLI98x5lf4WXZJKb8hE0MrYI64l6bN4ehOYOZYMaqYgJV27iJxQKgPRuwxn0
         Px2w==
X-Forwarded-Encrypted: i=1; AJvYcCVr85sfXwZ45ifP7vaia+oABB61PgwDA46drwnTuwx37yUxLbo7+UQ4iblSw6TWIcAI64TYzw7aQYM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUEdIacSEr2KYH3zOTd1bNCfaAiEAop74nsUpEN/dXGyHwPV33
	sOiDmtlbK4SyRprnfYnU5PMfB5XdxrE/woiLAXtFEVH/4M52A7YIM9hmQWLZFgs=
X-Gm-Gg: ASbGncvPy4xEYpHSii7m6b23aCoo1eNARSLUknpuX8h2EzTwEG6jCXoGDX9WUZY9O+Q
	JUX+9Joz9pg4Zu7jk6irMEvjB53xyJZxuWx0wXl/Qe9OOjI10YsON3aPO+IRi3V7iJaT65q4z0Z
	BJ6y8Z05076GYvU0NcVCPghk7IojZ8IHWJQoxeZ9DGXHZOCLqQyYe1Uo9txH8QRUeF1kZYsJ0T6
	4iDCWX53m8SPpsLggEZl+zTXsKCysh93+FoOJa1VgQZ3vkhfnmIJbiAvQhDbtmanjuNEkUfqFLM
	m2r6oSCS8FvW4O2FaWCXeYRrwQ3KaTP+M6eMv2TjpotFHbhmX5DE9HUlBGDKmdFsODwsuiBs39J
	x1F3CReMhJw+BFDvgaX+szSgArigDkHpmTeS9
X-Google-Smtp-Source: AGHT+IGXzRigtXsPzj90j/78YQbLG+CGAnKWwF2PQgfEJZOtJnmpVNVhi1AoGMgITGhf4fbDGSnoNw==
X-Received: by 2002:a17:907:3da0:b0:aab:d8df:9bbb with SMTP id a640c23a62f3a-ab38b42d8e0mr535640266b.41.1737204086146;
        Sat, 18 Jan 2025 04:41:26 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-30-28-209.retail.telecomitalia.it. [79.30.28.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcd73dsm332562366b.178.2025.01.18.04.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 04:41:25 -0800 (PST)
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
Subject: [PATCH v9 21/23] clk: imx8mp: support spread spectrum clock generation
Date: Sat, 18 Jan 2025 13:40:04 +0100
Message-ID: <20250118124044.157308-22-dario.binacchi@amarulasolutions.com>
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

(no changes since v1)

 drivers/clk/imx/clk-imx8mp.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index 012cd3b52e3f..560f51d9232d 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -393,6 +393,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node, *anp;
 	void __iomem *base;
+	struct imx_pll14xx_ssc ssc_conf;
 	int err;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
@@ -432,9 +433,21 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MP_SYS_PLL3_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL3_REF_SEL);
 
 	hws[IMX8MP_AUDIO_PLL1] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_AUDIO_PLL1);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "audio_pll1", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MP_AUDIO_PLL1], &ssc_conf);
+
 	hws[IMX8MP_AUDIO_PLL2] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_AUDIO_PLL2);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "audio_pll2", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MP_AUDIO_PLL2], &ssc_conf);
+
 	hws[IMX8MP_VIDEO_PLL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_VIDEO_PLL);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "video_pll", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MP_VIDEO_PLL], &ssc_conf);
+
 	hws[IMX8MP_DRAM_PLL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_DRAM_PLL);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "dram_pll", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MP_DRAM_PLL], &ssc_conf);
+
 	hws[IMX8MP_GPU_PLL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_GPU_PLL);
 	hws[IMX8MP_VPU_PLL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_VPU_PLL);
 	hws[IMX8MP_ARM_PLL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_ARM_PLL);
-- 
2.43.0

