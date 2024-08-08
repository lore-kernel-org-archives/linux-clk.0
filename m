Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0E018EFC7
	for <linux-clk@vger.kernel.org>; Thu,  8 Aug 2024 14:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723126284; cv=none; b=IhlvU7hZkhSXSRCYApKkQKcvhLjUcZlb6JIG34x4W1rtMIyxDh2VeIKFHTc3jJM3lXIKVyXTRhEloqAw+GRM6a7v51i4QqSmEcR5iY8XG6F2AtX+4I9FDjC3oX21NplrgxezVBugcC5GLAyfSza0queiT3dQjeA5OrN7VE4taiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723126284; c=relaxed/simple;
	bh=BM5NOBExieRXZnAEQvVUw0Kowl8OGVo6wjlq8o0hJrA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZQh1qJnZMwViG57kERxkrISrKZXmblmT/qgv89YrgrL7q7CL86rbMQcwZdHSFx/91neOyUG3oH7PTdwuSYI7UbciIjevPprDBrzvogkmb/1BJ3fD8X6J2zHzBNRd+kXMqBqVQBHDD8imu+oeAldMD/+llcZzwgbuJE+8ZN+XbM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nMVCVZht; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nMVCVZht"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5a15692b6f6so1130721a12.0
        for <linux-clk@vger.kernel.org>; Thu, 08 Aug 2024 07:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723126280; x=1723731080; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b0KZBbN+nQ1FI8ntFiIPj9qlGXoBaHjCw819hVXcAjw=;
        b=nMVCVZhtA6O/C5ZVwUff+byxNH0oUo0SWBAm/HGOvD/qKdEk42enTwEwDmC/YDBVXZ
         Qgcj4isRf7Uv6n0hkVzLurUTtRElqDmn9d5Q1kc3gpCUzeC8TwkZpR9X0TgQKeon25dD
         knKmygCDjQKRKxj8gWY+g3zBQukYFL6VOJaqneAv8qtiRLzwq+C17I2+sOeJIhyz5qij
         EhQBGzAgWBeqNiO1UkiLbP2loJI8+kNQ3q/iyg0HQbhq2ncM0Dpo26N8HZuzY/Y+rX7d
         9Iiz4pRbt5JA2QDNxiPj/SUOXmJ0emcQoGy1adIufhXm3o80AG9QrOLsr0v9dW2o3mGD
         K8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723126280; x=1723731080;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b0KZBbN+nQ1FI8ntFiIPj9qlGXoBaHjCw819hVXcAjw=;
        b=OYNRhVquAp0fSSHI/wSDid6Np6x6KpI+ux6z3bXymQSY/d99JsJzEQDPvauN3ZQr4e
         kRD0snif+rWe7TUfpfHecFCUM12Qnui0xsylVgNh8JPaGrRHBihgwd5Ahb+oLyAjlJo6
         /t/GRVZEA/DFjYgaY9+8lHY7VCdXiGw8m/1xpaN8wYYsc3uiv+K2zjpvIwo8yw3NbVsr
         GQuBv5inikrfBCLyHlADhY2lgYWQayVGNrPnhAdMl4FUwmBuxafnu+HWIB5RQlvjHMpI
         WjiNT7SmM5uTTmuBrcDvSUH9xybLm5uB0JB/aMeLjMLJ2ckngPGOy6FkdyLZ4+hUS+5N
         6BGg==
X-Forwarded-Encrypted: i=1; AJvYcCVzG6m6vTE0eSdAAaekGyKXTX6Y6ZQMiEOmeTbirbdNss7bf1mP3AF0OzPgzreHVSNJC0bTm9CUa/QX59xJ5vNTLcJwhXnyr0fW
X-Gm-Message-State: AOJu0YwDIiRKwn2Z/rp6AJxmVT4T4QWUAxsq4wBu2os3Fusi6cV/t3yX
	uDDDCR9KpVL9KzHuGefCdKU1x7seFOmWyuLdkVLDNSrxftcBdlmtKHJgvxhDTOqook+bvU4QBCW
	OTM5itg==
X-Google-Smtp-Source: AGHT+IGtyeiAxYcp18rF8HoQf16HSx6tLGtDmNJrCO+VQaF0ML3hsMyoqYty49GZM6aDNVCYElHp5w==
X-Received: by 2002:a05:6402:2695:b0:57c:7471:a0dd with SMTP id 4fb4d7f45d1cf-5bbb21a3148mr1640366a12.12.1723126279666;
        Thu, 08 Aug 2024 07:11:19 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c29f79sm671761a12.33.2024.08.08.07.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:11:19 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:11:20 +0100
Subject: [PATCH v5 06/20] clk: imx: imx5: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v5-6-11cffef0634e@linaro.org>
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
 drivers/clk/imx/clk-imx5.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/clk/imx/clk-imx5.c b/drivers/clk/imx/clk-imx5.c
index b82044911603..163bed084a57 100644
--- a/drivers/clk/imx/clk-imx5.c
+++ b/drivers/clk/imx/clk-imx5.c
@@ -357,8 +357,6 @@ static void __init mx50_clocks_init(struct device_node *np)
 
 	r = clk_round_rate(clk[IMX5_CLK_USBOH3_PER_GATE], 54000000);
 	clk_set_rate(clk[IMX5_CLK_USBOH3_PER_GATE], r);
-
-	imx_register_uart_clocks();
 }
 CLK_OF_DECLARE(imx50_ccm, "fsl,imx50-ccm", mx50_clocks_init);
 
@@ -463,8 +461,6 @@ static void __init mx51_clocks_init(struct device_node *np)
 	val = readl(MXC_CCM_CLPCR);
 	val |= 1 << 23;
 	writel(val, MXC_CCM_CLPCR);
-
-	imx_register_uart_clocks();
 }
 CLK_OF_DECLARE(imx51_ccm, "fsl,imx51-ccm", mx51_clocks_init);
 
@@ -608,7 +604,5 @@ static void __init mx53_clocks_init(struct device_node *np)
 
 	r = clk_round_rate(clk[IMX5_CLK_USBOH3_PER_GATE], 54000000);
 	clk_set_rate(clk[IMX5_CLK_USBOH3_PER_GATE], r);
-
-	imx_register_uart_clocks();
 }
 CLK_OF_DECLARE(imx53_ccm, "fsl,imx53-ccm", mx53_clocks_init);

-- 
2.46.0.rc2.264.g509ed76dc8-goog

