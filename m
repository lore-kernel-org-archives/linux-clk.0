Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A027118F2C0
	for <linux-clk@vger.kernel.org>; Thu,  8 Aug 2024 14:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128182; cv=none; b=l78E+5Pi1hEiXw1sYsR9o+nP9zHfmolglOOBLYJvsQot8kWY0GfMUFFus9No9dS3G874bTeZb3Jf/w10ooDRZlha6URx1YyJv//GInCGMW5XodJ+RRxTBcZl6wTJ7AKCjDj/LX5q/Jm3b2dX2GVh9lFRjTcFmNHKOh2372Iy+Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128182; c=relaxed/simple;
	bh=nXzI2w3ThoiSRcRj8fOXuTW+n6yOdH+9/0PqUvo2i28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NB2jlvbXXbrROJq4QoKsymCQSRlv4wwiN0z1OGbBmFsR5eEo/atms6lTE4bnuFSdCwugbfMxmfUr7WmjkC4ANLSq4ADPEDsMNs0A9yYrTkHTC8qBLoeR/RyjMfVPE7sAKzqQebjlVVmeqqGo8oHmjZn3bW0LLG32CDQcd1M/4Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hv2lfC8G; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hv2lfC8G"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5af6a1afa63so1183359a12.0
        for <linux-clk@vger.kernel.org>; Thu, 08 Aug 2024 07:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723128178; x=1723732978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g4eCyKnwzwhvgvotyhGHB+vsH3GCQ4YaY3HQS5YaZiA=;
        b=hv2lfC8GPDvHKbCqcIwGJEJojnr8ll21jubKjS+FIjcE08d7VoI8t3+rPF3VhYuM1C
         YtlXejnCFiIB+sT1fs/jaJkkJ/OtbV6iiZxCR95HKG3ZCefKEa3QOd0hGJEQ/1V6Ud/v
         S8zIU8lW6B7Nt57vTOEGfvD1DrCA2gIjjhdDwztuYjZYEH7IQeWZu4IZJ17kERMxQvf9
         rlnUuxcOREEg/ZFukOLRFo07LWgNZChWk2aWvBUd6hFH/paFbcowt8YzmUz/qTTjRn9J
         LqehT7fryJ7B8eXZtEces9cgXxCcaimh/OcnSMdXuC3m5EE6R2zMB2We9FYfKh2kZqNR
         wFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128178; x=1723732978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g4eCyKnwzwhvgvotyhGHB+vsH3GCQ4YaY3HQS5YaZiA=;
        b=swxuEu/OB5JuPSnvSC8ocxc/iMklNSuiTmMXM+yz3nJTMQ56xjrLdfg1eB5HxvuRFF
         BSwXvrECfC6yzdnP6llVj4cetiWCQsDANsCTeHolXwoSHna92iHbRTB7zjLesbIawSmD
         1wt6/8DAjPYN6VLQvRXo3kv/qiCaM4LKYzSzzzB+eN9WvdCKt+yAy/oVxiQ1OZP2l7Z0
         Y00aR8eQidDZc9c92cNeAB/2P9Z7vwCMDJNK9SLPX94ReawnX8xEx/XBykuMRoGq9NsI
         zf3/TS9fWqesBr0X0Re71fDDA5xVLUN16P0t2f8DeuOPEFr1+I7KemsS5Wu6mGkjzSJl
         wUPA==
X-Forwarded-Encrypted: i=1; AJvYcCW+HDc31MyuT5Ulu7e1+2A9oA4Dwp7Q7EhqZiVPfohaLgUKTCXYfRWuI7XFUGrWtXzpgGUaEisuhC2194FSEYeuxxsN+LzlCTLQ
X-Gm-Message-State: AOJu0YxClku1U5xMOysbEqqihaWCLAn5eJtgiwLP/876jrLpRp4mj6T4
	hfe8/Rr09zM2xXMfQCupZGMh5y4pMhf0aar6gSPDW6M8uRwJcQJ2uHTpz7Qg72o=
X-Google-Smtp-Source: AGHT+IHqbohN5vuse2tZu05wgsB0D/3481cW3wuuO9L9OkxukplhEORcbJpoFFUAYLw6KR5UnB87lg==
X-Received: by 2002:a17:907:da6:b0:a7a:c106:3640 with SMTP id a640c23a62f3a-a8090eff092mr152706366b.66.1723128177570;
        Thu, 08 Aug 2024 07:42:57 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e04sm759298966b.175.2024.08.08.07.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:42:57 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:43:01 +0100
Subject: [PATCH v6 20/20] clk: imx: drop imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v6-20-e91c537acedc@linaro.org>
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

There are no users of this anymore in the tree and the clk core
implements something similar now, we can remove
imx_register_uart_clocks().

Do so.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/imx/clk.c | 72 ---------------------------------------------------
 drivers/clk/imx/clk.h |  7 -----
 2 files changed, 79 deletions(-)

diff --git a/drivers/clk/imx/clk.c b/drivers/clk/imx/clk.c
index df83bd939492..5f998e56a4ed 100644
--- a/drivers/clk/imx/clk.c
+++ b/drivers/clk/imx/clk.c
@@ -154,77 +154,5 @@ void imx_cscmr1_fixup(u32 *val)
 	return;
 }
 
-#ifndef MODULE
-
-static bool imx_keep_uart_clocks;
-static int imx_enabled_uart_clocks;
-static struct clk **imx_uart_clocks;
-
-static int __init imx_keep_uart_clocks_param(char *str)
-{
-	imx_keep_uart_clocks = 1;
-
-	return 0;
-}
-__setup_param("earlycon", imx_keep_uart_earlycon,
-	      imx_keep_uart_clocks_param, 0);
-__setup_param("earlyprintk", imx_keep_uart_earlyprintk,
-	      imx_keep_uart_clocks_param, 0);
-
-void imx_register_uart_clocks(void)
-{
-	unsigned int num __maybe_unused;
-
-	imx_enabled_uart_clocks = 0;
-
-/* i.MX boards use device trees now.  For build tests without CONFIG_OF, do nothing */
-#ifdef CONFIG_OF
-	if (imx_keep_uart_clocks) {
-		int i;
-
-		num = of_clk_get_parent_count(of_stdout);
-		if (!num)
-			return;
-
-		if (!of_stdout)
-			return;
-
-		imx_uart_clocks = kcalloc(num, sizeof(struct clk *), GFP_KERNEL);
-		if (!imx_uart_clocks)
-			return;
-
-		for (i = 0; i < num; i++) {
-			imx_uart_clocks[imx_enabled_uart_clocks] = of_clk_get(of_stdout, i);
-
-			/* Stop if there are no more of_stdout references */
-			if (IS_ERR(imx_uart_clocks[imx_enabled_uart_clocks]))
-				return;
-
-			/* Only enable the clock if it's not NULL */
-			if (imx_uart_clocks[imx_enabled_uart_clocks])
-				clk_prepare_enable(imx_uart_clocks[imx_enabled_uart_clocks++]);
-		}
-	}
-#endif
-}
-
-static int __init imx_clk_disable_uart(void)
-{
-	if (imx_keep_uart_clocks && imx_enabled_uart_clocks) {
-		int i;
-
-		for (i = 0; i < imx_enabled_uart_clocks; i++) {
-			clk_disable_unprepare(imx_uart_clocks[i]);
-			clk_put(imx_uart_clocks[i]);
-		}
-	}
-
-	kfree(imx_uart_clocks);
-
-	return 0;
-}
-late_initcall_sync(imx_clk_disable_uart);
-#endif
-
 MODULE_DESCRIPTION("Common clock support for NXP i.MX SoC family");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index aa5202f284f3..314730f848f7 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -11,13 +11,6 @@ extern bool mcore_booted;
 
 void imx_check_clocks(struct clk *clks[], unsigned int count);
 void imx_check_clk_hws(struct clk_hw *clks[], unsigned int count);
-#ifndef MODULE
-void imx_register_uart_clocks(void);
-#else
-static inline void imx_register_uart_clocks(void)
-{
-}
-#endif
 void imx_mmdc_mask_handshake(void __iomem *ccm_base, unsigned int chn);
 void imx_unregister_hw_clocks(struct clk_hw *hws[], unsigned int count);
 

-- 
2.46.0.rc2.264.g509ed76dc8-goog

