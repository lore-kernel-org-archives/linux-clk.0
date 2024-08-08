Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8977218E76D
	for <linux-clk@vger.kernel.org>; Thu,  8 Aug 2024 14:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723126289; cv=none; b=Q0kzp09mdloVNAntIVoIZZQlTVkstofICbeTy9K7oZhRQ9KyDKNq2PgM3in1+UiHA8Hj9NrZFDtH6J82vFSIwMBCVHB3V+x+0h9G/hqQqa8YxUqWUIFBwqlucg1kmjG2TMDrHMIPVHPImhbtZOl4Sx2dcUXENcEhHDqltUCrgRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723126289; c=relaxed/simple;
	bh=k4Mp7OQtKEMyYQQBprE0etTznHJ6XNdrfUzHCPYj4Ho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JmNOTXLmOj8WjmjLs93BrI38pTjvunVXZiEtVM4UZ+1ATVtUExBTh0OCN5EnBVsZHMX6W16uEafaSd7/NijX4ID3F8OQemMwkinipX6YYdoxf+GH8/M2CocGWaNW5k9WoTw91/pht/eS1WLmVNp8ka8fbJ4ULvHyO0EIDZ4mmZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GJHznm9A; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GJHznm9A"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ef248ab2aeso14492261fa.0
        for <linux-clk@vger.kernel.org>; Thu, 08 Aug 2024 07:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723126283; x=1723731083; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0sTSIJgqJzgG9ZOeXhaBq4KjYwR+dgEfjYLq292FpHw=;
        b=GJHznm9Axn/iOZ0m05nfL6sc3TbpETENt8+xCJUESqbK1uMFoL8jAC00nykhMir7f6
         HDgdtF19/cA8qKODF7/LH7ModEEFat7oNsIyLQU1i5wqQdir/genuwI+fHEyOvXEGzVs
         p1vplAt4en1iUlfmqiirW+UQVZDFS4RZTH7HzEh3lUw+q7UCTvYwUtPC19t8zQGACD1/
         k32gBfx5vl5c6A8Fksmnr+jYb9bg7Y14pzG3dlR9kEKVfq995LTX1HMmnPJ7sSyKZlLn
         n5lULooe5lstINMcVtNAaIYdk4n9eTX9mDR841vd7kEZm38SXXCmnqbz5ozQUq8J+9Va
         8d4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723126283; x=1723731083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0sTSIJgqJzgG9ZOeXhaBq4KjYwR+dgEfjYLq292FpHw=;
        b=Ke8FQHY2QpgPKLu+Gdgmarivf1wrP5JrhgMZ70B2ObW4/1r/5BaKjvJtSa6wGygCTs
         5VOr4K3+wN0Xjc/X/+vUPJFiBd0NPDjf/tI6nJ9lFMVBHBUSzYKdpx1puS5fhUR3YMEa
         GABGDgoNFQsDvGYUP2Wk2MRhcL9rD0d1ytBPWNhR4oog0+xmwTP96en8Kd0SYQMfv3cV
         NJyhkjlQHJOi675pyYXUk1j7Bdr69x9ZKlrxvhCWmkcGDDxNkmKjuDE/EUioELnnakmk
         vERPGpektb+01DfAKEgXq2bkWghqvQMzse+wQXrl2MHKkVyJovP3moWnyBkZ/yiB7uaH
         1KOg==
X-Forwarded-Encrypted: i=1; AJvYcCWBXyofXHZR17yc8brhOjgOjqZR2xaF5aoDQuuRWCaLbditH813TiCW2j8lC2B8Iit98oT2hGS7t5hFVwZ54ql/0oCeFsqlfrcQ
X-Gm-Message-State: AOJu0YwpnyqdAL2p5UpvHL6f+P7enQqZjwx8SeMzsvXN+XVZIzNMNN4h
	JqMswZiTDrBKeH3E2Z2IZgZYgBeQzCTNuaBhPYtfG6btPm5XMvGDYuuEFtBDaSr57DvVwDrUdG/
	cEXSBJA==
X-Google-Smtp-Source: AGHT+IHzmyDjmbmh70t+LjuxJmyPnQb27LIwTkOn9wZAu/HD3ECQGEFR0hg5M02+6uogp0kQV3XniQ==
X-Received: by 2002:a2e:9cd1:0:b0:2ef:2490:46f1 with SMTP id 38308e7fff4ca-2f19de394famr17881011fa.23.1723126282528;
        Thu, 08 Aug 2024 07:11:22 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c29f79sm671761a12.33.2024.08.08.07.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:11:22 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:11:26 +0100
Subject: [PATCH v5 12/20] clk: imx: imx7d: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v5-12-11cffef0634e@linaro.org>
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
 drivers/clk/imx/clk-imx7d.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx7d.c b/drivers/clk/imx/clk-imx7d.c
index 99adc55e3f5d..789cc3afd062 100644
--- a/drivers/clk/imx/clk-imx7d.c
+++ b/drivers/clk/imx/clk-imx7d.c
@@ -882,7 +882,5 @@ static void __init imx7d_clocks_init(struct device_node *ccm_node)
 	hws[IMX7D_USB1_MAIN_480M_CLK] = imx_clk_hw_fixed_factor("pll_usb1_main_clk", "osc", 20, 1);
 	hws[IMX7D_USB_MAIN_480M_CLK] = imx_clk_hw_fixed_factor("pll_usb_main_clk", "osc", 20, 1);
 
-	imx_register_uart_clocks();
-
 }
 CLK_OF_DECLARE(imx7d, "fsl,imx7d-ccm", imx7d_clocks_init);

-- 
2.46.0.rc2.264.g509ed76dc8-goog

