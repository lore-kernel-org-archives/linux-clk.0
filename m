Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 24 Oct 2016 17:58:44 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Jonathan Liu <net147@gmail.com>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [linux-sunxi] [PATCH v5 3/4] Documentation: devicetree: add
 vendor prefix for Pine64
Message-ID: <20161024155844.biwcobiuxqmcpqk2@lukather>
References: <cover.f18c0f482ef4459b5c8f6eb5828fcb6762440974.1476986335.git-series.maxime.ripard@free-electrons.com>
 <73852fb92ac0aeec294dc9883cf235d9fa74a07b.1476986335.git-series.maxime.ripard@free-electrons.com>
 <CANwerB36N8q7ppKqocRs9m62h65+vrJFn37ncc-oh+Yozz_vFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="re7bdvfctnt65zwg"
In-Reply-To: <CANwerB36N8q7ppKqocRs9m62h65+vrJFn37ncc-oh+Yozz_vFQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--re7bdvfctnt65zwg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jonathan,

On Fri, Oct 21, 2016 at 11:30:01AM +1100, Jonathan Liu wrote:
> On 21 October 2016 at 05:00, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > From: Andre Przywara <andre.przywara@arm.com>
> >
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > Acked-by: Rob Herring <robh@kernel.org>
> > Acked-by: Chen-Yu Tsai <wens@csie.org>
> > [Maxime: Change title prefix to match the usual style]
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.txt | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Do=
cumentation/devicetree/bindings/vendor-prefixes.txt
> > index f0a48ea78659..4eefd1c3ff16 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > @@ -208,7 +208,7 @@ parade      Parade Technologies Inc.
> >  pericom        Pericom Technology Inc.
> >  phytec PHYTEC Messtechnik GmbH
> >  picochip       Picochip Ltd
> > -pixcir  PIXCIR MICROELECTRONICS Co., Ltd
>=20
> Why is "pixcir  PIXCIR MICROELECTRONICS Co., Ltd" removed?

Probably a poor rebase on my side. Good catch, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--re7bdvfctnt65zwg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYDi+wAAoJEBx+YmzsjxAgrdUQAIzmW5o2YJoI+648f2Qkt7lG
3V9xLCXjXSVfGfRw9BirViu46HY2O5vC8McgJ6YUSpBYkOWdmB26WDiqGuHYEtmW
ia61Son9CP92xFnUsWNLVSkZromV6zNXjVWJbgmC/PHSlqvoPOQa44qjzkREBV/g
eh7rwnRQEPcn0EoXVniJte4Cx4gYk02c7JhAGkp+VOqYy3M+Ft9x0r6jyFKk2qvz
BwTD1tFPWABoJgkXLIWFfwlq6sVKiYgxiJOgKGMl2eubRztvCIuXl+WU0wqsLWcg
/XobeJqFRCbgELLWQx0RsWgQslgV8+PE0IGs9bLWuBBMp4jRBnW/u4QnjNbC4xnf
qrwFt0JJ3XNvvLzg1yCQvPt84lcS48Z4KD1DwZYIQLatt553Op540Rsr05Msr4X7
r8LdMPUMo0BafUH4ZXGJZffCUyyEnIF6JXQdO6vnspU4qyfrwxBdsBRJYbB/hX8J
Qzt9OcA7T3a1FEpa81VRw7I3HzEUvqjtQRPs/5dP3G0DEUxwXqcoMly24Jry/5ip
FKf3sgB9dZlWIW+FunQItPaZVzfkzO0GIXzQ//wrM234gwgF5zp0KeKeMBpHG09T
yDc3fE1uUZ4asWvlWCNr7pD/E+I4siiQ5O5JbrqzdUjhbxG339mo5KBA0l/CSJd4
PgADlIq5Kjbg81jMk/2z
=kQdg
-----END PGP SIGNATURE-----

--re7bdvfctnt65zwg--
