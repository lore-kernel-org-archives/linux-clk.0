Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE0918FC6A
	for <linux-clk@vger.kernel.org>; Thu,  8 Aug 2024 14:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723126290; cv=none; b=j+uoDoakwbJC7OBrdXFc9PblKZKVZ8G0TdwWkWsqGKflgGD2jeBHnHsO6fpmZjKNoptkH37gFWZev97vR+W4TBt/5aQ19qkUUPqsGDfVwCG7cpmslRiCefmcOL8+q+q4f8+ULgSxsnGMvb3vFfBl6VFZaW1x4gJcm52bKGDqifI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723126290; c=relaxed/simple;
	bh=fgoFdUktN0AC8jt3vFeTIBwCbSQYaBCYL6rp147Iyig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VnIT0qOIFf/dRheTe5dlhI+2mdwKuqXhJczdOw+OW9Nn4EpZ4aDgBbjilAGlo/ZOf+HSO1pn/Q3GQpkX2n/rsRjM8JPtu2ktp6hurojeBfV3PMafPz3uSTXrQwu+nXkMRbjun3+073gOI0Y6d/kDvEuhBTreHLHpfaucI55eCU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Irtz92pA; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Irtz92pA"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5a10835487fso1355145a12.1
        for <linux-clk@vger.kernel.org>; Thu, 08 Aug 2024 07:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723126284; x=1723731084; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Of9JwvhLlmcEUvlQcUj1kyU6mPikzafRwyTDPy8iQT8=;
        b=Irtz92pAANFSZ5V+MNmVaghtgvl9Ldqe8nsoP1YiH3RkcsTAwyyn0/EysHxIKYcXDN
         1+hPfh8IwOcU2BpITFQZ18fZ+7mXYGtLADG+fV4uCbwEBwod6Z+LKmFEYAh0uJ4bx7wB
         P1B1nscpekH4NlfmvXDsQ/eIh2Lxp9G2uluGRGn6U7/C29tL0rUAYEyx1qwc8b5PnWcd
         GsqutY1aLLO+DerqjW5SozEq0KVhjMMr9U6tvyzM7pIql7+HFYnuO0uht8NekigTr247
         jevv3Ex7PD1ZFtC4pLm1XBix9H3Gosx5T03LdoJQ2ZhL+iXeF38Pe621JCfbuq1V56aP
         mwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723126284; x=1723731084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Of9JwvhLlmcEUvlQcUj1kyU6mPikzafRwyTDPy8iQT8=;
        b=SxZgYuJARXo88SuXI0ixxZfi5zEovBbM0MM7f0dKAepgXGBOnkOGr2WsneFKIfraa5
         sgdw5I6Vv+Q51GIOUmgP1cvnr2qoP9+4rV3jYYeSSUKuGMCJnjymv5Ec8OIHk1/+jxGU
         E20CbNkopYgxZpbSxxoVidITtzDD+qqQaAG/8ZwqlA4y72ZI9/DtbSBGH3seHXWX1LOJ
         hap2gAZz7HkNVyikXgRALZF18s5RJhrjcfL5vbat6TV+HqnrFp95bYbSHhfYjAeuoK2k
         gFoRBF7rx6LzMgBgF4HZDEb4K+Y/66gCJAz2Mykqg+Cp97UiaIqMcb1mYg23iDfXbtLE
         SPCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUavKI1rxUBytqrDMLSgEY0Pk8zRZRGqQUjKLObozWXn62KFzcy0oyviBpl3NohCc46E0HS0WyCWIE5iUODvuaJ9TQOGk/UGJRv
X-Gm-Message-State: AOJu0YwNG0hXi80OaZDXe782IhwYl1Mx/HnI1w4TazEs7CHWr8MQh8AM
	dX9+zqwI+v6CRsPM+aRlucgRpgBCnY/+zDJD6PhMbMVDqIB+bckRkDv3NUrB7eNeWOQpdfpEENs
	RtWh5iw==
X-Google-Smtp-Source: AGHT+IFf3g/jYuJvYQwgVJBe8vCrF8fGufVkSyYm1tnaBSWaG5CaYQLX35KDxCAtiZcxjnLr0qD2Ng==
X-Received: by 2002:a05:6402:210f:b0:5a2:f154:95f4 with SMTP id 4fb4d7f45d1cf-5bbb21d08d1mr1734856a12.22.1723126284388;
        Thu, 08 Aug 2024 07:11:24 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c29f79sm671761a12.33.2024.08.08.07.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:11:24 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:11:30 +0100
Subject: [PATCH v5 16/20] clk: imx: imx8mp: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v5-16-11cffef0634e@linaro.org>
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
 drivers/clk/imx/clk-imx8mp.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index 516dbd170c8a..1c128c051199 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -721,8 +721,6 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	imx_register_uart_clocks();
-
 	return 0;
 }
 

-- 
2.46.0.rc2.264.g509ed76dc8-goog

