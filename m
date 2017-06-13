Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 13 Jun 2017 10:02:01 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: icenowy@aosc.io
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [linux-sunxi] Re: [PATCH v2 10/11] ARM: sun8i: h3: add display
 engine pipeline for TVE
Message-ID: <20170613080201.pezlmcggfnfziiat@flea.lan>
References: <20170604160149.30230-1-icenowy@aosc.io>
 <20170604160149.30230-11-icenowy@aosc.io>
 <20170607094241.65dcm42aacrn4eev@flea.lan>
 <87bf6e8c54286fd0630bd876ec0c6c56@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="2ogm3vqxmzj5xyg7"
In-Reply-To: <87bf6e8c54286fd0630bd876ec0c6c56@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--2ogm3vqxmzj5xyg7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 11, 2017 at 02:58:47PM +0800, icenowy@aosc.io wrote:
> =E5=9C=A8 2017-06-07 17:42=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=BC=
=9A
> > On Mon, Jun 05, 2017 at 12:01:48AM +0800, Icenowy Zheng wrote:
> > > +	soc {
> > > +		display_clocks: clock@1000000 {
> > > +			compatible =3D "allwinner,sun8i-a83t-de2-clk";
> > > +			reg =3D <0x01000000 0x100000>;
> > > +			clocks =3D <&ccu CLK_BUS_DE>,
> > > +				 <&ccu CLK_DE>;
> > > +			clock-names =3D "bus",
> > > +				      "mod";
> > > +			resets =3D <&ccu RST_BUS_DE>;
> > > +			#clock-cells =3D <1>;
> > > +			#reset-cells =3D <1>;
> > > +			assigned-clocks =3D <&ccu CLK_DE>;
> > > +			assigned-clock-parents =3D <&ccu CLK_PLL_DE>;
> > > +			assigned-clock-rates =3D <432000000>;
> > > +		};
> >=20
> > We discussed that already a few times, but there's no reason to do
> > so. If you need a downstream clock at a particular rate, call
> > clk_set_rate on it, period.
> >=20
> > Whether its parent will be coming from PLL_DE or some other more
> > appriopriate clock is not relevant and doesn't make any difference.
>=20
> The clock framework is not so smart to deal with these infomations:
> - CLK_PLL_PERIPH should always be 600MHz
> - CLK_TVE should always be 216MHz
> - CLK_DE (in fact CLK_MIXER{0,1}) should be larger than 300MHz (for 4K)

None of what you're doing guarantees what you state above, so I'm not
really sure what your point is.

> So we have to specify CLK_DE to be 432MHz, and then it will set
> CLK_PLL_DE to this value, then the CLK_TVE can be set to 216MHz with
> divider 2.

Yes, but it works by accident. Any clock change somewhere in the same
clock-tree might break whatever you have set in the DT.

Hence why you want to do it within the clock framework and your
driver, not here.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--2ogm3vqxmzj5xyg7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZP5v5AAoJEBx+YmzsjxAg75QP/RKLgPYijMm70E3Fs+UJA7dM
fGzWPQSAKGbdWm4xcNm7wrNej2hqN4vYqSKYuLAZsG4n7qEsBCIsoJ0mNNGVt0LI
PXQ8XhCSgKdETQR5J83c7l7xrleLSDRZpWLrgoP1RZais49ZupOGFMWKLnYmh8sI
2OAL4dOnhrNOzZI32q+M8XU9Nv6k3at1zBUtoJpvTsfl6T2zs55i5911X9ZiptS+
9Mt/jZD22K7wpABLBt14vus3VL9DVyfQMBaPzMzYhYbbG2qNZRw0KEO16aIJM3MW
dCNvmpMCIIJws1hIr2Vgo3gemeM9ollFFFHni5qxxM/jvceM7RE4V54P1wLas57e
N5woOnG9r2fmSl1ga6/T1mS6PlswIuS5oWpFw2Z1qu8mP2PO+vybSRAOe9ypdB8V
CcwvDqeLsXXd6lzUNK0vc2NCWqhmuLCb3Bi+D6TT6rTU0uAF9L6wCLdTGmAkNMak
3WtlGZZejG6GHeM9GFg7Fm3nvug9KmMVT4tFUI+VYEwXW8ZUFkQoIiv81J5UdGbQ
QmoagK22eCIfPJDEKWipTp6o31l3rLcMEVe0gYF7uhvRHz127WggPrcu5Ae7Q0+I
nEtloWX2hfSdUqtlsR1eAZXxKr7xBkyOzI1a5CgcDhKb5Fqii7xWbr2SdlDNbzNy
QYfTMnfSSLWmkGiFRGO3
=aKgJ
-----END PGP SIGNATURE-----

--2ogm3vqxmzj5xyg7--
