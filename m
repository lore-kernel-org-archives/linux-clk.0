Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AD218F2F2
	for <linux-clk@vger.kernel.org>; Thu,  8 Aug 2024 14:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723126288; cv=none; b=Q2aM4qEEz/0wWR8XahXeDN7CfRr4hwhTTVs6MpfZS/P/gJTkrA0s3zMWAj+yUZ540RYRoDDnyJfsKRZa5BNG3owCRkFQCG2jPXh+oSZDsPZrjflqgWQFiibXGYuePtAEFgMATOB7vXUkzbeBZ7N/ddIuOcl+qggOWo4iwaVStv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723126288; c=relaxed/simple;
	bh=e8jx8xmkdW6YnrISThEmwGeUauedgdSxxNVyoc0/+CE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MjUbBFHrCjvXCAZ/zEYq/46vCOzobkNDUByZLcyxGLiBWa3jBnfZkNodHk063VQowBUaTG4Z6yDZwFnafk2AVvQS6ctNc5BFU4RhK69xAvH+IGiE0L45oHdKDP8/nIlOPZG3/DCLSZGel32iHPn1lKYPB2gVBxBQDFZs6Ov1q78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SZTIxwAM; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SZTIxwAM"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5a2a90243c9so912603a12.0
        for <linux-clk@vger.kernel.org>; Thu, 08 Aug 2024 07:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723126284; x=1723731084; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c1BcegJWI56BA/X7kHTU13cyTVS8Z7HSnW1uFBI1IcY=;
        b=SZTIxwAMJVh80WSMV2rq9bAF4YFp/BH7RfsKvsLCTjFbzRp6JiEvGlOQC4CuMABTZ4
         hXz8yr1eDiGFUL5gcguYSk5CyPj7EMzD/7gtpFNitTIoN1QRLWIyUzov6Bq4oRWNcnNV
         0FsmQIbAfBNsBFbsVB2vIAd8azeDM/l7TbMreKZQIhhEt9MFQxaoTGp8U4WR/oW5bsLa
         u3KKEhiK57ZYOzeDFKeMAl6j72wF5EM77CyoQzE/PLFPm4PLWiPSlmnfAFh5DSTiq+Et
         1kVwysWz7OheRgyLZiwZsTLuKgZJ0dhgy+ZeptcuaHBElpLHBu/6xPNWelvNoTz7T0aJ
         f53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723126284; x=1723731084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c1BcegJWI56BA/X7kHTU13cyTVS8Z7HSnW1uFBI1IcY=;
        b=L0CrebGl6896GTgUPhhxbEtr86gybDlbEehQRI0UWUJg1yFU0cfREQ4taf+sqziLHg
         U9ZpfSsbWnE7NrMSNQZq9ElMC3TMXvpvH0kwVI33cMz+NWacvgdQONv0GaD8I22iGE2Q
         CCdTJ5nWqa3arL9n1ztaXR0xWpggeZY10BiDr48s0J14P3rngCX458Cve9Q4GDNIE1hw
         +NorJFPoJJvcDX6+mos8K3sjMu5Nu/lM1LoYQOIP4F/w/DpD5scoO4KLSGr3DzPlzXN1
         MQZ8IF4NBR5kc08KYgQDkO/xpGZ6L2mMKP9FpVj5CjIy3vfqE84edmPHahdvDLGIlysa
         HQRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmxcdH2bfVhV8i98GZjcLZSJs5ye8fONZbGM/a2CdNnW3yuC6ziw4/NbVIl5ix8sStCSOkKOit0e0VTOkuJ0LxhR1yVkmjxWhk
X-Gm-Message-State: AOJu0YwjeYdRuDlEHzABQ5gGe0WtOLBBPHS//m9rJn6KKoNNKEqPxs6a
	oYWmJUZgL4s/wG/FrLav8xy3Ot8Gmc1OQX2YkAwF754ldUS1re9heuXDtNFCjUXftSTagXjKVRz
	BV7rjig==
X-Google-Smtp-Source: AGHT+IFDQ4xO+7IdMcxAQOisAYakQnBCgmZLgpWTWFQiC5OifaIDp2UC1DBibihQ4Kt2Bm/3m4eP0Q==
X-Received: by 2002:a05:6402:1ed0:b0:5a1:1:27a9 with SMTP id 4fb4d7f45d1cf-5bbb2231a48mr1923760a12.18.1723126283922;
        Thu, 08 Aug 2024 07:11:23 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c29f79sm671761a12.33.2024.08.08.07.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:11:23 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:11:29 +0100
Subject: [PATCH v5 15/20] clk: imx: imx8mn: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v5-15-11cffef0634e@linaro.org>
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
 drivers/clk/imx/clk-imx8mn.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
index ab77e148e70c..af7f4c6b51e9 100644
--- a/drivers/clk/imx/clk-imx8mn.c
+++ b/drivers/clk/imx/clk-imx8mn.c
@@ -603,8 +603,6 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
 		goto unregister_hws;
 	}
 
-	imx_register_uart_clocks();
-
 	return 0;
 
 unregister_hws:

-- 
2.46.0.rc2.264.g509ed76dc8-goog

