Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B7118C92D
	for <linux-clk@vger.kernel.org>; Thu,  8 Aug 2024 14:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128174; cv=none; b=JmJBsN2fby83lUyWgVHbQYjszKoj5NHTesI2hrcS8Zmll+Ipl6mBlaCQZRtSuBpI1hpZDJVS7yKtbcDDNF1477iOeZ1ojRtkjD9Jqg25YmRXzdXRpPOzj8pZ0fxRf3zKHtLqR6KGu3/8g7a7nLJJ/K7lXmGnEM50Lu9VNbDM4UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128174; c=relaxed/simple;
	bh=HMlBx4X05JcRgo1zDJUFrZT9TkayrN7B5twwxpWIidA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jXY72Rf0iKmr78kcmp2HImTGYSMeEf60DU1pp/stLwnjlJzzXoSMXtH2U5l67L7xVma9yVMxfCdFWp5pwSOKoaS4CfrQSdmgGjeML352p0nnudx62E7OtkFxRfCLJU/QGBDX2pjjrCAGXLtPuxOLyqJibK2Dh8SgPvIAC5mE0JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sJVPwVV8; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sJVPwVV8"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5af326eddb2so3486530a12.1
        for <linux-clk@vger.kernel.org>; Thu, 08 Aug 2024 07:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723128170; x=1723732970; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y9to+L9bTdGJqYL9Sfh+XmsCrqySZTcdIgL2IwvTZdM=;
        b=sJVPwVV872GyZZUe2l6NjK1Y8+KYgUyml6Mg9NvTYnHbCCjKXcyPmieK0krvL56gSR
         375adYAxoR2q4B+bp/1IITc1NQCedyJJ3WbRLulffY/x2ragkG6FLiSbGMxxQFtAl+fY
         47w2FdJrsbsMkpuob90m2gb35zTsDBhfAXnM5lM5BfangVQ5GK89D5gCjbGtVStRfHvd
         goAwfVUEgRvk4fkochqUF6EjTbdfVcPt9dsPK+Jch/DXJQpMoqCdOZUVKThvIOwnH71O
         hEAzF4AUIlHEAATxppqwmYTEGlifCTVPvWDwrikxK0QpJhsJCAsoVC6GiAief+e6PSU4
         oLYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128170; x=1723732970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y9to+L9bTdGJqYL9Sfh+XmsCrqySZTcdIgL2IwvTZdM=;
        b=izguWWYsSXOYJ5u5rFM9ta3XCekuR1UcYdbw9aghBit996wTXATAZzyCLMYPDxfgU8
         gsHaLd9HHpFewtKJkr1M84Dyb8J+vO7M2QN6f/4YaD4q8veesl9qrOv54AcrkWEkOt2h
         M5/LVVFmNbys1lt0hulFMYPtR0MzPHP6v+57d7y/EvCha206/ORWaUSaQqCwwqTiVGZC
         W8Q2fFtq6m7gTtBAdT8b9aNhFZdJ3jwdbtke8+Xqu5trTL15eHdo/nfoxvx6Oq7UUTeU
         MCJVHGHYCLibBLb1bi77AEEHb8ECG2Y3Y/iPJ3Ine1Gff0i0/+h/c+xho/4DTjH7JFYa
         VaOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEdK8RYcNONdXuRFqQFGjzU5XFx3BGhmFPhtVYBdONAocty89O1Iq86bzChyErW5xZBLi993tMWmdf2DdyDWk6RgxoLx4tyRRe
X-Gm-Message-State: AOJu0Yw0Xry+y87Z24n9+PT2SgWv3+D4R42FcukuJDuikE9+NzpjEPS9
	lUj/Ec/RJrR1HuRHkR+aqnw42vRdxs9kRpswgSCxCHdrJWdOSO0zi2ha12NfHUc=
X-Google-Smtp-Source: AGHT+IG8GywzWr1gIp9i12RLWgA0KqKkT63htyiYzlG61i5bfa1BVS8WIMeH/VTqcF0FTAZqtfonTw==
X-Received: by 2002:a17:906:6189:b0:a72:5f3f:27a2 with SMTP id a640c23a62f3a-a8091f95f90mr126698566b.26.1723128170220;
        Thu, 08 Aug 2024 07:42:50 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e04sm759298966b.175.2024.08.08.07.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:42:49 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:42:46 +0100
Subject: [PATCH v6 05/20] clk: imx: imx35: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v6-5-e91c537acedc@linaro.org>
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
 drivers/clk/imx/clk-imx35.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx35.c b/drivers/clk/imx/clk-imx35.c
index 3b6fdb4e0be7..00355a187340 100644
--- a/drivers/clk/imx/clk-imx35.c
+++ b/drivers/clk/imx/clk-imx35.c
@@ -234,8 +234,6 @@ static void __init _mx35_clocks_init(void)
 	 */
 	clk_prepare_enable(clk[scc_gate]);
 
-	imx_register_uart_clocks();
-
 	imx_print_silicon_rev("i.MX35", mx35_revision());
 }
 

-- 
2.46.0.rc2.264.g509ed76dc8-goog

