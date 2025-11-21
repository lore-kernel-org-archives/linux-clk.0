Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F1B34A77F;
	Fri, 21 Nov 2025 16:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763741379; cv=none; b=HNDHX0AlEp6osY+AfXtSItHFqOQYbBi9RI+mSQ467LjlY/3ujgTIZOGiJIisHw3OudXILJybR7BhW4ekYxThgKLQDmRNXzO4lwZfqId7dMpjZp3XiFp7keZ2D0bDjcpRoKJ6mU1FLOnKlVtnOdBeefy+NLIApUm4AE9OOEA/Lzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763741379; c=relaxed/simple;
	bh=nG7P1oCjgzr374XwEfDpCU0otxlN/IxC1AL7zG7plW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GSUJ1Z/8E6/jbmNrODgmTQgcp3Xs36ixhwysIePGYXeJZIpNQPI2XayhgY20nT2WUrt3+tWzfUUnArfWsQH0CdZh226xIY1rvKzBi2LBqcs0BBhvJrxv8YEUDtjq8VPKwdZ2RFqBm5ruiuPHPtm/zhuwndL8lFKjBv3+/xHznwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TUg3r7vF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TUg3r7vF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5813DC4CEF1;
	Fri, 21 Nov 2025 16:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763741378;
	bh=nG7P1oCjgzr374XwEfDpCU0otxlN/IxC1AL7zG7plW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TUg3r7vFrPHLbI6POotsYVdnrzH9JhWbjCNzW/mST+9BrMXS4WcH8/QtX9DxbnyxC
	 1GzsCbsIH2mXidYQh6+k3ynj4OZs8xdX1o224BVfFyZ0qyGgnm3QR8sNXIKxCo4vRz
	 gexxfq54Rj1xxk+VOcI9zeq3UUY/Plw1uCaqju1FQAYz9bUsxBgfTkz5QBt0+5FKZ5
	 Zw0V7KOXfoyvgkIZLW0pQewB89tpJHdVvwmTdY2y6vrsHOn3VXhomMBfU5b7dzLAea
	 yhMUWq35U/+yVw+UMppaCDeAjirpenMAFH55ToFz/DhnwiUCwTfI29flSUey54mJY1
	 JL7Zu1gEamdPQ==
Date: Fri, 21 Nov 2025 17:09:36 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC v4 00/12] clk: add support for v1 / v2 clock rate
 negotiation and kunit tests
Message-ID: <mbbwnxoik3qhy6gcwglfdch2v2gdhz3uqoaeu3xujnec6uwnoy@lqexuvwyjyny>
References: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
 <20250925-eager-delectable-frog-fcbb5d@penduick>
 <aNVPqHldkVzbyvix@redhat.com>
 <20250930-brawny-pastel-wildcat-4ba8d8@houat>
 <aRfH35-jhM-qOrbb@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="5fgelsmvohxxbmes"
Content-Disposition: inline
In-Reply-To: <aRfH35-jhM-qOrbb@redhat.com>


--5fgelsmvohxxbmes
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC v4 00/12] clk: add support for v1 / v2 clock rate
 negotiation and kunit tests
MIME-Version: 1.0

On Fri, Nov 14, 2025 at 07:22:55PM -0500, Brian Masney wrote:
> Hi Maxime (and Stephen),
>=20
> On Tue, Sep 30, 2025 at 01:28:52PM +0200, Maxime Ripard wrote:
> > On Thu, Sep 25, 2025 at 10:20:24AM -0400, Brian Masney wrote:
> > > On Thu, Sep 25, 2025 at 02:14:14PM +0200, Maxime Ripard wrote:
> > > > On Tue, Sep 23, 2025 at 10:39:19AM -0400, Brian Masney wrote:
> > > > > The Common Clock Framework is expected to keep a clock=E2=80=99s =
rate stable
> > > > > after setting a new rate with:
> > > > >=20
> > > > >     clk_set_rate(clk, NEW_RATE);
> > > > >=20
> > > > > Clock consumers do not know about the clock hierarchy, sibling cl=
ocks,
> > > > > or the type of clocks involved. However, several longstanding iss=
ues
> > > > > affect how rate changes propagate through the clock tree when
> > > > > CLK_SET_RATE_PARENT is involved, and the parent's clock rate is c=
hanged:
> > > > >=20
> > > > > - A clock in some cases can unknowingly change a sibling clock's =
rate.
> > > > >   More details about this particular case are documented at:
> > > > >   https://lore.kernel.org/linux-clk/20250528-clk-wip-v2-v2-2-0d2c=
2f220442@redhat.com/
> > > > >=20
> > > > > - No negotiation is done with the sibling clocks, so an inappropr=
iate
> > > > >   or less than ideal parent rate can be selected.
> > > > >=20
> > > > > A selection of some real world examples of where this shows up is=
 at
> > > > > [1]. DRM needs to run at precise clock rates, and this issue show=
s up
> > > > > there, however will also show up in other subsystems that require
> > > > > precise clock rates, such as sound.
> > > > >=20
> > > > > An unknown subset of existing boards are unknowingly dependent on=
 the
> > > > > existing behavior, so it's risky to change the way the rate negot=
iation
> > > > > logic is done in the clk core.
> > > > >=20
> > > > > This series adds support for v1 and v2 rate negotiation logic to =
the clk
> > > > > core. When a child determines that a parent rate change needs to =
occur
> > > > > when the v2 logic is used, the parent negotiates with all nodes i=
n that
> > > > > part of the clk subtree and picks the first rate that's acceptabl=
e to
> > > > > all nodes.
> > > > >=20
> > > > > Kunit tests are introduced to illustrate the problem, and are upd=
ated
> > > > > later in the series to illustrate that the v2 negotiation logic w=
orks
> > > > > as expected, while keeping compatibility with v1.
> > > > >=20
> > > > > I marked this as a RFC since Stephen asked me in a video call to =
not
> > > > > add a new member to struct clk_core, however I don't see how to d=
o this
> > > > > any other way.
> > > > >=20
> > > > > - The clk core doesn=E2=80=99t, and shouldn=E2=80=99t, know about=
 the internal state the
> > > > >   various clk providers.
> > > > > - Child clks shouldn=E2=80=99t have to know the internal state of=
 the parent clks.
> > > > > - Currently this information is not exposed in any way to the clk=
 core.
> > > >=20
> > > > I recall from that video call that Stephen asked:
> > > >=20
> > > > - to indeed not introduce a new op
> > > > - to evaluate the change from top to bottom, but to set it bottom t=
o top
> > > > - to evaluate the rate by letting child clocks expose an array of t=
he
> > > >   parent rates they would like, and to intersect all of them to fig=
ure
> > > >   out the best parent rate.
> > > >=20
> > > > It looks like you followed none of these suggestions, so explaining=
 why
> > > > you couldn't implement them would be a great first step.
> > > >=20
> > > > Also, you sent an RFC, on what would you like a comment exactly?
> > >=20
> > > Stephen asked me to not introduce a new clk op, however I don't see a
> > > clean way to do this any other way. Personally, I think that we need a
> > > new clk op for this use case for the reasons I outlined on the cover
> > > letter.
> >=20
> > So his suggestion was to base the whole logic on clk_ops.determine_rate.
> > You're saying that it would violate parent/child abstraction. Can you
> > explain why you think that is the case, because it's really not obvious
> > to me.
> >=20
> > Additionally, and assuming that we indeed need something similar to your
> > suggestion, determinate_rate takes a pointer to struct clk_rate_request.
> > Why did you choose to create a new op instead of adding the check_rate
> > pointer to clk_rate_request?
>=20
> Sorry about the delayed response. I've been busy with other projects at
> work.
>=20
> I attached a patch that puts the negotiate_rates member on struct
> clk_rate_request instead of struct clk_ops. In order to get this to
> work, it also required adding it to struct clk_core and
> struct clk_init_data as well. I made this so that this patch applies
> on top of this series.
>=20
> I think the clk_rate_request approach is very ugly, and adding it to
> struct clk_ops like I have it in this series is the way to go.

I think I'm still confused about why we need negociate_rates in the
first place.

IIRC, Stephen's suggestion was something along the lines of "let's make
determine_rate optionally return a list of possible parent rates in
clk_rate_request and make the core find the intersection".

Why do we need to involve the driver in such a scenario, and using
negociate_rate in particular?

> I'm giving a talk at Linux Plumbers in Tokyo next month:
>=20
>     Fixing Clock Tree Propagation in the Common Clk Framework=20
>     https://lpc.events/event/19/contributions/2152/
>=20
> Stephen will be there as well, and hopefully we can reach consensus
> about an acceptable approach to fix this.

Yeah, discussing it at plumbers would probably be a good idea, and maybe
try to record / transcribe the meeting so we can have the minutes too
somewhere?
Maxime

--5fgelsmvohxxbmes
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaSCOvwAKCRAnX84Zoj2+
dvkHAYDI4mb/Yf6jo+x4KMwkGdi6B3EL2mWHQEzt9alv2kyPnXaa7n1A0qV5kQca
JulkJrMBgPZxz7LkVuq1aIiWHurtmsjbtWGCuD9z/RTx0cqCx7or04LhgTA53jbg
O4SLO7qo2w==
=cpRy
-----END PGP SIGNATURE-----

--5fgelsmvohxxbmes--
