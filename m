Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FEE18EFD7
	for <linux-clk@vger.kernel.org>; Thu,  8 Aug 2024 14:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723126286; cv=none; b=bUJl8gkWgo+sE0X5qIit4WGdZXB4ZUB1s+HtnHfyndR653Z3fcnpZWZQ7BH2Nkq4bpZ3U4wzdVVcscTWz1SgtBjiILH2VJdZtrp5Wkh3qGEPoAElD9oTnurBvNc4+3A1OYKOzNXk4G3cXhOV+FHuxeAa/PmPCKfbnqnDvJzsiN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723126286; c=relaxed/simple;
	bh=gR0CyM9a7lgnJr3lEM9JUrDdLahkhfxbkDJhWgDwKZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jXvrCPJcj1094dZJNdlVO/V9KIvcM94qCjA5xUivp0fPJpXn+QkXqKF3P+5JFnawqC4XzErkXODi1O5PNegkzhyeB4eU9mRuBA7GcEdG+MJSyufB29QI5DpFbDR1XihFO/BM44nPHCvGLYEfyx2gbzIKkiCVDhswcs79IEu2oKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=en27hXIR; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="en27hXIR"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5afa207b8bfso1044145a12.0
        for <linux-clk@vger.kernel.org>; Thu, 08 Aug 2024 07:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723126280; x=1723731080; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l83L9SwgjM7cQs40Ix45OsltdwbTgmJEPf1zQuQtrko=;
        b=en27hXIRhMA5daFt2gmE4HTs0Wo+icyc7KaojLz4wzRFwCItEm2ysP528zn+FIKcPl
         +HtiOzbnVEvtJUeiHcty6uLgtM3dCXvChjsQyfmVNnUikHjw9W3SYfyRq61D3UbDR07P
         EYjwMmALmFE/w4HWsbLP+ILYyFC5RilJtOWMrQCJY9e+36TcAIUt8yMjSXkw6vROBEpe
         M204yZCS9v9fNVa/pQAFKz3d8C7jzsWNS1rkJWmIfX5BL5Qxfj3lj6V+J8C4v0TwbRgY
         dYWTtvC3x8SjSAtoB5oZwMDSt2dd3Q8FuPCwpsPaMSYvBDSGWfvEKU0PyYTYc0lFf5zT
         iZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723126280; x=1723731080;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l83L9SwgjM7cQs40Ix45OsltdwbTgmJEPf1zQuQtrko=;
        b=i1kwksWtiANBfgxbDTlREXUreglLP7QYHsbX/5VOADA7LjFnah6zEqJQH9cRujJdEU
         ON1a7H0AM5WYQSaVaq0rQKHaR3ARaQc+j5045jNAQSKlDD8+gse/RUWXxgtk8vALANff
         F0DmT6HaxujDFrsg/Rdn0Zf8+DaiEDvL2pKm3l8/RaA6LnD7jkkln5ljKk+92AhDbmN+
         GDbzxaMukVnYuCL5KHVgpDL43Vy8HeSTCTwwgJHrxHjNIFMajRbRFoD+K+6RT7oBfdKo
         /odJArI0k/X3gbozpxkXqu1qX3xnBAZEp10ccIQYyR3pBmhkEY8lgo4Pdu17Xts1dA9P
         mBFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuFYY3++1p98YiFcen9tQ8ROUd4D2hIzo9ja2boY9OujfUHPNNU+mfR47I+UgAH9tO0VRG0REMlY8tz9tTGGG2Px/NvC7z+Exl
X-Gm-Message-State: AOJu0YzGgKKiQuHv1lcPXewdvIynYU5hZTOa96v6LLafNXrXrNXcj9nf
	iK+JAXx8rpyyW3vXC9yX14X9MlixNW2XcJB5EhUywwA252hxB3xA64pocXBKhdTtIsjlghQy0IF
	hkb27iw==
X-Google-Smtp-Source: AGHT+IHHbEYfKvz99NCzEnYTqfn7cB+94G7FgbH5KFNqsiOTBHtM9BvVoArHK526vLwSDjCHbxrRMA==
X-Received: by 2002:a05:6402:27d3:b0:5a7:48de:deb7 with SMTP id 4fb4d7f45d1cf-5bbb21a4daemr1489870a12.14.1723126280575;
        Thu, 08 Aug 2024 07:11:20 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c29f79sm671761a12.33.2024.08.08.07.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:11:20 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:11:22 +0100
Subject: [PATCH v5 08/20] clk: imx: imx6sl: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v5-8-11cffef0634e@linaro.org>
References: <20240808-gs101-non-essential-clocks-2-v5-0-11cffef0634e@linaro.org>
In-Reply-To: <20240808-gs101-non-essential-clocks-2-v5-0-11cffef0634e@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 imx@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

The clk core now does something similar for us as part of
of_clk_add_provider() and of_clk_add_hw_provider() and this i.MX
specific call isn't necessary anymore.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/imx/clk-imx6sl.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx6sl.c b/drivers/clk/imx/clk-imx6sl.c
index 47b8667cfa3f..bc3e414eeadd 100644
--- a/drivers/clk/imx/clk-imx6sl.c
+++ b/drivers/clk/imx/clk-imx6sl.c
@@ -439,7 +439,5 @@ static void __init imx6sl_clocks_init(struct device_node *ccm_node)
 
 	clk_set_parent(hws[IMX6SL_CLK_LCDIF_AXI_SEL]->clk,
 		       hws[IMX6SL_CLK_PLL2_PFD2]->clk);
-
-	imx_register_uart_clocks();
 }
 CLK_OF_DECLARE(imx6sl, "fsl,imx6sl-ccm", imx6sl_clocks_init);

-- 
2.46.0.rc2.264.g509ed76dc8-goog

