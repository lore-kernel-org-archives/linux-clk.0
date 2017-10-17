Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:42005 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935923AbdJQOeh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Oct 2017 10:34:37 -0400
Date: Tue, 17 Oct 2017 16:34:35 +0200
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
Subject: Re: [PATCH 02/23] drm/sun4i: Realign Makefile padding and reorder it
Message-ID: <20171017143435.5vj4obbxcnodgcu7@flea.lan>
References: <cover.fe3d65d1ee05a55224d26e7d113388c428592b26.1508231063.git-series.maxime.ripard@free-electrons.com>
 <9410b284ec97453fa692537dffaaa4fb4833347c.1508231063.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v649B-M7ya=XmH0+hHgYUHDMxWjAH1vuq+iKOOqgU13eCg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="tpfqufvrn2h67hvm"
In-Reply-To: <CAGb2v649B-M7ya=XmH0+hHgYUHDMxWjAH1vuq+iKOOqgU13eCg@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--tpfqufvrn2h67hvm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 17, 2017 at 05:14:47PM +0800, Chen-Yu Tsai wrote:
> On Tue, Oct 17, 2017 at 5:06 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > Some options were not padded as they should, and the order in the Makef=
ile
> > was chaotic. Fix that.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/gpu/drm/sun4i/Makefile | 28 ++++++++++++++--------------
> >  1 file changed, 14 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/Makefile b/drivers/gpu/drm/sun4i/Mak=
efile
> > index 43c753cafc88..af18b70ba5ed 100644
> > --- a/drivers/gpu/drm/sun4i/Makefile
> > +++ b/drivers/gpu/drm/sun4i/Makefile
> > @@ -1,24 +1,24 @@
> > -sun4i-drm-y +=3D sun4i_drv.o
> > -sun4i-drm-y +=3D sun4i_framebuffer.o
> > +sun4i-backend-y                        +=3D sun4i_backend.o sun4i_laye=
r.o
> >
> > -sun4i-drm-hdmi-y +=3D sun4i_hdmi_enc.o
> > -sun4i-drm-hdmi-y +=3D sun4i_hdmi_i2c.o
> > -sun4i-drm-hdmi-y +=3D sun4i_hdmi_ddc_clk.o
> > -sun4i-drm-hdmi-y +=3D sun4i_hdmi_tmds_clk.o
> > +sun4i-drm-y                    +=3D sun4i_drv.o
> > +sun4i-drm-y                    +=3D sun4i_framebuffer.o
> >
> > -sun4i-tcon-y +=3D sun4i_tcon.o
> > -sun4i-tcon-y +=3D sun4i_rgb.o
> > -sun4i-tcon-y +=3D sun4i_dotclock.o
> > -sun4i-tcon-y +=3D sun4i_crtc.o
> > +sun4i-drm-hdmi-y               +=3D sun4i_hdmi_enc.o
> > +sun4i-drm-hdmi-y               +=3D sun4i_hdmi_i2c.o
> > +sun4i-drm-hdmi-y               +=3D sun4i_hdmi_ddc_clk.o
> > +sun4i-drm-hdmi-y               +=3D sun4i_hdmi_tmds_clk.o
> >
> > -sun4i-backend-y +=3D sun4i_backend.o sun4i_layer.o
> > +sun4i-tcon-y                   +=3D sun4i_tcon.o
> > +sun4i-tcon-y                   +=3D sun4i_rgb.o
> > +sun4i-tcon-y                   +=3D sun4i_dotclock.o
> > +sun4i-tcon-y                   +=3D sun4i_crtc.o
>=20
> I don't know if you wanted to sort the file names as well.
> This would be a good time to do it.

Fixed while applying, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--tpfqufvrn2h67hvm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZ5hT7AAoJEBx+YmzsjxAgTO0P/iRVZVyWxnaMdGrd/wUlPQ9D
GLy8+msW4Rm7BQ1HBL0I+4hS7aNwnna30FxEIiszW87zAr+8rZw0/lKInePCQYBZ
lYYV5qifH9MghXKbbcyla+jnOn18yKoN4osa6YeR1pUbuDQZOiSmfERCgKHY9QLI
FfdIqYCRrbAq7hW6+KXPGvkiGxyTAr8u0cKKzFSbEp9cctR/Ikxv7rnqesUUuU6S
oiwM+piArwawvaVlKmBoKQ/emupruR9kjB9dLoW5W4mWzdoI1/98BOKfuVzAEcG1
J0EwEfWOvoVPH6lfy80tlcYngbauKK+SfqgHfo02mMmyrDywOI/miDEeE3WpKinE
Qlg3fQzOmdV23lmzq/ZwPwDrH0XUfAqAQEso0UgbXhtowmgnyUZ2JMDWv7JLDVGz
wexuE+dabAqBW23tgqde3anu39NsV1RVmclD/FSLVQjnOWMEpVHNPVSBWbfLnTOh
M0t/+xBWqfZy64IFMfwAMscEKMRom+aAGMv7sVdy1gO62H/mUv1lIjSJpCX4acFm
d6NAd7vH5NgTm8abPbkcZ76O4jX0/QhA2hQ32QwvIsgOOdzSdGx0qhljIYK4GYKI
tbOP+bNJ24NUcVMtj33jdm3fzl9VoeLdnbdvxmzkBieuQPot9on6IG0PZJCg+3mL
ZD9dJoS3GdvOaLeeraWf
=OGmH
-----END PGP SIGNATURE-----

--tpfqufvrn2h67hvm--
