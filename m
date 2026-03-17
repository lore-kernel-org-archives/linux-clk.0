Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E67B331A7E;
	Tue, 17 Mar 2026 13:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773753539; cv=none; b=qbIk/VWPkRGXYsBKyJHvKZUloCO7tQMouzSVmulFUmTkpzd6aKfMYMHMmLubMmEWe6o/RAI+kXPslWdAymSOn18+j0ZYDA+poSp2e/lKHiYxCaLWEpfFDLvuo5LCCYfxavEaSj/V9OQwlq9c7CjiOIiqfCpTgvGdDpVprW5Nb9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773753539; c=relaxed/simple;
	bh=Rwz1UcM+EXKrHxXWBqhLmZB1BcaZcm+pLkjELfxbvBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iqYl2tzvGVxfNG94PzNBs3G/RC7GPrRt86oEIsgb560Too3aNLeu25PtQX5aLUOrsbz7EmgFU/aWkM0nBVC/0hyvVZsiOmYg9ld1yowtP97Z5RXM2HsAuDAhDWO8IsWzbd1uSuBFU+c3+iUDa6Z/9w+Kh9kJZOmusH0wVgzlLTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ohsE5ww7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ohsE5ww7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEE95C4CEF7;
	Tue, 17 Mar 2026 13:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773753539;
	bh=Rwz1UcM+EXKrHxXWBqhLmZB1BcaZcm+pLkjELfxbvBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ohsE5ww7q0OeA65kM77pCy/xZKRia9QfqxO2o2I8o4c0ZIkOfHpCsgBh/VG8K5+ER
	 RTk2fimgezszf9+bCL7PcOn/mV0xqQJDbKtBiQaidY6v5k9pvLmupg189TDNrbjtEm
	 73nATEWhRzkKbf/H2jxTYBpfHhxXlPr0rUbca4Nhy8Ck6NV7nI7KdEn39ejp7ryti8
	 RvF9qSKoOgehbFTAhkilJkjsoQLQeSJ6RqYvmk1XcLUJZEY0NvIWtHTSHs4/eufyza
	 e4aVzdIU5blIMCJydlXeIiCfDt4JHmmfsafq5FwqKM51mL3ugQMKbuieCrVQbteGgr
	 soaK42JK/7j1A==
Date: Tue, 17 Mar 2026 14:18:56 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Brian Masney <bmasney@redhat.com>, Hans de Goede <hansg@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: add new Kconfig to control default behavior of
 disabling unused clocks
Message-ID: <20260317-lush-rooster-of-progress-9be3bb@houat>
References: <20260316-clk-ignore-unused-kconfig-v1-1-6e95a4fb0c94@redhat.com>
 <20260317-almond-leech-of-correction-2a2ef6@houat>
 <com5zf4bfgb3eoelbmy5pfykhdow6ne3nteua6l7bnzkr72dsb@pehxxygji5z2>
 <90efa4a3-7042-4fdd-9108-9234b0ba9573@kernel.org>
 <ablIc4OkoJvdeddT@redhat.com>
 <vhwd56xafb6wml5podszezzi52e6gdnyv25pgwcpw2u262bgnj@x2uqnjbmb7d5>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="jnkro65yipdyy4fk"
Content-Disposition: inline
In-Reply-To: <vhwd56xafb6wml5podszezzi52e6gdnyv25pgwcpw2u262bgnj@x2uqnjbmb7d5>


--jnkro65yipdyy4fk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clk: add new Kconfig to control default behavior of
 disabling unused clocks
MIME-Version: 1.0

On Tue, Mar 17, 2026 at 03:03:01PM +0200, Abel Vesa wrote:
> On 26-03-17 08:26:27, Brian Masney wrote:
> > Hi Hans,
> >=20
> > On Tue, Mar 17, 2026 at 01:16:33PM +0100, Hans de Goede wrote:
> > > On 17-Mar-26 13:14, Abel Vesa wrote:
> > > > On 26-03-17 08:30:24, Maxime Ripard wrote:
> > > >> On Mon, Mar 16, 2026 at 06:33:45PM -0400, Brian Masney wrote:
> > > >>> At the 2023 Linux Plumbers Conference in Richmond VA, there was a
> > > >>> discussion about how large number of systems need to boot with
> > > >>> clk_ignore_unused. Per the discussions at the conference, the exi=
sting
> > > >>> behavior in the clk core is broken, and there is a desire to comp=
letely
> > > >>> remove this functionality.
> > > >>
> > > >> Broken how?
> > > >>
> > > >> clk_ignore_unused is to a point where it's seriously cargo-culted =
and
> > > >> documented as a silver bullet, when in reality it's just a debug t=
ool
> > > >> for broken drivers, and the driver must be fixed.
> > > >>
> > > >> But nobody is actually fixing it.
> > > >>
> > > >> See
> > > >> https://fedoraproject.org/wiki/Changes/Automatic_DTB_selection_for=
_aarch64_EFI_systems#How_To_Test
> > > >> for example. The affected clock could be marked as CLK_IS_CRITICAL=
, and
> > > >> fedora wouldn't have to package anything, change anything, etc. Bu=
t no,
> > > >> the problem is clk_ignore_unused.
> > > >=20
> > > > Nope. Don't ever mark clocks as critical unless system crashes with=
out
> > > > them.
> > > >=20
> > > > Here is an example or why clocks cannot be marked as critical but n=
eed
> > > > to be kept by the clk_ignore_unused: display driver probes later.
> > > > If you mark it as critical you just made the clock stay enabled even
> > > > when display is off.
> > > >=20
> > > > And this is just one example.
> > >=20
> > > Interesting, so maybe we need a new way flag to mark clocks as not to
> > > be turned off when turning unused clocks off, which does not block
> > > them getting disabled normally later ?
> > >=20
> > > (I was under the mistaken impression this is what CLK_IS_CRITICAL did)
> >=20
> > There's a separate flag CLK_IGNORE_UNUSED that can be used instead.
>=20
> But figuring out which clock needs to stay enabled until whatever
> consumer module is provided and probes is a mess.

And yet, plenty of platforms are doing it just fine.

> The solution is drop the clk_ignore_unused and rely on the sync_state of
> each provider to do the job. Sync state isn't reached until all
> providers probes, therefore the clocks stay on until then.

The problem here isn't that providers have to be there, you said it
yourself, it's about when consumers will be loaded and get their clock.
Either way, sync_states don't seem to move forward much when it comes to
clocks, so it might be something that we converge to eventually, but it
won't help this patch today.

Maxime

--jnkro65yipdyy4fk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCablUwAAKCRAnX84Zoj2+
dlssAX42w9aALNhtNM24xN/j7McQ06rxLHbUD/zW96d7Cpc2EXq52DepnKCK630B
dzi1tuIBgL8KFnab6BN+XY7BKz7N7766vb2GdCRfV6bvMdFeTFRjszhiSBryihie
LbllJLyW9A==
=pnE7
-----END PGP SIGNATURE-----

--jnkro65yipdyy4fk--
