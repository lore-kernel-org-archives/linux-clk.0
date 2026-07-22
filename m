Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EC5439F7C;
	Wed, 22 Jul 2026 16:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784736971; cv=pass; b=NG4hWWkI22dw3/Su3P4eMFYkoqTpbNqmWBFz2qaR55CzlIxKIAbhnYaVToTU4LiVpLAdo/E7W0JQjkX2fO3ErZkeldvvvGxixY71qRenp29NXnzO6/MX0NK/I/J6cUg3O+i6poPc6cwy0FETGN3h+qLsMFlDRE+02QV2oRPZOQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784736971; c=relaxed/simple;
	bh=M6pHnweHoy5aN7cOaUlywg+lPDf6Ba0mkFFB6TRU+kI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qh4Y9BXlHFKzYUJLo30C24cDpm49tAiQhQfcjF4TVT7Y7BeV/ehOWwDWihmQvKTnlTP13p+/tcrB6noV1biTpbmP+A0bV+nl/rBFZ9oXfORdrDaxD7kE8Wpi1xARYyIO/Ne6oaaQs8uu7aTRCpf6apDQe0yd+R3xIweNpBAWhIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=Un1pEjbO; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="Un1pEjbO"
ARC-Seal: i=1; a=rsa-sha256; t=1784736938; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PDWqtAHATy4t8nnhTQFIRRfVRp8llenGrkZQRI6i5UzPJfpUr2bmDprLApynVG4eP6SKEX106WqiUM/D5Irj8Z4Rv7KluV2zX94oWr9xEb+CfZxofRQKl0ryOFhzS+/ut1uip1nFR/UwC/5Rc7AcunyZHttMG6rwcja0ZA+FCvc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784736938; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=M6pHnweHoy5aN7cOaUlywg+lPDf6Ba0mkFFB6TRU+kI=; 
	b=a1O3m4W/cRdXGYl9BUxN89hQmXyU6dB5G9jCZcwJ+25eJ6AhbYT1LCVXJ5qazVZrX/RWMX56EFTmV7aMhqqtAMbdun3SL3XvSy+4qJBTCmSCpicUIKC2MqktlOTBgXiDU7zEPZEFfC9fCzKn6eKBwLlFiR0Bmlb6n7Tjoa2KTOg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784736938;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=M6pHnweHoy5aN7cOaUlywg+lPDf6Ba0mkFFB6TRU+kI=;
	b=Un1pEjbOMq4Di5MKWNwwSOtwZfugb8qLZwzBZubTmn2Z/YHvRbxSVDIn0Zr0gIRQ
	JaqZZMLqliB2xcOUS3Q/kRmCIz14nWfsG5SDLl8c2xluvwtM8rUoUjXO0nKcCO0/hRK
	SVYC0tkEcCLCOYM/CUJb+pQ02MGTup33iPjC3DaU=
Received: by mx.zohomail.com with SMTPS id 1784736936244387.407806640693;
	Wed, 22 Jul 2026 09:15:36 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id E5F2618090F; Wed, 22 Jul 2026 18:15:30 +0200 (CEST)
Date: Wed, 22 Jul 2026 18:15:30 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Alexey Charkov <alchark@flipper.net>
Cc: Quentin Schulz <quentin.schulz@cherry.de>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Heiko Stuebner <heiko@sntech.de>, 
	Wyon Bi <bivvy.bi@rock-chips.com>, Finley Xiao <finley.xiao@rock-chips.com>, 
	Elaine Zhang <zhangqing@rock-chips.com>, Detlev Casanova <detlev.casanova@collabora.com>, 
	Sugar Zhang <sugar.zhang@rock-chips.com>, YouMin Chen <cym@rock-chips.com>, 
	Dragan Simic <dsimic@manjaro.org>, Liang Chen <cl@rock-chips.com>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: rockchip: Fractional PLL coefficient on
 RK3588/RK3576 is two's complement
Message-ID: <amDqgsh38FJN0tNC@venus>
References: <20260721-rk3588-fracpll-v1-1-b289bf17cf17@flipper.net>
 <7f3924ab-52fc-4fb6-91b4-42a5e55d5c76@cherry.de>
 <CAKTNdwE=s6XG==4HvbaEV86DATWO6egVxLgNE4LpjFaXNQP7_g@mail.gmail.com>
 <b0111164-3726-4a1b-bc3a-0e678ea2ecad@cherry.de>
 <amDC9ZfBAD2xbhqa@venus>
 <CAKTNdwFEEd2LF0F2E2yR5jPfYB4sh-NaYyXn2GTFwCpACaqAfw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="32vooojpiitecxiz"
Content-Disposition: inline
In-Reply-To: <CAKTNdwFEEd2LF0F2E2yR5jPfYB4sh-NaYyXn2GTFwCpACaqAfw@mail.gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/284.732.17
X-ZohoMailClient: External


--32vooojpiitecxiz
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clk: rockchip: Fractional PLL coefficient on
 RK3588/RK3576 is two's complement
MIME-Version: 1.0

Hello Alexey,

On Wed, Jul 22, 2026 at 05:54:15PM +0400, Alexey Charkov wrote:
> On Wed, Jul 22, 2026 at 5:44=E2=80=AFPM Sebastian Reichel
> <sebastian.reichel@collabora.com> wrote:
> > On Wed, Jul 22, 2026 at 02:59:25PM +0200, Quentin Schulz wrote:
> > > On 7/22/26 1:00 PM, Alexey Charkov wrote:
> > > > On Wed, Jul 22, 2026 at 2:35=E2=80=AFPM Quentin Schulz <quentin.sch=
ulz@cherry.de> wrote:
> > > > > On 7/21/26 9:17 PM, Alexey Charkov wrote:
> > > > > > Not adding Cc stable, because while this fixes a real bug it's =
not a
> > > > > > regression, as the issue was introduced in the same commit that=
 added the
> > > > > > RK3576/RK3588 support.
> > > > >
> > > > > I don't think this is a valid reason :)
> > > >
> > > > I believe Linus frowns upon changes like "it never worked, but we've
> > > > fixed it now" being submitted as fixes. It's been broken for years,
> > > > and since nobody complained yet, going via the normal development p=
ath
> > > > (i.e. -next) seems perfectly fine to me.
> > >
> > > My bet is because of the Fixes: it'll get backported anyway even
> > > if you don't put Cc: stable. In any case, I don't care too much :)
> >
> > FWIW you are mixing up things. Linus does not handle the stable
> > kernels. He does the release candidates and the initial version of
> > every kernel release. The stable releases are handled by the stable
> > maintainers. Linus only said, that he does not want to get these
> > kind of fixes during late -rc phase. That makes sense considering
> > fixes also have a chance of introducing regressions.
> >
> > But if patches end up in a pull request for an -rc kernel or in the
> > pull request for the next merge window depends on the maintainer
> > applying the patch (i.e. Heiko). The maintainer can queue a patch
> > with all those tags into the normal for-next queue targeting the
> > following merge window. This results in the patch being in
> > linux-next for a while, then being added to the master branch during
> > a merge window and then being added to the stable trees (as stable
> > only picks patches that are in mainline).
> >
> > The maintainer can also merge a patch to the queue for -rc kernels
> > without the Cc stable. That is exactly what happens for a regression
> > from a normal patch in the merge window, since the affected patch
> > wouldn't be in any stable kernel.
> >
> > TLDR: The Cc stable tag has nothing to do with Linus.
>=20
> Indeed, I made a logical leap here. In my view, however, this patch
> doesn't need to go into 7.2 fixes (it wasn't broken during the 7.2
> merge window), nor necessarily into stable backports (no-one seems to
> have used the affected PLL rates in older kernels, so there is nothing
> to fix for them either).
>=20
> However, it will become relevant for driving arbitrary display clocks
> for DP video output because several display modes (and consequently,
> PLL rates) I needed for those monitors I tested require new table
> entries with negative PLL coefficients. Those would be 7.3+ material
> anyway.

That's a different argument. FWIW I don't see any issues with not
Cc'ing stable. I suggest to put that info into the commit
description. E.g.:

While this patch fixes a few PLL rates, there are no known users of
the affected rates in the mainline kernel. Thus there is no need to
backport this. The fixed rate calculation will become relevant for
driving arbitrary display clocks for DP video output in the future.

That helps anyone to understand what is going on regarding stable
backport (incl. the bot).

Greetings,

-- Sebastian

--32vooojpiitecxiz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmpg7JcACgkQ2O7X88g7
+pow7Q/9EW+wY9JpCb5S4paI8GIRGS5rnbJay/pUKrWROaoT74PrU4sZgoRaA+bT
84fZ0m28wkZ6ZVKCokysF9IlTL+K3s24Mz3+ZvjKrTo4l7k8t142Rn4yyIeU2bQP
ZbOG13Wr9BSE97oWnXwCWlNNcv3J5BPd/Aw/vlExejhqf/gnw3ZhgBcPC5HFIYGs
IQvmd5rTvj43Q+PgdKQwDmyhTSaLnhn32lmeADODWagnEP803877jq1gkg31aQjn
KyQ4L1JMP2kidNVVwpMrfkUw5wLyZKY3XgjMtNkkMySZwuABNp9rfEFE03MHmzWQ
6eq/KXDgdPohAnpfMoo2GFOdLcvy+9tlkLmRkGTzvL8KUy6PokJThz3049K8tfce
qTbFXvMlQN9sMKHGNX+z9AV00MPMcpmNBGKKY3npNY3MTu60Ycqp0r1WGR16Isxc
LIBRZu1vNyoVoAZRvCClc61buBeJqdaDmhpTwxxm2u8MzBkBwtNAQ6ZLbABJ0qFg
j23YPrmXhcpqEY/h53fW/tBT+6jWskB2caFN7ktB/+YAuvh0HR51qwD0y9lK5U4S
CNs6FiKT9luwrM8fGE1zspOp29xJfiqvii/Dt5OXgYUzqC+ZVL0Ic7jQ12uCxyQ2
LyYhP/3n31ytwDQr6qMPDrPt4OQudGczZFjijnwwPuxGvzOMGUY=
=ssKd
-----END PGP SIGNATURE-----

--32vooojpiitecxiz--
