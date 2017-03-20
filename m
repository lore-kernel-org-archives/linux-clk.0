Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 20 Mar 2017 10:51:08 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>,
	Rob Herring <robh@kernel.org>, linux-clk@vger.kernel.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: sunxi: ccu-sun5i needs nkmp
Message-ID: <20170320095108.nru6wnl5lcigzsoc@lukather>
References: <20170214213005.2848151-1-arnd@arndb.de>
 <20170216175318.fuj375743jt43um4@lukather>
 <CAK8P3a13rqommB90NP_aNPgcoYXb9u=LYs7ep3U=c3C6-3wPHA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3orsvpvjuayvl3ib"
In-Reply-To: <CAK8P3a13rqommB90NP_aNPgcoYXb9u=LYs7ep3U=c3C6-3wPHA@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--3orsvpvjuayvl3ib
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Mon, Mar 13, 2017 at 05:24:10PM +0100, Arnd Bergmann wrote:
> On Thu, Feb 16, 2017 at 6:53 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > On Tue, Feb 14, 2017 at 10:29:45PM +0100, Arnd Bergmann wrote:
> >> A randconfig build ran into this rare link error:
> >>
> >> drivers/clk/sunxi-ng/ccu-sun5i.o:(.data.__compound_literal.1+0x4): und=
efined reference to `ccu_nkmp_ops'
> >> drivers/clk/sunxi-ng/ccu-sun5i.o:(.data.__compound_literal.7+0x4): und=
efined reference to `ccu_nkmp_ops'
> >>
> >> This adds the missing 'select'.
> >>
> >> Fixes: 5e73761786d6 ("clk: sunxi-ng: Add sun5i CCU driver")
> >> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >
> > Queued as a fix for 4.11, thanks!
>=20
> I just checked my old patches and this seems to still be required as of
> 4.11-rc2. I see it in linux-next through sunxi/sunxi/for-next, but not as
> part of a clk-fixes merge.

Sorry, I went to holidays without sending the PR. I just did,
hopefully, it should be on Linus' way for the next rc.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--3orsvpvjuayvl3ib
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYz6YMAAoJEBx+YmzsjxAgZb4P/3hyjS2OF9sVng2Qq+hYKvrF
Vcth7i5XiDAGBTslmoBP29yV4BRZJnow6jTtBc4+STdW40W7LMuVwYcPlmkbKkx+
3IjfS0bowyDj5ApmASh0LUztZdaK5uOuPE17+nMKxHvznenefqvfCYGCfjRYJDNf
HsPit7dRKKTBt/zcc+t/dimYHkBxxo4Mm+kaQJg76EfZMcf+SSmlAZNzt1mV0zby
xCBT7Y02GPIlHjveS+1wQssLzxZrN6yEZHZt+ZoSKV8NJRzuVMxQWcr6VXfSFlSa
f8ZZMMZvEzA2EcX7J3hp6waFPxzrRtifzCRzYjFzTl8/Eh3+Vk81uvdvltrdCHGC
9ngWPWU837nZixDFIYghhH7jYj6GoE/gU1MxtroqDJXaNUJSuH5kWPCNiFav+gqz
1bbZfJg8FMEKcnVQWcoKeSYSeChpHiqBgPbuOUXgRQ09KVMT35jBnTmeEzaSok5i
HZ1PBO8wWH2pvQMuEbloSHAuzpAvD1XzYCqAh3d59Xu6qz3lIK5EmX4ut2RIm5P5
Bbfzl6cQ7ibJDKklp+U+n50m//h+YoDSzyx4iPpTsb4Zi2vK2vypryyZyqidAKBS
clUBYL0FiPif6FR4yqyPG+dMdJ51tWkXS+K/0LsaoOkSnsaXb9JYp5BqNYiMLuyy
wStoEqHLv2bVQfkRHkXi
=7BPz
-----END PGP SIGNATURE-----

--3orsvpvjuayvl3ib--
