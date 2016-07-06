Return-Path: <w.egorov@phytec.de>
Subject: Re: [RESEND PATCH v5 1/5] mfd: RK808: Add RK818 support
To: Andy Yan <andy.yan@rock-chips.com>, Lee Jones <lee.jones@linaro.org>
References: <1464850228-17244-1-git-send-email-w.egorov@phytec.de>
 <20160608141735.GE14888@dell> <5759277D.7090101@phytec.de>
 <577C77DF.9060706@rock-chips.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, a.zummo@towertech.it, pawel.moll@arm.com, rtc-linux@googlegroups.com, ijc+devicetree@hellion.org.uk, mturquette@baylibre.com, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, alexandre.belloni@free-electrons.com, broonie@kernel.org, dianders@chromium.org, galak@codeaurora.org, zyw@rock-chips.com, linux-clk@vger.kernel.org
From: Wadim Egorov <w.egorov@phytec.de>
Message-ID: <577CBB62.8080806@phytec.de>
Date: Wed, 6 Jul 2016 10:03:46 +0200
MIME-Version: 1.0
In-Reply-To: <577C77DF.9060706@rock-chips.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Hi Andy,

On 06.07.2016 05:15, Andy Yan wrote:
> Hi Wadim:
>
> On 2016=E5=B9=B406=E6=9C=8809=E6=97=A5 16:23, Wadim Egorov wrote:
>> Hi,
>>
>> On 08.06.2016 16:17, Lee Jones wrote:
>>> On Thu, 02 Jun 2016, Wadim Egorov wrote:
>>>
>>>> The RK818 chip is a power management IC for multimedia and handheld
>>> "Power Management IC (PMIC)"
>>>
>>>> devices. It contains the following components:
>>>>
>>>> - Regulators
>>>> - RTC
>>>> - Clkout
>>> Clocking
>>>
>>>> - battery support
>>> Battery support
>>>
>>>> Both chips RK808 and RK818 are using a similar register map.
>>> "Both RK808 ad RK818 chips"
>>>
>>>> So we can reuse the RTC and Clkout functionality.
>>> Swap '.' for ','.
>>>
>>>> Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
>>>> ---
>>>>   drivers/mfd/Kconfig       |   4 +-
>>>>   drivers/mfd/rk808.c       | 231
>>>> ++++++++++++++++++++++++++++++++++++++--------
>>>>   include/linux/mfd/rk808.h | 162 ++++++++++++++++++++++++++++++--
>>>>   3 files changed, 350 insertions(+), 47 deletions(-)
>>>>
>>>> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
>>>> index 1bcf601..7ba464b 100644
>>>> --- a/drivers/mfd/Kconfig
>>>> +++ b/drivers/mfd/Kconfig
>>>> @@ -839,13 +839,13 @@ config MFD=5FRC5T583
>>>>         different functionality of the device.
>>>>     config MFD=5FRK808
>>>> -    tristate "Rockchip RK808 Power Management chip"
>>>> +    tristate "Rockchip RK808/RK818 Power Management chip"
>>> "Chip"
>>>
>>>>       depends on I2C && OF
>>>>       select MFD=5FCORE
>>>>       select REGMAP=5FI2C
>>>>       select REGMAP=5FIRQ
>>>>       help
>>>> -      If you say yes here you get support for the RK808
>>>> +      If you say yes here you get support for the RK808 and RK818
>>>>         Power Management chips.
>>>>         This driver provides common support for accessing the device
>>>>         through I2C interface. The device supports multiple
>>>> sub-devices
>>>> diff --git a/drivers/mfd/rk808.c b/drivers/mfd/rk808.c
>>>> index 49d7f62..3cf9724 100644
>>>> --- a/drivers/mfd/rk808.c
>>>> +++ b/drivers/mfd/rk808.c
>>>> @@ -1,11 +1,15 @@
>>>>   /*
>>>> - * MFD core driver for Rockchip RK808
>>>> + * MFD core driver for Rockchip RK808/RK818
>>>>    *
>>>>    * Copyright (c) 2014, Fuzhou Rockchip Electronics Co., Ltd
>>>>    *
>>>>    * Author: Chris Zhong <zyw@rock-chips.com>
>>>>    * Author: Zhang Qing <zhangqing@rock-chips.com>
>>>>    *
>>>> + * Copyright (C) 2016 PHYTEC Messtechnik GmbH
>>>> + *
>>>> + * Author: Wadim Egorov <w.egorov@phytec.de>
>>>> + *
>>>>    * This program is free software; you can redistribute it and/or
>>>> modify it
>>>>    * under the terms and conditions of the GNU General Public License,
>>>>    * version 2, as published by the Free Software Foundation.
>>>> @@ -22,12 +26,7 @@
>>>>   #include <linux/mfd/core.h>
>>>>   #include <linux/module.h>
>>>>   #include <linux/regmap.h>
>>>> -
>>>> -struct rk808=5Freg=5Fdata {
>>>> -    int addr;
>>>> -    int mask;
>>>> -    int value;
>>>> -};
>>> Why are you moving this to the header?
>> It is now part of the rk808 struct.
>>
>>>> +#include <linux/of=5Fdevice.h>
>>>>     static bool rk808=5Fis=5Fvolatile=5Freg(struct device *dev, unsign=
ed
>>>> int reg)
>>>>   {
>>>> @@ -57,6 +56,14 @@ static bool rk808=5Fis=5Fvolatile=5Freg(struct devi=
ce
>>>> *dev, unsigned int reg)
>>>>       return false;
>>>>   }
>>>>   +static const struct regmap=5Fconfig rk818=5Fregmap=5Fconfig =3D {
>>>> +    .reg=5Fbits =3D 8,
>>>> +    .val=5Fbits =3D 8,
>>>> +    .max=5Fregister =3D RK818=5FUSB=5FCTRL=5FREG,
>>>> +    .cache=5Ftype =3D REGCACHE=5FRBTREE,
>>>> +    .volatile=5Freg =3D rk808=5Fis=5Fvolatile=5Freg,
>>>> +};
>>>> +
>>>>   static const struct regmap=5Fconfig rk808=5Fregmap=5Fconfig =3D {
>>>>       .reg=5Fbits =3D 8,
>>>>       .val=5Fbits =3D 8,
>>>> @@ -83,7 +90,17 @@ static const struct mfd=5Fcell rk808s[] =3D {
>>>>       },
>>>>   };
>>>>   -static const struct rk808=5Freg=5Fdata pre=5Finit=5Freg[] =3D {
>>>> +static const struct mfd=5Fcell rk818s[] =3D {
>>>> +    { .name =3D "rk808-clkout", },
>>> How does this differ to a normal -clock driver?
>> I don't know. It is a normal clock driver.
>>
>>>> +    { .name =3D "rk808-regulator", },
>>>> +    {
>>>> +        .name =3D "rk808-rtc",
>>>> +        .num=5Fresources =3D ARRAY=5FSIZE(rtc=5Fresources),
>>>> +        .resources =3D &rtc=5Fresources[0],
>>> .resources =3D rtc=5Fresources,  ?
>>>
>>>> +    },
>>>> +};
>>>> +
>>>> +static const struct rk8xx=5Freg=5Fdata rk808=5Fpre=5Finit=5Freg[] =3D=
 {
>>>>       { RK808=5FBUCK3=5FCONFIG=5FREG, BUCK=5FILMIN=5FMASK,  BUCK=5FILM=
IN=5F150MA },
>>>>       { RK808=5FBUCK4=5FCONFIG=5FREG, BUCK=5FILMIN=5FMASK,  BUCK=5FILM=
IN=5F200MA },
>>>>       { RK808=5FBOOST=5FCONFIG=5FREG, BOOST=5FILMIN=5FMASK, BOOST=5FIL=
MIN=5F100MA },
>>>> @@ -94,6 +111,22 @@ static const struct rk808=5Freg=5Fdata
>>>> pre=5Finit=5Freg[] =3D {
>>>>                               VB=5FLO=5FSEL=5F3500MV },
>>>>   };
>>>>   +static const struct rk8xx=5Freg=5Fdata rk818=5Fpre=5Finit=5Freg[] =
=3D {
>>>> +    { RK818=5FUSB=5FCTRL=5FREG,    RK818=5FUSB=5FILIM=5FSEL=5FMASK,
>>>> +                        RK818=5FUSB=5FILMIN=5F2000MA },
>>>> +    /* close charger when usb lower then 3.4V */
>>>> +    { RK818=5FUSB=5FCTRL=5FREG,    RK818=5FUSB=5FCHG=5FSD=5FVSEL=5FMA=
SK, (0x7 <<
>>>> 4) },
>>>> +    /* no action when vref */
>>>> +    { RK818=5FH5V=5FEN=5FREG,    BIT(1),        RK818=5FREF=5FRDY=5FC=
TRL },
>>>> +    /* enable HDMI 5V */
>>>> +    { RK818=5FH5V=5FEN=5FREG,    BIT(0),        RK818=5FH5V=5FEN },
>>>> +    /* improve efficiency */
>>>> +    { RK818=5FBUCK2=5FCONFIG=5FREG, BUCK2=5FRATE=5FMASK,    BUCK=5FIL=
MIN=5F250MA },
>>>> +    { RK818=5FBUCK4=5FCONFIG=5FREG, BUCK=5FILMIN=5FMASK,    BUCK=5FIL=
MIN=5F250MA },
>>>> +    { RK818=5FBOOST=5FCONFIG=5FREG, BOOST=5FILMIN=5FMASK,  =20
>>>> BOOST=5FILMIN=5F100MA },
>>>> +    { RK808=5FVB=5FMON=5FREG,    MASK=5FALL,    VB=5FLO=5FACT |
>>>> VB=5FLO=5FSEL=5F3500MV },
>>>> +};
>>> The alignment here looks odd.
>> I will fix it in the next version.
>>
>>>>   static const struct regmap=5Firq rk808=5Firqs[] =3D {
>>>>       /* INT=5FSTS */
>>>>       [RK808=5FIRQ=5FVOUT=5FLO] =3D {
>>>> @@ -136,6 +169,76 @@ static const struct regmap=5Firq rk808=5Firqs[] =
=3D {
>>>>       },
>>>>   };
>>>>   +static const struct regmap=5Firq rk818=5Firqs[] =3D {
>>>> +    /* INT=5FSTS */
>>>> +    [RK818=5FIRQ=5FVOUT=5FLO] =3D {
>>>> +        .mask =3D RK818=5FIRQ=5FVOUT=5FLO=5FMSK,
>>>> +        .reg=5Foffset =3D 0,
>>>> +    },
>>>> +    [RK818=5FIRQ=5FVB=5FLO] =3D {
>>>> +        .mask =3D RK818=5FIRQ=5FVB=5FLO=5FMSK,
>>>> +        .reg=5Foffset =3D 0,
>>>> +    },
>>>> +    [RK818=5FIRQ=5FPWRON] =3D {
>>>> +        .mask =3D RK818=5FIRQ=5FPWRON=5FMSK,
>>>> +        .reg=5Foffset =3D 0,
>>>> +    },
>>>> +    [RK818=5FIRQ=5FPWRON=5FLP] =3D {
>>>> +        .mask =3D RK818=5FIRQ=5FPWRON=5FLP=5FMSK,
>>>> +        .reg=5Foffset =3D 0,
>>>> +    },
>>>> +    [RK818=5FIRQ=5FHOTDIE] =3D {
>>>> +        .mask =3D RK818=5FIRQ=5FHOTDIE=5FMSK,
>>>> +        .reg=5Foffset =3D 0,
>>>> +    },
>>>> +    [RK818=5FIRQ=5FRTC=5FALARM] =3D {
>>>> +        .mask =3D RK818=5FIRQ=5FRTC=5FALARM=5FMSK,
>>>> +        .reg=5Foffset =3D 0,
>>>> +    },
>>>> +    [RK818=5FIRQ=5FRTC=5FPERIOD] =3D {
>>>> +        .mask =3D RK818=5FIRQ=5FRTC=5FPERIOD=5FMSK,
>>>> +        .reg=5Foffset =3D 0,
>>>> +    },
>>>> +    [RK818=5FIRQ=5FUSB=5FOV] =3D {
>>>> +        .mask =3D RK818=5FIRQ=5FUSB=5FOV=5FMSK,
>>>> +        .reg=5Foffset =3D 0,
>>>> +    },
>>>> +
>>>> +    /* INT=5FSTS2 */
>>>> +    [RK818=5FIRQ=5FPLUG=5FIN] =3D {
>>>> +        .mask =3D RK818=5FIRQ=5FPLUG=5FIN=5FMSK,
>>>> +        .reg=5Foffset =3D 1,
>>>> +    },
>>>> +    [RK818=5FIRQ=5FPLUG=5FOUT] =3D {
>>>> +        .mask =3D RK818=5FIRQ=5FPLUG=5FOUT=5FMSK,
>>>> +        .reg=5Foffset =3D 1,
>>>> +    },
>>>> +    [RK818=5FIRQ=5FCHG=5FOK] =3D {
>>>> +        .mask =3D RK818=5FIRQ=5FCHG=5FOK=5FMSK,
>>>> +        .reg=5Foffset =3D 1,
>>>> +    },
>>>> +    [RK818=5FIRQ=5FCHG=5FTE] =3D {
>>>> +        .mask =3D RK818=5FIRQ=5FCHG=5FTE=5FMSK,
>>>> +        .reg=5Foffset =3D 1,
>>>> +    },
>>>> +    [RK818=5FIRQ=5FCHG=5FTS1] =3D {
>>>> +        .mask =3D RK818=5FIRQ=5FCHG=5FTS1=5FMSK,
>>>> +        .reg=5Foffset =3D 1,
>>>> +    },
>>>> +    [RK818=5FIRQ=5FTS2] =3D {
>>>> +        .mask =3D RK818=5FIRQ=5FTS2=5FMSK,
>>>> +        .reg=5Foffset =3D 1,
>>>> +    },
>>>> +    [RK818=5FIRQ=5FCHG=5FCVTLIM] =3D {
>>>> +        .mask =3D RK818=5FIRQ=5FCHG=5FCVTLIM=5FMSK,
>>>> +        .reg=5Foffset =3D 1,
>>>> +    },
>>>> +    [RK818=5FIRQ=5FDISCHG=5FILIM] =3D {
>>>> +        .mask =3D RK818=5FIRQ=5FDISCHG=5FILIM=5FMSK,
>>>> +        .reg=5Foffset =3D 1,
>>>> +    },
>>>> +};
>>>> +
>>>>   static struct regmap=5Firq=5Fchip rk808=5Firq=5Fchip =3D {
>>>>       .name =3D "rk808",
>>>>       .irqs =3D rk808=5Firqs,
>>>> @@ -148,6 +251,18 @@ static struct regmap=5Firq=5Fchip rk808=5Firq=5Fc=
hip =3D {
>>>>       .init=5Fack=5Fmasked =3D true,
>>>>   };
>>>>   +static struct regmap=5Firq=5Fchip rk818=5Firq=5Fchip =3D {
>>>> +    .name =3D "rk818",
>>>> +    .irqs =3D rk818=5Firqs,
>>>> +    .num=5Firqs =3D ARRAY=5FSIZE(rk818=5Firqs),
>>>> +    .num=5Fregs =3D 2,
>>>> +    .irq=5Freg=5Fstride =3D 2,
>>>> +    .status=5Fbase =3D RK818=5FINT=5FSTS=5FREG1,
>>>> +    .mask=5Fbase =3D RK818=5FINT=5FSTS=5FMSK=5FREG1,
>>>> +    .ack=5Fbase =3D RK818=5FINT=5FSTS=5FREG1,
>>>> +    .init=5Fack=5Fmasked =3D true,
>>>> +};
>>>> +
>>>>   static struct i2c=5Fclient *rk808=5Fi2c=5Fclient;
>>>>   static void rk808=5Fdevice=5Fshutdown(void)
>>>>   {
>>>> @@ -167,6 +282,48 @@ static void rk808=5Fdevice=5Fshutdown(void)
>>>>           dev=5Ferr(&rk808=5Fi2c=5Fclient->dev, "power off error!\n");
>>>>   }
>>>>   +static const struct of=5Fdevice=5Fid rk808=5Fof=5Fmatch[] =3D {
>>>> +    { .compatible =3D "rockchip,rk808", .data =3D (void *) RK808=5FID=
 },
>>>> +    { .compatible =3D "rockchip,rk818", .data =3D (void *) RK818=5FID=
 },
>>>> +    { },
>>>> +};
>>>> +MODULE=5FDEVICE=5FTABLE(of, rk808=5Fof=5Fmatch);
>>>> +
>>>> +static int rk8xx=5Fmatch=5Fdevice(struct rk808 *rk808, struct device
>>>> *dev)
>>> If you're going to do it this way, please switch these parameters.
>>>
>>> It's more common to return the pointer however.
>> If it's more common I will return a pointer to rk808.
>>
>>>> +{
>>>> +    const struct of=5Fdevice=5Fid *of=5Fid;
>>>> +
>>>> +    of=5Fid =3D of=5Fmatch=5Fdevice(rk808=5Fof=5Fmatch, dev);
>>>> +    if (!of=5Fid) {
>>>> +        dev=5Ferr(dev, "Unable to match OF ID\n");
>>>> +        return -ENODEV;
>>>> +    }
>>>> +    rk808->variant =3D (long) of=5Fid->data;
>>>> +
>>>> +    switch (rk808->variant) {
>>>> +    case RK808=5FID:
>>>> +        rk808->nr=5Fcells =3D ARRAY=5FSIZE(rk808s);
>>>> +        rk808->cells =3D rk808s;
>>>> +        rk808->regmap=5Fcfg =3D &rk808=5Fregmap=5Fconfig;
>>>> +        rk808->regmap=5Firq=5Fchip =3D &rk808=5Firq=5Fchip;
>>>> +        rk808->pre=5Finit=5Freg =3D rk808=5Fpre=5Finit=5Freg;
>>>> +        rk808->nr=5Fpre=5Finit=5Fregs =3D ARRAY=5FSIZE(rk808=5Fpre=5F=
init=5Freg);
>>>> +        break;
>>>> +    case RK818=5FID:
>>>> +        rk808->nr=5Fcells =3D ARRAY=5FSIZE(rk818s);
>>>> +        rk808->cells =3D rk818s;
>>>> +        rk808->regmap=5Fcfg =3D &rk818=5Fregmap=5Fconfig;
>>>> +        rk808->regmap=5Firq=5Fchip =3D &rk818=5Firq=5Fchip;
>>>> +        rk808->pre=5Finit=5Freg =3D rk818=5Fpre=5Finit=5Freg;
>>>> +        rk808->nr=5Fpre=5Finit=5Fregs =3D ARRAY=5FSIZE(rk818=5Fpre=5F=
init=5Freg);
>>>> +        break;
>>>> +    default:
>>>> +        dev=5Ferr(dev, "unsupported RK8XX ID %lu\n", rk808->variant);
>>>> +        return -EINVAL;
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>>>   static int rk808=5Fprobe(struct i2c=5Fclient *client,
>>>>                  const struct i2c=5Fdevice=5Fid *id)
>>>>   {
>>>> @@ -176,46 +333,52 @@ static int rk808=5Fprobe(struct i2c=5Fclient
>>>> *client,
>>>>       int ret;
>>>>       int i;
>>>>   -    if (!client->irq) {
>>>> -        dev=5Ferr(&client->dev, "No interrupt support, no core IRQ\n"=
);
>>>> -        return -EINVAL;
>>>> -    }
>>>> -
>>>>       rk808 =3D devm=5Fkzalloc(&client->dev, sizeof(*rk808), GFP=5FKER=
NEL);
>>>>       if (!rk808)
>>>>           return -ENOMEM;
>>>>   -    rk808->regmap =3D devm=5Fregmap=5Finit=5Fi2c(client,
>>>> &rk808=5Fregmap=5Fconfig);
>>>> +    ret =3D rk8xx=5Fmatch=5Fdevice(rk808, &client->dev);
>>> Is there a way to dynamically probe the device?  No device ID you can
>>> read directly from the silicon?
>> AFAIK there is no device ID register. At least it is not documented in
>> the manual.
>
> register 0x17 and 0x18 is the ID register, 0x17 is the MSB, 0x18 is LSB
>
> for RK818, register 0x17 is 0x81, 0x18 is 0x81

thank you for sharing this information. I have no RK808 PMIC device
here, so I would also need the IDs for RK808.

Lee, you have already applied this series. But I can't find the patches
in your kernel tree.
I would like to read the device ID from the register in the probe function.
Do you want me to base my changes on top of this series or send a new
version?
