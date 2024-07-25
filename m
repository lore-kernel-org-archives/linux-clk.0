Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB4D23D0;
	Thu, 25 Jul 2024 18:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721930757; cv=none; b=YbJCApZvwvq7bXz7ZNavBl+Ef5ejWklfp6ExtcD6mTOd6hbp5fD++PBZc/MSk82SMde967ecbzKrE1NGKwEIfcO9giXG/W5uHMz2o2eSESqgGRc4QCrZKWE95yxgB05SW2OOyQvdl8V/K0cbHXAossX6pRaFKHBpZc7PEdrtx94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721930757; c=relaxed/simple;
	bh=yBslK0qKxuTFiNQiopZ+rPRV5w7Tw7fjqPkyzsZIeuI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ghU//Z4cfVj3WN3/NOM1XeBw8WWc77VtCL84cmHvi5LG2RBkdT101NFVF8yCAL9X1F24nLKBzNiwpjjPbC/3e2wGW1XLSmKPbiUwdU/bkc66mBR9Sr8Wg228epka0tpln9RGIx9vxICRgkTQqZ4JR2iE9m1McsQ7sQzizF6V/hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=C0jSlWy7; arc=none smtp.client-ip=185.70.40.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="C0jSlWy7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1721930753; x=1722189953;
	bh=lzuLEPm4kjgW03M5qjjr86UmmBCtz9uvJ/WOtYQHA9M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=C0jSlWy7WHEnnJGvs+0VHDUMEhypb0YEPWWiPqqtWdvqJbfWoee1/CCrKlE1NnFbE
	 n/3wCWXL7oGPt1GxsPLAXQac2XGjsXaMhrq1zTZ/pQxFp/7RiNTLPOcyOnEj55abac
	 QFSHCRgY4npd/Pzr00vQAAAzQJoEbT/0chLwyDlzmIIHbmYnj+fDfP5R6qEfYnqWpb
	 2cmoLwSal7I6mISQmmwazGOeDhb8LBZI3rawtjBZeRA9wnfP/MD4+zVB54dgQnNS6V
	 lRQBrASD52Af9wJHRSlOhQcD9068KYGefGZciVxjsp2IqJ9Ck59u4nDiZ8sOEW3bQM
	 GzrJv6U8IBfYA==
Date: Thu, 25 Jul 2024 18:05:48 +0000
To: Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>
From: Harry Austen <hpausten@protonmail.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/7] clk: clocking-wizard: add user clock monitor support
Message-ID: <D2YTI7LU63SW.3BD4V6FCRKQ60@protonmail.com>
In-Reply-To: <1cacce63c7263a3532cca148ad2c567f.sboyd@kernel.org>
References: <20240720120048.36758-1-hpausten@protonmail.com> <20240720120048.36758-6-hpausten@protonmail.com> <1cacce63c7263a3532cca148ad2c567f.sboyd@kernel.org>
Feedback-ID: 53116287:user:proton
X-Pm-Message-ID: 32ddf0609ddb5c593a1b0e2588258dfd0f21aba2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed Jul 24, 2024 at 12:29 AM BST, Stephen Boyd wrote:
> Quoting Harry Austen (2024-07-20 05:01:53)
> > Xilinx clocking wizard IP core supports monitoring of up to four
> > optional user clock inputs, with a corresponding interrupt for
> > notification in change of clock state (stop, underrun, overrun or
> > glitch). Give userspace access to this monitor logic through use of the
> > UIO framework.
> >
> > Use presence of the user monitor interrupt description in devicetree to
> > indicate whether or not the UIO device should be registered. Also, this
> > functionality is only supported from v6.0 onwards, so add indication of
> > support to the device match data, in order to be tied to the utilised
> > compatible string.
> >
> > Signed-off-by: Harry Austen <hpausten@protonmail.com>
> > ---
> > diff --git a/drivers/clk/xilinx/Kconfig b/drivers/clk/xilinx/Kconfig
> > index 051756953558b..907a435694687 100644
> > --- a/drivers/clk/xilinx/Kconfig
> > +++ b/drivers/clk/xilinx/Kconfig
> > @@ -21,6 +21,7 @@ config COMMON_CLK_XLNX_CLKWZRD
> >         tristate "Xilinx Clocking Wizard"
> >         depends on OF
> >         depends on HAS_IOMEM
> > +       depends on UIO
>
> If I have a pre-v6.0 device I probably don't want UIO though. Perhaps
> you should use the auxiliary bus framework to register a device that is
> otherwise unused and then have the uio driver live in drivers/uio and
> match that device made here. I think you can have 'imply UIO' if you
> like to put a weak Kconfig dependency.

Yeah I wasn't particularly happy about the UIO usage here. It seems like a
nice way to leave control up to the user in userspace though, rather than
adding a bunch of device attributes to read status registers, configure
interrupts etc. but I agree the dependency isn't good here. Will look into
your suggestion for v2.

>
> >         help
> >           Support for the Xilinx Clocking Wizard IP core clock generato=
r.
> >           Adds support for clocking wizard and compatible.
> > diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/x=
ilinx/clk-xlnx-clock-wizard.c
> > index 7b262d73310fe..2d419e8ad4419 100644
> > --- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> > +++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> > @@ -1165,6 +1209,17 @@ static int clk_wzrd_probe(struct platform_device=
 *pdev)
> >                 return -EINVAL;
> >         }
> >
> > +       data =3D device_get_match_data(&pdev->dev);
> > +       if (data && data->supports_monitor) {
> > +               irq =3D platform_get_irq(pdev, 0);
> > +               if (irq > 0) {
> > +                       ret =3D clk_wzrd_setup_monitor(&pdev->dev, irq,
> > +                                                    platform_get_resou=
rce(pdev, IORESOURCE_IO, 0));
>
> Any reason this can't be
>
> =09=09ret =3D clk_wzrd_setup_monitor(pdev);
> =09=09if (ret)
> =09=09=09return ret;
>
> and then all the surrounding code be moved into the function, including
> the dev_err_probe()?

That makes a lot more sense. Don't know what I was doing. Thanks!

>
> > +                       if (ret)
> > +                               return dev_err_probe(&pdev->dev, ret, "=
failed to setup monitor\n");
> > +               }
> > +       }
> > +
> >         ret =3D of_property_read_u32(np, "xlnx,nr-outputs", &nr_outputs=
);


