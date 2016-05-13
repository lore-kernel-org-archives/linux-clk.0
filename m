Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 13 May 2016 09:50:00 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Vishnu Patekar <vishnupatekar0510@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 01/16] clk: fix critical clock locking
Message-ID: <20160513075000.GB3733@lukather>
References: <1462737711-10017-1-git-send-email-maxime.ripard@free-electrons.com>
 <1462737711-10017-2-git-send-email-maxime.ripard@free-electrons.com>
 <20160509221146.GS3492@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xShVoZav8KYWC5Dk"
In-Reply-To: <20160509221146.GS3492@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>


--xShVoZav8KYWC5Dk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Mon, May 09, 2016 at 03:11:46PM -0700, Stephen Boyd wrote:
> On 05/08, Maxime Ripard wrote:
> > The critical clock handling in __clk_core_init isn't taking the enable =
lock
> > before calling clk_core_enable, which in turns triggers the warning in =
the
> > lockdep_assert_held call in that function when lockep is enabled.
> >=20
> > Add the calls to clk_enable_lock/unlock to make sure it doesn't happen.
> >=20
> > Fixes: 32b9b1096186 ("clk: Allow clocks to be marked as CRITICAL")
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
>=20
> Why is this patch hiding in this series?

Sorry, I discovered it while working on this, and somehow it slipped
in there. I'll resend it separately.

>=20
> >  drivers/clk/clk.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >=20
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index ce39add5a258..16a38df3c688 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -2404,8 +2404,15 @@ static int __clk_core_init(struct clk_core *core)
> >  		core->ops->init(core->hw);
> > =20
> >  	if (core->flags & CLK_IS_CRITICAL) {
> > +		unsigned long flags;
> > +
> > +		clk_prepare_lock();
> >  		clk_core_prepare(core);
> > +		clk_prepare_unlock();
>=20
> It looks like we already hold the prepare lock at this point.

You're right. I thought I removed it, but obviously I didn't.

I'll send a v2.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--xShVoZav8KYWC5Dk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXNYcoAAoJEBx+YmzsjxAgjOgP/AyH2Qa+JZ/wVmdPJKO5cizR
qEHtPxMkxCYLfzvdlsQmix7DePQqkLvWTq0YxzwyyAQnilrpJ991ywcQj0IF4XLU
4o1cNoi8GH+V3BtbOvBEUnqtr3jdBQH6oZ7cRXL2J6nYNsj0NSIMeJOnnofLduLD
9MY3JBn1RZ90M46E4RO1cyuGatwzL9q031EsfOecs3HSx+BFjGd+NCiNSts+TscD
2Q6B4k+a1vYI58mPqpC4dkaQfXwgOZ5/6H8P9UmxlzdIHd3bzB+BXI7Lhm/2Ngkn
MKi9PboEDGsBp5jtDIFobhAOoPhiX0XvQNHLPPlKQShgwO5JjS1MSRf5otpfzIqv
A50WRyIKnKAI+p01qHG1IXt8XeCqcSAKbQmIdEsGigKhs6JrhSuZCoxpONQyCrcA
jzber/lNq8itm3aYHkYkoHCzEU08AXCwhn4GABBp0BjbwGxnBLqzI/z8NIpbdCOW
UrPFr9R4BEvFonjnOhDADsfs8CA2Ujl80A8ZZ19bTsdQNx38+pzDYVfLEiQxjKjd
HMK5r4GgICZa0g/ol2V82fUHp8+aQRQa5JFC83U5WqO2vBunrgfTp0PZK0Q8bmiy
5ax7nvrLGCSRhfL+x0B1gpPD/HnPdG7ZuQUcZUB5LOI7w3+9ZyBPsr4mI0aaVPq6
SVIvdo7b06P4gvIBk/Ns
=ImZV
-----END PGP SIGNATURE-----

--xShVoZav8KYWC5Dk--
