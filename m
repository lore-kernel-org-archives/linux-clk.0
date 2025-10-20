Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB562C234C
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 17:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760982667; cv=none; b=NG8Wy+7cF+N4T/twiuoiInhqNDJI9IMsJ/PcVKuKi3BwMVPw13QpSMO7r4NHsa3ATNaDgeNSQTRFmX9mbN/NikY0QCa6MktatrmAbhgzwga7kv6SDMc5DDfKM1WFczNHk7fV+Ms5L5Kyw97n2HOkbmVqZT34ZnCXnW/+0c63jCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760982667; c=relaxed/simple;
	bh=KnROEUass2/iW7GccrgtsymOuPjezhPd1bODirEEn90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O+SWXcaM9ujknmeRTJmPucV+MwiVvjGUZ/aUzPZku12phJOCa+YyfM9NT7ME2qoUJ6kYCpEhdIPw8shlEygiEQmIBR+ydAN/RKHfrSUkAEefwJ5ckND3DAuFhvsCDiOuZe8Xr+EB/nzoOMi86OLWjIlNJDNSdE7n8kDOcRlyKuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHnKcaCj; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHnKcaCj"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4711b95226dso34001795e9.0
        for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 10:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760982663; x=1761587463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qTAyakvLktp/e+AMviKRZMNRnJVDyQcT2DmQsBGK+VQ=;
        b=QHnKcaCjU0WebKUcgcp4j7RfJC5Q2hKxoZT175iVG+DfcNz/54MEdToww4BnqFEl7Y
         yO4CNntkhsesJavFFqv88klF/b/CkJwiyP0Niw9w9SrcLkE2P3EknphU0e8+0kNsxeHS
         EtP7XsqGmbh5yxNqo9ZPIbvyATw03pwhp1WIP1Yxf/xVAk1cI3uL7D9XVF6mTM4CvPgZ
         DXLQyzjwanDG3XpxfavNK921mxAFIwSCNavEa/tBv/uMSSTtcSEyuoDga+SzluC5GAXo
         YMpHVxPvZ8daki6wx/F6Ll39sJFR+HApA0NLGMQOW/swdTCaZaldiYDse5P+5YPbrqfE
         Refw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760982663; x=1761587463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTAyakvLktp/e+AMviKRZMNRnJVDyQcT2DmQsBGK+VQ=;
        b=qB5SSWtu6Sxd53AOkRcBu3IWfWX8Arkh8RCquQOZLVt2hsKh7MM+tvVYBOrCrn7mkN
         eg/c59Ecg+4gUUvUX9q0BeehYU3IuZlwCfWEjgdLY1PU1fSAPHqWwigNdpNNs1zMDRBU
         L/IuxpUvzfRUk5dpTc+r7c3bTd/6Q/ammtBrOhe31eJfoxPiaIdbyTAjI5hrGU9o5Yd1
         NioV/DVqzUwtVwvMJ7Zjr3bkX1HG74oJSNalYecTwkZq3ImTTiYzis93NqI9iC9A68iV
         RBVaDSax43iJd5uAb+aKLiqopO1FJZl90ImSD6GZfQjAytZ7VMotTnQQKTGpN7fSQFAO
         o1Zw==
X-Forwarded-Encrypted: i=1; AJvYcCW91PueV2h2M9zT2KKSk2AVJIU7JpdwCdUlSrOMjNJgmd3j/sHwVgwAmDUWxjq2YTr0UagAvyKf/kA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7mZRzx3mWfPHyjvC4Ail0tCRbfiH8BbRMr29qNgDkQZwr4GoD
	sgAPfoluXcWSv8egzz/OvJHcB6iI9qIznAFe/hZpTFCl1F4dQmTZfbEH
X-Gm-Gg: ASbGnctMf8fZg8oGT7OSq/uvsvw+IHJSIphc1L9Z0nyFSUkqA3OELaRpVIh3LhMmYJI
	LIS7JA/LxXf1U7dEAmuAIXdCj8znuTTCTNRfhBu4Ykn+4TdQRL9yl+3kycBDJmNzcQQishkSCH/
	HugEP77YtMKKeVqbNvk3V/N3h1X7hm6Am++xDnVaWwYkwykFe8GSw/lyyl1ZQenK5HHA0D9DBAp
	fog46u4h9FuRWw8vNaoqQs0/IgaBTd7d3PBApka7XQtj6VNewptc+X0urS3qewj30z5zBPtY3Gj
	Q2kzk60S07BQAO9aWO29WYyb5MLfXiWfexDmeR6WvbIN5hSrP8nwSIa5Y0io0S4YTOLCN5N7rZK
	NT14O0AljuQnKQ4hkqpTmc1DzSqZqM0m9doRwBy9Uqqz3n73jqgKBDXWYkg4mOsu8UDxqUPLVeH
	7Iwig0MKjoPj9Un4haZiSSTFwsDUHt34/S4cwWpCRTP2YakSLNSGu5V6MrnpBvWbttdp+YbU6mt
	5XJpho=
X-Google-Smtp-Source: AGHT+IEf+pLydZZJlPsNS9klI6Ppz7HfqYBrVGwlK2LGcq8ett6vc+FT1k0DRHTRyZXn1XwlZQ3W5w==
X-Received: by 2002:a05:600c:444d:b0:46e:4cd3:7d54 with SMTP id 5b1f17b1804b1-471178b124amr91678925e9.18.1760982662640;
        Mon, 20 Oct 2025 10:51:02 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4715257d8b2sm187794005e9.3.2025.10.20.10.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 10:51:02 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Mark Brown <broonie@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-sound@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 05/11] clk: sunxi-ng: sun55i-a523-r-ccu: Mark bus-r-dma as
 critical
Date: Mon, 20 Oct 2025 19:51:00 +0200
Message-ID: <3374980.aeNJFYEL58@jernej-laptop>
In-Reply-To: <20251020171059.2786070-6-wens@kernel.org>
References:
 <20251020171059.2786070-1-wens@kernel.org>
 <20251020171059.2786070-6-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 20. oktober 2025 ob 19:10:51 Srednjeevropski poletni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> The "bus-r-dma" clock in the A523's PRCM clock controller is also
> referred to as "DMA_CLKEN_SW" or "DMA ADB400 gating". It is unclear how
> this ties into the DMA controller MBUS clock gate; however if the clock
> is not enabled, the DMA controller in the MCU block will fail to access
> DRAM, even failing to retrieve the DMA descriptors.
>=20
> Mark this clock as critical. This sort of mirrors what is done for the
> main DMA controller's MBUS clock, which has a separate toggle that is
> currently left out of the main clock controller driver.
>=20
> Fixes: 8cea339cfb81 ("clk: sunxi-ng: add support for the A523/T527 PRCM C=
CU")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c b/drivers/clk/sunxi=
=2Dng/ccu-sun55i-a523-r.c
> index 70ce0ca0cb7d..fdcdcccd0939 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
> @@ -121,7 +121,7 @@ static SUNXI_CCU_GATE_HW(bus_r_ir_rx_clk, "bus-r-ir-r=
x",
>  			 &r_apb0_clk.common.hw, 0x1cc, BIT(0), 0);
> =20
>  static SUNXI_CCU_GATE_HW(bus_r_dma_clk, "bus-r-dma",
> -			 &r_apb0_clk.common.hw, 0x1dc, BIT(0), 0);
> +			 &r_apb0_clk.common.hw, 0x1dc, BIT(0), CLK_IS_CRITICAL);
>  static SUNXI_CCU_GATE_HW(bus_r_rtc_clk, "bus-r-rtc",
>  			 &r_apb0_clk.common.hw, 0x20c, BIT(0), 0);
>  static SUNXI_CCU_GATE_HW(bus_r_cpucfg_clk, "bus-r-cpucfg",
>=20




