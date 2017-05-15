Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Mon, 15 May 2017 10:40:49 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v7 02/13] clk: sunxi-ng: add support for DE2 CCU
Message-ID: <20170515084049.m5hfe54yvo7ilzlk@flea.home>
References: <20170514163045.40366-1-icenowy@aosc.io>
 <20170514163045.40366-3-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="gmb4itcnywiflkhi"
In-Reply-To: <20170514163045.40366-3-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--gmb4itcnywiflkhi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2017 at 12:30:34AM +0800, Icenowy Zheng wrote:
> The "Display Engine 2.0" in Allwinner newer SoCs contains a clock
> management unit for its subunits, like the DE CCU in A80.
>=20
> Add a sunxi-ng style driver for it.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--gmb4itcnywiflkhi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZGWmRAAoJEBx+YmzsjxAg/+oP/jALBq6MX3/Tjv6ZzB7mHFDV
6gbVRZDlDnVBa/FvPnlHtyqEss/i5OCLN0oHwdF+xHvrCwG7NTVPNo4D5xMJ/ZRb
j72Jp85ZJCGkotMyn6JqvfI0WdwCkf3w85p0Dd+KTTQjiMiU/7hfAR4Wlj3cnFAM
WaOiQD58GJD2LDiQsPsAhWG3kySqufASAbeHUp/PjtWNGuOp409vg8wCJtC31UPb
M6ek6i0YVRdzpkFHqbP3+p1BzzYyKArXG2ahE/FY6tdu3FdBtXB2dNLLJ6t8PJK5
Qq5Io+svQnZnoUvRUwfjIjZmWjq6KSQsJzNAwgcdRSkhPYhT6bqr1isbmEEorwC7
B20p2YUjaTrQv17OtVqnridPPT5eSe9/PoX4zP4dj0vXIvdhWf4LMzQYyFcYVdK7
k50uSlld1GRBXKGDz5BCKTLhesUqRzeQpxREhpGBoH8zC0npJl4ztvSEKX4Obgz+
84Y2+WF+0zRsWoXzdNWlXwDXyqk3BKz6UIwIyAwd2QezaHBEETKkCbX421SEgNsX
XVyPIeExrvGi0tVqCRvTpmEs8kFO/plp9IM9YRG7/7Z0iMdAz+9ewAcNBt2VaZu/
ILFLKr1UA2ssJiWpyRXASo3rFAGOM1jfVsXLq7FKroJPFgkv6W7uUl7vkfVbn+pW
7tozJERktYltdFuB+5LB
=XZnV
-----END PGP SIGNATURE-----

--gmb4itcnywiflkhi--
