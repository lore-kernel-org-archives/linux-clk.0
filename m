Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9A718FC8D
	for <linux-clk@vger.kernel.org>; Thu,  8 Aug 2024 14:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128182; cv=none; b=fp3+Ect6TPvo9IBFhNDZhKmbuf3nskKJT0xMaZsqQbtR6jAu2TzfMCVDqqdnI9SIAUBq6LZbb1UIpF4L+hQ05qmN1VPLYhmdYtY+ELVG3B8aE6ClbN94+Pg5mQOni+v04SHkpnwNcUzBzYcgkbcN/pyaTTEF5I3xHAeqz+tVg7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128182; c=relaxed/simple;
	bh=n+1hhj763mEFqV1dem2n36RFOjE3WvEU7qjocs6Feh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AjK1Kns6TZwoeoqY7xbeED85lhCNQcHDN4j8UmWk/PD4I4Br2Iu4m9Ntkp0RmVYbWel8q+q7+ZhxUZ6vQTv7a3Pp14PGHnEX8anMutXbq58PeUb8mEIUeLsoKjUE0jgK6CZn6zfOsUypA6DJbASynlXSvhB+0sgwkUMuaNQV1O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TWrA+3qw; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TWrA+3qw"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a7a9a369055so106385766b.3
        for <linux-clk@vger.kernel.org>; Thu, 08 Aug 2024 07:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723128177; x=1723732977; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lpweh87gijIIJF4cQA1mk27Giq5WUQNyR9nG1a9dx7o=;
        b=TWrA+3qwdFNB3y7+JZtZB15xK4EE9u5AQFyS2KP0Qfy3WMzL3VNGty5YJJ/pKPq6gq
         tDUBYSzY9jECxD6qPlmvSXz115zSsU2aGwJE0YIXSsbYo1m71HR+lm6xvmqMXP/BGEwp
         HK6ROv9XFwg8Hmww97yKnTryBhICc5yQGK3F3mshRq+DsXuVH0IvrnXBAvJYSntA5cOQ
         wmQOgj+/vOpJgUMdTv1WwcpDabT/TuIXEYWhuRyxpeoOhavHmAdCbnI1BmSqUWxYtTaN
         pmozGuMBa5XnzHhnrGK+oi/8KayxGEgh/PNqQAbLEd1zZWOxL3OhmybPZbj/C6pXxNJm
         rh7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128177; x=1723732977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lpweh87gijIIJF4cQA1mk27Giq5WUQNyR9nG1a9dx7o=;
        b=XwXfNseTlZnB8bXUtPSveh2fpliCqNCGbcSEzxVWRdhngZQt1RYt8sroRV4Vb9zAhX
         uKqjGusJnll3PfvGF+CsDqoNtIBi2Rw1Q6bvVkb9XtTY2K6LZoGOiwZ9d0h/3gjnyS7V
         IaYxASVmPGVpzHg8Hu3HiVgF0H9f2L2fj+IBjbwynYcWbCiY+3KCez4avMIxEB1RoG8V
         k3/BxRwdVy97ikhUoTgzueII+yLTzDXcz9TwiGjRaO0TiLCi8/abIJdms3vJWnhy+Ez8
         qaDprAkC81Wusp0ZZDBKCteRxw3BmR8hcjlHheK/pNDgueR6E1kf4yt5W8BhLiMvo8Ko
         ODog==
X-Forwarded-Encrypted: i=1; AJvYcCWO7LkrkWViV/AskSL8Fr+BcvOGHKA868VXAFwyPLlVkXbvfMpp18RXtIx1XfgNrtL80Hwr3YOGraAMF/m+3whzAF+6DqNxKn/x
X-Gm-Message-State: AOJu0YyZ2Yc2BLjTrMPoTbX4rwB5MC05+HOzTZ9zdQbadriRmSM+SBrn
	6aDoj5vOxWL6YVArPche0Jfg53CTYHzqZzE6kmK6B8jEO4gChUv7mRvRGTvTb7c=
X-Google-Smtp-Source: AGHT+IEwPmF6AHiigxgHBV+EJFuVs6w3OGWE4wzZqmI7eDvxo4EYmmOjzDlsuV9hWRsxZBFpbrUimg==
X-Received: by 2002:a17:907:d59a:b0:a7a:c812:36c8 with SMTP id a640c23a62f3a-a8090c6b841mr159287966b.18.1723128177139;
        Thu, 08 Aug 2024 07:42:57 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e04sm759298966b.175.2024.08.08.07.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:42:56 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:43:00 +0100
Subject: [PATCH v6 19/20] clk: imx: imx93: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v6-19-e91c537acedc@linaro.org>
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
 drivers/clk/imx/clk-imx93.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx93.c b/drivers/clk/imx/clk-imx93.c
index c6a9bc8ecc1f..9b8006b15d0c 100644
--- a/drivers/clk/imx/clk-imx93.c
+++ b/drivers/clk/imx/clk-imx93.c
@@ -343,8 +343,6 @@ static int imx93_clocks_probe(struct platform_device *pdev)
 		goto unregister_hws;
 	}
 
-	imx_register_uart_clocks();
-
 	return 0;
 
 unregister_hws:

-- 
2.46.0.rc2.264.g509ed76dc8-goog

