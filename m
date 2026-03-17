Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C2B2773C6;
	Tue, 17 Mar 2026 13:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773754370; cv=none; b=Ux1xX25zfAGFESo+VnKpdO+zG8YBxGh5+XCkb0fipu/akVYeOeO178qw7Udr9qcJ+pNd+VaHOukK3yTn08FmzixrH44Dy1ywyHUaXE4+n3QgJSUjfORDMmwWgzhck7GgKpIDn5C/DlMonZJbd3mZuk/bBtI/quFFQyMQon5ryJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773754370; c=relaxed/simple;
	bh=F4Jv1k8QHFRwhplRuDbvrvAdd3Wm2JPDzFW5FAGLFy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vAlOqSsBdNZE2d+sF5kZwlCaCi8aMDzAO/ZqEJMx/JiU/WeD5frJYLasuByCC89I7lwotZEUYrL8XG3Yl6wVTiT0fGjn1h/5xsCyPq20/NFQHOHU32MPpxESvL452zqgNyVPgZFB0OOE+x5r8wp+5X4jMYSBRpHACTNT+7Pa114=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V+lJfDAc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+lJfDAc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73FDCC19425;
	Tue, 17 Mar 2026 13:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773754369;
	bh=F4Jv1k8QHFRwhplRuDbvrvAdd3Wm2JPDzFW5FAGLFy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V+lJfDAcGojGt4c8qyjb+vZWQcrZCFtTpylZ4ZwKkDexDpT+pznr6ISGPv/vAJrxT
	 eyLIhrwEiCxoJJdp3YlZLtf0YXnH63dJ6KAEHp1Eq3J4z6sgwyeVeAjMt3LnM/sfCq
	 Puih1ZIEVWIEqWNTyqpqZeCYf8kgGeTHqyxF6hU3cbjkZpy76KvLaibep3AcIRIfLG
	 g8ISqY2ggIyPlRZqAfgMBfGE1O7XK53f7U0rEXau0dbtpoz/GZWGFi/o6Rjjehe+Y7
	 3LKW4WsrvdXkojIyTLiUCDPR0c7LXa0aGad5w0gViyjFAfUPShfJm8+et7PLoBoNNn
	 Ln6Xi7/LLZkRg==
Date: Tue, 17 Mar 2026 14:32:47 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Hans de Goede <hansg@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: add new Kconfig to control default behavior of
 disabling unused clocks
Message-ID: <20260317-tough-slim-sunfish-fbe9da@houat>
References: <20260316-clk-ignore-unused-kconfig-v1-1-6e95a4fb0c94@redhat.com>
 <20260317-almond-leech-of-correction-2a2ef6@houat>
 <75a9514c-2e62-4535-b963-65a99cdfd3f6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="56z4qrcfxxzpqjgt"
Content-Disposition: inline
In-Reply-To: <75a9514c-2e62-4535-b963-65a99cdfd3f6@kernel.org>


--56z4qrcfxxzpqjgt
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clk: add new Kconfig to control default behavior of
 disabling unused clocks
MIME-Version: 1.0

On Tue, Mar 17, 2026 at 12:53:10PM +0100, Hans de Goede wrote:
> Hi Maxime,
>=20
> On 17-Mar-26 08:30, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Mon, Mar 16, 2026 at 06:33:45PM -0400, Brian Masney wrote:
> >> At the 2023 Linux Plumbers Conference in Richmond VA, there was a
> >> discussion about how large number of systems need to boot with
> >> clk_ignore_unused. Per the discussions at the conference, the existing
> >> behavior in the clk core is broken, and there is a desire to completely
> >> remove this functionality.
> >=20
> > Broken how?
> >=20
> > clk_ignore_unused is to a point where it's seriously cargo-culted and
> > documented as a silver bullet, when in reality it's just a debug tool
> > for broken drivers, and the driver must be fixed.
> >=20
> > But nobody is actually fixing it.
> >=20
> > See
> > https://fedoraproject.org/wiki/Changes/Automatic_DTB_selection_for_aarc=
h64_EFI_systems#How_To_Test
> > for example. The affected clock could be marked as CLK_IS_CRITICAL, and
> > fedora wouldn't have to package anything, change anything, etc. But no,
> > the problem is clk_ignore_unused.
>=20
> Both things can be true at the same time. Yes there are ways to work
> around issues causes by clk_ignore_unused and those ways should be
> used more often. And in example of the X1E laptops I do indeed want
> to try and figure out which clocks must not be turned off and
> try to see if it will be accepted to mark these as CLK_IS_CRITICAL.
>=20
> But at the same time the fundamental concept of turning off all unused
> clocks as soon as all *builtin* drivers are done probing is a broken
> concept when working with generic distro kernels where many drivers
> are modules. To me it looks like this was very much made with
> embedded systems with device specific kernels where all drivers for
> the used SoC are builtin.

It's not about embedded systems, it's about shitty, inconsistent,
closed-source bootloaders. If bootloaders weren't enabling far more than
they require and / or if we could fix them when they do, we wouldn't
have more clocks enabled than we need to.

Removing clk_ignore_unused will just make end users pissed off because
of the higher power draw.

> The problem basically is, that if we want something like disabling
> unused clocks at all (1), it should happen when all drivers including
> those build as module have had a chance to run. ATM the clocks
> simply get turned off too soon.
>=20
> Also see Stephen Boyd's LPC talk about this:
>=20
> "Make sync_state()/handoff work for the common clk framework"
> https://lpc.events/event/17/contributions/1432/
>=20
> When the clk framework maintainer themselves are arguing for
> replacing the way unused clks are disabled atm with something
> better then to me that is a clear sign that there is something
> wrong with the current mechanism.

I have no problem with *replacing* it with something better. I looked at
that talk already, tried to make sync_state work already and suggested
it to Brian too. So I'm not saying it shouldn't replaced.

What I have a problem with is removing it with no viable alternative in
sight.

> Arguably it would be better to tie this into the deferred_probe_timeout
> mechanism with some way for subsystems to register callbacks for
> when the deferred_probe_timeout triggers. This way there will at
> least be some attempt by the kernel to delay it until all probing
> is done.
>=20
> Even though we do really have a problem here I'm not convinced
> that this patch, which allows disabling the entire mechanism
> by default, is a good idea though. There will likely be issues
> with systems consuming more power then they should, especially
> when suspended when unused clocks are not disabled. So allowing
> to change the default behavior will just swap one set of problems
> for another.

I'm glad we're in violent agreement then :)

Maxime

--56z4qrcfxxzpqjgt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCablX/gAKCRAnX84Zoj2+
doPfAYCLal9zcurS4z82B86oIVOwWwd4XPN7FYFMbsvklyfmtuNWdHAXT7jV9SH6
miog42YBf2ba5MqulN9XqvQBoL4d0XIruqcZ9jQ6PPyVoT2OJVYz/AE+AJC2vmRW
IwmBxhDVlQ==
=5r2I
-----END PGP SIGNATURE-----

--56z4qrcfxxzpqjgt--
