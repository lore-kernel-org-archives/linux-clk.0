Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC36331771E;
	Thu, 13 Nov 2025 19:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763063102; cv=none; b=KWZ9owrOwdKRuT/K92V9oqsB3dBHidlHPzIGG9mdsDGLmyPGGblYpAxgNvmuUtzNGKQMFR2O+qXmdSx1olCX0NEL9TRm31MVvP9Vk0Y/9LHryf/acIWi5SK3bwM3VdSwBrtO6iqTPGa4+Jg8JxkUfzxljlTmw/jaE6fNQD1k38s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763063102; c=relaxed/simple;
	bh=0VwKaYc35bZVUgu90hr/jsC2a+mJC8giJD4+WvmKtmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hapWJp/jd33VoyH1eKaxaxXMlJ+pIL9py9A0VAPKI45x473lRhli7vOoBYxuYoraPH5EITCAemqYP+AkEWMAx/WjMtMyC9llGoNGkWUJHYICH4xiPLp5jLXeE2NFQXkKmk0OS820TTc0tzUQ/F3If7aDAeNta29iGSFuMMtVh1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CYdJIPPS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CYdJIPPS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70FE0C4CEF1;
	Thu, 13 Nov 2025 19:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763063101;
	bh=0VwKaYc35bZVUgu90hr/jsC2a+mJC8giJD4+WvmKtmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CYdJIPPSOEOvnf/bgsK11R2E89RQ7+vEc5reOI2FhvVe9UVPfAItJfBhMQSYjoGv0
	 TNXFpYwpGAm3kQazKFBeEFhmJBXOw2jeikG1SNneO4gp0FOhTlV3pYjUDrryqGGvVW
	 cF5VIdqba1jBzZ6YvMAoSjLCEVCBO8pk8A10cnNxpONJ1ru5wnLwbGyKKF/S1cYyFK
	 kyt0oasNjxwpqKj75d72zVvVJgRpLLL++cfso3ieHF0qj4Hasq9dUqbELt+sp1roY3
	 W1mhVVQ/6D80E7ChaldiPuY4sQVYEzinVKabCn9zyBlXxO0pqxcAgaPojRyQZWFrVk
	 9FNGg4ljOwW3w==
Date: Thu, 13 Nov 2025 19:44:52 +0000
From: Conor Dooley <conor@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Xingyu Wu <xingyu.wu@starfivetech.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Andy Yan <andyshrk@163.com>, Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-phy@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH RFC 01/13] dt-bindings: soc: starfive: Add vout-subsystem
 IP block
Message-ID: <20251113-irritable-unfold-da619d52026c@spud>
References: <20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
 <CGME20251108010453eucas1p2403ec0dd2c69ae7f3eabe19cf686f345@eucas1p2.samsung.com>
 <20251108-jh7110-clean-send-v1-1-06bf43bb76b1@samsung.com>
 <20251111-massager-twistable-1e88f03d82f8@spud>
 <20251111-unsaid-rockslide-67b88b2e34bd@spud>
 <0d8e3a626b037dd348378e5ebca8005c1e715871.camel@icenowy.me>
 <20251112-skating-robust-81be8dee0a8b@spud>
 <1d54524d7ef939232b4512ca59c78794484103ca.camel@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ts3gmjGSebbDWFBm"
Content-Disposition: inline
In-Reply-To: <1d54524d7ef939232b4512ca59c78794484103ca.camel@icenowy.me>


--ts3gmjGSebbDWFBm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 08:48:33AM +0800, Icenowy Zheng wrote:
> =E5=9C=A8 2025-11-12=E6=98=9F=E6=9C=9F=E4=B8=89=E7=9A=84 18:36 +0000=EF=
=BC=8CConor Dooley=E5=86=99=E9=81=93=EF=BC=9A
> > On Wed, Nov 12, 2025 at 02:34:39PM +0800, Icenowy Zheng wrote:
> > > =E5=9C=A8 2025-11-11=E6=98=9F=E6=9C=9F=E4=BA=8C=E7=9A=84 18:36 +0000=
=EF=BC=8CConor Dooley=E5=86=99=E9=81=93=EF=BC=9A
> > > > On Tue, Nov 11, 2025 at 06:18:16PM +0000, Conor Dooley wrote:
> > > > > On Sat, Nov 08, 2025 at 02:04:35AM +0100, Michal Wilczynski
> > > > > wrote:
> > > > > > Add the dt-binding documentation for the StarFive JH7110
> > > > > > Video
> >=20
> > > > > > +patternProperties:
> > > > > > +=C2=A0 "^display@[0-9a-f]+$":
> > > > >=20
> > > > > Personally I'd like to see these being regular properties,
> > > > > since
> > > > > there's
> > > > > exactly one possible setup for this.
> > > > >=20
> > > > > > +=C2=A0=C2=A0=C2=A0 type: object
> > > > > > +=C2=A0=C2=A0=C2=A0 description: Verisilicon DC8200 Display Con=
troller node.
> > > > >=20
> > > > > Can you add the relevant references here instead of allowing
> > > > > any
> > > > > object?
> > > >=20
> > > > I don't think that if you did, this would pass the binding
> > > > checks,
> > > > because there's no "verisilicon,dc" binding. I think I saw one in
> > > > progress, but without the soc-specific compatible that I am going
> > > > to
> > > > require here - if for no reason other than making sure that the
> > > > clocks
> > > > etc are provided correctly for this device.
> > >=20
> > > Well I didn't specify any soc-specific compatible because that IP
> > > has
> > > its own identification registers.
> >=20
> > I still require one because I want to make sure that clocks etc are
> > handled correctly. You can ignore it in the driver if you wish, but
> > when
> > the next user comes along with one more or less clock, I want the
> > jh7110 one to be forced to use the correct configuration.
>=20
> I don't think for those generic IPs requiring a SoC-specific compatible
> is a good idea.

I disagree. If things are complex enough to end up with different
numbers of clocks or power-domains etc on different platforms (which I
believe GPUs are) then I want one for validation purposes on platforms I
care about. What you do in the driver is up to you.

--ts3gmjGSebbDWFBm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRY1NAAKCRB4tDGHoIJi
0k9zAQDvbUM7s4AEGxVxu+wdxmQIgr0MmVDfS6YxVkmZ+4CJIAEAiwMj6RElCUx6
g7Zzf1f3tUc15pHEt8NIVOAt/SqlRQc=
=tccX
-----END PGP SIGNATURE-----

--ts3gmjGSebbDWFBm--
