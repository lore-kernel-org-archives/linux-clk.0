Return-Path: <maxime.ripard@free-electrons.com>
Date: Sun, 15 May 2016 20:31:22 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Vishnu Patekar <vishnupatekar0510@gmail.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 02/16] clk: sunxi-ng: Add common infrastructure
Message-ID: <20160515183122.GA27618@lukather>
References: <1462737711-10017-1-git-send-email-maxime.ripard@free-electrons.com>
 <1462737711-10017-3-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v67XWt6tjG_xXWgGatTaiN5uYQb2_Q6bgixMDUkHfVHLHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
In-Reply-To: <CAGb2v67XWt6tjG_xXWgGatTaiN5uYQb2_Q6bgixMDUkHfVHLHg@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, May 09, 2016 at 06:01:45PM +0800, Chen-Yu Tsai wrote:
> On Mon, May 9, 2016 at 4:01 AM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > Start our new clock infrastructure by adding the registration code, com=
mon
> > structure and common code.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/clk/Makefile              |   1 +
> >  drivers/clk/sunxi-ng/Makefile     |   2 +
> >  drivers/clk/sunxi-ng/ccu_common.c | 108 ++++++++++++++++++++++++++++++=
++++++++
> >  drivers/clk/sunxi-ng/ccu_common.h |  74 ++++++++++++++++++++++++++
> >  drivers/clk/sunxi-ng/ccu_factor.h |  15 ++++++
> >  drivers/clk/sunxi-ng/ccu_mux.h    |  20 +++++++
> >  drivers/clk/sunxi-ng/ccu_reset.c  |  55 +++++++++++++++++++
> >  drivers/clk/sunxi-ng/ccu_reset.h  |  40 ++++++++++++++
> >  8 files changed, 315 insertions(+)
> >  create mode 100644 drivers/clk/sunxi-ng/Makefile
> >  create mode 100644 drivers/clk/sunxi-ng/ccu_common.c
> >  create mode 100644 drivers/clk/sunxi-ng/ccu_common.h
> >  create mode 100644 drivers/clk/sunxi-ng/ccu_factor.h
> >  create mode 100644 drivers/clk/sunxi-ng/ccu_mux.h
> >  create mode 100644 drivers/clk/sunxi-ng/ccu_reset.c
> >  create mode 100644 drivers/clk/sunxi-ng/ccu_reset.h
> >
> > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > index 4ef71a13ab37..83a93cd9e21d 100644
> > --- a/drivers/clk/Makefile
> > +++ b/drivers/clk/Makefile
> > @@ -78,6 +78,7 @@ obj-$(CONFIG_ARCH_SOCFPGA)            +=3D socfpga/
> >  obj-$(CONFIG_PLAT_SPEAR)               +=3D spear/
> >  obj-$(CONFIG_ARCH_STI)                 +=3D st/
> >  obj-$(CONFIG_ARCH_SUNXI)               +=3D sunxi/
> > +obj-$(CONFIG_ARCH_SUNXI)               +=3D sunxi-ng/
> >  obj-$(CONFIG_ARCH_TEGRA)               +=3D tegra/
> >  obj-y                                  +=3D ti/
> >  obj-$(CONFIG_ARCH_U8500)               +=3D ux500/
> > diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makef=
ile
> > new file mode 100644
> > index 000000000000..bd3461b0f38c
> > --- /dev/null
> > +++ b/drivers/clk/sunxi-ng/Makefile
> > @@ -0,0 +1,2 @@
> > +obj-y +=3D ccu_common.o
> > +obj-y +=3D ccu_reset.o
> > diff --git a/drivers/clk/sunxi-ng/ccu_common.c b/drivers/clk/sunxi-ng/c=
cu_common.c
> > new file mode 100644
> > index 000000000000..1d9242566fbd
> > --- /dev/null
> > +++ b/drivers/clk/sunxi-ng/ccu_common.c
> > @@ -0,0 +1,108 @@
> > +/*
> > + * Copyright 2016 Maxime Ripard
> > + *
> > + * Maxime Ripard <maxime.ripard@free-electrons.com>
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License as published by
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#include <linux/clk-provider.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/of_address.h>
> > +#include <linux/slab.h>
> > +
> > +#include "ccu_common.h"
> > +#include "ccu_reset.h"
> > +
> > +static DEFINE_SPINLOCK(ccu_lock);
> > +
> > +void ccu_helper_wait_for_lock(struct ccu_common *common, u32 lock)
> > +{
> > +       u32 reg;
> > +
> > +       if (!(common->features & CCU_FEATURE_LOCK))
> > +               return;
> > +
> > +       WARN_ON(readl_relaxed_poll_timeout(common->base + common->reg, =
reg,
> > +                                          !(reg & lock), 0, 500));
>=20
>                                     no delay between reads? ^

Yes, I intended it to be a simple busy waiting loop since I don't
expect it to be very long. Do yu have any more data on how much time
it usually takes?

>=20
> > +int sunxi_ccu_probe(struct device_node *node,
> > +                   const struct sunxi_ccu_desc *desc)
> > +{
> > +       struct ccu_common **cclks =3D desc->clks;
> > +       size_t num_clks =3D desc->num_clks;
> > +       struct clk_onecell_data *data;
> > +       struct ccu_reset *reset;
> > +       struct clk **clks;
> > +       void __iomem *reg;
> > +       int i, ret;
> > +
> > +       reg =3D of_iomap(node, 0);
>=20
> Why not of_io_request_and_map?

Because initially I still had some old clocks that were probing, which
was leading to some issues. This is obviously not the case anymore,
I'll switch to it.

>=20
> > +       if (IS_ERR(reg)) {
>=20
> And of_iomap returns NULL on error. This is for of_io_request_and_map.
>=20
> > +               pr_err("%s: Could not map the clock registers\n",
> > +                      of_node_full_name(node));
> > +               return PTR_ERR(reg);
> > +       }
> > +
> > +       data =3D kzalloc(sizeof(*data), GFP_KERNEL);
> > +       if (!data)
> > +               return -ENOMEM;
> > +
> > +       clks =3D kcalloc(num_clks, sizeof(struct clk *), GFP_KERNEL);
> > +       if (!clks)
> > +               return -ENOMEM;
> > +
> > +       data->clks =3D clks;
> > +       data->clk_num =3D num_clks;
> > +
> > +       for (i =3D 0; i < num_clks; i++) {
> > +               struct ccu_common *cclk =3D cclks[i];
> > +               struct clk *clk;
> > +
> > +               if (!cclk) {
> > +                       cclk =3D ERR_PTR(-ENOENT);
>=20
> This seems redundant, unless you intended to use it elsewhere?

Yeah, that was supposed to be clks[i] =3D ERR_PTR(..);

I'll fix it.

>=20
> > +                       continue;
> > +               }
> > +
> > +               cclk->base =3D reg;
> > +               cclk->lock =3D &ccu_lock;
> > +
> > +               clk =3D clk_register(NULL, &cclk->hw);
> > +               if (IS_ERR(clk))
> > +                       continue;
> > +
> > +               clks[i] =3D clk;
> > +       }
> > +
> > +       ret =3D of_clk_add_provider(node, of_clk_src_onecell_get, data);
> > +       if (ret)
> > +               goto err_clk_unreg;
> > +
> > +       reset =3D kzalloc(sizeof(*reset), GFP_KERNEL);
> > +       reset->rcdev.of_node =3D node;
> > +       reset->rcdev.ops =3D &ccu_reset_ops;
> > +       reset->rcdev.owner =3D THIS_MODULE;
> > +       reset->rcdev.nr_resets =3D desc->num_resets;
> > +       reset->base =3D reg;
> > +       reset->lock =3D &ccu_lock;
> > +       reset->reset_map =3D desc->resets;
> > +
> > +       ret =3D reset_controller_register(&reset->rcdev);
> > +       if (ret)
> > +               goto err_of_clk_unreg;
> > +
> > +       return 0;
> > +
> > +err_of_clk_unreg:
> > +err_clk_unreg:
> > +       return ret;
> > +}
> > diff --git a/drivers/clk/sunxi-ng/ccu_common.h b/drivers/clk/sunxi-ng/c=
cu_common.h
> > new file mode 100644
> > index 000000000000..e8b477fcd320
> > --- /dev/null
> > +++ b/drivers/clk/sunxi-ng/ccu_common.h
> > @@ -0,0 +1,74 @@
> > +/*
> > + * Copyright (c) 2016 Maxime Ripard. All rights reserved.
> > + *
> > + * This software is licensed under the terms of the GNU General Public
> > + * License version 2, as published by the Free Software Foundation, and
> > + * may be copied, distributed, and modified under those terms.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#ifndef _COMMON_H_
> > +#define _COMMON_H_
> > +
> > +#include <linux/compiler.h>
> > +#include <linux/clk-provider.h>
> > +
> > +#define CCU_FEATURE_GATE               BIT(0)
> > +#define CCU_FEATURE_LOCK               BIT(1)
>=20
> *_PLL_LOCK would be clearer that this implements a PLL lock indicator.
> Or maybe a comment.

I'll change it for PLL_LOCK

>=20
> > +#define CCU_FEATURE_FRACTIONAL         BIT(2)
> > +#define CCU_FEATURE_VARIABLE_PREDIV    BIT(3)
> > +#define CCU_FEATURE_FIXED_PREDIV       BIT(4)
> > +#define CCU_FEATURE_FIXED_POSTDIV      BIT(5)
> > +
> > +struct device_node;
> > +
> > +#define SUNXI_HW_INIT(_name, _parent, _ops, _flags)                   =
 \
> > +       &(struct clk_init_data) {                                      =
 \
> > +               .flags          =3D _flags,                            =
   \
> > +               .name           =3D _name,                             =
   \
> > +               .parent_names   =3D (const char *[]) { _parent },      =
   \
> > +               .num_parents    =3D 1,                                 =
   \
> > +               .ops            =3D _ops,                              =
   \
> > +       }
> > +
> > +#define SUNXI_HW_INIT_PARENTS(_name, _parents, _ops, _flags)          =
 \
> > +       &(struct clk_init_data) {                                      =
 \
> > +               .flags          =3D _flags,                            =
   \
> > +               .name           =3D _name,                             =
   \
> > +               .parent_names   =3D _parents,                          =
   \
> > +               .num_parents    =3D ARRAY_SIZE(_parents),              =
   \
> > +               .ops            =3D _ops,                              =
   \
> > +       }
> > +
> > +struct ccu_common {
> > +       void __iomem    *base;
> > +       unsigned long   reg;
>=20
> This seems quite large, considering the address space of the CCU,
> and you using u16 or u32 for the same thing on the reset control side.

Indeed, what about u16?

>=20
> > +
> > +       unsigned long   features;
> > +       spinlock_t      *lock;
> > +       struct clk_hw   hw;
> > +};
> > +
> > +static inline struct ccu_common *hw_to_ccu_common(struct clk_hw *hw)
> > +{
> > +       return container_of(hw, struct ccu_common, hw);
> > +}
> > +
> > +struct sunxi_ccu_desc {
> > +       struct ccu_common       **clks;
> > +       unsigned long           num_clks;
> > +
> > +       struct ccu_reset_map    *resets;
> > +       unsigned long           num_resets;
> > +};
> > +
> > +void ccu_helper_wait_for_lock(struct ccu_common *common, u32 lock);
> > +
> > +int sunxi_ccu_probe(struct device_node *node,
> > +                   const struct sunxi_ccu_desc *desc);
> > +
> > +#endif /* _COMMON_H_ */
> > diff --git a/drivers/clk/sunxi-ng/ccu_factor.h b/drivers/clk/sunxi-ng/c=
cu_factor.h
> > new file mode 100644
> > index 000000000000..e7cc564aaea0
> > --- /dev/null
> > +++ b/drivers/clk/sunxi-ng/ccu_factor.h
> > @@ -0,0 +1,15 @@
> > +#ifndef _CLK_FACTOR_H_
> > +#define _CLK_FACTOR_H_
> > +
> > +struct ccu_factor {
> > +       u8      shift;
> > +       u8      width;
> > +};
> > +
> > +#define SUNXI_CLK_FACTOR(_shift, _width)       \
> > +       {                                       \
> > +               .shift  =3D _shift,               \
> > +               .width  =3D _width,               \
> > +       }
> > +
> > +#endif /* _CLK_FACTOR_H_ */
> > diff --git a/drivers/clk/sunxi-ng/ccu_mux.h b/drivers/clk/sunxi-ng/ccu_=
mux.h
> > new file mode 100644
> > index 000000000000..17cedad4e433
> > --- /dev/null
> > +++ b/drivers/clk/sunxi-ng/ccu_mux.h
>=20
> As far as I can tell there are no users of this file within this patch or=
 the
> following patches before the mux clock support one. It'd be easier to und=
erstand
> if this part was moved to the mux clock patch.

Will do.

>=20
> > @@ -0,0 +1,20 @@
> > +#ifndef _CCU_MUX_H_
> > +#define _CCU_MUX_H_
> > +
> > +#include "common.h"
> > +
> > +struct ccu_mux_internal {
> > +       u8      shift;
> > +       u8      width;
> > +
> > +       u8      *map;
>=20
> I assume map is a table?
>=20
> > +};
> > +
> > +#define SUNXI_CLK_MUX(_shift, _width, _map)    \
> > +       {                                       \
> > +               .map    =3D _map,                 \
> > +               .shift  =3D _shift,               \
> > +               .width  =3D _width,               \
> > +       }
> > +
> > +#endif /* _CCU_MUX_H_ */
> > diff --git a/drivers/clk/sunxi-ng/ccu_reset.c b/drivers/clk/sunxi-ng/cc=
u_reset.c
> > new file mode 100644
> > index 000000000000..6c31d48783a7
> > --- /dev/null
> > +++ b/drivers/clk/sunxi-ng/ccu_reset.c
> > @@ -0,0 +1,55 @@
> > +/*
> > + * Copyright (C) 2016 Maxime Ripard
> > + * Maxime Ripard <maxime.ripard@free-electrons.com>
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public License as
> > + * published by the Free Software Foundation; either version 2 of
> > + * the License, or (at your option) any later version.
> > + */
> > +
> > +#include <linux/io.h>
> > +#include <linux/reset-controller.h>
> > +
> > +#include "ccu_reset.h"
> > +
> > +static int ccu_reset_assert(struct reset_controller_dev *rcdev,
> > +                           unsigned long id)
> > +{
> > +       struct ccu_reset *ccu =3D rcdev_to_ccu_reset(rcdev);
> > +       const struct ccu_reset_map *map =3D &ccu->reset_map[id];
> > +       unsigned long flags;
> > +       u32 reg;
> > +
> > +       spin_lock_irqsave(ccu->lock, flags);
> > +
> > +       reg =3D readl(ccu->base + map->reg);
> > +       writel(reg & ~map->bit, ccu->base + map->reg);
> > +
> > +       spin_unlock_irqrestore(ccu->lock, flags);
> > +
> > +       return 0;
> > +}
> > +
> > +static int ccu_reset_deassert(struct reset_controller_dev *rcdev,
> > +                             unsigned long id)
> > +{
> > +       struct ccu_reset *ccu =3D rcdev_to_ccu_reset(rcdev);
> > +       const struct ccu_reset_map *map =3D &ccu->reset_map[id];
> > +       unsigned long flags;
> > +       u32 reg;
> > +
> > +       spin_lock_irqsave(ccu->lock, flags);
> > +
> > +       reg =3D readl(ccu->base + map->reg);
> > +       writel(reg | map->bit, ccu->base + map->reg);
> > +
> > +       spin_unlock_irqrestore(ccu->lock, flags);
> > +
> > +       return 0;
> > +}
> > +
> > +const struct reset_control_ops ccu_reset_ops =3D {
> > +       .assert         =3D ccu_reset_assert,
> > +       .deassert       =3D ccu_reset_deassert,
> > +};
> > diff --git a/drivers/clk/sunxi-ng/ccu_reset.h b/drivers/clk/sunxi-ng/cc=
u_reset.h
> > new file mode 100644
> > index 000000000000..36a4679210bd
> > --- /dev/null
> > +++ b/drivers/clk/sunxi-ng/ccu_reset.h
> > @@ -0,0 +1,40 @@
> > +/*
> > + * Copyright (c) 2016 Maxime Ripard. All rights reserved.
> > + *
> > + * This software is licensed under the terms of the GNU General Public
> > + * License version 2, as published by the Free Software Foundation, and
> > + * may be copied, distributed, and modified under those terms.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#ifndef _CCU_RESET_H_
> > +#define _CCU_RESET_H_
> > +
> > +#include <linux/reset-controller.h>
> > +
> > +struct ccu_reset_map {
> > +       u16     reg;
> > +       u32     bit;
> > +};
> > +
> > +
> > +struct ccu_reset {
> > +       void __iomem                    *base;
> > +       struct ccu_reset_map            *reset_map;
> > +       spinlock_t                      *lock;
> > +
> > +       struct reset_controller_dev     rcdev;
> > +};
> > +
> > +static inline struct ccu_reset *rcdev_to_ccu_reset(struct reset_contro=
ller_dev *rcdev)
> > +{
> > +       return container_of(rcdev, struct ccu_reset, rcdev);
> > +}
> > +
> > +extern const struct reset_control_ops ccu_reset_ops;
> > +
> > +#endif /* _CCU_RESET_H_ */
>=20
> The reset control code looks good.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXOMB6AAoJEBx+YmzsjxAg3FIP/0W8FMOudmTAV1tsPQjSt7IV
uphdoXOugHVrej44o32GDi5Jw+8E0AkTQtRO3cwLHX7DG7pnrLIjuEsCEFiR0jVM
UoS6NnIs/mR7g8gsjxZPUN5zb8D4nejKY0d0/leGZWrlWkAteUOO+nESQ40xJT43
8gETNQLAQZD9crlL5AStr8hkK6DGfcnkyy+Gwo+DsnRK1xTTCpEKeEfxYhELQdKM
Cs/lo2iZKJTIJZlSuYjbZ5CcDXH15iLOzFYSzQkpHAsV4C7TTgD2IYaOf7U0QolW
0vYZtunfM6NNW441HB8Wy6AeRognjePM/qrh9Cskyj2tMI8nGgvu10kPeC8u+EFY
nxA2R57B/XG504OAnJ4xEmCLCse5rjR/8P/qWPdzmf/b4aAxB2FzHDR+15CbVhq8
2VIpZ1cgh8RwBfAj6Flub7LmBkDJBkzOpBI0XGk4UJBDY2V/T9yNoS7+3Hh6tPfd
BK4W5S5L4E8aZzp3HF4g1XhWBz2v+9hYTMvHdILh3aSYigDVphDOe/zhY30G/Mgp
c8uKuazWAj6rr8EnoW79uoy7qHQLW8VdWx/rIgYC1HlqCz+U4hLJre1I0dx3FXBy
Fk0TMgrjDVpEY7mW3GRctVyRlxXmiQMcjcDzEEhWDLNdSzA67LPg8L5BcHM1XcZM
BdOr6FBHEJ7hD79jdz3A
=Sz9Q
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--
