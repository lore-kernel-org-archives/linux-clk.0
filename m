Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6B219E98B;
	Mon,  2 Sep 2024 14:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725285755; cv=none; b=T4SvwlM8rwQTXSiIydIxt+L7oxOWPQx0DpGlBQzK+WR3cVdNY5zdalOIUM4R9vJg8n46Y6BOmkE1PA3PsYEEEZLVQAm5KApcaIlG4pSNUeeLWmAPLMMsS36BEdrRg9+EW72M2P2r8Dv1A6WLLS9OUoV7IbllusDj8KKNsfajcFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725285755; c=relaxed/simple;
	bh=dGr0hmtqgEG2bKigM03F+K7XEGLbxyVTsJM6AuXa2o0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ClTksdNUXjPOL86eQDWemTdHykQkHMuJ8G4+v4og4aQCCVY/rp3rfOIjStOE6iAyVnsSsVSUsr/09gPLFWTd9VWwX4KBisr5RiU8W4Kx2+NPRKRUk8ErLHMjBjdWIZz2Cf85o+lNgBE779xQ6VMTG+AgDa8PSf2ETqUo342n9nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=gg2EymqO; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="gg2EymqO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Q5kDo072oqXPIANlSuSJ0omtBEVMG7dk+/GwwjwoW+w=; b=gg2EymqOeUoXG4PwS/2Ul/RuXY
	yhOW3w+ES5SGi+fp1XpY9szPDM0lRbquthZ7K10Rwv9MnyjlJhWZSdSEB5IAz71AixgeujUEF5Wnw
	B2uE14oAuMhHmuw4B4wxK7FvuZMjMzDk3o7sJNNo+RKNSx2Sn5mxfxo4gsodVNlNW5XxOqdhAz9KL
	nsMexdPcvQ6MyNSLejNfQJrt38bgroQF4xO8mfKgKiNnA6FwKGmUfe5A+EdQvzB7LJLbs7Y2pkl3o
	/NFQKyHvx9of7CFcOKcLzwpUX3w2o/dU9Sl0id9k/6dO3VVAMCBiq6AiUrSLEMKZQurGmijKxp5XU
	5BYxlsxQ==;
Received: from i5e860d00.versanet.de ([94.134.13.0] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sl7dM-0002as-Px; Mon, 02 Sep 2024 16:02:20 +0200
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
Subject: Re: [PATCH v9 6/7] clk: rockchip: implement linked gate clock support
Date: Mon, 02 Sep 2024 16:03:56 +0200
Message-ID: <2299897.AOvM4ru3NT@diego>
In-Reply-To: <20240325193609.237182-7-sebastian.reichel@collabora.com>
References:
 <20240325193609.237182-1-sebastian.reichel@collabora.com>
 <20240325193609.237182-7-sebastian.reichel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Am Montag, 25. M=E4rz 2024, 20:33:37 CEST schrieb Sebastian Reichel:
> Recent Rockchip SoCs have a new hardware block called Native Interface
> Unit (NIU), which gates clocks to devices behind them. These clock
> gates will only have a running output clock when all of the following
> conditions are met:
>=20
> 1. the parent clock is enabled
> 2. the enable bit is set correctly
> 3. the linked clock is enabled
>=20
> To handle them this code registers them as a normal gate type clock,
> which takes care of condition 1 + 2. The linked clock is handled by
> using runtime PM clocks. Handling it via runtime PM requires setting
> up a struct device for each of these clocks with a driver attached
> to use the correct runtime PM operations. Thus the complete handling
> of these clocks has been moved into its own driver.
>=20
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

> +static void rk_clk_gate_link_remove(struct platform_device *pdev)
> +{
> +	struct rockchip_gate_link_platdata *pdata;
> +	struct device *dev =3D &pdev->dev;
> +	struct clk *clk, *linked_clk;
> +
> +	pdata =3D dev_get_platdata(dev);
> +	clk =3D rockchip_clk_get_lookup(pdata->ctx, pdata->clkbr->id);
> +	linked_clk =3D rockchip_clk_get_lookup(pdata->ctx, pdata->clkbr->linked=
_clk_id);
> +	rockchip_clk_set_lookup(pdata->ctx, ERR_PTR(-ENODEV), pdata->clkbr->id);
> +	clk_unregister_gate(clk);
> +	pm_clk_remove_clk(dev, linked_clk);
> +}
> +
> +static const struct dev_pm_ops rk_clk_gate_link_pm_ops =3D {
> +	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
> +};
> +
> +struct platform_driver rk_clk_gate_link_driver =3D {
> +	.probe		=3D rk_clk_gate_link_probe,
> +	.remove_new	=3D rk_clk_gate_link_remove,

what's the use-case for remove?

We don't allow the main clock driver to be unbound, so I guess we might
want to do the same here? On a system-level they're getting registered
automatically but never unregistered, so the only case here would be
a manual unbind - but I'd think that would cause mayhem anyway?



