Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604111;
	b=bUai7QR9IaFsO6RbXkM8tyHZmRZv5D6+wGap+sdlC1mG2tA3hAxdtlIzv340mf2s6dPJ
	 HwQRfDxVY7xWRmde3OwXdRW5rNRYKZ55HAbycaGzW/ZTL//dKsaS4+jxiCNtLihesy3HM
	 KrzNZayiGRhlm9JD0Oa4923diUnUshK93Fcut7BL1wRkZJgdIBtXkoTKvah+qrWm6Ov0d
	 KtcI0ONMwZtYhp05W3niDBZXEGPXasbOKgVy61kmImlEPU21YhBz0OensTf+8Yk5iRFyV
	 45/daPCwbG/AxRHutIZ05qtIVxBDfTG28+/cAhCvaXrRlqIIp0Q48CGaxlOtQh4ViVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604111;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=3T+PgBhGAeiyiJXoesZjBC+dalaU5f+v7s903e1CpXs=;
	b=zuGx38LxMcg08sH0BRi7U3G6iul3wHkKNPdHvrtmNQNNsaEwgNOItRCXK1wjF+pN9TIE
	 bk9h/Yy23sOjJCJ4MzLBVwiop+hVEUwFXocHGFIzx7x/k21rhcHCE45U/sjxkmYfAuG43
	 6h2UBfX1Ad6u3aFxkdjf+4mdsg9rLYXG0qpJIYe4TdFTuvKE+qr8LcnLB9HkOovoaX+RQ
	 rVSG5XcUjf/7wAq1D/OqpIHx3KUBgelPnF39A297erYYURWwiuCYworxs2RWscxrlsYxt
	 fW7Ih3cHqZCxo5nA1JpAAs/vz5tnDJCXLm+NubogUbBi0bxkxOF1cz+Q5Jc2UxSgY3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HMR+lxB9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91677606A335;
	Wed, 25 Nov 2026 10:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HMR+lxB9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E651A1F000C4;
	Wed, 25 Nov 2026 10:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795604111;
	bh=3T+PgBhGAeiyiJXoesZjBC+dalaU5f+v7s903e1CpXs=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=HMR+lxB9DpYGJdlMSiwTyypb8XN0TBuITla3qPw7hwHp4VeL0Ul2htvUZLPrifSxM
	 5NuE6u2yPcrrSB5hbZWu8M1qnIFZVbjGlku0+o8f1CFiu6w6qCBfR232d7Pe3rTDzu
	 XJCSM49gC6mR0Jpy9ilKnd8nBEYNr3L8vDVajsAjh4i1ZP8kgkHMN/pywZ9HCDo9nC
	 e6DfPpZTAwH0OQitvZf1/87I8rDF65hEbFw8+EdlnPrg++M1CEmv6dZLa2hjiwzFz5
	 26YToi+XTpjfn6Z4i2xdHWs6zRux06lfU2A1py1Cv9xAdKogZh4nO6JDh9NqNYfsid
	 9/hBHeqrXmaGQ==
Message-ID: <647d4527-dd99-4f1e-98ff-a6a5317560e6@kernel.org>
Date: Wed, 25 Nov 2026 11:54:58 +0100
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
Subject: Re: [PATCH 3/7] soc: mediatek: add MMDVFS core driver
To: Echo Zhang <echo.zhang@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 MMDVFS Team <linux-mediatek@lists.infradead.org>, kyrie.wu@mediatek.com,
 ming-fan.chen@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, llvm@lists.linux.dev
References: <20261125060037.649659-1-echo.zhang@mediatek.com>
 <20261125060037.649659-4-echo.zhang@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261125060037.649659-4-echo.zhang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/11/2026 07:00, Echo Zhang wrote:
> Add the common MediaTek MMDVFS driver framework.
> 
> The core driver handles device probing, SoC data selection, clock provider
> registration, power-management notification, and dispatch to the
> microprocessor transport used for runtime performance voting.

I don't get why DVFS driver is a soc driver. This should use proper
Linux subsystems and be placed there.

> 
> Signed-off-by: Echo Zhang <echo.zhang@mediatek.com>
> ---
>  drivers/soc/mediatek/Kconfig                  |  19 +
>  drivers/soc/mediatek/Makefile                 |   1 +
>  drivers/soc/mediatek/mmdvfs/Makefile          |   6 +
>  drivers/soc/mediatek/mmdvfs/mmdvfs-clk.c      | 462 ++++++++++++++
>  drivers/soc/mediatek/mmdvfs/mmdvfs-core.c     | 581 ++++++++++++++++++
>  drivers/soc/mediatek/mmdvfs/mmdvfs-internal.h | 305 +++++++++
>  include/soc/mediatek/mmdvfs.h                 |  72 +++
>  7 files changed, 1446 insertions(+)
>  create mode 100644 drivers/soc/mediatek/mmdvfs/Makefile
>  create mode 100644 drivers/soc/mediatek/mmdvfs/mmdvfs-clk.c
>  create mode 100644 drivers/soc/mediatek/mmdvfs/mmdvfs-core.c
>  create mode 100644 drivers/soc/mediatek/mmdvfs/mmdvfs-internal.h
>  create mode 100644 include/soc/mediatek/mmdvfs.h
> 
> diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
> index d7293977f06e..bb273a4461f0 100644
> --- a/drivers/soc/mediatek/Kconfig
> +++ b/drivers/soc/mediatek/Kconfig
> @@ -60,6 +60,25 @@ config MTK_REGULATOR_COUPLER
>  	default ARCH_MEDIATEK
>  	depends on REGULATOR
>  
> +config MTK_MMDVFS
> +	tristate "MediaTek MMDVFS support"
> +	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	depends on MTK_VCP_RPROC

Does not exist.

> +	help
> +	  Say yes here to add support for the MediaTek Multimedia Dynamic
> +	  Voltage and Frequency Scaling controller. The controller provides
> +	  virtual clocks for multimedia hardware blocks and coordinates
> +	  performance votes with platform voltage resources.
> +

...

> +/* Logging macros */
> +#define mmdvfs_dbg(dev, fmt, args...) \
> +	dev_dbg(dev, "[mmdvfs] " fmt, ##args)
> +#define mmdvfs_info(dev, fmt, args...) \
> +	dev_info(dev, "[mmdvfs] " fmt, ##args)
> +#define mmdvfs_warn(dev, fmt, args...) \
> +	dev_warn(dev, "[mmdvfs] " fmt, ##args)
> +#define mmdvfs_err(dev, fmt, args...) \
> +	dev_err(dev, "[mmdvfs] " fmt, ##args)
> +

No, do not reimplement standard Linux kernel APIs/frameworks.

This applies EVERYWHERE here.



Best regards,
Krzysztof
