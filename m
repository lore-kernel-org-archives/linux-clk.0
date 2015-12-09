Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 9 Dec 2015 10:16:57 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Emilio Lopez <emilio@elopez.com.ar>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>
Subject: Re: [PATCH v5] clk: sunxi: Add CLK_OF_DECLARE support for
 sun8i-a23-apb0-clk driver
Message-ID: <20151209091657.GV27957@lukather>
References: <1449126330-21595-1-git-send-email-wens@csie.org>
 <20151207093622.GE27957@lukather>
 <CAGb2v65GQYgnKcmTqXCZpRMpbZiPKMyrg628wc4i+pK6=v62Eg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NBQMqqtZQBFxm+aD"
In-Reply-To: <CAGb2v65GQYgnKcmTqXCZpRMpbZiPKMyrg628wc4i+pK6=v62Eg@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--NBQMqqtZQBFxm+aD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 07, 2015 at 09:46:24PM +0800, Chen-Yu Tsai wrote:
> On Mon, Dec 7, 2015 at 5:36 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > Hi,
> >
> > On Thu, Dec 03, 2015 at 03:05:30PM +0800, Chen-Yu Tsai wrote:
> >> The APBS clock on sun9i is the same as the APB0 clock on sun8i. With
> >> sun9i we are supporting the PRCM clocks by using CLK_OF_DECLARE,
> >> instead of through a PRCM mfd device and subdevices for each clock
> >> and reset control. As such we need a CLK_OF_DECLARE version of
> >> the sun8i-a23-apb0-clk driver.
> >>
> >> Also, build it for sun9i/A80, and not just for configurations with
> >> MFD_SUN6I_PRCM enabled.
> >>
> >> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> >> ---
> >>
> >> Changes since v4:
> >>
> >>   - Keep building clk-sun8i-apb0 for SUN6I_MFD_PRCM.
> >>
> >>   - Add an error message and comment for when of_io_request_and_map()
> >>     fails. of_io_request_and_map() merges a bunch of errors into -EINV=
AL,
> >>     so this might not be the best approach. But I think having an error
> >>     message when we know something is wrong (-EBUSY, -ENOMEM) is bette=
r.
> >>
> >> ---
> >>  drivers/clk/sunxi/Makefile         |  1 +
> >>  drivers/clk/sunxi/clk-sun8i-apb0.c | 80 +++++++++++++++++++++++++++++=
+++------
> >>  2 files changed, 69 insertions(+), 12 deletions(-)
> >>
> >> diff --git a/drivers/clk/sunxi/Makefile b/drivers/clk/sunxi/Makefile
> >> index 103efab05ca8..ccf21ba3b6b0 100644
> >> --- a/drivers/clk/sunxi/Makefile
> >> +++ b/drivers/clk/sunxi/Makefile
> >> @@ -15,6 +15,7 @@ obj-y +=3D clk-sun9i-core.o
> >>  obj-y +=3D clk-sun9i-mmc.o
> >>  obj-y +=3D clk-usb.o
> >>
> >> +obj-$(CONFIG_MACH_SUN9I) +=3D clk-sun8i-apb0.o
> >>  obj-$(CONFIG_MACH_SUN9I) +=3D clk-sun9i-cpus.o
> >>
> >>  obj-$(CONFIG_MFD_SUN6I_PRCM) +=3D \
> >> diff --git a/drivers/clk/sunxi/clk-sun8i-apb0.c b/drivers/clk/sunxi/cl=
k-sun8i-apb0.c
> >> index 7ae5d2c2cde1..7ba61103a6f5 100644
> >> --- a/drivers/clk/sunxi/clk-sun8i-apb0.c
> >> +++ b/drivers/clk/sunxi/clk-sun8i-apb0.c
> >> @@ -17,13 +17,77 @@
> >>  #include <linux/clk-provider.h>
> >>  #include <linux/module.h>
> >>  #include <linux/of.h>
> >> +#include <linux/of_address.h>
> >>  #include <linux/platform_device.h>
> >>
> >> +static struct clk *sun8i_a23_apb0_register(struct device_node *node,
> >> +                                        void __iomem *reg)
> >> +{
> >> +     const char *clk_name =3D node->name;
> >> +     const char *clk_parent;
> >> +     struct clk *clk;
> >> +     int ret;
> >> +
> >> +     clk_parent =3D of_clk_get_parent_name(node, 0);
> >> +     if (!clk_parent)
> >> +             return ERR_PTR(-EINVAL);
> >> +
> >> +     of_property_read_string(node, "clock-output-names", &clk_name);
> >> +
> >> +     /* The A23 APB0 clock is a standard 2 bit wide divider clock */
> >> +     clk =3D clk_register_divider(NULL, clk_name, clk_parent, 0, reg,
> >> +                                0, 2, CLK_DIVIDER_POWER_OF_TWO, NULL);
> >> +     if (IS_ERR(clk))
> >> +             return clk;
> >> +
> >> +     ret =3D of_clk_add_provider(node, of_clk_src_simple_get, clk);
> >> +     if (ret)
> >> +             goto err_unregister;
> >> +
> >> +     return clk;
> >> +
> >> +err_unregister:
> >> +     clk_unregister_divider(clk);
> >> +
> >> +     return ERR_PTR(ret);
> >> +}
> >> +
> >> +static void sun8i_a23_apb0_setup(struct device_node *node)
> >> +{
> >> +     void __iomem *reg;
> >> +     struct resource res;
> >> +     struct clk *clk;
> >> +
> >> +     reg =3D of_io_request_and_map(node, 0, of_node_full_name(node));
> >> +     if (IS_ERR(reg)) {
> >> +             /*
> >> +              * This happens with clk nodes instantiated through mfd,
> >> +              * as those do not have their resources assigned in the
> >> +              * device tree. Do not print an error in this case.
> >> +              */
> >> +             if (PTR_ERR(reg) !=3D -EINVAL)
> >> +                     pr_err("Could not get registers for a23-apb0-clk=
\n");
> >
> > This is not the only case you have to take into account.
> >
> > There's also the case when you have a regular clock (and by regular I
> > mean that is not in the PRCM) that will be probed by the
> > CLK_OF_DECLARE mechanism and then later by the device model.
> >
> > In such a case, the second of_io_request_and_map will fail, and you
> > will have an error returned that you do not ignore at the moment.
>=20
> Right. It will return -EBUSY. But ignoring it and returning 0 is telling
> the driver core that the device successfully binded. I think this is
> wrong.

Well, technically, it is already bound.

> Normal clocks should be in the "clocks" node, and wouldn't be probed a
> second time through the device model, would it? Am I missing something?

Hmmm, that's true.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--NBQMqqtZQBFxm+aD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWZ/GJAAoJEBx+YmzsjxAgs/0QAJjaIYrCaVfCahHuGX4Ev602
YAxq3kpGvS9ansfetJxAZFIo8039g4Xs0gZke3skKh+KeJnfMIFR9CCguxBpsu/j
vpIoLslH4Pj4cKSF8zQbsjR7c7EQ9sJyfaqiWr6P0wpYpm588M9OLcvIlln0YdOU
pkl+SDgqy1ag4DVAlM61Pl8uWMePzb03R4n/Q56/t8V2Rz4H+C+AhzpRCQU/qxcp
kNsQbHckxp2Z5qsejvgl9JPYg/X9oSfx509gm3aPqWawtWbfwvzeuIAiBsXz+o7T
ENXRBxX1uk0IxtJPZP6LmUlAymkNxZOwNfEqsixR9rHXysBNXGESjt4CNq9uFUCX
HrpIkCs0pxVnrqaR0L+j83dPdxHsr+UAqJ9O+EX/k9VdI5LW7fHc6cR0dg2RhIqy
2JiLgZP5tTJmyvXheVUkdi8yKpwyYqSr6cTtS0gOHpc2eyN8evUG9tajnwHopKRF
4SkeTvxuaWiYct729ff7RGWWhnkAr8E0PLWRJD568lKp6y83dKMq5ljXIlQBIMHC
z71SpUi6/5gaD7EldnukCvrtfGZNtq/K30gankyb2CCKEs6T92a84IHzxy81z4DK
V2ok2xjDCq1gq8SEGZaJcBr7aXJRXCrXGTeUvEqs5zGj/YfYPPlySQoyY6t6A/G0
NeAoooZRKNumheDMYVv4
=6DHt
-----END PGP SIGNATURE-----

--NBQMqqtZQBFxm+aD--
