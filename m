Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDD518FDAC
	for <linux-clk@vger.kernel.org>; Thu,  8 Aug 2024 14:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128181; cv=none; b=JCtzVG40gtJNoLJNZbMBrDNNIswDX+IhG+ZBi3cy3mT15ZjOAH2WwVLubqf4sD0S9Cmuw7ic23qgvvLmZ+7DMhT0oKNkaevt8qHzPwJCDkXhsVWVnXr2ivR6GJIBS/DmvrIxibulzD5aVP3aLuoSWrJIfsCYgcZVQLrjqQqVYFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128181; c=relaxed/simple;
	bh=dtBXWxh6pEv7DtMPsjNa6bKadgnceb0rxD2xntEHe8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b5bOv9S7LRmnMn7flJITyITte7NewzU+pbkuG12gM6Nny3FbNAwT0SkwzWdOiAbNxjwQ3HC0L/z/q9gGVZuuwTnwwozvqQuvQOZlVDMAo8+tCOV37HXzJa1/XHvZrU9Af3g0QqNQjCoP150+pfYZBDeMfKIAJQZ7z7sOjirnsVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xS/BSQ4x; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xS/BSQ4x"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a7ac449a0e6so105360666b.1
        for <linux-clk@vger.kernel.org>; Thu, 08 Aug 2024 07:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723128175; x=1723732975; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=645sqhYxiGhlKPfMQkDqwsuRcG9BMBI/0rO4pG2w9xI=;
        b=xS/BSQ4xTvxPagThXnGdCwTw8sdDHRM6SPm7Y8ZvflVVAuLwl9Iecqi4mWQLuuUdhM
         kOlW70W5bLXwvupxF+spl9gfAIJrWKwa1061rp10XAMje+DfcbgNpehsUcGs+AaG7Am9
         JFumh7oXDytZSMz5pleNYrIebthfOiYd5nWvWIS92HeTISJKVAbhMYX3zAPalpOLKlQK
         +ZWsLf7xPqGl1frgHnb366j7lHC/Mhn60C62O1NlM8HOr1SeXkHrSFSQBmiEvjZwg9NV
         MIBmhVcaQwwQJGtVVtvAvqOyDo+vE1DhosEwb+cd1hQqSdAXBeCbDA/2sOrALHHnVI4Q
         cyHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128175; x=1723732975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=645sqhYxiGhlKPfMQkDqwsuRcG9BMBI/0rO4pG2w9xI=;
        b=QrcjScKXtNWsGzdIfS/l8Zn9nRZ/eWOMBNKn+d+jNRt1abhK4T8b4QraOeXjfpdMPy
         QrU/yd7mUOC3uSIlf3o2tDvtioQEjNMS6NoHk7tXZREdCmPi4F91+FourL7fhNSIlfaZ
         t+vA85KsgGJ3azH/nRHMrFiVohs81G+VrYla5iHkGamJxssIgC3fZE4IdhIspl7VOoMd
         SuppeizOxG0CMEM3DToo22mYXX+xKfol2ivQcO2B7m5lr3gn7QTu5635ID2PHojyj9/4
         ctm0yISIsm8FMPtLwV5OcZ0fwoVg+Ah9riZdZSOXqpC5rRmoyEa2XGB4dA3iDkZUjASV
         gxwg==
X-Forwarded-Encrypted: i=1; AJvYcCWruqFNPCMCibSMbBpIRnWFYix0Wx29cf3M/z+ns9Bx2f/BJTUCpjZELftxiwKG083IZXr19elg8eE8sfr1tAdUK5rxqhyE/JOV
X-Gm-Message-State: AOJu0YzL4HLIAkx1BXDJWXqFZWiXDLjUr6MRCU8KwqmvN+P/YRUVcD0k
	PdhYD+VO8EP6DbxNlQqsPbRGon+K9+UvWAlyZmX7nnUhiSRjMzQSTr/LHo8JQrk=
X-Google-Smtp-Source: AGHT+IHmAxlBw4O2VUn/A8heI+wfeEh/p3nxcqvtlZJmde0nHyNMStnoDpAJEr+6mWLx5is/WLQ66A==
X-Received: by 2002:a17:907:e6e7:b0:a7d:3de1:4ab2 with SMTP id a640c23a62f3a-a8090c829ecmr157391766b.27.1723128174551;
        Thu, 08 Aug 2024 07:42:54 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e04sm759298966b.175.2024.08.08.07.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:42:54 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:42:54 +0100
Subject: [PATCH v6 13/20] clk: imx: imx7ulp: drop calls to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v6-13-e91c537acedc@linaro.org>
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

