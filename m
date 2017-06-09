Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:50591 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751527AbdFIQtu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Jun 2017 12:49:50 -0400
Date: Fri, 9 Jun 2017 18:49:15 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 01/11] dt-bindings: update the binding for Allwinner
 H3 TVE support
Message-ID: <20170609164915.enap3epreg5vr2gy@flea.home>
References: <20170604160149.30230-1-icenowy@aosc.io>
 <20170604160149.30230-2-icenowy@aosc.io>
 <20170607084544.kgclybyxxttfk3ko@flea.lan>
 <092D4797-0034-4C39-A30A-92CFAB23AAF8@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="wxz37dpxhkcomzec"
In-Reply-To: <092D4797-0034-4C39-A30A-92CFAB23AAF8@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--wxz37dpxhkcomzec
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 07, 2017 at 04:48:50PM +0800, Icenowy Zheng wrote:
> >> @@ -189,6 +211,8 @@ supported.
> >>  Required properties:
> >>    - compatible: value must be one of:
> >>      * allwinner,sun8i-v3s-de2-mixer
> >> +    * allwinner,sun8i-h3-de2-mixer0
> >> +    * allwinner,sun8i-h3-de2-mixer1
> >
> >Again, please explain why we need to have different compatibles
> >here. If it's only about the number of planes, this should be dealt
> >with a property, not a compatible.
>=20
> Only mixer0 has "VEP" and write-back support, at least on H3.

What is that VEP? writeback support can also be expressed by a
property.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--wxz37dpxhkcomzec
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZOtGLAAoJEBx+YmzsjxAgPdQP/2Yuss8dajPxhN/5gXOh2YLp
EOv2csNPYSpOCfurT7OtRSg3ZkJIzatC4sNyQog7TC95LRdg2AqpvAJ2HkE+6jCl
Tyud0qiBzsgHnSgGcU1Clb3SepLmpw9ft70zxYuJsPPfgyLKIH5KI1o2AMX8/Vio
IM+gVwyRx3GyFqdWZxplxOOgtLhDXU5Du8/fj91W5stIKkNEFqfehQZClnB6emNV
zDouO2yMVePHWNV9MLiJJ9ApI53rwr3rlSvSwM5sJQXFtiu8VZfRVO3+8YHGKhmF
16fkWzOMjXSCakizUDE7BsKVWamHP+LsOaqwcfoeBMLfinBPHqG+COAroHOPbiX6
qN8PoXsMo+2l06f579YEDVbld2Jgj3fXym4m+pAB1COAfjGpoCqYupOeXi9s1oeu
tjjRD4EL+uFpyF5BwQ2WVV7KYE8ALbTao7aTUlXX7O2MGety8S0mJsHnwuw0+u/H
RQ2NMpWl/uM+CaZ421w27rQcBq+8MFmUiCyIMfb10dUXi29wC/cRiupk8h3z+1bg
TBsSbpz7qQMXRqagDiUkUVYF4oDgLVWj7vakGHI6K6NGHOp9iuqxUlpw9lPpmc+e
PiWQpldQS5uoJqHseIzAzsW8qhKL9/Llz4G/H6zK/+Ic9etRMMdMD9c8eGJvolhv
4CEIj0VJOiPcYKkWbyot
=a2Ki
-----END PGP SIGNATURE-----

--wxz37dpxhkcomzec--
