Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:42025 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755214AbdJQOfa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Oct 2017 10:35:30 -0400
Date: Tue, 17 Oct 2017 16:35:28 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Priit Laes <plaes@plaes.org>, Icenowy Zheng <icenowy@aosc.io>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Quentin Schulz <quentin.schulz@free-electrons.com>,
        Mylene Josserand <mylene.josserand@free-electrons.com>
Subject: Re: [PATCH 03/23] drm/sun4i: tcon: Make tcon_set_mux mode argument
 const
Message-ID: <20171017143528.suq4n3v7t6dosl35@flea.lan>
References: <cover.fe3d65d1ee05a55224d26e7d113388c428592b26.1508231063.git-series.maxime.ripard@free-electrons.com>
 <b0cce5a43fc3b56953d21a54fc3c14672f755f42.1508231063.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v65zeBsKOMnLURn7025e37=CHOFbUmi56nOoN7rGubvHrA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="qqzq6uc2uvo6eu7t"
In-Reply-To: <CAGb2v65zeBsKOMnLURn7025e37=CHOFbUmi56nOoN7rGubvHrA@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--qqzq6uc2uvo6eu7t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 17, 2017 at 05:21:09PM +0800, Chen-Yu Tsai wrote:
> On Tue, Oct 17, 2017 at 5:06 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > The drm_display_mode pointer can be mark const, so let's do it.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>=20
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--qqzq6uc2uvo6eu7t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZ5hUwAAoJEBx+YmzsjxAguQMQAIdUglbfUicetFP8gubsxR/Y
DEJD3+1a7wOeYR68bZrfZbubH5FR4Lpod4NmAGP2wdmIzFBoje+C5gRgzsXOl/zt
n1c4352wIXTWNqQH1pfF7fs0g1XApbPu3hwNQIlKKTx2QqSLtCehE/O0gcbPhAQG
gZqyKwJyDod49KhqzrdSNwBwwmEwy4l5TeUI4mPm3SsQ0NgCLXQcA2cckG0e1MOo
RK8m5DMeAR1t5+7rhw6N31wpVoSYsA4cfgkl3LO9J2u15PYKjCtEkpfMBHOZkOmP
p7eyasyD8WPzaS/VnJQOZMy8egAEkPZbzXL4J6nb+e+LdCAJ+Lq6vQWer2W8LHvn
AmQvvE3IWaXDPsFbj+kqO8/3wO4k5A5dY85zVchaR1+IrPqQe8+FS0MnM9irbH/Z
/XdYMHbVyLr1H5z251Hfy3HdYS68Qyq+1ND1ib714IaKs4k2VH8GtbdBsFRxyt+E
BTc+Hl+l13vBFAtXJC/JGFZsCvuFSS43P5zJOZ8mk2v+3D+krxGtc851TpxFVmSZ
IyibwD+X8CB2VhrtLFQBfmYtNTpE7lhh46D6uX488o2e7ByIoizFXu/W+mZplLha
eyWYQyKHClM2TjpUAe9a6nzosjXAmpf9foY+kRh5R+2ZQgraLO01hwIgZ+uNlC3D
XpDUxJTKRT2N2J72u56G
=dUb0
-----END PGP SIGNATURE-----

--qqzq6uc2uvo6eu7t--
