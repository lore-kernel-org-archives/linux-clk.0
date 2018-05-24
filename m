Return-Path: <prvs=2682933aec=Matti.Vaittinen@fi.rohmeurope.com>
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: Mark Brown <broonie@kernel.org>
CC: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>, "lee.jones@linaro.org"
	<lee.jones@linaro.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Mutanen,
 Mikko" <Mikko.Mutanen@fi.rohmeurope.com>, "Haikola, Heikki"
	<Heikki.Haikola@fi.rohmeurope.com>
Subject: RE: [PATCH 8/9] regulator: bd71837: BD71837 PMIC regulator driver
Date: Thu, 24 May 2018 17:51:27 +0000
Message-ID: <042F8805D2046347BB8420BEAE397A4016C06B60@WILL-MAIL002.REu.RohmEu.com>
References: <20180524060036.GI4249@localhost.localdomain>,<20180524141427.GU4828@sirena.org.uk>
In-Reply-To: <20180524141427.GU4828@sirena.org.uk>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

=0A=
From: Mark Brown [broonie@kernel.org]=0A=
> Sent: Thursday, May 24, 2018 5:14 PM=0A=
>=0A=
> On Thu, May 24, 2018 at 09:00:36AM +0300, Matti Vaittinen wrote:=0A=
>=0A=
> > @@ -0,0 +1,683 @@=0A=
> > +// SPDX-License-Identifier: GPL-2.0=0A=
> > +/* Copyright (C) 2018 ROHM Semiconductors */=0A=
> > +/*=0A=
> > + * bd71837-regulator.c ROHM BD71837MWV regulator driver=0A=
> > + */=0A=
> > +#include <linux/kernel.h>=0A=
>=0A=
> Make the entire comment block a C++ comment so it looks more intentional=
=0A=
=0A=
I will change this to C++ - but the verison of checkpatch.pl I used did com=
plain=0A=
if I used C++ style comments in C-files or if I used C-style comments in he=
ader.=0A=
I guess the sscript should be fixed unless it is already done.=0A=
=0A=
> and add a blank line before the headers for legibility.=0A=
Will do.=0A=
=0A=
> > +static int bd71837_regulator_set_regmap(struct regulator_dev *rdev, in=
t set)=0A=
> > +{=0A=
> > +     int ret =3D -EINVAL;=0A=
> > +     struct bd71837_pmic *pmic =3D rdev->reg_data;=0A=
> > +=0A=
> > +     if (pmic) {=0A=
> > +             mutex_lock(&pmic->mtx);=0A=
> > +             if (!set)=0A=
> > +                     ret =3D regulator_disable_regmap(rdev);=0A=
> > +             else=0A=
> > +                     ret =3D regulator_enable_regmap(rdev);=0A=
> > +             mutex_unlock(&pmic->mtx);=0A=
> > +     }=0A=
>=0A=
> This looks very weird - why might we not have a parent PMIC,=0A=
I'll remove the check. I've just adopted habit of adding NULL checks=0A=
for pointers "jsut in case".=0A=
=0A=
> what is the lock doing and what is this wrapper function intended to do?=
=0A=
This was the other spot which I was unsure how to handle. Datasheet for=0A=
the chip says that if voltage is to be changed, the regulator must be=0A=
disabled. Thus my voltage changing function checks if regulator is enabled=
=0A=
and disables it for duration of voltage change (if it was enabled). This lo=
ck=0A=
is used to protect the voltage change so that no one enables the regulator=
=0A=
during voltage change. I don't know what would have been correct way of=0A=
doing this, or if disabling regulator for voltage change is Ok - but this w=
as=0A=
the only way I could think of. I am again grateful for any tips.=0A=
=0A=
> Similar=0A=
> issues apply to the voltage functions, if there's any need for this it=0A=
> needs to be better documented but it really doesn't look like a good=0A=
> idea.=0A=
If the solution with lock and wrapper (to prevent race during state check=
=0A=
and voltage change) is Ok, then I will add comment which explains this,=0A=
=0A=
> > +     err =3D=0A=
> > +         regmap_update_bits(pmic->mfd->regmap, BD71837_REG_REGLOCK,=0A=
> > +                            (REGLOCK_PWRSEQ | REGLOCK_VREG), 0);=0A=
> > +     if (err) {=0A=
> > +             dev_err(&pmic->pdev->dev, "Failed to unlock PMIC (%d)\n",=
 err);=0A=
> > +             goto err;=0A=
> > +     } else=0A=
> > +             dev_dbg(&pmic->pdev->dev, "%s: Unlocked lock register 0x%=
x\n",=0A=
> > +                     __func__, BD71837_REG_REGLOCK);=0A=
>=0A=
> There's loads of coding style problems with this code, please refer to=0A=
> the coding style - indentation is weird and if there's { } on one side=0A=
> of an else it should be on both.=0A=
=0A=
Will fix it.=0A=
=0A=
> > +             rdev =3D regulator_register(desc, &config);=0A=
> > +             if (IS_ERR(rdev)) {=0A=
>=0A=
> devm_regulator_regster()=0A=
=0A=
Makes sense. Thanks=0A=
=0A=
=0A=
Best Regards=0A=
    Matti Vaittinen=0A=
=0A=
