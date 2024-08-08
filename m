Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B1219004F
	for <linux-clk@vger.kernel.org>; Thu,  8 Aug 2024 14:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128180; cv=none; b=o8iPqY5GxmykM4durQS2/7e8ngUuGI/GFoKRUsPd326GzS9H3D8J7j3ifW5HD8xA2tlSs0fcAl9Ojv8WhLv7Mj6ET1qBcjHJwLH7n9C/ZwOxsQQAbks8WNYdVEMVbFAne/Ita8Is6O6ABoFY2343PcQEiYf61AtmeI8fpBlAVwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128180; c=relaxed/simple;
	bh=e8jx8xmkdW6YnrISThEmwGeUauedgdSxxNVyoc0/+CE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dlgRI2bPVH8yWyIisXBktXOtSR6+QbBDQSH9TIMIVDGHYz3zEHZyvvq6aeecHwboi2fkufedtWB8kynxEChq/G4eKtnpfymV2ivdLF+n9iTPJwJO2yBmRsfiP9kvKD3ZiUduvAyFZF62aJ9QbM4Ent/RW7p7SQCkOY6UvXI1Eg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FUTK5G3D; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FUTK5G3D"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5a108354819so1383577a12.0
        for <linux-clk@vger.kernel.org>; Thu, 08 Aug 2024 07:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723128175; x=1723732975; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c1BcegJWI56BA/X7kHTU13cyTVS8Z7HSnW1uFBI1IcY=;
        b=FUTK5G3D5244foWSmIIoswonTq5GTDLn1JZS226/QDy0pMKAB9Ixl3ghbQAPlQE2rW
         VKGVfkwaM4aSV77HHRzCXYWUlCsMjBc9UpeFZptmRNfYmV5ilYlphDMy+TvsuqebMUEX
         +TM8p5EibHX/7FGfmV0z5WrRUN48TA0dlk1ZyR+RtdbndMVmDaprn/87Mwn+KI+ewavC
         hL+I3WB3uvJLehn/eBJpILT9fJ26Wh5q6V5DsU52wL2uIEuT48UiwFNQL0Xn3Lw18K2z
         p1Zen3+BmUUbmhSWVVW8QKQznZ817QGF344B8t1+yXOfChvcg13RE7oxypyK321VaHvw
         77NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128175; x=1723732975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c1BcegJWI56BA/X7kHTU13cyTVS8Z7HSnW1uFBI1IcY=;
        b=qQ8HbU+eq2zQpYXL4VmCo1pMCm9WehF+NV/5BwSFeVCAnDvjF0Lrl+y2yyXxqgKHhm
         UA/AUs4yU9S454nizYU6Ct9zfY7HX5WFnhUH290EaVeYbSkS4KA8Djjdpfr3KygU/RLY
         yRy+090C0j7OxbsEOiUEl5w3ttDiKsVWotK9PuZhlQPx8azT4FQzs76ecxOU+HP7Kduo
         lrBBnnvjaU50Vpu2zxwystHoLVuek+36WOkyNl8uAZvNa+K5crGf+OQW9zts7d4ZXV1U
         n/F+K1iWzr4xJAS/GXxLyFW7HR0A95GuqdfhB7EY0LGJL1sISXiZr5jbNL9l+CGR8vfJ
         3g9w==
X-Forwarded-Encrypted: i=1; AJvYcCW6H3Cf+g2a7TvVlDCZfw60VzFJ4L3F+nw45pgVINCexjwPtjeluhIZy/utkPWrS9Yf/a1yRJ7okcPbvfblTKlxaIe6rrybr1yt
X-Gm-Message-State: AOJu0YxPJBzY8ToSzmgfHohSRFomXIHmjYywfMTZIe+oj58jt6ktzsot
	fmeEzUBUXJqbZZfIhmCb1t+INT34yVXsReT+S9eKSkg9x3YLtA/FXBXeIMgtV28=
X-Google-Smtp-Source: AGHT+IGEjPZ6D3mw9uu41eGOe1/9dd+KO47dw+ehD6I1DSyq5FPAseWCyaO5gOFwMq0QnQVKVDCluA==
X-Received: by 2002:a17:907:72d4:b0:a72:750d:ab08 with SMTP id a640c23a62f3a-a8090c32551mr185430666b.14.1723128175435;
        Thu, 08 Aug 2024 07:42:55 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e04sm759298966b.175.2024.08.08.07.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:42:55 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:42:56 +0100
Subject: [PATCH v6 15/20] clk: imx: imx8mn: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v6-15-e91c537acedc@linaro.org>
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

