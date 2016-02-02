Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 2 Feb 2016 18:00:37 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Emilio Lopez <emilio@elopez.com.ar>, heiko@sntech.de,
	Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/5] clk: sunxi: convert current clocks registration to
 CLK_OF_DECLARE
Message-ID: <20160202170037.GZ4652@lukather>
References: <1454402834-6385-1-git-send-email-maxime.ripard@free-electrons.com>
 <1454402834-6385-4-git-send-email-maxime.ripard@free-electrons.com>
 <56B0BA56.10500@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O/sh2HmV2lEgPixT"
In-Reply-To: <56B0BA56.10500@arm.com>
List-ID: <linux-clk.vger.kernel.org>


--O/sh2HmV2lEgPixT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Feb 02, 2016 at 02:16:54PM +0000, Andre Przywara wrote:
> Hi Maxime,
>=20
> On 02/02/16 08:47, Maxime Ripard wrote:
> > The current clock registration and protection code has a few drawbacks,=
 the
> > two main ones being that we create a lot of orphans clock in the
> > registration phase, which will be troublesome when we will start being =
less
> > relaxed about them.
> >=20
> > The protection code also relies on clkdev, which we don't really use but
> > for this particular case.
> >=20
> > Fix both at the same time by moving everyone to the CLK_OF_DECLARE that
> > will probe our clock tree in the right and thus avoid orphans, and by
> > protecting directly the clock returned by our registration function.
>=20
> I very much appreciate this cleanup and like the idea. Any chance we can
> have this rather quickly, so that I can rebase the A64 support series on =
it?

I actually count on that :)

I wasn't really happy about your allwinner,sunxi compatible, so I just
gave you an easier way out ;)

> > +static void __init sun8i_ahb2_clk_setup(struct device_node *node)
> > +{
> > +	sunxi_mux_clk_setup(node, &sun8i_h3_ahb2_mux_data);
> > +}
> > +CLK_OF_DECLARE(sun8i_ahb2, "allwinner,sun8i-a31-ahb2-clk",
> > +	       sun8i_ahb2_clk_setup);
>=20
> I don't find this clock in my tree (which is mripard/sunxi/for-next).
> Instead I only have "allwinner,sun8i-h3-ahb2-clk", as mentioned below.
> But as you remove this clock below from the old code and instead
> instantiate this new clock here, this looks somehow wrong to me. Can you
> confirm this or am I utterly confused?

Damn, you're right, it's just a silly copy-paste issue, I'll fix it.

> Apart from that I checked each and every clock mentioned in this patch
> and can confirm that the transformation is correct. So if you fix this,
> I can send a Reviewed-by.

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--O/sh2HmV2lEgPixT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWsOC1AAoJEBx+YmzsjxAgvpgQAJuVwURGo4lyxMs8GPzFMIaa
cPVL4NRDCH8PBKB59/gj2vmxYqubbCtq7iJMSTm5cPm21EIWrnQazMr/dCTDD4zZ
Bn5qqBpGPaGbPTzf+2bqqkwNxo75XF0P/uLGwCmsM0aWmnruX6OiTXjfnQhUYucR
5PtVTuxy0l2AW4kQlwQ4Gk2RwF3AYBx/9XxsvuO9tFX1GEMThrNBY+njukaKDn/a
rZDdhO6yvYVKLn9v/95eyyTu4O9ZSTzbDRuQvtKXDl7vBTXp+eL1oWHBQAkJsMjZ
/dr87n9GaAhgFoL4DrsYYL1+dfpzHmtvtHESZyBtldHodImY94HVOm8GIB97mPyv
ZP7vEBSJlechtXhmP+j7BCoPzMyBWBLjf6iosmTHVFukAzJ0A1c4u9eTvrWYcGqc
nug7THeaRxKyGlSzfvuALqrdLdiYJ6KQaBRSyfv5i0q0rtf1IFoC2qOSn1dxYEBc
pqZwwHaDqycgUMNUWl81emWR5ccHbMDbs6UBD6KfJKEd8e3rm2VRw7SE/pULds8x
vwxFKjCwHP11MgDAPiu9CglHLKcZYESRObfyWK6yuyeJ0/ZLM+iBtN4uHr07i3gI
SE2+cx65efcRg5zY6ZH9rdL/m9BUsRpm1JPR+IOfCl903947Q0d8wIeVS/JGWTYj
GxTtWyttXfbj7OJD605p
=MHsO
-----END PGP SIGNATURE-----

--O/sh2HmV2lEgPixT--
