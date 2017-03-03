Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 3 Mar 2017 10:53:33 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/5] clk: sunxi-ng: Add driver for A83T CCU
Message-ID: <20170303095333.hgxoli2h7clailvo@lukather>
References: <20170214033526.16977-1-wens@csie.org>
 <20170214033526.16977-5-wens@csie.org>
 <20170214095819.utsftcvti5zdmlmi@lukather>
 <CAGb2v66PxbhUdqSwFc5iFN2wDVQbOsibDkckXpFsxXW1WJNe3w@mail.gmail.com>
 <20170215094954.h3wyaxlqkeb342yu@lukather>
 <20170301191705.GS25384@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="afpdob5wjxivssig"
In-Reply-To: <20170301191705.GS25384@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>


--afpdob5wjxivssig
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen

On Wed, Mar 01, 2017 at 11:17:05AM -0800, Stephen Boyd wrote:
> On 02/15, Maxime Ripard wrote:
> > On Tue, Feb 14, 2017 at 06:26:39PM +0800, Chen-Yu Tsai wrote:
> > > On Tue, Feb 14, 2017 at 5:58 PM, Maxime Ripard
> > > <maxime.ripard@free-electrons.com> wrote:
> > > > On Tue, Feb 14, 2017 at 11:35:25AM +0800, Chen-Yu Tsai wrote:
> > > >> +/*
> > > >> + * MMC2 supports what's called the "new timing mode". The CCU and=
 the MMC
> > > >> + * controller must be in sync about which mode is used. The new m=
ode moves
> > > >> + * the clock delay controls (and possibly the delay lines) into t=
he MMC
> > > >> + * block. Also, the output of the clock is divided by 2. The outp=
ut and
> > > >> + * sample phase clocks are unused under this mode.
> > > >> + *
> > > >> + * This new mode seems to be preferred. Hence we force this clock=
 to the
> > > >> + * new mode. And we don't add the phase clocks.
> > > >> + */
> > > >
> > > > I'm sorry, but I said this several times, this isn't working. We
> > > > should model it properly, and not hack this around in the clock
> > > > driver.
> > > >
> > > > As you say in your comment, the MMC driver needs to be aware about
> > > > which mode is used, in order to also set a bit in one of its regist=
ers
> > > > accordingly, and modify its sampling behaviour.
> > > >
> > > > The new timing is preferred, but our previous clock implementations
> > > > didn't hardcode it, so we can't even rely on that behaviour to alwa=
ys
> > > > write it in our driver.
> > >=20
> > > Correct. With the A83T there has never been a merged clock driver tho=
ugh.
> > > I realize this is a one off thing.
> > >=20
> > > > This is not something specific to the A83T, but is found in all the
> > > > SoCs since the A23, so we need to come up with a good solution to
> > > > address that.
> > > >
> > > > I'm not sure what a good solution would be though. One would be to
> > > > just have a private function of our own to switch in the new mode (=
if
> > > > relevant, because only the MMC2 controllers have it), but that would
> > > > lead to troubles with !sunxi-ng. Not something we can't deal with, =
but
> > > > some extra precautions should be taken (make sure to protect the ca=
ll
> > > > through an ifdef / IS_DEFINED, check that the sunxi-ng driver has b=
een
> > > > probed, etc.)
> > >=20
> > > If the custom function route is acceptable, I'll come up with somethi=
ng.
> >=20
> > I think it would be a great start yes. I'll try to discuss it with
> > Mike and Stephen at ELC and see what they think about that.
> >=20
>=20
> I didn't hear anything at ELC.

Yeah, sorry, I ended up discussing this with Mike.

> Can someone explain what the issue is? Could something like
> clk_get_phase() + clk_get_rate() tell us if we're in one mode
> vs. the other?

So we have two modes of operation for that clock, old vs new (I know,
I didn't pick the names).

The old mode is what we support right now. It has a combination of a
linear multiplier and divider, plus some phase controls.

The new mode however disables the phase controls and adds post-divider
of 2 on the rate.

We cannot really rely on the rate itself, since there's a huge overlap
between the rates we can obtain in the old and new modes. Same thing
for the phase, having a 0 deg phase is achieved both in the old and
new modes.

To make things worse, the new mode is only available on one out of
three MMC controllers (and associated clocks), and that MMC controller
needs to set a bit as well to switch to the new mode if needed. So we
definitely needs some synchronisation there, and also to be able to
retrieve if the mode switching is available, and if we're already
using that mode.

Mike agreed that the easiest way forward was to use a custom function.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--afpdob5wjxivssig
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYuT0ZAAoJEBx+YmzsjxAgCVYQAKoZWsFI0CYygLxeogubw9zQ
SnMB4hhU0wDkMvjcDuF+9IfLWStSulSKAxZtd7l8J6O39RsdqCAEIPJFSTYA86ig
Vq5Wvkgny6p7wM0d4mULgrBDZK3Ft99z9ZBPMmU2nyASOOwMzsCzqZ1zq3vP6ZBR
zzq6I2m8ZnlbJm2CY3Q+CNeNmOwdgtmvuBOoPmSyCI/eXciMVnT8aBydBbBCASHr
5/W0Jwb2rCmLQompXKZ6gT5/usvpe7JHz83dJC4AHxRqe9knnPho+Uy/xt4J54HW
xGiUKB/o/KYl/dRXPK+QOuASRUI+Pa4Kb4Dg/3Hp+GZg0VRvcP32mSz3RxEZHV6g
C11tEf5N85cRPcKQzGQGEzNV+mk4pdecHt7R7Jo8ce5WcTRPRlyjmXCJWDlwF2Bp
0BJBlJfw2M7lzlg4Vb5U7TJCiFoC42ozrZkStkDy3xB91nhDmcgpGQ9GhM9KBa//
z9ySBJnPYRwTARhhcIuI3IC3D7EX59ascEIDFk3rZhU/PdYPyIdecTw/UDg5HzTw
WxDq5+k17Oa1BhuTd+dEtMpoceZYst58ISSb1fZw14tQDGX+MS7LdUqv8hVFvKDf
77idJZPtGNrXDMNgFLZYS8dVfNjw7jA+PrfVW3REIaXQjZmKxnoz9hC8MYn8X8+i
xT+DynwbY7bIR0KtWLIj
=W99n
-----END PGP SIGNATURE-----

--afpdob5wjxivssig--
