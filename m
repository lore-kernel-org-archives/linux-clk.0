Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B815918FC66
	for <linux-clk@vger.kernel.org>; Thu,  8 Aug 2024 14:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128177; cv=none; b=bu5yz71jDr1ycq/qp22RBki2o6Ru8jmiGv3JBNxLZSNZ8x3pfiIR7O1+n9KDtLq7oWkCsX9DILuUpa/Mq/eab7ONCpRoANnC2p4MnnULfg7qnVk3JXexJmhMX8l++wjiVF79uRwbDunImqvpJR352qorQgm4XqU3BivWSrWUdNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128177; c=relaxed/simple;
	bh=Aa36Al+8XL+o6jnCRaXGcn3QPeSfqDekEcFkrR4ZXoI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EzE/Oo/VoKMU1SvGnBMXYg0o9MAinOXmjNlK4/e7Y+dIGW9o5MzpcHyxpCDemH7xDdoF0pu2YlLgoikgOPaGPgCt3cIh4Fi9g8U6NxRE+34P70XKxiF52T/WLvofDnmpOVaqC/HDyJfKHJ3ZSkWkg8j85wbCLfh/3yzSfFmIHKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LwuMAFP3; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LwuMAFP3"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a7a9185e1c0so107802566b.1
        for <linux-clk@vger.kernel.org>; Thu, 08 Aug 2024 07:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723128172; x=1723732972; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xSaLptLfozVkUpjw1oRI9Gwlbl43zWvMUP09a2upKVw=;
        b=LwuMAFP3pKgrVexYBTFJlM4XB6LHZKBkkeiTfandzXJS0vt96f/67w1b/BkZKnKcNX
         QaALk0a2PG2JBnNhCaFlYc4TeknjmI+5/vOJSqjf17xB3dX5dvxwo2to8UDdgXnnHxwv
         i6KSMD+3tavfnN7Fy7b0v5BmSaFUNkeD7zZaQz1KsnR5HePxOk9xkn3K2qEqYPDnu30Y
         4XUqe9lEya7Q2nJsJNgrbrw26LwEd0WoCa280VZKEN3EJhVT6PRySoOaCZI66VdWX6fJ
         qLkuyqk8Ajanp4tAie6xppDdkRZe1YqdQpBBWhoQYYdjkqwdtXhdKN8E7aQ6LhR0CS1X
         BjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128172; x=1723732972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xSaLptLfozVkUpjw1oRI9Gwlbl43zWvMUP09a2upKVw=;
        b=g81KYakMqH9RzKM7N+9vBk62CDeoL/WQ0jzaZV5ca9hgUrK8pAQwdhfgahDXOR16MB
         WT0pY/gwSKBkCQ9kUu2gV+SDfyfNzyzNILkY9gvu4IItVivzrplU10BOyzWTEd/EAUTH
         I6jzsp2m4+tNmg6LO8tcqd8NbRlu4u04+0k+xgBi9ZfpWJTBW0Ny4u9jTizEIAodhWvR
         CR5xyyFyZl3tJA/Nl5CMAfZjjv9nXGXdewiUrZnJ3YG3IKajvInKYWSO9hbqXky1idT9
         WJEPxmhfzPh2RYMx5qFfLdqPK1GQHsq0pcfsp9sWAdr1pbaBappdtd3F++1xIhXjdNiY
         RicA==
X-Forwarded-Encrypted: i=1; AJvYcCVtvy6+4gDOrmd/dFbhcH3x1yNYSs70powkSN89FCgOUQr6g0O7hoVrlaf181oWEXoz83xRwnpSRoSfjLXUfTnrFjlu5+2YS4FM
X-Gm-Message-State: AOJu0Yzk2WDDsRWsN+kv1xXBVUvxXaHYDfBWcJ2qZT7pxNn5T/j9KO2g
	6I8JPerST90anokA6DCRjjFOFgaIFEob63UYuq+JyNxhYyrI4de+rXuLcV9A6+I=
X-Google-Smtp-Source: AGHT+IFMK2qopGYBycdChfC/X1LoyzHCLARQBPYUBx9YA9oZBE8LNw3RFGiTAugu4rQMz79p2jq/4Q==
X-Received: by 2002:a17:906:6a04:b0:a6f:1036:98cf with SMTP id a640c23a62f3a-a8090e8a3fcmr157838366b.54.1723128172451;
        Thu, 08 Aug 2024 07:42:52 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e04sm759298966b.175.2024.08.08.07.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:42:52 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:42:51 +0100
Subject: [PATCH v6 10/20] clk: imx: imx6sx: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v6-10-e91c537acedc@linaro.org>
References: <20240808-gs101-non-essential-clocks-2-v6-0-e91c537acedc@linaro.org>
In-Reply-To: <20240808-gs101-non-essential-clocks-2-v6-0-e91c537acedc@linaro.org>
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
 drivers/clk/imx/clk-imx6sx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx6sx.c b/drivers/clk/imx/clk-imx6sx.c
index 69f8f6f9ca49..4e42e30245b3 100644
--- a/drivers/clk/imx/clk-imx6sx.c
+++ b/drivers/clk/imx/clk-imx6sx.c
@@ -555,7 +555,5 @@ static void __init imx6sx_clocks_init(struct device_node *ccm_node)
 
 	clk_set_parent(hws[IMX6SX_CLK_QSPI1_SEL]->clk, hws[IMX6SX_CLK_PLL2_BUS]->clk);
 	clk_set_parent(hws[IMX6SX_CLK_QSPI2_SEL]->clk, hws[IMX6SX_CLK_PLL2_BUS]->clk);
-
-	imx_register_uart_clocks();
 }
 CLK_OF_DECLARE(imx6sx, "fsl,imx6sx-ccm", imx6sx_clocks_init);

-- 
2.46.0.rc2.264.g509ed76dc8-goog

