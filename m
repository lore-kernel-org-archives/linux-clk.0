Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021921BC39;
	Sat, 31 Aug 2024 10:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725101260; cv=none; b=uyii+TzcHmIDBxKGAhPPqOAi1oc5Q+6LHiNDG8CU0kTzRRkHUnyjjlvPqdO9CJxQ8siC5z6Lb/OU8e1VHEISaFHzxahEt6X2LbI8XQ6OMsE2TQvdOk66K2XUyhKgrbzA2LGfB7u2CG/A+mK6znYbCAH7HUA9mGu3N1H+Jik1/JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725101260; c=relaxed/simple;
	bh=kiivoI+Gg3Yauqhf1p5rlFAeUkG50p5IxgGsSDPsX3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HK5wHE4ac2+XgCQr1LQmxC4+X1sM4/EdnFhgtf/iRsPZe4VoUxvrXkK3jkk9tI8LFQOW+uf2Ay0PPhz3II6PxG/d7Ns+wyYsJpweldh7aSMedTcF7rvZ3h4xjbL/Ksnu5Enm2Zj71kGBCC8x2V0/Tqlw4+jdvBEdbbnEbnUT3OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=dTrpm3qR; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="dTrpm3qR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IM9d6UMpZ5gjX3hzI1jszjTrPvmLv8VkOEdEYbhUEYg=; b=dTrpm3qRvmfG9mvD434IzmZFCR
	NomrNe9Tz+wJCs1zU+zvcFj+QJjIn03C4BERDDQxtbrgwzZYSnXC+tsz6LdRkRxMcz2tsgPfWddgG
	ha2oABJPK0bbI8R5snHdi3YlYu/fZdAWTgXHjRzb6fjjghBGXUXCRwrNilBPcn5q2gbxdmtRfQk6P
	LuRdnNf0YHVmrnQZWwx54n4tFnJfkNHQ6F4zuw+mbiUgqoH1z+2eO7SrfqkUbc6AFvdIn16f6Yxas
	M96a07RJOg/+GP9pPPV0l7VdsGnJeM9jFtRpPPYtZu8dfOIEVYQEvJoAUutqSD0HXXDB3ZN6A1c2g
	dIBT2AQw==;
Received: from i53875be3.versanet.de ([83.135.91.227] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1skLdf-0002ra-GW; Sat, 31 Aug 2024 12:47:27 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Elaine Zhang <zhangqing@rock-chips.com>,
 Kever Yang <kever.yang@rock-chips.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, huangtao@rock-chips.com,
 andy.yan@rock-chips.com, Michal Tomek <mtdev79b@gmail.com>,
 Ilya K <me@0upti.me>, Chad LeClair <leclair@gmail.com>,
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com
Subject:
 Re: [PATCH v9 2/7] clk: rockchip: handle missing clocks with -EPROBE_DEFER
Date: Sat, 31 Aug 2024 12:48:54 +0200
Message-ID: <2405227.9fHWaBTJ5E@diego>
In-Reply-To: <20240325193609.237182-3-sebastian.reichel@collabora.com>
References:
 <20240325193609.237182-1-sebastian.reichel@collabora.com>
 <20240325193609.237182-3-sebastian.reichel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Am Montag, 25. M=E4rz 2024, 20:33:33 CEST schrieb Sebastian Reichel:
> In the future some clocks will be registered using CLK_OF_DECLARE
> and some are registered later from the driver probe routine. Any
> clock handled by the probe routine should return -EPROBE_DEFER
> until that routine has been called.

So this changes the behaviour for misconfigured systems/devicetrees.
Before a driver would get the ENOENT if they requested a clock from an
empty lookup field, but now they will just defer forever.

Can we do some rockchip_clk_finalize() that runs after _all_ clocks are
registered (in the CLK_OF_DECLARE function for most drivers, at the end
of probe for i.e. rk3588) that takes all lookup entries that are still
EPROBE_DEFER and set it to ENOENT again please?


Thanks
Heiko


> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/clk/rockchip/clk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
> index 73d2cbdc716b..31b7cc243d82 100644
> --- a/drivers/clk/rockchip/clk.c
> +++ b/drivers/clk/rockchip/clk.c
> @@ -376,7 +376,7 @@ struct rockchip_clk_provider *rockchip_clk_init(struc=
t device_node *np,
>  		goto err_free;
> =20
>  	for (i =3D 0; i < nr_clks; ++i)
> -		clk_table[i] =3D ERR_PTR(-ENOENT);
> +		clk_table[i] =3D ERR_PTR(-EPROBE_DEFER);
> =20
>  	ctx->reg_base =3D base;
>  	ctx->clk_data.clks =3D clk_table;
>=20




