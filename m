Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 4 Apr 2017 17:45:44 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: Re: [PATCH v4 0/5] Add support for the R_CCU on Allwinner H3/A64 SoCs
Message-ID: <20170404154544.ofecao56dpcvk3wc@lukather>
References: <20170404095100.18649-1-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xestqvaia3sdnjo7"
In-Reply-To: <20170404095100.18649-1-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--xestqvaia3sdnjo7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 04, 2017 at 05:50:55PM +0800, Icenowy Zheng wrote:
> Allwinner SoCs after sun6i-a31 nearly all have a R_CCU in PRCM part.
> (V3s and R40 do not have it, as they have even no PRCM)
>=20
> This patch adds support for the ones on H3/A64.
>=20
> Some clock/reset values are reserved for easier extending the support to
> A31/A23, but for this I think some changes to the PRCM MFD should be made,
> see [1] (Although this is only a sketch).
>=20
> The r_pio device node is also added for A64, as the driver is already
> merged, and its depends (r_ccu) is now met.

Applied all, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--xestqvaia3sdnjo7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY47+oAAoJEBx+YmzsjxAg/pkP/jjmMHxAdkZt5gvgrKBpPmH5
OkwnJlPbjKt65Z+vajmm65IAmBRKTM7IHnvGHwbEF4lR11qYeznaaih5pGUH5BNs
OccrPVJnb+TW+5UjAyrxN46UjHONLyvU5lJ8wbjAjbBErOT+XFnF5DfP1ftCO/Xp
GjeEThT8zJDIoLzvtkXLDMsPy5kw02W9S63PufcBT5wxxk/tILm4tjC1Dhz3UJCa
yGWN0q5mk5vpj/rmLg6t+OD5f9IIbHMtLjMgrA1yCwet3QjxZ43jqvSe3tNy3ZKY
d6VuC71upWT+ZMVEMHAv+7Dv2Z8mhBwZx4RVRdE0+q9v8bemEPNzTULwR2GxhYi6
o17DhsT4g5Glzcqma7oJGX5HOEQq6+Ys1r7h8AzgA7VSLCGnu5D/peF8/tIPw54F
WQhBksveHXLMI+nO9RRj4wjONzna9kZ5/QZp3atUnmdv3LeEyzTYwKuM0tstSpaI
ao8TXdwCQfA4fpbOPdAdpn70ji8l0GO8MG5c/dEZPOM2w1ZT7FRvNtUM0sUDwQZy
w4Je3LWhvZI7dXomS7hIkYHclOfkvjILi/A5SyD924LWMiUq9Y+PloHJW7luwAki
DQ5K9vBidVXYBk0vndtg0IWn3knp+W6BJYpR6pDHk03WILkBnqRPUg3QpPQuVGoH
c9B/cYh35IQ3ktmOxa12
=hGWa
-----END PGP SIGNATURE-----

--xestqvaia3sdnjo7--
