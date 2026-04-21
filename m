Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6753019DC;
	Tue, 21 Apr 2026 17:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776792503; cv=none; b=cOWEey79cwW9OxWm+b/0Z6eT2BNq7Ivg26JB5whPa953EGbeHCIvgJp4pI2sVYoWYRMnQ81Av0ZLjvo9XIPZFOj+fwTWKSLtUq47HXpi5B8c8vx2VfZnPl2Hq2uf+4CaCJBqGIiOnxvAxMUgxXZwGEeOpzPm5GsMVAewYls3xy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776792503; c=relaxed/simple;
	bh=kUM5ZHDKanu2VPHEDO+nSYWK4KrspVotTh/Lcq7hvoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LHcUbB312OohAJyyxpYpNGAAgjNV07ba8/7M6dCLE8RwGq2IQXLcScYEPZOIoEH3c15iBttr4ecUSNn1wHT/aQ6fMeHLgNPzIJ4TljGOb8g6AhzG6kzvMwSZTag6mI8KWRoj9ySp+EBul3PVggImY/iF0xD6bpksgpsBOblAWFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MCMJmNtX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MCMJmNtX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0F3CC2BCB0;
	Tue, 21 Apr 2026 17:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776792502;
	bh=kUM5ZHDKanu2VPHEDO+nSYWK4KrspVotTh/Lcq7hvoI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MCMJmNtXpK7lT7F7DCl0rcDChg9i5obQpSMX64HcWQuHICW0V/UCABYOm2CqDbfnw
	 xPM/LdH0E/VXrNs35Ge8qu4/CNQopZbwVfePxqDPLvMTaf2WMkUwgr1LaPp7lkuKg3
	 JUP2gwqtpIX56c2lAO5TTJrW5yvn+HAy1ySwIVnpgnLx8Tbqc5z/VI9QBgK7+RD5+w
	 311nSstBsO3l/6twCVoBPIt1ysWt14lK1ayUwHf3qawfRNvmuvo+Qf/R8eTV6R1sSa
	 pVLg04q789KqtQETMGtBvfSl4YSx58Yarpyu7tQ7B10YiLnSK89q7fXki/u1SLZkeS
	 5210px/gLQuFQ==
Date: Tue, 21 Apr 2026 18:28:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: Add clock guard DT description
Message-ID: <20260421-each-candy-67380b760d26@spud>
References: <20260318-feature-clock-guard-v1-0-6137cb4084b7@bruker.com>
 <20260318-feature-clock-guard-v1-2-6137cb4084b7@bruker.com>
 <20260318225510.GA639444-robh@kernel.org>
 <7c7034a7-686a-42c2-bdba-6f31b5179f7c@gmail.com>
 <20260319-yearly-wrongful-883f7fd86a69@spud>
 <b45d9845-2d56-4fdd-a3ac-b0e0e27ba573@gmail.com>
 <20260323-sanctuary-semantic-432089feb1c7@spud>
 <d097826c-3db5-4902-acee-ffcff7436d4e@gmail.com>
 <20260326-lustiness-borrower-530898a5ce28@spud>
 <f3e27db5-d84d-4b6a-9d6f-25fcc9044efc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Oqli5VmO2nW07SBw"
Content-Disposition: inline
In-Reply-To: <f3e27db5-d84d-4b6a-9d6f-25fcc9044efc@gmail.com>


--Oqli5VmO2nW07SBw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 07:56:31PM +0200, Vyacheslav Yurkov wrote:
> On 26.03.2026 11:44, Conor Dooley wrote:
> > On Thu, Mar 26, 2026 at 10:54:52AM +0100, Vyacheslav Yurkov wrote:
> > > On 23.03.2026 21:14, Conor Dooley wrote:
> > >=20
> > > >=20
> > > > The binding you've got says "GPIOs used to control or guard the clo=
cks",
> > > > which is not what you're saying that is going on in this mail. A mo=
re
> > > > suitable description would be "GPIOs used to check the status of the
> > > > clocks".
> > >=20
> > > Agree, the description I provided is not very accurate.
> > >=20
> > > > I want to see an example dts user for this please.
> > >=20
> > > DTS example:
> > >    clock_guard: clock_controller_guard {
> > >      compatible =3D "clock-controller-guard";
> > >      #clock-cells =3D <1>;
> > >      clocks =3D <&h2f_clk 0>, <&clk_fgpa_rx 0>, <clk_fpga_tx 0>;
> >=20
> > Unfortunately, this doesn't contain the part that I wanted to see - who
> > the providers of these clocks here actually are.
> >=20
> > To be frank, I am not sure how this block would know that these clocks
> > are enabled but their providers do not. I can think of a few ideas for
> > how this block would know, but I don't understand why the providers
> > themselves don't, and therefore why you need this gpio to tell you.
> >=20
> > >      clock-names =3D "h2f_clk0", "clk_fpga_rx", "clk_fpga_tx";
> > >      gpios =3D <&fpga_ip 0 GPIO_ACTIVE_HIGH>, <&fpga_ip 1 GPIO_ACTIVE=
_HIGH>;
> > >      gpio-names =3D "gpio-input0", "gpio-input1";
> > >      clock-output-names =3D "clkctrl-guard";
> > >    };
> > >=20
> > >    custom_device {
> > >      compatible =3D "...";
> > >      ...
> > >      #clock-cells =3D <1>;
> > >      clocks =3D <&clock_guard 0>;
> > >      clock-names =3D "clock-guard";
> > >    };
> > >=20
> > > The driver usage exaple:
> > >=20
> > > clk =3D devm_clk_get(dev, "clock-guard");
> > > if (IS_ERR(clk))
> > > 	return dev_err_probe(dev, PTR_ERR(clk), "failed to get clock\n");
> > >=20
> > > ret =3D clk_prepare_enable(clk);
> > > if (ret) {
> > > 	dev_warn(dev, "Clock is not ready, %d\n", ret);
> > > 	return -EPROBE_DEFER;
> > > }
> > >=20
> > >=20
> > > > TBH, I don't understand your driver implementation either and why i=
t has
> > > >=20
> > > > +static const struct clk_ops clkctrl_guard_ops =3D {
> > > >=20
> > > > +	.enable =3D	clkctrl_guard_enable,
> > > > +	.disable =3D	clkctrl_guard_disable,
> > > > +	.prepare =3D	clkctrl_guard_prepare,
> > > > +	.unprepare =3D	clkctrl_guard_unprepare,
> > > > +	.is_prepared =3D	clkctrl_guard_is_prepared,
> > > >=20
> > > > any of these 4 implemented when you have no control over the clock.
> > > > I didn't think it was required to call your parent clocks enables in
> > > > your own enable either, thought that was handled by the core recurs=
ively
> > > > calling clk_enable() on clk->parent. The one thing I would expect y=
ou to
> > > > have implemented ops wise is is_enabled, which you don't have.
> > > > Also no sign of any rate acquisition functions, which I thought were
> > > > mandatory.
> > > >=20
> > > > +	.get_parent =3D	clkctrl_guard_get_parent,
> > > > +};
> > >=20
> > > Good point on .is_enabled, I indeed missed that. As for the rate acqu=
isition
> > > functions I referred to this table
> > > https://docs.kernel.org/driver-api/clk.html#id4 , and it see that .se=
t_rate
> > > is actually optional.
> >=20
> > .set_rate is not rate acquisition. .round_rate and .determine_rate are.
> > I thought they were mandatory, but for a gate clock I guess they are not
> > and the parent rate gets used automatically.
>=20
> Before I send a v2 I'd like to clarify a few more things:
> - I provided a schematics by means of the URL. I believe there's no unifi=
ed
> way to provide something like that in the documentation, is there? So the
> only way to describe it properly would be to summarize the description fr=
om
> the mailing list, right?

I don't believe anything we have at the moment is what you're looking
for.

> - I'm going over the Common Clk Framework again, and perhaps I understood=
 it
> wrong. You mentioned that I have to implement is_enabled, but I implement=
ed
> is_prepared. It seems that I just have to move my is_prepared implementat=
ion
> to is_enabled. Does that sound correct?

Effectively yes, I think.

> - In my particular use case I don't need enable/disable ops, but to keep =
the
> driver generic, I'd probably want to have the bulk_enable implementation
> inside, because I don't know which clocks are assigned in a device tree. =
The

Why don't you know this? I'd expect there to be 1:1 mapping of gpios to
clocks, with an equal number of input and output clocks, since all
you're doing is detecting if the clocks are ready to go?

> clk_core_enable function only enables 1 parent clock, not the the list of
> parent clocks. Or I'm missing something here?


--Oqli5VmO2nW07SBw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeezsgAKCRB4tDGHoIJi
0nvOAQCTrme7fq//tFBMUwF0/4UV7bRtW7tZbWQ1wynmxGDRBQD/Q1ozIIf836La
AXhJbuM7PZlVRYlTkGsfFTw8yHsaVAE=
=p8dP
-----END PGP SIGNATURE-----

--Oqli5VmO2nW07SBw--
