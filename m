Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:46912 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932413AbdDQHqb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Apr 2017 03:46:31 -0400
Date: Mon, 17 Apr 2017 09:46:19 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: linux-pm@vger.kernel.org, linux-sunxi@googlegroups.com,
        linux-kernel@vger.kernel.org,
        Quentin Schulz <quentin.schulz@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/5] ARM: sun8i: h3: add operating-points-v2 table for CPU
Message-ID: <20170417074619.ilxkrdavmcoeno2v@lukather>
References: <20170408185025.53841-1-icenowy@aosc.io>
 <20170408185025.53841-5-icenowy@aosc.io>
 <20170411091346.mcwyskezadabsobn@lukather>
 <b37490ed1282f45542168701dea332bb@aosc.io>
 <20170416205740.b5pk3kcxwaegij6g@lukather>
 <40F4D1F2-EA59-4BD1-9A00-4C0AA7FED9D3@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="phl23oyx6qgx6gfm"
In-Reply-To: <40F4D1F2-EA59-4BD1-9A00-4C0AA7FED9D3@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--phl23oyx6qgx6gfm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 17, 2017 at 05:00:00AM +0800, Icenowy Zheng wrote:
>=20
>=20
> =E4=BA=8E 2017=E5=B9=B44=E6=9C=8817=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=88=
4:57:40, Maxime Ripard <maxime.ripard@free-electrons.com> =E5=86=99=E5=88=
=B0:
> >On Tue, Apr 11, 2017 at 09:28:55PM +0800, icenowy@aosc.io wrote:
> >> =E5=9C=A8 2017-04-11 17:13=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=
=BC=9A
> >> > On Sun, Apr 09, 2017 at 02:50:24AM +0800, Icenowy Zheng wrote:
> >> > > The CPU on Allwinner H3 can do dynamic frequency scaling.
> >> > >=20
> >> > > Add a DVFS table based on the one tweaked by Armbian developers,
> >which
> >> > > are proven to work stably on BSP kernels.
> >> > >=20
> >> > > Frequencies higher than 1008MHz are temporarily dropped in the
> >> > > table, as
> >> > > they may lead to over voltage on boards without proper regulator
> >> > > settings or over temperature on boards with proper regulator
> >settings.
> >> > > They will be added back once regulator settings are ready and
> >thermal
> >> > > sensor driver is merged.
> >> > >=20
> >> > > In order to satisfy all different regulators (SY8106A which is
> >50mV
> >> > > per
> >> > > level, SY8113B which have two states: 1.1V and 1.3V, and some
> >board
> >> > > with
> >> > > non-tweakable regulators), all the OPPs are defined with a range
> >> > > which has
> >> > > the target value as the minimum allowed value, and 1.3V (the
> >highest
> >> > > VDD-CPUX voltage suggested by the datasheet) as the maximum
> >allowed
> >> > > value.
> >> > > It's proven to work well with a board with SY8113B.
> >> > >=20
> >> > > Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> >> > > ---
> >> > >  arch/arm/boot/dts/sun8i-h3.dtsi | 38
> >> > > +++++++++++++++++++++++++++++++++++++-
> >> > >  1 file changed, 37 insertions(+), 1 deletion(-)
> >> > >=20
> >> > > diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi
> >> > > b/arch/arm/boot/dts/sun8i-h3.dtsi
> >> > > index b36f9f423c39..a0cee17fe44b 100644
> >> > > --- a/arch/arm/boot/dts/sun8i-h3.dtsi
> >> > > +++ b/arch/arm/boot/dts/sun8i-h3.dtsi
> >> > > @@ -43,32 +43,68 @@
> >> > >  #include "sunxi-h3-h5.dtsi"
> >> > >=20
> >> > >  / {
> >> > > +	cpu0_opp_table: opp_table0 {
> >> > > +		compatible =3D "operating-points-v2";
> >> > > +		opp-shared;
> >> > > +
> >> > > +		opp@480000000 {
> >> > > +			opp-hz =3D /bits/ 64 <480000000>;
> >> > > +			opp-microvolt =3D <980000 980000 1300000>;
> >> > > +			clock-latency-ns =3D <244144>; /* 8 32k periods */
> >> > > +		};
> >> > > +
> >> > > +		opp@648000000 {
> >> > > +			opp-hz =3D /bits/ 64 <816000000>;
> >> > > +			opp-microvolt =3D <1020000 1020000 1300000>;
> >> > > +			clock-latency-ns =3D <244144>; /* 8 32k periods */
> >> > > +		};
> >> > > +
> >> > > +		opp@912000000 {
> >> > > +			opp-hz =3D /bits/ 64 <960000000>;
> >> > > +			opp-microvolt =3D <1080000 1080000 1300000>;
> >> > > +			clock-latency-ns =3D <244144>; /* 8 32k periods */
> >> > > +		};
> >> > > +
> >> > > +		opp@1008000000 {
> >> > > +			opp-hz =3D /bits/ 64 <1008000000>;
> >> > > +			opp-microvolt =3D <1140000 1140000 1300000>;
> >> > > +			clock-latency-ns =3D <244144>; /* 8 32k periods */
> >> > > +		};
> >> > > +	};
> >> > > +
> >> >=20
> >> > From your serie, I guess you never actually tested those OPPs on
> >any
> >> > board without SY8113B, right?
> >>=20
> >> Yes. But I will test them on an Orange Pi PC (newly got) soon.
> >
> >The orange pi pc also uses the SY8113B.
>=20
> I remember in H3 Orange Pi's only One, Lite and Zero uses SY8113B,
> and PC is SY8106A.

Ah, my bad, I confused the two.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--phl23oyx6qgx6gfm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJY9HLCAAoJEBx+YmzsjxAgYtIP/Rp7dPyP/m/vyHRDEtrshat5
yXWViAyZIFC4q2l+fu0Ybu61ol4XEG/wfcX9z9uMy4daIhBJbUa8Boxlj3AvfWpM
tQR0Hejxpkstmk9LOVRxn1hrXM4hIm0d9WR9uKS34/uuD87MP/Y2o1yeG1PTVJcI
EDggUH1gmCfvSfLsB7iXo+SjjboLxfRk8YKPxwyOoJM7L6Z5v/FBftkiT8XZbYB7
MERKfFKLAfStI4VuTPAnoh7RDOQC08FUTiPDnNXPra+t22dPI2Dm/4mPWZJ86i1P
Vbk7jep1Gbda8v4qrxBC5IKrRSVNiSaD5xQjKVjtiOwstpoV5zBUJt9gLk6LRB8t
FrlX0/Aq7ktpGtGRvSuDqHGTh7u65rzgY7aKdnkV90SrTKWTO7uvDWAorP+emIg4
ZGXdqHSscKeEb6QgAwybxc7FEgPTqbM7WG1o9SvHM/LLANJT9ws8UEiOvpVXU14t
H3TptJu9xkA1QoE5kKZ/kMPVRlVAGDbITPKiFwL7saWgJ3muWpbIDHB02bMDcU6Y
ZToNNnz/PU8ad38kDf2m4DQT/dEoI8gH7y2gmSCmd/SuDg5TdiRP7m4AB58h3/uQ
o2TwAFs7WzKqeTx7x7jKazb0CrpdhH2Evst2ID2pLyPm0EC1NtLC3OuxI8j7n4HM
11vFsv1AUbTEevWNfyic
=S1Ax
-----END PGP SIGNATURE-----

--phl23oyx6qgx6gfm--
