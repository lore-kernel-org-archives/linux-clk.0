Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7552C1B4127
	for <linux-clk@vger.kernel.org>; Sun, 22 Dec 2024 17:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734887175; cv=none; b=JDKAxRqPtbzfd/Rp6vdl72vg7z3/OFi2OOYYbjXHIfnWSviENpRPzja2gSiFdQXCyY16yM10z+JMiqZOycRkWYQL8CM9X3oM5GSuDqkgXbUtQqlc8eaBqVtZdJ+gXdHRx+kkpRWLBITMF9fUZZ1zMBfb9jhSosFQ9jXiqi9p+7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734887175; c=relaxed/simple;
	bh=bi8yUclAAwD0wSw1yOprZdA5MUHc82j8ssHIifM5FAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rIJfEcT1WixTJV0hCRwQ3tMfWkJY3//XWeD5wAhhEq7IuCtuWhIovWYjHfHcNwj1i9ePwjvHqmWZtUNo4SB9A1iFxOpK217j5kOj6YakLx7y7Eme3ScoMR2iInIJ/60ef+492LJyKS4gaiQXHNMHAM3jq54lNoDyURlDvqmJAZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=OPQaaoQf; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="OPQaaoQf"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aa69077b93fso499900566b.0
        for <linux-clk@vger.kernel.org>; Sun, 22 Dec 2024 09:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1734887172; x=1735491972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OmS2q4PEwUxAZm6SKuFHBNxLEZy5O27yTgc+4SIr6m4=;
        b=OPQaaoQflB+p3Rh93kQmP4SElB0zGcmWb8RlMILDvSDIeh5EmuZP3jH26+Yazk5ZQC
         eDcpPOlUiNLSXLPacCpUo+BpL+a2mCzVcffXSJtOsgqiUqy5jN8g6urDPMumyZXgYOBc
         gDJu6XbCuXUcXv6aunk/MITZwnzSNbjRjahL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734887172; x=1735491972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OmS2q4PEwUxAZm6SKuFHBNxLEZy5O27yTgc+4SIr6m4=;
        b=guMHeXrR7xu41ksmNpYC/Q7TdpE/7cXn0EV4+pZMn41YlMTWEr6HVFniscJ5oih5rK
         BNd2q/I71ZIoWuWruzbHkmM8XY2JeOLplWs8mfSpkzfNAPV3tLIeKulLjC4c54g4NTd0
         BC2P/z/1v30HNJssoD3LwxWVOzvo1MjHx9z4pv2A8eOcn/5wnatUTm9Tmfljd6Dg4KgQ
         /NIS1WL9Qfet7jBseZWk6F9Rsiz31552//k6E4L5r5kgyMUWwWd8mLOhPAA8oXxSejLI
         6BRxGmpll2c3M/RCoQeCFGU+PCxdGyvXe6e95u6LKdCKWaLMrCHMV86PZO5EbOoJv4Cf
         Pd4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQx8nnGzqwCOnBN1qhp4KNhiz6OFDQBbNi3FeZFWjs9WeF7NuzPEaSZhjff+8M8kt86PBxklW/D2k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFKwEgwnqqKfMTH3prWiVvLSF7wRgiV5iIEOKFgxPdwzNp6b/t
	RIPlJcCan+HYCdPz4B3j7D36U455eFzev0lWjYzM8XnV59MAt5ONWcasA0w9SZ4=
X-Gm-Gg: ASbGncsikOqTXQqVtOnCRNxSa2lLrm3Twk/W4q+hXwlyQGotWpIU1GAj1ga5OeYU5Sp
	jAG0qsEF43oS617kDVMGm3rBAkJhHtAjnEqAnP2WHSv3+cw0TEY4yuFczXeSAtvn3Neb/QQC1Hs
	9++aT6FaADoxXWLUqjQrc1LvssJHsQ2biMGPN7qXx/Cn3yPQfseMIXJYf2zA0psbP+U2Kb4CwVH
	nci3BrltTgcen0G6wZRY6opzNecOKmEIM/ASyFdf9v849qLLbN573Irr/lq3MDmydBBHzfzmukB
	FW8bSHv+ndH5kZNkx22kzTd5maqjHC1v3X24G7j0F44kWw==
X-Google-Smtp-Source: AGHT+IHJzculVyLqVLiiOPR1XaEdHZ7jSwaVhPg8aOnJUgPmmOr2yhR4PsirVllXClh6H0aRUqSvpQ==
X-Received: by 2002:a17:907:9621:b0:aab:f8e8:53b9 with SMTP id a640c23a62f3a-aac345f427dmr975282166b.58.1734887171608;
        Sun, 22 Dec 2024 09:06:11 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe48d6sm414056566b.127.2024.12.22.09.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:06:11 -0800 (PST)
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
Subject: [PATCH v6 18/18] clk: imx8mn: support spread spectrum clock generation
Date: Sun, 22 Dec 2024 18:04:33 +0100
Message-ID: <20241222170534.3621453-19-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
References: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
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

