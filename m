Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034C346444
	for <linux-clk@vger.kernel.org>; Sun, 29 Sep 2024 17:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727630878; cv=none; b=QrxQt1K7R8O2aJC+Cq1gtYs4IEaSQNRRyPJtOZxyYZ5PYTLhh+6q8fJMP32An+l/1dlXEwrSQwj5hjSw0SRJgwmiCnOc+u53gFZ5dGu/D/UmbMNNBUCMXXz01iOPcIcL3/RcFUkFZyBFWkIFuhImWCy8UTE7+tKNgdiejuNf0CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727630878; c=relaxed/simple;
	bh=KmBueEVKme5DtcuzYm7hl+dZKGVzspxJFWdpCrLNZgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=clbjphanTQ2TrvodrodyPD9yja6p8/phG3+ijU1L4VqrrGlu6wv3ehlVG8ecWGAH39csWU88VnvNh3UXd0syhYxeqI2YzXtMdy28m8469Y9KaC2As+SDIAJm2enkyMRK1LE0gmXdWqusrWk3IEEgHqjtHBOUj+wxhw+3g+UYVBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=IUupnd4P; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="IUupnd4P"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42f56ad2afaso37360205e9.1
        for <linux-clk@vger.kernel.org>; Sun, 29 Sep 2024 10:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1727630874; x=1728235674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2RymkxnNQTDpNcXN6Qg1uYxhHB5JeOGRw/tDAC3s4FE=;
        b=IUupnd4PrUUPWvwJRDPrF7T7+lSuegKjVHUHdWar8SElcBl/RpTjkNpyParfsj2s6T
         jCqicixOl1I+XY/keeDgml4nMyv9uhu/yq7wsLwBj5K/aXtX+7ZNx6bT6D/aES6NTd5s
         Kb8ZCkljrr5nmXtiS/3ZVFQ9XzWpGOX3tWOtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727630874; x=1728235674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2RymkxnNQTDpNcXN6Qg1uYxhHB5JeOGRw/tDAC3s4FE=;
        b=r6D3xZQy1EXe3t0CV68z3nYQ23pL0V0gAbl3GCrFxITusHSCA3kslnXJ7QPAihnsou
         3OSm9YZTxmUNvH8WxMiht6rpxsADm4UKCr1iDN7cqaV79FilHYJpqZOYs4YnSpYfFIad
         TBSt47TjY9S1QxzTW933YDaG21a1TS16L8igEiScbXR8frTY4cD5MNmt/u4rQ5+DnRBg
         MW1Ra+vdJVZ3vdLzZCRzLR0Mg5P+8aCrm5Bthw9oC+an3sGYs//wqRvCbmTSj/qvAoQ/
         0hyMMe6ixDpc4SimBokDJOzPCd9myXNs5kuGMLZ0X2sQTpR7QYGl/Y4D6a/s3axYsF7H
         evTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvPWRcxUQy7/wFXRriRE/Z4Bsvce+ftoY+w2kJw26ldHE/vSdY1YBZyFTZZcLOIO5G7sLhiVGXqu4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe91LsQjw4ru8u4VW7bWuhQiEkHksKRVNRrE+SBn/AkF1o2lmd
	K1jTTFaGOXm5F7MJVLsw1Sdq22uz7+FroJMtvPqCITnoXmA63jA/sSB6QXIx3lo=
X-Google-Smtp-Source: AGHT+IGmvVmD7fNsIntJU4qP6HHyGpU2QLRfhh5X/ydqxCTIJfv/+WNCG9XNyNBpNOJz5bNihD8xgQ==
X-Received: by 2002:a5d:6886:0:b0:37c:cfa4:d998 with SMTP id ffacd0b85a97d-37cd5b1515amr8217224f8f.49.1727630874386;
        Sun, 29 Sep 2024 10:27:54 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-54-102-102.retail.telecomitalia.it. [79.54.102.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27776a1sm403176866b.8.2024.09.29.10.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 10:27:53 -0700 (PDT)
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
Subject: [PATCH v2 5/6] clk: imx8mp: don't lose the anatop device node
Date: Sun, 29 Sep 2024 19:27:15 +0200
Message-ID: <20240929172743.1758292-6-dario.binacchi@amarulasolutions.com>
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

Setting the "clk" (clock-controller@30380000) device node caused the
reference to the "anatop" (clock-controller@30360000) device node to be
lost. This patch, similar to what was already done for the base address,
now distinguishes between the "anatop" device node and the "clk" device
node. This change is preparatory for future developments.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 drivers/clk/imx/clk-imx8mp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index 516dbd170c8a..b2778958a572 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -408,13 +408,13 @@ static struct clk_hw_onecell_data *clk_hw_data;
 static int imx8mp_clocks_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np;
+	struct device_node *np, *anatop_np;
 	void __iomem *anatop_base, *ccm_base;
 	int err;
 
-	np = of_find_compatible_node(NULL, NULL, "fsl,imx8mp-anatop");
-	anatop_base = devm_of_iomap(dev, np, 0, NULL);
-	of_node_put(np);
+	anatop_np = of_find_compatible_node(NULL, NULL, "fsl,imx8mp-anatop");
+	anatop_base = devm_of_iomap(dev, anatop_np, 0, NULL);
+	of_node_put(anatop_np);
 	if (WARN_ON(IS_ERR(anatop_base)))
 		return PTR_ERR(anatop_base);
 
-- 
2.43.0

