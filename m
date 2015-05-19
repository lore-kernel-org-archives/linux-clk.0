Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 19 May 2015 22:53:43 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Emilio Lopez <emilio@elopez.com.ar>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 3/8] clk: sunxi: Add a driver for the PLL2
Message-ID: <20150519205343.GZ4004@lukather>
References: <1430565879-28113-1-git-send-email-maxime.ripard@free-electrons.com>
 <1430565879-28113-4-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v64jVksA5rapnAPn9yefEeXnfFw5FwdnXPP0G9FvzWnVBg@mail.gmail.com>
 <20150515074520.GR4004@lukather>
 <CAGb2v64gbY1n4kVBc55hm=jwC3N-eKjWXCgEJr-+J6tYsD7sQA@mail.gmail.com>
 <20150515144439.GZ4004@lukather>
 <CAGb2v67DguLiPKrg_LEo-Fwmfoh8nvv4iPV_4X30RBD-NFHcvg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eDs+MzjklnCQZgvp"
In-Reply-To: <CAGb2v67DguLiPKrg_LEo-Fwmfoh8nvv4iPV_4X30RBD-NFHcvg@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--eDs+MzjklnCQZgvp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2015 at 03:58:09PM +0800, Chen-Yu Tsai wrote:
> >> >> > +#define SUN4I_PLL2_PRE_DIV_VALUE       4
> >> >> > +
> >> >> > +#define SUN4I_PLL2_OUTPUTS             4
> >> >> > +
> >> >> > +static void sun4i_a10_get_pll2_base_factors(u32 *freq, u32 paren=
t_rate,
> >> >> > +                                           u8 *n, u8 *k, u8 *m, =
u8 *p)
> >> >> > +{
> >> >> > +       /*
> >> >> > +        * Normalize the frequency to a multiple of (24 MHz / Fix=
ed
> >> >> > +        * PRE-DIV)
> >> >> > +        */
> >> >> > +       *freq =3D round_down(*freq, parent_rate / SUN4I_PLL2_PRE_=
DIV_VALUE);
> >> >> > +
> >> >> > +       /* We were called to round the frequency, we can return */
> >> >> > +       if (!n)
> >> >> > +               return;
> >> >> > +
> >> >> > +       *n =3D *freq * SUN4I_PLL2_PRE_DIV_VALUE / parent_rate;
> >> >> > +
> >> >> > +       /*
> >> >> > +        * Even though the pre-divider can be changed, we don't r=
eally
> >> >> > +        * care and we can just fix it to 4.
> >> >> > +        */
> >> >> > +       *m =3D SUN4I_PLL2_PRE_DIV_VALUE;
> >> >> > +}
> >> >> > +
> >> >> > +static struct clk_factors_config sun4i_a10_pll2_base_config =3D {
> >> >> > +       .mshift =3D SUN4I_PLL2_PRE_DIV,
> >> >> > +       .mwidth =3D 5,
> >> >> > +       .nshift =3D SUN4I_PLL2_N,
> >> >> > +       .nwidth =3D 7,
> >> >> > +
> >> >> > +       .m_zero =3D 1,
> >> >> > +       .n_zero =3D 1,
> >> >> > +};
> >> >> > +
> >> >> > +static const struct factors_data sun4i_a10_pll2_base_data __init=
const =3D {
> >> >> > +       .enable =3D SUN4I_PLL2_ENABLE,
> >> >> > +       .table =3D &sun4i_a10_pll2_base_config,
> >> >> > +       .getter =3D sun4i_a10_get_pll2_base_factors,
> >> >> > +       .name =3D "pll2-base",
> >> >> > +};
> >> >> > +
> >> >> > +static DEFINE_SPINLOCK(sun4i_a10_pll2_lock);
> >> >> > +
> >> >> > +static void __init sun4i_pll2_setup(struct device_node *node)
> >> >> > +{
> >> >> > +       const char *clk_name =3D node->name, *parent;
> >> >> > +       struct clk_onecell_data *clk_data;
> >> >> > +       struct clk **clks, *base_clk;
> >> >> > +       void __iomem *reg;
> >> >> > +       u32 val;
> >> >> > +
> >> >> > +       reg =3D of_io_request_and_map(node, 0, of_node_full_name(=
node));
> >> >> > +       if (IS_ERR(reg))
> >> >> > +               return;
> >> >> > +
> >> >> > +       clk_data =3D kzalloc(sizeof(*clk_data), GFP_KERNEL);
> >> >> > +       if (!clk_data)
> >> >> > +               goto err_unmap;
> >> >> > +
> >> >> > +       clks =3D kcalloc(SUN4I_PLL2_OUTPUTS, sizeof(struct clk *)=
, GFP_KERNEL);
> >> >> > +       if (!clks)
> >> >> > +               goto err_free_data;
> >> >> > +
> >> >> > +       base_clk =3D sunxi_factors_register(node, &sun4i_a10_pll2=
_base_data,
> >> >> > +                                         &sun4i_a10_pll2_lock, r=
eg);
> >> >>
> >> >> Why aren't you using divs_clk for this? It seems right for the job.
> >> >
> >> > As far as I know, divs_clk can only handle a single divider, and not
> >> > two subsequent dividers like this one uses.
> >>
> >> I thought we were setting the post divider to 4 so the outputs match
> >> the names? Maybe we could get it in as is (with the above comment
> >> addressed), and refactor it later. I'm still stuck on factors_clk
> >> stuff....
> >
> > We are, but the pre-div is considered as the M factor, and the N
> > factor as N, so we can't really consider it as a single divider.
>=20
> Isn't pre-div used by all the clocks?
>=20
> The manual lists:
>=20
> 1X =3D 48*N / pre-div / post-div / 2
> 2X =3D 48*N / pre-div / 4
> 4X =3D 48*N / pre-div / 2
> 8X =3D 48*N / pre-div
>=20
> So couldn't you have a base factor clock as 24*N / pre-div,
> and the outputs as follows?
>=20
> 1X =3D base / post-div
> 2X =3D base / 2
> 4X =3D base
> 8X =3D base * 2

Good thing that it's what was done in this patch then :)

> > Thinking a bit more about this, what we could do though, is splitting
> > the pll2-base clock in half, one that would expose a single divider
> > using clk-divider for the pre-divider, then a factor clock for the N
> > factor, and then multiple dividers for the post-divider and other
> > outputs.
> >
> > I wonder if that could not even be made that way for all the factors
> > clock. That would reduce the needed logic in the drivers a lot.
>=20
> Taking apart what should be an integrated clock into separate parts
> kind of makes the clock tree ugly. :(

But it would remove the amount of code that we maintain, extend and
debug by our own in favor of common, well-tested and factored code.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--eDs+MzjklnCQZgvp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVW6LXAAoJEBx+YmzsjxAguP8P/jBeNnNZsE8ATbQoow5TAfmH
H7lXAwwQtPJ71MuYOcLYrszeYFZC9gd4s79+4SDf5NLAZWjY0o/Or53MVF5HBMsh
CtwlLsHYU5YDRhqdh3akNNApfDS0yhAXcXnEMvgaTep18PQKbEMvNgc0bDqVssk7
UFR25EnepLJ+4ZOuX/vWWy6KudvJBhRh6PfRwJNcDzQFgVU9x6BaO+4ntq+DOiKf
d3/7S3E2fpewrBbnV7HZbfZf4tMGV9T1s2ja/uDdrtXmCvB0ourRSqVyUT4ZAepW
ieJ6HIqvdcxgC2dYdMWfOKtVIyyDcAdrYztbFxPT3DStyxMGS0NpCNfE1R8X2UFU
+ZH0WrB4JKXwwkSY0zg/+m23g7xmQEM7R/ogKziv5Ubf9rYjTnbW5kvbOliMpmW1
U0m5mPX4eaWabfPsWazHOjdYUZjAAKCt2sndQcpzoWTyOUAXz541CgezzZHmWDCa
FaaH2+BdR87F48d/VLGWv/XUnBojr33GxiA2YN3j4jOogyfnk8U0//b91+CUyg5H
cN8JdPIJcE7JnRZyqiDK1ErtZeZ/H8wyOCAtueV2JIxye4B3NfP1IRvSMdCqPfRO
9g/lIAcVEBI8lPpyxiB7yWNf82Xau+mvQUXp+boPATf8p8O7UGlkjE2BiFJff3/W
KqwZrUUlC9G5vvTem+WK
=/gc5
-----END PGP SIGNATURE-----

--eDs+MzjklnCQZgvp--
