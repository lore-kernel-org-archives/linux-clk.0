Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 26 Jan 2016 21:58:52 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Marcus Weseloh <mweseloh42@gmail.com>
Cc: linux-sunxi <linux-sunxi@googlegroups.com>,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org,
	"Mailing List, Arm" <linux-arm-kernel@lists.infradead.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi: Fix mod0 clock calculation to return stable
 results and check divisor size limits
Message-ID: <20160126205852.GT7908@lukather>
References: <1451323892-13060-1-git-send-email-mweseloh42@gmail.com>
 <20160113111809.GA9905@lukather>
 <CAGNoLaMan-qS0Xzz=442gmj_TYBS=Q0tYg=-sdZaYSBbF+5=wg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DOQx4ubtbYINM/to"
In-Reply-To: <CAGNoLaMan-qS0Xzz=442gmj_TYBS=Q0tYg=-sdZaYSBbF+5=wg@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--DOQx4ubtbYINM/to
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jan 14, 2016 at 11:40:15AM +0100, Marcus Weseloh wrote:
> > On Mon, Dec 28, 2015 at 06:31:32PM +0100, Marcus Weseloh wrote:
> >> This patch fixes some problems in the mod0 clock calculation. It has
> >> the potential to break stuff, as the issues explained below had the
> >> effect that clk_set_rate would always return successfully, sometimes
> >> setting a frequency that is higher than the requested value.
> >
> > That's actually the expected behaviour of clk_set_rate.
> >
> > clk_set_rate is supposed to adjust the given clock rate to something
> > that the clock drivers seems fit. It should only return an error in a
> > case where you can't change the rate at all (because you didn't pass a
> > valid struct clk pointer, because changing the rate would violate some
> > clock flags, etc.). Otherwise, clk_set_rate should succeed.
> >
> > By returning an error code the clock is higher than the one passed,
> > you violate that expectation, especially since that is relative to the
> > clock you passed.
> >
> > It makes sense in your case to never exceed the given rate, it might
> > not for a different clock in the tree, or even for a different
> > instance of the same clock. For example, you could very well have
> > another case in your system where you should not have rates set that
> > are below the one given because that would prevent the consumer
> > device to be usable.
> >
> > This is why the adjustment is left to the clock driver, and is not
> > enforced by the framework itself, simply because the framework has no
> > idea how you want to round your clock rate on that particular clock in
> > your system.
>=20
> I understand now, thanks a lot for the good explanation! So my
> thinking is wrong for the general case of the clock framework itself,
> and that actually makes a lot of sense.
>=20
> But the clk_factors_determine_rate function in
> drivers/clk/sunxi/clk-factors.c works on the assumption that the
> returned rate must be less or equal to the requested rate. At least
> that is what the code in that function tries to do. That the mod0
> factor calculation doesn't check the m and div variables for overflow
> undermines the intended behaviour, as it "lies" about the frequencies
> that the hardware can support.

Yeah, that's totally something that needs fixing.

> And for very low frequencies below 80kHz, clk_set_rate does
> currently return -EINVAL. There are even cases when it results in a
> division by zero error, for example if you request a rate of 94kHz
> from a 24Mhz parent (24000000 / 94000 =3D 255,32, rounded up to 256 =3D
> 0 on the u8 variable).

Yeah, the division by 0 is bad... However, can you even generate 80kHz
frequencies using a module clock? The lowest I can see here is 180kHz
(24M / 8 / 16).

> Now I'm unsure what to do here... If the clock driver should only
> return an error in real error cases and not when the requested
> frequency isn't reachable, then clk_factors_determine_rate needs to
> be changed as well?

If it returns an error in such a case, yeah. Also, I think in such a
case, we can simply round to the minimal frequency we can reach
(without an error or a kernel panic, that would be ideal ;))

> >> An example:
> >> parent_rate =3D 24Mhz, freq =3D 1.4Mhz results in p=3D1, m=3D9, freq=
=3D1333333,3333
> >> (which gets rounded down to 1333333).
> >> Calling the function again with parent_rate =3D 24Mhz and freq =3D 133=
3333
> >> results in p=3D1, m=3D10, freq=3D1200000.
> >>
> >> Rounding up the returned frequency removes this problem.
> >>
> >> Signed-off-by: Marcus Weseloh <mweseloh42@gmail.com>
> >> ---
> >>  drivers/clk/sunxi/clk-mod0.c | 7 +++++--
> >>  1 file changed, 5 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/clk/sunxi/clk-mod0.c b/drivers/clk/sunxi/clk-mod0=
=2Ec
> >> index d167e1e..d03f099 100644
> >> --- a/drivers/clk/sunxi/clk-mod0.c
> >> +++ b/drivers/clk/sunxi/clk-mod0.c
> >> @@ -31,7 +31,8 @@
> >>  static void sun4i_a10_get_mod0_factors(u32 *freq, u32 parent_rate,
> >>                                      u8 *n, u8 *k, u8 *m, u8 *p)
> >>  {
> >> -     u8 div, calcm, calcp;
> >> +     unsigned int div, calcm;
> >> +     u8 calcp;
> >>
> >>       /* These clocks can only divide, so we will never be able to ach=
ieve
> >>        * frequencies higher than the parent frequency */
> >> @@ -50,8 +51,10 @@ static void sun4i_a10_get_mod0_factors(u32 *freq, u=
32 parent_rate,
> >>               calcp =3D 3;
> >>
> >>       calcm =3D DIV_ROUND_UP(div, 1 << calcp);
> >> +     if (calcm > 16)
> >> +             calcm =3D 16;
> >>
> >> -     *freq =3D (parent_rate >> calcp) / calcm;
> >> +     *freq =3D DIV_ROUND_UP(parent_rate >> calcp, calcm);
> >
> > While the two above seems harmless, this one concerns me a bit. Did
> > you test the various mod0 clock users and made sure that they were
> > still working as they used to?
>=20
> No, I didn't do a thorough test, only booted the board with some mod0
> users (mmc, spi, ss) and watched them request their frequencies
> successfully. But this is an edge case, only affecting certain "weird"
> frequencies. And the only effect is that the chosen frequency is not
> the optimal one. So maybe I should drop it because it looks too
> disruptive for too little gain?

I'm guessing the other changes are fine. I'm a bit worried about this
one, but we still have quite some time before the 4.6 release. We can
always merge it, and deal with the fallout.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--DOQx4ubtbYINM/to
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWp94MAAoJEBx+YmzsjxAgj3IQAIxjXhntmyiTDKsw6wGUNrV/
nHxJBoA+ZUnyxguU1OsxV8idGafDM6oFCPY1DA4e7BsG8NQJOVH1A7rGR3TK+KUa
Y17ql5esKehon5UMAWbhRAl0QYRuK/h13iqfDnMf9roQmdXJOX5wLuX+C3r4IIv3
dpgO7uMQNU1KU1eamsEoHwa37ytVdM/DgGyrRH36EZZD+0a3F7H/aCdvoGceK48m
XJYyrW6S3J4rzmRMQr4Iu27k35GvZGDeiV2SHPYcjC4IuM9gwSK6X8kroAU5ep04
vKWfNhN/6pvUvFQ5PDS71lJsuv3v50wUg+997bFfxhDew2sbyOT4J0Hz/7WpwwEQ
UZm31M54lLd9hvHik0Irdn7yPTpU2J0G7Pia1dnm3/wKW0e9s3pIgwn75qcP8KUq
hCdfHqLQkT6Dt1EngHV6ilHPikbeKe9siLaxTy7g2YGVXvqIs7ESFVznWpmb4LuI
vTm+F/URzLB/wLEh7p4jAvy9i3TBwc3qACQRdhaht7kiWcbrCzXdlbHvAK+/9JGq
s2wa9yJxHdgP9U6PFLy3sTZhlDN2oD1TnBIf2IANmtp43CtI3tWqQBi78KsFoQIg
ZHCzinCwKYt7lqD5F7Gc9S3rVBiiDq2FsmmM4Ve+DnPiRLr0AfCbxKE77grQrORN
cK5ib6NWWRkub7LzGMa5
=2e6P
-----END PGP SIGNATURE-----

--DOQx4ubtbYINM/to--
