Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB563793CA;
	Wed, 22 Jul 2026 16:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784737425; cv=none; b=rwiaxsQ+BrDl1WSMjQRqpI2JPiO2NquFzslY1yjhM5svTxQ04UKmfYMVh07qxLUz6W8HCUndEzCNA8J89BNBKQziUzCIkPsbafiH7aGD038GTLoRRL/Mf8xGyup1vLf7Ooome2RuYoHEd60gb4mlMZ/0UFe+r3y7mlGjaqTj0Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784737425; c=relaxed/simple;
	bh=X4aOAhCIGbQmkj8pfrFxHkKi8Xrm93t52GBvPKdZXrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k8cxYynXlWi01CRo+QX4EwZyWqu6pm88ieP9azWYC1qmlzHAzrxs9yqN19iF3SpAHdL+MKtgbWFQ1jDgZLEvUOQDWbpF67ZTaqWpgy8vzlSnMidiyrVdUO680NSIrtCVKIO5cewJNqXFVgunbVuDRHwY8QaL9yRCIYp8vXEQgWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=vA6xfOIO; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="vA6xfOIO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=X4aOAhCIGbQmkj8pfrFxHkKi8Xrm93t52GBvPKdZXrs=; b=vA6xfOIOdGbL7huGD/ih26/ABU
	Im2+evznOv+fllB1iqbxLTtiHmj/XMRijTT0QNbDDHxbwbQK1pxWm9dRJ+BwPpnV3FdvwqBudl1sK
	JCnDEZaJcQwmp1YEOJKYRyH06adXqR/RKbhDU5PpBDVw2jjslXKlH8DfOCLHfHe9L+EosVmBMuufV
	3jEIgfMR2661FMvcL4aq41d3Lz8/XRoelHQhEzwcD/mS2hThJ2KhlY6H/h12R76u1XMLq+geRkhaT
	A3z3wLKDRIlJpP6gTdkFlgQJV2jn/GewsULlvbYgVV6CVOGj10eo2XbJlfpTBoJLhSVUlBJL+jtrB
	+naTNsBQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Quentin Schulz <quentin.schulz@cherry.de>,
 Alexey Charkov <alchark@flipper.net>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Wyon Bi <bivvy.bi@rock-chips.com>, Finley Xiao <finley.xiao@rock-chips.com>,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>, YouMin Chen <cym@rock-chips.com>,
 Dragan Simic <dsimic@manjaro.org>, Liang Chen <cl@rock-chips.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] clk: rockchip: Fractional PLL coefficient on RK3588/RK3576 is
 two's complement
Date: Wed, 22 Jul 2026 18:23:10 +0200
Message-ID: <3482742.0oRPG1VZx4@diego>
In-Reply-To:
 <CAKTNdwE=s6XG==4HvbaEV86DATWO6egVxLgNE4LpjFaXNQP7_g@mail.gmail.com>
References:
 <20260721-rk3588-fracpll-v1-1-b289bf17cf17@flipper.net>
 <7f3924ab-52fc-4fb6-91b4-42a5e55d5c76@cherry.de>
 <CAKTNdwE=s6XG==4HvbaEV86DATWO6egVxLgNE4LpjFaXNQP7_g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Mittwoch, 22. Juli 2026, 13:00:47 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Alexey Charkov:
> Hi Quentin,
>=20
> On Wed, Jul 22, 2026 at 2:35=E2=80=AFPM Quentin Schulz <quentin.schulz@ch=
erry.de> wrote:
> >
> > Hi Alexey,
> >
> > On 7/21/26 9:17 PM, Alexey Charkov wrote:
> > > When the PLL rates table was first committed for RK3588 (and later re=
used
> > > for RK3576), the fractional PLL coefficient was defined as an unsigned
> > > value, while the TRM clearly states that it is a two's complement 16-=
bit
> > > value.
> > >
> > > Rockchip's downstream kernel later revised the fractional PLL code [1=
] to
> > > account for the two's complement nature of the coefficient, but that
> > > change wasn't upstreamed.
> > >
> > > Change the PLL table definition to use two's complement for the
> > > fractional coefficient and update its users accordingly.
> > >
> > > Note that a negative fractional coefficient is meant to be subtracted=
 from
> > > the next larger integer multiplier, so the _m values in the table are
> > > also adjusted accordingly for the two negative-k entries.
> > >
> > > While at it, fix the denominator of the fractional PLL calculation to=
 use
> > > 65536 instead of 65535, as per the TRM (RK3576 TRM Part 1 V1.2, Secti=
on
> > > 2.13.1.4 Setting Guide on P, M, S, and K):
> > >
> > > Fout =3D ((m + k/65536) * Fin) / (p * 2^s)
> > >
> > > Link: https://github.com/flipperdevices/rockchip-linux/commit/7a72bc0=
5dcc3a51e85ae531749e6270bf9b9212d [1]
> > > Fixes: f1c506d152ff ("clk: rockchip: add clock controller for the RK3=
588")
> > > Fixes: cc40f5baa91b ("clk: rockchip: Add clock controller for the RK3=
576")
> > > Signed-off-by: Alexey Charkov <alchark@flipper.net>
> > > ---
> > > Not adding Cc stable, because while this fixes a real bug it's not a
> > > regression, as the issue was introduced in the same commit that added=
 the
> > > RK3576/RK3588 support.
> > >
> >
> > I don't think this is a valid reason :)
>=20
> I believe Linus frowns upon changes like "it never worked, but we've
> fixed it now" being submitted as fixes. It's been broken for years,
> and since nobody complained yet, going via the normal development path
> (i.e. -next) seems perfectly fine to me.

Personally, I also don't think this _needs_ a stable tag.
The whole if it ain't broke thing ....

If stable-maintainers do think it valuable on their own (without stable tag)
then by all means, but changing how the PLL rate stuff works has the
_ability_ to introduce other behaviour _somewhere_.


> > In any case, this patch is doing too many things at once. I see the
> > following things that would warrant individual patches:
> >
> > 1) fix the wrong denominator, stable candidate IMO,
>=20
> I could split this one out, but since it's a trivial one-liner, I'd
> like to hear what Heiko prefers.

yes please.
=2D Subject: Foo and Bar
=2D Commit message with "while at it"
are clear indicators that the change wants to get split ;-)

So please split out that "while at it" part. The rest can stay
together though.


Thanks
Heiko


