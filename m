Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:41860 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932308AbdJQO3v (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Oct 2017 10:29:51 -0400
Date: Tue, 17 Oct 2017 16:29:49 +0200
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
Subject: Re: [PATCH 01/23] drm/sun4i: Implement endpoint parsing using kfifo
Message-ID: <20171017142949.lkefs4m7majjh4ey@flea.lan>
References: <cover.fe3d65d1ee05a55224d26e7d113388c428592b26.1508231063.git-series.maxime.ripard@free-electrons.com>
 <4ecb323e787918208f6a5d9f0ebba12c62583c98.1508231063.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v65zJh1Fqqxo22RTL8TQ90FrxywVo0J_bhD04JYHnVjdhg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="lfhreeygfcmipmbm"
In-Reply-To: <CAGb2v65zJh1Fqqxo22RTL8TQ90FrxywVo0J_bhD04JYHnVjdhg@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--lfhreeygfcmipmbm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 17, 2017 at 05:19:04PM +0800, Chen-Yu Tsai wrote:
> On Tue, Oct 17, 2017 at 5:06 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > The commit da82b8785eeb ("drm/sun4i: add components in breadth first
> > traversal order") implemented a breadth first traversal of our device t=
ree
> > nodes graph. However, it was relying on the kernel linked lists, and th=
ose
> > are not really safe for addition.
> >
> > Indeed, in a single pipeline stage, your first stage (ie, the mixer or
> > fronted) will be queued, and it will be the final iteration of that lis=
t as
> > far as list_for_each_entry_safe is concerned. Then, during that final
> > iteration, we'll queue another element (the TCON or the backend) that
> > list_for_each_entry_safe will not account for, and we will leave the lo=
op
> > without having iterated over all the elements. And since we won't have
> > built our components list properly, the DRM driver will be left
> > non-functional.
> >
> > We can instead use a kfifo to queue and enqueue components in-order, as=
 was
> > the original intention. This also has the benefit of removing any dynam=
ic
> > allocation, making the error handling path simpler too. The only thing
> > we're losing is the ability to tell whether an element has already been
> > queued, but that was only needed to remove spurious logs, and therefore
> > purely cosmetic.
> >
> > This means that this commit effectively reverses e8afb7b67fba ("drm/sun=
4i:
> > don't add components that are already in the queue").
> >
> > Fixes: da82b8785eeb ("drm/sun4i: add components in breadth first traver=
sal order")
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/gpu/drm/sun4i/sun4i_drv.c | 71 +++++---------------------------
> >  1 file changed, 13 insertions(+), 58 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/=
sun4i_drv.c
> > index b5879d4620d8..a27efad9bc76 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_drv.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
> > @@ -11,6 +11,7 @@
> >   */
> >
> >  #include <linux/component.h>
> > +#include <linux/kfifo.h>
> >  #include <linux/of_graph.h>
> >  #include <linux/of_reserved_mem.h>
> >
> > @@ -222,29 +223,15 @@ static int compare_of(struct device *dev, void *d=
ata)
> >   * matching system handles this for us.
> >   */
> >  struct endpoint_list {
> > -       struct device_node *node;
> > -       struct list_head list;
> > +       DECLARE_KFIFO(fifo, struct device_node *, 16);
> >  };
>=20
> Is there any reason to keep using struct endpoint_list, other than
> to avoid using kfifo in function parameter lists?

It appears that you can't just pass a kifo pointer as a function
argument, so the only two remaining solutions were to have a global
pointer or embed it in a structure. It just seems like the best
solution.

>=20
> Otherwise the rest of the code looks sound.
>=20
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--lfhreeygfcmipmbm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZ5hPdAAoJEBx+YmzsjxAgBB4QAL0vLsDBTmjw6SozCZgEwISW
psTuje0TbSF7u9MUFxggtnHGN55yYJ5aSiTbFfWrZ3BF2+jOE97M/uQJM5ZlgQBe
fwcuE1WVGLlbBsPEpX+GzSf69Sv0XDGkayt04F/PZFaGI22WZ9he0tfpvQd5mW6A
4ZU+WRrwZrs1/QSL6nhXrdJct94HMO6E9cC9k7Ozu4wkp2RxtEHIvSZA82z3E7dg
QOP9IhUPVddbZOHCJ9TLLhWtQaJSimirYF4du0aXkA/ymYKKpOglt4oGuGzuInY/
CDPoWhlOy9k3a5Y8UqwUx/FDAChdRuewOp29wZLCrKTMp8D9RSMfwlP24iYgx1wS
OLKTdp6eB9/adq3Bsw1uv3fHaUme3/3ebrp5R0SWST2C//yqrlIKkSQvaGVDfXt6
UZ2X7mUEBIpLMU88Y/+jczffoFuQkwRtzxGwrPQcBDgL/UpYWbuM2d+fTKFfnZsl
Amu8aOiNt2dr2KNvopS5SponFKxwJvcao51IXEC31AhVdMZhVO7re57itVMCjHKC
9gcsmX8czOrD/Gf7QraYZDANzp/F8GkW95MCvPtD3L8TmiHrNC1vPScVZMlOJvWk
AM40cnWmyf9cLcC5G9r7tJiz48UmAi3ZIF7FypvT7OI0F/1oapdkYlUTo5FEYFwa
a6+5L1SvLRmue1fSw+kn
=2TwJ
-----END PGP SIGNATURE-----

--lfhreeygfcmipmbm--
