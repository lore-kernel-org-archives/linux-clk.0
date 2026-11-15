Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794752316;
	b=5TO5TPtP+3wmkusdKZ8X6q0TYT8nOedHWjPGtennseFWUb4bMXECrH+UPtCnzVqXA58R
	 Nnqc4ItTSt55dNBulRFPng2WEiH11wYdQu4P7BVcL++lbCkN3nClrnbsiWgj4D5unoUr8
	 odMwRaQWUQpwhN4C7mb8zq6uOzg0FkUzv88fcS9qczdkbxPGx4YEoSrC/0ySVHbmiogLC
	 uYvykl7tZ/jdzKC0IRuzQ1YPyXF8cdCCtulx2e4M7R1NPGrl8oa3JfpuNwsy54NXHKH6a
	 PtJisWIE3VbZvGTSYHAp12JY0uLUd1vZXbQ0b+zJ5o3Bdt1NTlmMeJ1n3bSyKQRK7ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794752316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=S704AU5qbUN5VbRr+2O0ZeqFrfEN5c1p3S93iVWr7So=;
	b=VG47BYHU//MQ6+/0JshojSEz8MOvgjAupdqXC/V/sjxOx7btBCcMSjWr1A9t37VkFRd5
	 /s/bZ4sr76xQAMexiYd4RJNOh3LQCW8h4GxTEERaKLNJ6tCBoCisxtl8Y8V6uE6ytpoPL
	 ++S6BIn1UyvbIN5aEE70MILZF+4lt3f2XV6llpodvFBoDDL345Vaggjsp7AwUn4Iwcevi
	 AaBqbMkDGDgif3KrRAs8QCC6xFXnwUxDGvoUYPhMXLAXZwtoD7BQTMfosJ1+QqG1+0O/9
	 JteSasIY641LnCcIDfQL2yTQR/VRLJPzA1V93vRdgAmZVXzFxYWMAXVjrmDyJgCcddA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=AEKq45wr;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15957606A31F
	for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 14:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15957606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=AEKq45wr
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso29626755e9.1
        for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 06:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794752313; x=1795357113; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S704AU5qbUN5VbRr+2O0ZeqFrfEN5c1p3S93iVWr7So=;
        b=AEKq45wrETpWcBoHsbmJ3tPNJ6GNH1SiKODswaqPbUOk8UJjpTOgLMM8Zt6QrBgel0
         gsHKx5HXdyfDJofwu9Vq8Fz+XJeesKYdOmSbgGGxrRgRNmLWfFEnZeus7L2SInTqmd2c
         lfQOTVjgmimMrzi7sU3sYmd7ieAFjA6Y/aoafEsWK9LXYMW/Kj2c5Csg6DqWq3Vbh6BT
         Z0ZbhCTeu3UyZLpDFEcs8R1YsoYR/OIMI9GG9+oT8cGDLozprBpjqroQeVZYkBC/VP2H
         hx3X/Sgsu1XszM5xS1/5BQbqI6C93q8OsfbqDsudSSalaloJxrVjARxbviFFI5hDS7k7
         Rsgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794752313; x=1795357113;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S704AU5qbUN5VbRr+2O0ZeqFrfEN5c1p3S93iVWr7So=;
        b=INuemJ5XqecMoXeWASjJOIsJtolXZrI5odCytJqI7t70cH5wvkavbvfKkJpen3+ulZ
         v8BZBINCS6UniDJEl83lUDH2tydYfliqth4+Jc4nYOx5lXNjDewvawUDsfcHMzzkl9PG
         x0Hhu90B/ob3eVZ2EjBLYv2J61SEaItI40rEhsyEeLDJWUk9vxHDxh49p5af66BDAhzT
         JyRpsqNh5Sp3haaoRRB7U7ySVhnTaYZc7yzM37ZcL9xVYwaJv0ywsQzoIG6Lo99UGOvY
         nNl6cYotTAvaWHak5rnuFzvBaUtMS/a4XsERpd9JJ00NdWp88mr/MRa5Qt1Rv+jdSFMH
         amGw==
X-Forwarded-Encrypted: i=1; AL+hErGiASgEs311F65CxUvnmok5mOclOl/Jiod3Ohvxerxk8zkrx/UFq+c2dQCKgG3lIWz3qSfabqsEySc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QtjIK6zr5lcUH1nYNRrxUdTXnT1RV1yUuKfvso3jQwkabiXb2
	w11biF8qJeyGhVh0l9c3fufLHQ0pJ+gHs4kau1qv8E5C56eTtJ0cZ89S8ENwY6UYLvs=
X-Gm-Gg: AYBFou3BSG3J8E3R5Iehcfqx1aqGY83CjjrAlECuVOAF6X5JuyX15FVZsrT8iICo6h+
	fOWnL70HHedI5E1O1rJkrzVn6mNPhXsjaev4ujAt/1MZLtQPg0n7yBF0skaNQePIwwhLuEhsJ5U
	VIgtTDZXp/CBrmk//K4C+BsbnL6zZsSp3Uk+2+0hclzHbXHu2rjNh6Iz0eaTshDD4zP5sUoNRqH
	BEukTmv8Lag6ZM+op+FSv2Y106L27uy3tAA8a3It0MiURhi2ISPg3Mn2Wf79R8VhrxIwpSw2ypC
	AcR+hgSj4Do4hCiboTTGesqrRaxHSnyBA3BQ5O6Sq3/EUSrlkMIqSkJlLgMlw3LML3+MUAvMzKb
	D2d9TNwFFL8Qdp6zEwVxNvJWOvNzaanOGEL+P/ONlQxB/1NagHLXmYbCDwmQ3HUTPvaQzQf/E7z
	Zbr/qTuudJByUfTxR/Qna064kXnXT9iBZBz+Zz5FA2vQx1RU8JIWU3N4BKJoixauXwVGbLB0RUw
	KhUz/wCv9+88dvLygg9qijo6vGrh9YTq1606QxouX99wGFCGmNudNJmjqxZDkBDct8912e68mOm
	/pjPml94eODMqe24UC28DRsCzz8uvRVVbH4KjmaPgqCcNBFntw==
X-Received: by 2002:a05:600c:34d6:b0:4bb:5c92:ce22 with SMTP id 5b1f17b1804b1-4bb5c92d047mr132126085e9.8.1794752313396;
        Sun, 15 Nov 2026 06:18:33 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223b21sm18530520f8f.2.2026.11.15.06.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 06:18:32 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v1 2/6] clk: starfive: jh71x0: Move reset controller
 registration to jh71x0 common code
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Brian Masney <bmasney@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20261013102707.9207-3-changhuang.liang@starfivetech.com>
References: <20261013102707.9207-1-changhuang.liang@starfivetech.com>
 <20261013102707.9207-3-changhuang.liang@starfivetech.com>
Date: Sun, 15 Nov 2026 15:18:28 +0100
Message-Id: <179475230833.3873592.13070196353304136001.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3026; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=SzFQdbzAtEZ1BnfFOUSY0w8toQFX6y0M+FCu3Ru7vsw=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFk/95vzHzn/Wm9uzcPMf6oFG0Wunll3x/DbhM5fr+XsQ
 iez9HiKdpSyMIhxMciKKbLUcFeLv5PU+jJrus5tmDmsTCBDGLg4BWAiLqEM/ysdn089x/jq+N6j
 4Q1p+dVaEm9m6+e/vf7hfrst902ebEGGv3Lhkd56y34ulv/k/zPkvat185OPuy6rGDg9z594TP/
 BXFYA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> jh7110_reset_controller_register() is only tied to the JH7110 system
> clock driver by its location. Its logic is generic: hand the CRG
> register base to the reset driver through an auxiliary device.
> 
> Move it to clk-starfive-jh71x0.c as jh71x0_reset_controller_register()
> so that the clock drivers of other StarFive SoCs can reuse it, and make
> CLK_STARFIVE_JH71X0 select AUXILIARY_BUS accordingly.
> 
> While at it, replace the open-coded auxiliary device allocation, init,
> add and release handling with devm_auxiliary_device_create(), which
> already implements all of it. The register base is now passed to the
> reset driver as platform data of the auxiliary device, so struct
> jh71x0_reset_adev and the embedded auxiliary device go away.
> 
> The auxiliary device ID is dropped: every CRG already uses a distinct
> auxiliary device name, so the ID is not needed to keep the device names
> unique, and it is always 0 now.
> 
> Since the helper now lives in clk-starfive-jh71x0.c, the auxiliary
> device names are prefixed with "clk_starfive_jh71x0" instead of
> "clk_starfive_jh7110_sys". Update the auxiliary_device_id table of the
> JH7110 reset driver in the same patch to keep the tree bisectable.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/clk/starfive/Kconfig                  |  2 +-
>  .../clk/starfive/clk-starfive-jh7110-aon.c    |  2 +-
>  .../clk/starfive/clk-starfive-jh7110-isp.c    |  2 +-
>  .../clk/starfive/clk-starfive-jh7110-stg.c    |  2 +-
>  .../clk/starfive/clk-starfive-jh7110-sys.c    | 59 +------------------
>  .../clk/starfive/clk-starfive-jh7110-vout.c   |  2 +-
>  drivers/clk/starfive/clk-starfive-jh7110.h    |  4 --
>  drivers/clk/starfive/clk-starfive-jh71x0.c    | 24 ++++++++
>  drivers/clk/starfive/clk-starfive-jh71x0.h    |  2 +
>  .../reset/starfive/reset-starfive-jh7110.c    | 19 +++---
>  include/soc/starfive/reset-starfive-jh71x0.h  | 10 ++--
>  11 files changed, 45 insertions(+), 83 deletions(-)
>
> diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
> index bd29358ffeec..51716655554f 100644
> --- a/drivers/clk/starfive/Kconfig
> +++ b/drivers/clk/starfive/Kconfig
> @@ -2,6 +2,7 @@
>  
>  config CLK_STARFIVE_JH71X0
>  	bool
> +	select AUXILIARY_BUS
>  
>  config CLK_STARFIVE_JH7100
>  	bool "StarFive JH7100 clock support"
> @@ -32,7 +33,6 @@ config CLK_STARFIVE_JH7110_PLL
>  config CLK_STARFIVE_JH7110_SYS
>  	bool "StarFive JH7110 system clock support"
>  	depends on ARCH_STARFIVE || COMPILE_TEST
> -	select AUXILIARY_BUS
>  	select CLK_STARFIVE_JH71X0
>  	select RESET_STARFIVE_JH7110 if RESET_CONTROLLER

You've switched to imply for the new controller you are introducing later in this series.
You should probably be consistent and align this one too. Not in this change though, it would
be unrelated.

This change otherwise looks good to me. It requires Philipp's opinion as it is touching reset too.

-- 
Jerome

