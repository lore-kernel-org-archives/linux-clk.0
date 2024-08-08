Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B460190472
	for <linux-clk@vger.kernel.org>; Thu,  8 Aug 2024 14:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128182; cv=none; b=lz0aOOd2jWxZF4EtKEoRO4jx+w0alOSbgIRpMo0+d8JvyyGuZwAMJYSeFGsUWIVIrvd46Zdy6gbYvYSYNiUBPKXmQp0yTvYhdq9mcfQXXvGIGrcrcPPBEJhWF2w0UscFmF0bUwdTG0gyj7utjx6960v2ey0DC0kBX7KcYyW+WC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128182; c=relaxed/simple;
	bh=IWr4xOLwFlcBBVMqbh/CeNYKnBYkZvyljj8xB0z/c08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S7fJAeigHKycxsvvgjEIULZjc5NgNrLygXpTu8zTlstFz8RAuHFQDSup0z6lD0tsAM70ggZlgAnXkkbElxRkgaBXFWuYuf19Kai3jIrP0PNPxrHiauKajab4h9K5Tp60seuh4rikNWLsma8/7vvEJUIic0uAXIVgzBBUWCZQ3AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WV2n8drj; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WV2n8drj"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5b5b67d0024so1207525a12.0
        for <linux-clk@vger.kernel.org>; Thu, 08 Aug 2024 07:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723128176; x=1723732976; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UhprNA5ngdnDDPt6+AGX+wASXbiO8LYK4hmScrmWYDY=;
        b=WV2n8drjrDy93mcLGnYvxa8qaA2jEKQWsq547a1vd8QtoprPZ3bslpqfmZDEr1bQ/e
         imHrI1VdaM4981Bq5WQGOTs/xaa96qUzUM2z4NF34fRE+NKbh36+TTDWAz+wiDBjiG3e
         sRptq0ptC9gTzGfIk62eL4ERwmfirkC4NddVAF/onaXyvlFR5y1F58HnSw+fzg7ghkrv
         /t0awBGju4aLhQzn4J3L+m08wurCfwHp++3icjEdL1MZkkpDTaKX26B/HexC/eX5cFH3
         9Q8s1fKv93xFIWPAsSvhXxIVZ0tnwnHbfIcpsraDmIJXE8xYmRcOGIuP9v+8CAE0NZPN
         g72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128176; x=1723732976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UhprNA5ngdnDDPt6+AGX+wASXbiO8LYK4hmScrmWYDY=;
        b=ZhjgtaaSyPE26EUTzagDBaCpIRgTFhO/uz4jKKQV6zkPDhxu1K9fF4RXSrvpIeExWx
         3f0I869sveYTCnkSI6ZgmXm4lAfP2C7i3nkI93MhQLGQRoF6d7qif9Q6FevJEkOwN7pz
         M+EZpusw/kHM13FbzMbaIpxsJR04LBmba0bXs4d+AS8pImfjAU7Onwf5i0avwbxaGXF0
         zFAArRoWX1r+le8WLNb1p5WO/RR9jaOt7yuX5dbfo2v1O8KLPOg5EzqP1PRSALy5eeIK
         wWwnZNe98WvuYK3szfq65S71wnKjfHAJoPCeM10l6KnC60pYlmO6OT0sPYx9qgnfo1lC
         bcuw==
X-Forwarded-Encrypted: i=1; AJvYcCWXY7s6DkwqtlnmVt0FCUAFoaIR+rUnH/KeTfKTu9VMM+5tNImWnOruRdL1cFt+yQuDQfQJXrQlpWSYGeBLWQaddkTvrfpA9KtI
X-Gm-Message-State: AOJu0Yz/UNaogSae7Dy9+C/WfI02/KvqkXdXqJPI0U1zzlmntK75Jjx9
	oFG9xoe/lEXtrdnRYhIRZPwMBhJu/5NUIQ2Mn7E/oxj73kOAUo9HYzUfcL9cmCg=
X-Google-Smtp-Source: AGHT+IGqiI0vglxKcqyNtx/0toY2g/EAxqDpRfsnT3HZrYPk9OUoo9cgt0W0M6U+BQ788mgVAuOhmA==
X-Received: by 2002:a17:907:f1dc:b0:a7a:9d70:82b9 with SMTP id a640c23a62f3a-a8090c826fcmr135586466b.17.1723128176276;
        Thu, 08 Aug 2024 07:42:56 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e04sm759298966b.175.2024.08.08.07.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:42:55 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:42:58 +0100
Subject: [PATCH v6 17/20] clk: imx: imx8mq: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v6-17-e91c537acedc@linaro.org>
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
 drivers/clk/imx/clk-imx8mq.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
index f70ed231b92d..db9aaec42800 100644
--- a/drivers/clk/imx/clk-imx8mq.c
+++ b/drivers/clk/imx/clk-imx8mq.c
@@ -604,8 +604,6 @@ static int imx8mq_clocks_probe(struct platform_device *pdev)
 		goto unregister_hws;
 	}
 
-	imx_register_uart_clocks();
-
 	return 0;
 
 unregister_hws:

-- 
2.46.0.rc2.264.g509ed76dc8-goog

