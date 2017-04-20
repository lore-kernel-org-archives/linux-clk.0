Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:43366 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1032416AbdDTOgU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Apr 2017 10:36:20 -0400
Date: Thu, 20 Apr 2017 16:36:17 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Rob Herring <robh@kernel.org>
Cc: Icenowy Zheng <icenowy@aosc.io>, Chen-Yu Tsai <wens@csie.org>,
        David Airlie <airlied@linux.ie>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v4 02/11] clk: sunxi-ng: add support for DE2 CCU
Message-ID: <20170420143617.v6yemhjamqufbqwj@lukather>
References: <20170416120849.54542-1-icenowy@aosc.io>
 <20170416120849.54542-3-icenowy@aosc.io>
 <20170420140252.vd6aeeweshx2tdou@rob-hp-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mkrmhrpsgb67ykf7"
In-Reply-To: <20170420140252.vd6aeeweshx2tdou@rob-hp-laptop>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--mkrmhrpsgb67ykf7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Thu, Apr 20, 2017 at 09:02:53AM -0500, Rob Herring wrote:
> On Sun, Apr 16, 2017 at 08:08:40PM +0800, Icenowy Zheng wrote:
> > diff --git a/include/dt-bindings/clock/sun8i-de2.h b/include/dt-binding=
s/clock/sun8i-de2.h
> > new file mode 100644
> > index 000000000000..982c6d18c75b
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/sun8i-de2.h
> > @@ -0,0 +1,54 @@
> > +/*
> > + * Copyright (C) 2016 Icenowy Zheng <icenowy@aosc.io>
> > + *
> > + * This file is dual-licensed: you can use it either under the terms
> > + * of the GPL or the X11 license, at your option. Note that this dual
> > + * licensing only applies to this file, and not this project as a
> > + * whole.
> > + *
> > + *  a) This file is free software; you can redistribute it and/or
> > + *     modify it under the terms of the GNU General Public License as
> > + *     published by the Free Software Foundation; either version 2 of =
the
> > + *     License, or (at your option) any later version.
> > + *
> > + *     This file is distributed in the hope that it will be useful,
> > + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + *     GNU General Public License for more details.
> > + *
> > + * Or, alternatively,
> > + *
> > + *  b) Permission is hereby granted, free of charge, to any person
> > + *     obtaining a copy of this software and associated documentation
> > + *     files (the "Software"), to deal in the Software without
> > + *     restriction, including without limitation the rights to use,
> > + *     copy, modify, merge, publish, distribute, sublicense, and/or
> > + *     sell copies of the Software, and to permit persons to whom the
> > + *     Software is furnished to do so, subject to the following
> > + *     conditions:
> > + *
> > + *     The above copyright notice and this permission notice shall be
> > + *     included in all copies or substantial portions of the Software.
> > + *
> > + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> > + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> > + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> > + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> > + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> > + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> > + *     OTHER DEALINGS IN THE SOFTWARE.
> > + */
>=20
> You can use SPDX tag here:
>=20
> SPDX-License-Identifier: (GPL-2.0+ OR MIT)

I don't think you ever addressed Russell's comment about what would
happen to the license if and when the SPDX doc is changed or goes
offline?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--mkrmhrpsgb67ykf7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJY+MdhAAoJEBx+YmzsjxAgoDsP/Rl8pQHSzTeME1CDJ/JIh0cU
5+dqt2sEcbW+1STR1rYVauA8Gx5TeWgzci14TacW1+hZeB29zXhZVCI0Ivb8D2MQ
pMdJmXKk5IHFt4txP/8HeSW1mdJYLoAGt2KHPbi4wWY8imfhS3ncDJoz3lwCwVfj
nPGv5hogwvGAYKwdTLmgJzcuS6RBsj7OHISGxyWdAlVKqsaHEyM+9Akqa81JunMS
CNNrMaeMwNs7EnllcnfyeVURzr4DMwudTeoVXkoQbuVsLlmWNIVU1Qs7mMtIJ53P
ooPnLecIjfPBTRIiWHh5yjGp+AJlTosMKtHKERbNAOtFlablkFLHHJJHZODUzDyZ
yJoSiR+6B6KOShn4KYJ97qFryb43XE45qNWvxDNrmRCnhxccrqIAZHPt4h8yE/mz
wWrHzPLDTjhRyQhN9BwC8DPEhRaCHAfF+H8ChRZ0IaKmxo+Izryztzz/3LfNFYm5
tIzkkUKdrID6KdpfbY3NxPVdNV5MBbBsivDO9Zw3l/WxG41hAiFNEawaHq90nCsV
ay1AlRxn8GB2TB1I/cc4VOdhDDwO0ga+0avoQiLMqibZ4q2lv/t26l7v6LNNWAJm
Ela6+2GfP+sBPmIxzgevLunZcbaXHnjgVwbQfg+Tf77rmoMB2/aczhvEed5UwjDy
tBs2Ld3V0scQP5lBrbRy
=EmXj
-----END PGP SIGNATURE-----

--mkrmhrpsgb67ykf7--
