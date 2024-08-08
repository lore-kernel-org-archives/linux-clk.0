Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DFF18F2EC
	for <linux-clk@vger.kernel.org>; Thu,  8 Aug 2024 14:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723126289; cv=none; b=dSxcQbR7pYN4z4m4ZZCsn+zVLkEn1lJ+F9zZV+agcXolTstdAjEybWxfkuqHN5cH+EI+2hTNz5gfYFSS/Rb5jTUIiWW8sqEGWKOLhygjTfSFSV5qspJcYg1wPrBtNhSH2tQt1HySbdOWu+Fnbr1lY7XXuT0VfPS6OnSWFKRTrRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723126289; c=relaxed/simple;
	bh=dtBXWxh6pEv7DtMPsjNa6bKadgnceb0rxD2xntEHe8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SKdMrJkXwtdmxtt68HGp8WSwkDXgJ5y6YEi/J7V9zltqREFcSs6DbK/FAYiAmzXISLsSMD7Y8pDrc07F2GEROD8VjPsZVh0HPDG2VqWExeqPW8yo2EaBSe46U7kXeAOmNTJbTcswPbtGprGyQ/m/Qg+v95/Yt5sbqfSvjYKmwnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ia83qOcX; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ia83qOcX"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a7ab63a388bso44149166b.1
        for <linux-clk@vger.kernel.org>; Thu, 08 Aug 2024 07:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723126283; x=1723731083; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=645sqhYxiGhlKPfMQkDqwsuRcG9BMBI/0rO4pG2w9xI=;
        b=ia83qOcXqlnleAF7+8oOHFyzOIrr11a4XEabC5nnVXshqvDHurIKr7uQ33mkTWrdpa
         /zBBlw5RucsLRnlmo3AptJvvDrXZZ80tLpH34EW/V6ulr9mSHFOox8j0SGml7b40c43F
         bjQc61M3dQnVQkK4QoPcJ3+nISQyz9SFXiKGuf/g4OBo2zA0fxZLAiD6rKN4XoaiFEan
         RUGzzAQ429T1ggbA9QVhdhfyyV8OlmJeitJzZlHf2TA2rcxOO53mFyrYHFp0UIthAwOK
         m8mTKaH+a+7syyS9VmEtIgF/MIAtqAPfLBuSHayEZotVjkPEQ66apvGGXYX963BM8IK5
         qM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723126283; x=1723731083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=645sqhYxiGhlKPfMQkDqwsuRcG9BMBI/0rO4pG2w9xI=;
        b=JRST7DyZe/qj0q2g9O6lwb/EhP+gsyHTz9wnq8VU1k9cffQW3mo+NTI2ttYoii3Q27
         rM7g5YRMBcmlww9WPJEsUYMCAC9yvYLS63ujedoHDSvQ5sYE4PDItgAzzho3xd5rwFH8
         B95BQMCMgqiBzP8R3aGTOBiLC+7nRFkn9MlNN+Mm0cGkMPqWnTFV+k52wCW0uGeftwph
         +RPWdd431cmyPgg4r0g0g6aL88eKMGoPPHJDmQ/7aXMe3sVRi/+vy8XWNJ7dujmPkf7w
         YJFxOzEAEzBy/68IcZSoKm+UdhnXcAu+KTsm/UGj0Jc21pneg5MDYOcrKOIALE+SIj/7
         eMQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYp6nWsd7NEtHU/BM/9YM7UMFYOpbcWwdv+TV2HtzY7882yBKCTHrk4yPN47Vk7duajsGgFg5fC2VZq1H3VE/g3LuZCd7DEN6J
X-Gm-Message-State: AOJu0Yw1quxcPOclRNGT/6PbVLFYangNeUYgu+FVEBMv0Ku6Bq5DtBmr
	oQY6LTVGWswxrNtphqLndJSM3dBV84bmTuQdzDA68IzLpLkv3b8YRA4AhI+t+m+gqp3J1M5GYHJ
	P3COMVQ==
X-Google-Smtp-Source: AGHT+IG0sC08kh/zmsOObZ3PvXcjyWyb0j5P2FOkvROsWIocHE2S7w2vlae2/iLc1s1v1RsqBQB2DQ==
X-Received: by 2002:a05:6402:5308:b0:5a2:2b56:e06e with SMTP id 4fb4d7f45d1cf-5bbb24be6d4mr1598591a12.36.1723126282994;
        Thu, 08 Aug 2024 07:11:22 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c29f79sm671761a12.33.2024.08.08.07.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:11:22 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:11:27 +0100
Subject: [PATCH v5 13/20] clk: imx: imx7ulp: drop calls to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v5-13-11cffef0634e@linaro.org>
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

This should also plug a memory and clock reference leak due to multiple
calls to imx_register_uart_clocks(), one for each clock unit.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/imx/clk-imx7ulp.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/imx/clk-imx7ulp.c b/drivers/clk/imx/clk-imx7ulp.c
index f4a48a42637f..517fb388ce85 100644
--- a/drivers/clk/imx/clk-imx7ulp.c
+++ b/drivers/clk/imx/clk-imx7ulp.c
@@ -175,8 +175,6 @@ static void __init imx7ulp_clk_pcc2_init(struct device_node *np)
 	imx_check_clk_hws(hws, clk_data->num);
 
 	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_data);
-
-	imx_register_uart_clocks();
 }
 CLK_OF_DECLARE(imx7ulp_clk_pcc2, "fsl,imx7ulp-pcc2", imx7ulp_clk_pcc2_init);
 
@@ -222,8 +220,6 @@ static void __init imx7ulp_clk_pcc3_init(struct device_node *np)
 	imx_check_clk_hws(hws, clk_data->num);
 
 	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_data);
-
-	imx_register_uart_clocks();
 }
 CLK_OF_DECLARE(imx7ulp_clk_pcc3, "fsl,imx7ulp-pcc3", imx7ulp_clk_pcc3_init);
 

-- 
2.46.0.rc2.264.g509ed76dc8-goog

