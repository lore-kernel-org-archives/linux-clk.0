Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795623398;
	b=C02kFNNV+/maz+6rN9dZLY/clemTNDNVMhqOTMHJwXiFmktsBSlp/elb+j46vxxgVDrI
	 w024v3tjWpXuoSqB1cvblTKDVbccwtkT8KtP1/oELJoaNzrCcJ7rPhUQtXgkdkFHA3cx3
	 lF16Kg8KWs6RrDGDSNXt1KHA79UpXbMtlE5AtPDuYS2wsCtT7v6Khriv9KIfCKzYcIkdY
	 2oqp35s8k5tK6fpnB7mMPj6fBUs4Ttgsfs2OLySQbq6BrM+irFrgBukO20jUT3V/A9Dzf
	 1dYmkszuKyzIXhKULcR9ZrKWJXXcnIB/E0DMOBzNtWENuUVLSrKMrzoTYWjK5fTqFOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795623398;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pgNpwuNjZPa0FgqgsMQIdcu4qflYj7O8O2CtmNNIw7A=;
	b=evNp9eo3pnFmt8Ly4E2WOvIt5bwZMijRC89GDrD6Znad6GvQDSNzcVNM0DV/PtHt72uS
	 lcDJ9w78QFiT0ewl5mur/fDH6uIs0loaOSWrcq2r9Eu8aatadZFtOrchFa0yGAKxsQNFw
	 qkTl57L7YuAegIcmKrDkRNz33783ge+lYi8CJV/2DgczYvK8q/+D+DPY/pF2pOWaN0hMe
	 7sYO59QMtD0nnx4blvAwHsqJsT6hDmgfW3/JvGcynpO9ZjTCakfcdM2tYogGOf46liomM
	 Jrhp0rcjzH2SlMIHCIE2Ypx/reOAfJuRnEJkjhnsseRdqDClsHgS/vTr11ezqSOADHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SbvYGL84;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2E6606A321;
	Wed, 25 Nov 2026 16:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SbvYGL84
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 572D61F000C4;
	Wed, 25 Nov 2026 16:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795623398;
	bh=pgNpwuNjZPa0FgqgsMQIdcu4qflYj7O8O2CtmNNIw7A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SbvYGL84iVbKlLZGVoy9cUJe8rqKbIrYI+Rg0G0sLeD7apbpbmuFMBeHm4rr1QIpS
	 ytTTPmVjtwefGh4pshGxrZdsDdikbdZ+Bv1aqhno+DzoqPMZG7++nVdcziq2BJeBnw
	 xoTvgfp9VfrRaomWA7IVsd8/3TVvOy4Cth7X8yOYnQqWnfjcBO4rZqt7aVmg/trSmk
	 WB3FMYH7w3HN5cmL5dmnNIY0mar9d2LLOQ8j3J4JG8DYD+dHhuzhrA7e8kKY4BJ6zG
	 LqSrAUAooxvJb/cBt0rr1+NFXQyd9M9UHCobVbsohuCAwFCZsfQWFltbxQBYeUuAIV
	 jeiDh7bgQZOPg==
Message-ID: <sashiko-outbox-233736@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] clk: renesas: r9a06g032: Add reset controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Hendry" <khendry@reliablecontrols.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261125-rzn1-miic-resets-v3-2-f25a4b656d71@reliablecontrols.com>
References: <20261125-rzn1-miic-resets-v3-0-f25a4b656d71@reliablecontrols.com>
 <20261125-rzn1-miic-resets-v3-2-f25a4b656d71@reliablecontrols.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 16:16:37 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] clk: renesas: r9a06g032: missing RESET_CONTROLLER Kconfig
  selection
--

commit 7a7dcd672790275a8fba3dc76bd11b687249bdde
Author: Kyle Hendry <khendry@reliablecontrols.com>

clk: renesas: r9a06g032: Add reset controller

This commit registers a reset controller in the R9A06G032 clock driver to
expose the timestamp and RGMII/RMII converter reset lines in the
PWRCTRL_SWITCHCTRL register.

> diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas=
/r9a06g032-clocks.c
> index 3df3f2b2c6de7..fc4433c3d3272 100644
> --- a/drivers/clk/renesas/r9a06g032-clocks.c
> +++ b/drivers/clk/renesas/r9a06g032-clocks.c

[ ... ]

> @@ -1394,6 +1446,13 @@ static int __init r9a06g032_clocks_probe(struct pl=
atform_device *pdev)
>  	if (error)
>  		return error;
> =20
> +	clocks->rcdev.ops =3D &r9a06g032_reset_ops;
> +	clocks->rcdev.of_node =3D np;
> +	clocks->rcdev.nr_resets =3D ARRAY_SIZE(r9a06g032_resets);
> +	error =3D  devm_reset_controller_register(dev, &clocks->rcdev);
> +	if (error)
> +		return error;

[Severity: Medium]
Should config CLK_R9A06G032 in drivers/clk/renesas/Kconfig select
RESET_CONTROLLER?

Without that selection, builds with CONFIG_CLK_R9A06G032=3Dy and
CONFIG_RESET_CONTROLLER=3Dn compile devm_reset_controller_register() to a
no-op stub that returns 0, leaving the reset controller unregistered so
consumers such as pcs-rzn1-miic fail to probe with -EOPNOTSUPP.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-rzn1-miic-=
resets-v3-0-f25a4b656d71@reliablecontrols.com?part=3D2
