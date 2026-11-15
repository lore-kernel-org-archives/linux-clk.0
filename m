Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794752322;
	b=KHSTUPOY7kJc9DSkDXHMmc10WGD7ZXwVjur6Is+WWoFN13qfjXh+JqYm9AkFD4SfcZYh
	 rq/852yJPcfEOLgdraoAsvb5MpBIMw4084mUc0c+cCkwLuq7cVZz/meMlRTlaZ4vt/Wgv
	 l5fBF4VatVVVG/6YuTPfp5d6fZ2f1OP2HG17vaopoiH4dvQIk3B89u9fDgAUzFsH609lp
	 R7SsKt5ZZ33h7i5E16AcelSu1AVUx7f9fujpKRJPSoNMdfsM+MVfhHm4mAp2zHo61uCao
	 VXlW8RI6yAVMohmbezHwswRQWTlqSSDFyUmoRUWyII8p+UiOp647vjNVLj8V1Ji9eRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794752322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=yg+6x1taFPz1aG2RIqr++6bIa3IK0w7NjTUlcchGBio=;
	b=2+EmLNh8U5EGqHsaam97IoNcWhCwBzpGpqTS8iq2YGL73CZxYAGs1XICeOvgcQ2jLYDX
	 TTXVoo66BIHQtbUe5YvQzhcVVxN0MM+5Zz5ZdtK0emoo/Hk/EC4N41ZW5Yz2CQ++FPLPZ
	 V+3FqI+SbclERYHFgoARt8b+bWtEqDMXbA2rXUAEO05njhpPu7jJuDgnnklrzHKElbkvu
	 PIMuGY79ktDwZI3UuTCw5Lfv3EYe+/jOPT3JeUk1/AhNF22bkU1beMIVFBI92Izub5Yum
	 bHRo1gH8yAXsmGa0/CdkFzOVQkKU4eMVfLRSZWpqF81/MhtYf6r0nYLf5uQPHmmaUsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Dzm8NTv0;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3DD606A337
	for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 14:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D3DD606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Dzm8NTv0
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4922dbcee23so1158535f8f.0
        for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 06:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794752320; x=1795357120; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yg+6x1taFPz1aG2RIqr++6bIa3IK0w7NjTUlcchGBio=;
        b=Dzm8NTv0uKn0CqPPjh2nKHSOmCFi47zZLQ7/cmoD7K9DiSpoDhf8Bmgm9a7f66fVfl
         ZYmc3X0SIUfXGTKbae1gphVhc8IBsi89pnZLru6mScrct/MPwWa1GcqbMIo8B/MerJSo
         xS8710j4f2asPuW7drnMQ/yzxP0UrDkQm9b5J/Rw/UthN/ZBqIvf6YqG9z683iPQtktE
         r2q5yTMiwQt+/TT+hcZNpLut5G18P9zvifIF+tLl+jzmwbKRBqmppd23qk3gWfJknVsO
         AIxA/KZM27D5whv/1eG6qkecSC+VtWsGkLjW/sU/idrxJjcCoaWSP/aADpfQQq1VKYvh
         RjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794752320; x=1795357120;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yg+6x1taFPz1aG2RIqr++6bIa3IK0w7NjTUlcchGBio=;
        b=KNO/+owdixWeJNfBTnVyrIGdmYO3SnKbNt1wMNJxmsVM9vXybBcOOiTiPSqObIjg9F
         4CMd+PuKs1lz+aM8bLe0n4tJiPN7rh59V1N43cCCWv84SEy9k8+nbCyknIhAh91PSdkf
         JbMEa95ulttqZK0HifResG5TVzNhDB70ahw/rv1sIABaKVtCisvjkZiipg1v52+sLtBE
         8KeAnNAaNR71IHN6l03hCEab/44VIqmjxo3cJMz9UiRyAXOnPELjgxT4I126Zuwgvj89
         /ZLkoniW3gfd3SB7tHeIZYg8la92r/kDlp2AfZkYRyEp57apyESIcAvHfWxlalm0Wrfu
         WRUg==
X-Forwarded-Encrypted: i=1; AL+hErHQLOcKhhow8bm+NHgmGENiL/8Gej3kB7/TTPeQXJzqutwZoULXD7CPlGjhojVcpo6xAn3Ni9Oq/GI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4LT9/V6G/njYm+O6Gi58nqi7nA9FxO+Am5S/S9go9Ut/9XVL/
	iUX2pLbpnCYRgwwcYzmgpl3y2UFBIsRUJp3/BDyj/hTNn3OuoK86q0S8pt/qcEOOqGE=
X-Gm-Gg: AYBFou3Cm3xsS4P9MGmSVcg95u863ZDS0+xokMAf10+rf4654oiBuXLnPCaj7za2b/F
	M/C/OXrnpOCw2uqP1DspFZCgoHKP3PlXQKNQvxGBtPsGX5kksbKLBKPsigudIWL6uBUCHqpvkHd
	zjuYYKA4Nnj5ifl66HdtlzTIZ+s8FAfBYlfyo3O0VgN8A1FtNi5F0KpLtiZ+5FsWMkMzaexfzf/
	ZIYmDcP82vBUkHe2oRLN2i3H3M1eyMmrTak3nU0rrG25stiNY0JX9T2WeQ+BCUL5aLltNKue8hN
	Xi/AQPAuxDrhckWGkA16TzZzbY1m/9+M+t/PXh0aIPzSY5HQv1hdv5RjMtF5uHEVF80c6+rH8PK
	vgEL8U50g2l/w3agAfy3BlUdQMw0zIc8QgF498s1gGScJK2qM34eSqQK/TcYUn21R0L5rSsOuEn
	1GqR1B68tj3hCLgetBhYRHnMpCL7z/gUP3nYcMu2b8exRHjiL5xZz+4KAdn8YOeSKZg/Z4JWaP2
	mfWlACqMGjk/qMKt9Eh1znWFhIw9Fqayy0Q0q3ODyBSM4gEBjfDW8KtSa8eoWuLVIK9PY4RndjV
	F6WL94qU9Aco0ItzEkqAV+lwMcJ2aFzF3JDCh7gTfqb/I9ua
X-Received: by 2002:a05:6000:26c7:b0:492:f563:cfa1 with SMTP id ffacd0b85a97d-49c73ed0ba9mr17977136f8f.55.1794752320034;
        Sun, 15 Nov 2026 06:18:40 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm17400553f8f.8.2026.11.15.06.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 06:18:39 -0800 (PST)
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
Subject: Re: [PATCH v1 6/6] reset: starfive: Add StarFive JHB100 System-0
 reset driver
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
In-Reply-To: <20261013102707.9207-7-changhuang.liang@starfivetech.com>
References: <20261013102707.9207-1-changhuang.liang@starfivetech.com>
 <20261013102707.9207-7-changhuang.liang@starfivetech.com>
Date: Sun, 15 Nov 2026 15:18:28 +0100
Message-Id: <179475230833.3873592.14107280802504551112.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2441; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Apxx3Ov1ydC3jlD163T+qDu/ZuqndG5aUGB/PTRcBEc=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFk/95snLg5eWf6gfN/cd7eNeK+7ct2XeLhA9fyZ2Ifdw
 aUXGnamdpSyMIhxMciKKbLUcFeLv5PU+jJrus5tmDmsTCBDGLg4BWAi3zUYGd79iDxWUNy96YPo
 jLWvixQltj48/ErwXcDMiA5r1t3qoZkMf8VXaTvsaJ0547OP7Yxb39Ws+j6E33qolafOZLHo8CP
 LY4wA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> Add the auxiliary reset driver for the StarFive JHB100 SoC. It binds to
> the auxiliary devices registered by the JHB100 clock generator drivers
> and uses the register base handed over as platform data.
> 
> Start with the System-0 clock and reset generator (SYS0CRG). Its reset
> IDs do not map one-to-one to the hardware reset bits, so the controller
> is registered with a reset ID map.
> 
> The other JHB100 reset controllers are added by follow-up patches, each
> right after the clock driver of the same CRG.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  MAINTAINERS                                   |  6 ++
>  drivers/reset/starfive/Kconfig                |  9 +++
>  drivers/reset/starfive/Makefile               |  1 +
>  .../reset/starfive/reset-starfive-jhb100.c    | 75 +++++++++++++++++++
>  4 files changed, 91 insertions(+)
>  create mode 100644 drivers/reset/starfive/reset-starfive-jhb100.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f66998e8eb64..c2ab9cbccf49 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26858,6 +26858,12 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/pinctrl/starfive,jhb1*.yaml
>  F:	drivers/pinctrl/starfive/pinctrl-starfive-jhb1*
>  
> +STARFIVE JHB100 RESET CONTROLLER DRIVERS
> +M:	Changhuang Liang <changhuang.liang@starfivetech.com>
> +S:	Supported
> +F:	drivers/reset/starfive/reset-starfive-jhb1*
> +F:	include/dt-bindings/reset/starfive,jhb1*.h
> +
>  STATIC BRANCH/CALL
>  M:	Peter Zijlstra <peterz@infradead.org>
>  M:	Josh Poimboeuf <jpoimboe@kernel.org>
> diff --git a/drivers/reset/starfive/Kconfig b/drivers/reset/starfive/Kconfig
> index d832339f61bc..84baefbaee14 100644
> --- a/drivers/reset/starfive/Kconfig
> +++ b/drivers/reset/starfive/Kconfig
> @@ -19,3 +19,12 @@ config RESET_STARFIVE_JH7110
>  	default ARCH_STARFIVE
>  	help
>  	  This enables the reset controller driver for the StarFive JH7110 SoC.
> +
> +config RESET_STARFIVE_JHB100
> +	bool "StarFive JHB100 Reset Driver"
> +	depends on CLK_STARFIVE_JH71X0 || COMPILE_TEST

This would mean it can't build without the starfive clock being compiled too.
There should just be a shared header, unless I'm missing something and the
clock already imply this driver, that should be enough ? no ?

If so, 'default ARCH_STARFIVE' can go too. and just

depends on ARCH_STARFIVE || COMPILE_TEST

-- 
Jerome

