Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428595;
	b=QsDwJaZ8EUE1eQVlcTTFt4YG5YWIdTHAbCeB9QyhEpt/ql/ii7XFCWIKM7LJz8M8PvqI
	 vX0f0RIaav6UXGQhE51q++wjERPPvGOgYvAB022ufTAH8uGeRc1+Ar5tpKUl3hONnXx9t
	 7t1VHF8kKrLxnkQg1t39fRG+2GRTmVyT1QDzb68o7ULKORYEUSQfxZo9ZJKySR4TbCRfH
	 dRmcoj06opAgTXyzm4cJNyyHwvIESF6z3HkqrmBC5P86lPkYLcGrzpLYNUnRQhkaE4R3P
	 Yw3dmxm+rOpERsBOGI9vq5Mqi31TXxlemW+kTcVTDktvPcmlV7mw9X6+WMC1MzYyF4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428595;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=QzNSZ0iFhRlTWtyDOwGZYClX/oRnKCvUibKarAhFQB8=;
	b=s9c8VENuEHK3bHYPCVR8m1KVIYWXBpkkZCZIx0LGRBLGXhfrU7dZYHYMun0D/DlJEaw/
	 tttgqHzTTEa8Mz4tCybJ4whu/76qETYQl1ivsifLAtv3KLiTqb9MZqxBckiS5mTqVQkdi
	 xptB2ChzceeHvmv0sQmCYcJALuKrmKnrWdNafabX5f2XSRsIBCgQyVZ4xG++kkaSHMtY0
	 svZbpD6u81wVoDczJkOXWV3J4qW+J+jQgN1N1u8t91pahygO8p86CBUAPSe62qS9J94ux
	 CIp4aX/KIDzezRI4HSGXi1TXHX2RWP2r7iK+5u58ZbgE4VyLky8Y0xRuTJQ2JfC4lbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=BBePDjYT;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F514606A31E;
	Mon, 23 Nov 2026 10:09:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F514606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=BBePDjYT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795428593;
	bh=dNcePiAUgVfMdRA+1roMRiVaEzWyrtTb8Npu/FK/EqY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BBePDjYTm0dnzUEMQr71rXFyP6MEJNcQCEHXVkw+Y+2PQzAUn64znCBUpQ9mg6Mpu
	 dhAobMTj0w62AYUcNRJt06xPjX65TlHXbUDYzBlBXTVrIkavKW2w4e+KiJ3PerXLuN
	 Hb3qwOPAWaMKgfqUtPbw2yHYOsod19W46F8NOLQDZGoTamlm4gtKZ8Zybzsi8m2brb
	 LCO24l9X5yzZZoFZsiz/B/FZQutp25a6WYXxTDEZivbrwlMeSnOHjHiV2FSVM1Nm1f
	 O0b/2h9yaVSaxXm0MviW9R9SbPssuMWCixe/JZLTc+rdKeXlnkATT3FTgKkyrCRARN
	 SiOj3NT1LKw+Q==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 274FC17E021B;
	Mon, 23 Nov 2026 11:09:53 +0100 (CET)
Message-ID: <05e5b03e-16f7-4e5b-b6ad-f946b2560ccf@collabora.com>
Date: Mon, 23 Nov 2026 11:09:52 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] clk: mediatek: mt7629: move clock counts out of DT
 bindings
To: Chuanhong Guo <gch981213@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20261120-b4-mt7629-rtc-v2-0-cd877cd496ae@gmail.com>
 <20261120-b4-mt7629-rtc-v2-1-cd877cd496ae@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261120-b4-mt7629-rtc-v2-1-cd877cd496ae@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/26 15:41, Chuanhong Guo wrote:
> The clock counts used by clk-mt7629.c size the clock provider arrays.
> They are driver implementation details rather than clock IDs used by
> device tree consumers.
> 
> Move CLK_TOP_NR_CLK, CLK_INFRA_NR_CLK, CLK_PERI_NR_CLK and
> CLK_APMIXED_NR_CLK into the driver. Keep their values and all clock IDs
> unchanged.
> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>

If you migrate clk-mt7629 to mtk_clk_simple_{probe,remove}, you will realize that
the CLK_xxxx_NR_CLK definitions are completely useless, and you'll be able to
remove those.

Check other MediaTek clock drivers about how to migrate.

In any case, NR_CLK is always the same as ARRAY_SIZE(that_clock_array)....

Cheers,
Angelo

> ---
>   drivers/clk/mediatek/clk-mt7629.c      | 5 +++++
>   include/dt-bindings/clock/mt7629-clk.h | 4 ----
>   2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt7629.c b/drivers/clk/mediatek/clk-mt7629.c
> index e154771b1b8b..517c43b19f18 100644
> --- a/drivers/clk/mediatek/clk-mt7629.c
> +++ b/drivers/clk/mediatek/clk-mt7629.c
> @@ -17,6 +17,11 @@
>   
>   #include <dt-bindings/clock/mt7629-clk.h>
>   
> +#define CLK_TOP_NR_CLK		108
> +#define CLK_INFRA_NR_CLK		6
> +#define CLK_PERI_NR_CLK		22
> +#define CLK_APMIXED_NR_CLK		7
> +
>   #define MT7629_PLL_FMAX		(2500UL * MHZ)
>   #define CON0_MT7629_RST_BAR	BIT(24)
>   
> diff --git a/include/dt-bindings/clock/mt7629-clk.h b/include/dt-bindings/clock/mt7629-clk.h
> index ad8e6d7f0154..cff9a02e8302 100644
> --- a/include/dt-bindings/clock/mt7629-clk.h
> +++ b/include/dt-bindings/clock/mt7629-clk.h
> @@ -115,7 +115,6 @@
>   #define CLK_TOP_CRYPTO_SEL		105
>   #define CLK_TOP_SGMII_REF_1_SEL		106
>   #define CLK_TOP_10M_SEL			107
> -#define CLK_TOP_NR_CLK			108
>   
>   /* INFRACFG */
>   #define CLK_INFRA_MUX1_SEL		0
> @@ -124,7 +123,6 @@
>   #define CLK_INFRA_DEVAPC_PD		3
>   #define CLK_INFRA_APXGPT_PD		4
>   #define CLK_INFRA_SEJ_PD		5
> -#define CLK_INFRA_NR_CLK		6
>   
>   /* PERICFG */
>   #define CLK_PERIBUS_SEL			0
> @@ -149,7 +147,6 @@
>   #define CLK_PERI_NFI_PD			19
>   #define CLK_PERI_NFIECC_PD		20
>   #define CLK_PERI_FLASH_PD		21
> -#define CLK_PERI_NR_CLK			22
>   
>   /* APMIXEDSYS */
>   #define CLK_APMIXED_ARMPLL		0
> @@ -159,7 +156,6 @@
>   #define CLK_APMIXED_ETH2PLL		4
>   #define CLK_APMIXED_SGMIPLL		5
>   #define CLK_APMIXED_MAIN_CORE_EN	6
> -#define CLK_APMIXED_NR_CLK		7
>   
>   /* SSUSBSYS */
>   #define CLK_SSUSB_U2_PHY_1P_EN		0
> 
