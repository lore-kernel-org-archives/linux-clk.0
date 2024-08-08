Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8BE18E767
	for <linux-clk@vger.kernel.org>; Thu,  8 Aug 2024 14:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723126282; cv=none; b=j2EMkiRKipJno21Eyztm8MEM6lZ5o/nmI8snHY9rUR3gMRPITq5E3QouWjAQ9nHDc/N1SUh1tZrpJTzjij6Z0J3doP3ClGfJzOWwAZnOzeJWkyUACFEWmjzSaMoBaJExcDI5mr7dnfhS9iIXnX7/+VNldN7RviBl+VbAPWW316c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723126282; c=relaxed/simple;
	bh=F85JnWhsga2fKjX8ofqy8VS4HE5CVI70avGh7w8r0jU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A47fwieZY5mvjXD2TidXU11TqCwDd48RhKyzesfNaUTcR81NWX86q6D1NNKV2X73rdcpnMiyA806xE26/dpecesPe/YM1fQS1z6omIJlXV2sjSAAnkPKuAxOy+8EayRrZrsOrQGg8urPNVMkMTb5RMI6W2EMVSV+TP5lD01ZufU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W5859u+C; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W5859u+C"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5bb477e3a6dso992644a12.0
        for <linux-clk@vger.kernel.org>; Thu, 08 Aug 2024 07:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723126279; x=1723731079; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CR2/Ipvc98fbygDSdyGUwyP4a+VA03w16ijfH8oQ9sU=;
        b=W5859u+CH0L/PqibEEfL0OhVE+FZMxmr4XSX6NRh4zWaU7S8Qz+AfUQTraRAQQ7zxm
         bGd8wlOvxwBhnSWJ2TFiMPCx7AUrBpp40pt4ZOMpPE2ihRZyKsChPsxhoFn4wf3ujXUq
         grr1hWltmXSWCNTqH8r77d/LUaGR8zw4MenC1VA0/sLeS2lBpoXtANlXilbPVHLB7Z5R
         R6apdvgVsV+ZkpLMtnK6cgQhNREUJ9pWVaeN//pmm0xStBL4vRxgTDZ9BZuWhkYwjJVk
         gaemE119+zG4j2ebI0ubcU22Zy1s3CgkG1ztOXrMOHc/Q4ocHu/cx8nxODkA69WGy1dh
         Pgog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723126279; x=1723731079;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CR2/Ipvc98fbygDSdyGUwyP4a+VA03w16ijfH8oQ9sU=;
        b=Z+RmD4lGnP6pgbQdidgqIePUlNRklhEsUN8zuECxkr/Aock38gZmX1PaN2VzuVQnjJ
         QUa5SYmMyT4slI7SaS9nb0uCfM6aGJ35UZ7ioHYhI9yzDNGw2xKAROb9NQQxqN9i9gLz
         zdHDm9gRR1xEJzxH3zLEnDcWTQasmiZGk3foMJZ2ymQbUqkgr2Jx10b0HfL428Y4xj7N
         g9iHAfo7igb/old6oHXV01rrhktHlm+65ED8QdCqlMw4N7eZFlKo+3ChKe+jc7xMlKRv
         3NLrg5eJiO1fzeHI1KN9Sw0jnBCF4J8w2dMPb5Ct/5epqoq+GydtW5Qw+Urn4rF2IJog
         CGLA==
X-Forwarded-Encrypted: i=1; AJvYcCWIZDFtWHkHMzjOlf2adWerCL5bsFT7eJVrCotFj1pimHBhoRQC2jKY3RthTImXKDIb6jlM0qMMYqblVlZeUEbKgdhSRholGGEh
X-Gm-Message-State: AOJu0YwgvaAfw0EL8UxUrsYqMtowujkB/YnkoJYA7q0II1uVgHHAlalf
	uDbVlkQ7Zvd7393ZbhASgf7kxNwQKdHtc7unFdi1eFoFEL3AETlV2z5ZPXai6DDFu0Ue7dfh4qk
	K1lGOsw==
X-Google-Smtp-Source: AGHT+IGQvljBuJxnonICHpQDY/uQkKK/KV1ck0021rT8j6xJghx/FmB4/M4YPS1UIlFmnkBzuBf0oQ==
X-Received: by 2002:a05:6402:208a:b0:5a1:6c50:a35 with SMTP id 4fb4d7f45d1cf-5bbb2411412mr1631283a12.37.1723126278581;
        Thu, 08 Aug 2024 07:11:18 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c29f79sm671761a12.33.2024.08.08.07.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:11:18 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:11:18 +0100
Subject: [PATCH v5 04/20] clk: imx: imx27: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v5-4-11cffef0634e@linaro.org>
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
 drivers/clk/imx/clk-imx27.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx27.c b/drivers/clk/imx/clk-imx27.c
index 99618ded0939..53018e80ca51 100644
--- a/drivers/clk/imx/clk-imx27.c
+++ b/drivers/clk/imx/clk-imx27.c
@@ -164,8 +164,6 @@ static void __init _mx27_clocks_init(unsigned long fref)
 
 	clk_prepare_enable(clk[IMX27_CLK_EMI_AHB_GATE]);
 
-	imx_register_uart_clocks();
-
 	imx_print_silicon_rev("i.MX27", mx27_revision());
 }
 

-- 
2.46.0.rc2.264.g509ed76dc8-goog

