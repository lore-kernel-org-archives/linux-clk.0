Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 9 Mar 2017 15:55:39 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>,
	Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>
Subject: Re: [linux-sunxi] Re: [PATCH 10/15] drm/sun4i: tcon: Switch mux on
 only for composite
Message-ID: <20170309145539.43eequth2ej7wvqk@lukather>
References: <cover.bc06ffa88f847ddd9ddd7c259415d5f61b55307b.1488876832.git-series.maxime.ripard@free-electrons.com>
 <3f70bcfe2ec03188c06d54a262d49ad91963a510.1488876832.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v67iTOV-=u5rReu6_wi6NFoCoJkbJKshTpmFYUmJ=ggKUw@mail.gmail.com>
 <20170309105800.mnzhvnky6na7d5vn@lukather>
 <CAGb2v67XkaC2+AxubaUF9nPcoGZcAzny7LKVD6C+-9BM5Fi+9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="h753cmu4qni4wyzx"
In-Reply-To: <CAGb2v67XkaC2+AxubaUF9nPcoGZcAzny7LKVD6C+-9BM5Fi+9g@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--h753cmu4qni4wyzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 09, 2017 at 07:31:27PM +0800, Chen-Yu Tsai wrote:
> >> Additionally, the mux registers are only valid in the first TCON, mean=
ing
> >> it must available be active in 2 pipeline chips. It's also why we'd pa=
ss
> >> "struct drm_device *" instead of "struct sun4i_tcon *".
> >
> > Hmmmm. That's going to be tricky to support. Has this been confirmed
> > somehow? Is the register used for something else on TCON1?
>=20
> At this point, the only reference is Allwinner's kernel, and the old 3.4
> kernel for A10/A20. I could try getting HDMI working on the A31 to get
> some real results.
>=20
> FWIW, the registers do not seem to be aliased across the two TCONs.

Then maybe we don't need to care, and we can just always write to the
mux?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--h753cmu4qni4wyzx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYwWznAAoJEBx+YmzsjxAgM/gP/0I1y73K2s/qMlT9DUThALv1
my4pbybYM8Gqp3b27Va5qiPsy/e79qK38/oyRKKBdJow5HaQO2g06wPPhXPXNIrp
nK5+olfnpx0ZnO24pWDw6B+mxDyi1HrpspTG/CKx97bqwrxyWd+Tj3U2i7qoEQ/q
icdJ14q2KJ5AvFjQkr+HWCnceogvN76gom8oxFMOZ98FVEcTZKEej+cEbLyvIisd
zLmOutk1bwlwRU86/NTB0xDJ9Gss1fT7NtaUpBKKcuAqsSdhzH1z7CM2RSLWqLqm
Dx6kUhYZUmxTOw7dqXY0YfY/Jab2REy+5pGKBlTOY6FZRHzAE9biRHc0SjKdoKxh
Xr8LMSFCO5+RlY41PvzUbnwx1/mRiCNrP8etgezpfME1MxsGW1Zmde6avWvWBNKM
8q9C8W+DPJi1qA43wVjJlfNkDknjaGIxbGB92WjMdDxezYQYWLjZs02OGrULe9pR
tV7ZMgrVS04hK16wDCqkwXsp6jL2xhUnFPQvF0aBUIy61AHxIIdVM7z5CwyBfjQc
T7lIZCfCQRqIumEhg477eiw3bAEz0BoSr6VTvFjmT2G6Fd89IalX3J5ttyEpem9+
7zPG+5K7j/InkEMwiOyu94yqK1Oc7wXiIyGsRXEr6ZDhXip8h0I5z9hq3BkS+A2c
2HGZHv5+YtuUsUkAe2ev
=AF8I
-----END PGP SIGNATURE-----

--h753cmu4qni4wyzx--
