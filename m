Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F17E3B7751;
	Mon, 27 Apr 2026 11:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777288666; cv=none; b=dxS33COSn6Oc2C40b9typkU+TWuhaaAax6av6hGR1NNJErs5SbmAMzMO554SQ93l0nhsVACuF4ezu8PqJQ/dN2+MJ8XVA4O2HSgwZxP0x8t/W2+4WDLvJAG+3LXMQAuxRJmON4gzQeuLH2MbcV/Fy4bS2HShOjn/i7bVvZWXsxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777288666; c=relaxed/simple;
	bh=cz5ECVwXX93yMdBIhnUxVJ4RoSZT24k5RP9nDScaUBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VR9mtjyYHiMqxyRqds7Ituol4Hp+js2HAeOMsKTJOkOSqig4MmM51+TNTuYw7BBvxpL+YyvXkNW/MjDfFipeAUNFn5xDB4w+CQXG4NoZdg8z3Cebycsxt+YOqlA1Slpj0/kRQdAU3kUNYsGJvpvD1pQYBWPW0dfREc/Lzjup2bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=zU04asBW; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="zU04asBW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=/MCIfW2py6u2WGLFRG+lrXEI6H5DKL5xFLnl1adUerU=; b=zU04asBWfsMn9cSs5czJiFCjQD
	1iA3oKzZAnEPOCdQOKkbnBXDeXcQLElpSHGtLspTovIlsBExCy7PNSkK52n35dKxZN3EUZRU66/SX
	/KuakRvCK9Rnezvx74d0DWsFCDWC7sdwk2XHp6MdU4YZPJG0ZwfbcKRSiKMf3iEUde7LX0VD0m4IZ
	gdgdDQk4kBEAZPzbqawgxshcF/mP7mJuDdj4AM3l9N3pyluA2qej81wOABJGj8spoFgMpdekoIadT
	qmpBBGtUySL8kK+Y5SIUoRJlpbRykwS43JNnNhen2b4Hpqj7wXSiGMY2+VsgIJ5z5V0aMlz+FtVI8
	oLflI9nA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Johan Hovold <johan@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 stable@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH] clk: rk808: fix OF node reference imbalance
Date: Mon, 27 Apr 2026 13:17:39 +0200
Message-ID: <10504733.NyiUUSuA9g@phil>
In-Reply-To: <177714062701.5403.1177541832751457755@lazor>
References:
 <20260407095027.2625516-1-johan@kernel.org>
 <177714062701.5403.1177541832751457755@lazor>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Samstag, 25. April 2026, 20:10:27 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Stephen Boyd:
> Quoting Johan Hovold (2026-04-07 02:50:27)
> > The driver reuses the OF node of the parent multi-function device but
> > fails to take another reference to balance the one dropped by the
> > platform bus code when unbinding the MFD and deregistering the child
> > devices.
> >=20
> > Fix this by using the intended helper for reusing OF nodes.
> >=20
> > Fixes: 2dc51ca822e4 ("clk: RK808: Reduce 'struct rk808' usage")
> > Cc: stable@vger.kernel.org      # 6.5
> > Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> > ---
>=20
> +Heiko

Looking at the device_set_of_node_from_dev() function, this is the
right move, so

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


It also seems the rk808-regulator.c might be another candidate for
this, as it also takes the node without of_node_get and manually
setting the of_node_reused flag.


Heiko


> >  drivers/clk/clk-rk808.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/clk/clk-rk808.c b/drivers/clk/clk-rk808.c
> > index f7412b137e5e..5a75b5c91555 100644
> > --- a/drivers/clk/clk-rk808.c
> > +++ b/drivers/clk/clk-rk808.c
> > @@ -153,7 +153,7 @@ static int rk808_clkout_probe(struct platform_devic=
e *pdev)
> >         struct rk808_clkout *rk808_clkout;
> >         int ret;
> > =20
> > -       dev->of_node =3D pdev->dev.parent->of_node;
> > +       device_set_of_node_from_dev(dev, dev->parent);
> > =20
> >         rk808_clkout =3D devm_kzalloc(dev,
> >                                     sizeof(*rk808_clkout), GFP_KERNEL);
> >
>=20




