Return-Path: <broonie@sirena.org.uk>
Date: Thu, 11 Aug 2016 14:28:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20160811132824.GR9347@sirena.org.uk>
References: <1470915049-15249-1-git-send-email-broonie@kernel.org>
 <CAMuHMdVhd6qk4g98xEXZYjf4qnwTT5=hKu-o8YRJXWNFQREueQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ctZH5Gqgrl5HoVnD"
In-Reply-To: <CAMuHMdVhd6qk4g98xEXZYjf4qnwTT5=hKu-o8YRJXWNFQREueQ@mail.gmail.com>
Subject: Re: [PATCH] clk: Make clock framework user selectable
List-ID: <linux-clk.vger.kernel.org>


--ctZH5Gqgrl5HoVnD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 11, 2016 at 01:50:08PM +0200, Geert Uytterhoeven wrote:
> On Thu, Aug 11, 2016 at 1:30 PM, Mark Brown <broonie@kernel.org> wrote:

> > Unfortunately some architectures do still provide a custom implementation
> > of the clock API which is incompatible with common clock. Provide a config
> > option HAS_CUSTOM_CLK which these architectures can select in order to
> > prevent COMMON_CLK being enabled.

> The list is not that long anymore, so it looks fixable with not too much
> effort:

Yeah, it's probably a good project for someone.  TBH my main goal here
was to stop x86 blocking use of the clock API.

--ctZH5Gqgrl5HoVnD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXrH13AAoJECTWi3JdVIfQuR4H/1e7flPe8WXLwPujknUNRzkJ
ORMQ5Mv3G+SPj85LU4W0FLUw48WXpA3BuJ4jl3pMRQkeaQ+ojK7vkPOx8+zXouAD
4LlVZ0//60dPbaDDPMetHpanJjYZ1F1KN42r7zpUBEQD6xaNMXEkSxAP1XjQJBcP
sFgRikXvcjo5uI3O0zOS/m5yDcRuZ5t9nB8SS0IghCcqhbxKQi7E5GkYIiXcC4MD
zP+ncyYjkrg9bKmjBNIvPKx5/jNJ2U6Zc8opDAy5emZotldZYamiiBnobPsvYFji
5NUsXpj4wktR+7Q3mHIK6X4iAXlhB45TOoUHE6/x3RsTSyrYyDWWOK5jv6isj5Y=
=8LZ4
-----END PGP SIGNATURE-----

--ctZH5Gqgrl5HoVnD--
