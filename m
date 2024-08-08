Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFACB18FC85
	for <linux-clk@vger.kernel.org>; Thu,  8 Aug 2024 14:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128178; cv=none; b=dfj+XFf1AOGP+KixzK8Wjmnp6Zg9szIyR/qUP/jnh1kKLna3ntN+ZxUBm4JZ4SZc8OtDrC+CeFK8MBZaMSRHoRl092G3Tevl7z1cOW0MYSP9oiqSgPPXcpbHyFMXMqpNfBVnPaZRiqDusTNDDXKKhEowzY/okfWfZPznVryfWI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128178; c=relaxed/simple;
	bh=RCzb4T7ygPujxOgSIHXjGoBW3H5sHyUhE9zlzlMY0qY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cYiQh5vK43gylcj4F/eSppFGYXz/b0rv2FDkh4/Xd9N8y18K7kxqgxwtLCoJHOmEbfaFR2ft8evhLXdUnW06uFTYGTyxUUZBGMPYGOG5PnU2ylW09+qsEzYHbLZS0oZfItedbORIv0TvydHXL+UyAO6pM1id33DBjBtDfWVKW3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kHnoyFNO; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kHnoyFNO"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5b8c2a611adso1401709a12.1
        for <linux-clk@vger.kernel.org>; Thu, 08 Aug 2024 07:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723128174; x=1723732974; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fELKcjyo4D+4io09ckq4Quxisz8/UoBpXMhoRi06ZaU=;
        b=kHnoyFNODF7gfI7Pdqy0W+LSMM6Vqz1TV569hl/m9I0uONtdqH/F9Tl9zniajqj4Oo
         nDaOBZYVeB+mBvqDD1z87V30l/W7wN6LXpTj4SbBTUDCArodXSSDjmRRmX+OweAy5dx5
         zbWj+Dv/PNoIeeO+Rom53w8IH2Ojt+wiOZUPy1jrnjarZ9GlKUCuTbQTauqBqqgfaxho
         XJyjGUdH0984R9tr+92dnQoDScLEo5Z6qRAtuJy6Rkblc7LLdP9mZ9O28DCVnMhR51D+
         ZL57p5hEUmpc88L231H0y6MI8OmGT9c4Mn3brphvGcHM6BQdtuH6xgyBDSpE3YPkupEL
         /o2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128174; x=1723732974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fELKcjyo4D+4io09ckq4Quxisz8/UoBpXMhoRi06ZaU=;
        b=J8vAh6pJ5EZ/RcSyJQgGCeK15NbZ3YzvtOlXvgeea2cj9ujuudwN8DBnT0a1wvfy4C
         h0Evu+4wKSeLbR1zGlQdc1NHy5OSp+dixS4AR3Xazn4a0SkZDV4D/FTHi25ox6TZVE7l
         bBRX9zuznNfd6Pb/CfZThGELuELb/8vXmbVpp1oYyiWlescp4ahg25a4g9rxWs1p+dDI
         z0IHHgCc0ctooQFbqMU5xTBHOJCfE4KPD71KinA9gwHyPt4RZRsWWwHXY6DK7xWrNY3u
         8cpB3nJUsHHNidgECTa254xhmU63sbLonGJbP6nfVXnO3CEYt8/2s62QZA9xoFp3xjs5
         M63g==
X-Forwarded-Encrypted: i=1; AJvYcCU47bhektHEZvqCC+eMe31PxTkDqj5eJh7ZSjPpDWq3jhcu4LIzjDUtPT+wGrjQZr6lAJbdJT/Oj5o+nfpbc/6ByM0d1TfAyhPX
X-Gm-Message-State: AOJu0YwJG7INWlbu86oBx9tIJFt8PyA1h5jBCIQHLssGDLDtWYQBR8ww
	Mj4lIJzVMeell32U55nHIF1O/6jJLog+NLb/yFKLU/9o7kLFP3xaRIYPs7WMTfk=
X-Google-Smtp-Source: AGHT+IEdiR2uqxL40ypq1eVBsdbq009S5HpqMJsLtiHNMyRcup08bUljMUs/bT8PIRSRi7Q4xYViWw==
X-Received: by 2002:a17:907:97cc:b0:a7a:b9dd:775f with SMTP id a640c23a62f3a-a8090e3cf84mr182258966b.55.1723128173566;
        Thu, 08 Aug 2024 07:42:53 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e04sm759298966b.175.2024.08.08.07.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:42:52 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:42:52 +0100
Subject: [PATCH v6 11/20] clk: imx: imx6ul: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v6-11-e91c537acedc@linaro.org>
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
 drivers/clk/imx/clk-imx6ul.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx6ul.c b/drivers/clk/imx/clk-imx6ul.c
index 05c7a82b751f..b828cecd3690 100644
--- a/drivers/clk/imx/clk-imx6ul.c
+++ b/drivers/clk/imx/clk-imx6ul.c
@@ -544,8 +544,6 @@ static void __init imx6ul_clocks_init(struct device_node *ccm_node)
 
 	clk_set_parent(hws[IMX6UL_CLK_ENET1_REF_SEL]->clk, hws[IMX6UL_CLK_ENET1_REF_125M]->clk);
 	clk_set_parent(hws[IMX6UL_CLK_ENET2_REF_SEL]->clk, hws[IMX6UL_CLK_ENET2_REF_125M]->clk);
-
-	imx_register_uart_clocks();
 }
 
 CLK_OF_DECLARE(imx6ul, "fsl,imx6ul-ccm", imx6ul_clocks_init);

-- 
2.46.0.rc2.264.g509ed76dc8-goog

