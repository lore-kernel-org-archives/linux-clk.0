Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <76DC4CD7-4A07-40C7-80A8-1C2D177E8109@aosc.io>
References: <20180119231735.61504-1-icenowy@aosc.io> <20180119231735.61504-3-icenowy@aosc.io>
 <CAGRGNgUjvvzseAtUuiy5xCaZrLw2Jq4+A_dPXR9r_Xs-yYL1cw@mail.gmail.com> <76DC4CD7-4A07-40C7-80A8-1C2D177E8109@aosc.io>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Sat, 20 Jan 2018 14:22:06 +1100
Message-ID: <CAGRGNgUj47nyf2dkgdk1bT2kO1p5oP8nk5LQ4EpCya2dfK=uMg@mail.gmail.com>
Subject: Re: [linux-sunxi] [RFC PATCH 2/9] ARM: sunxi: add Allwinner ARMv5 SoCs
To: icenowy@aosc.io
Cc: "Mailing List, Arm" <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-gpio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Icenowy,

On Sat, Jan 20, 2018 at 2:10 PM, Icenowy Zheng <icenowy@aosc.io> wrote:
>
>
> =E4=BA=8E 2018=E5=B9=B41=E6=9C=8820=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=88=
11:06:40, Julian Calaby <julian.calaby@gmail.com> =E5=86=99=E5=88=B0:
>>Hi Icenowy,
>>
>>On Sat, Jan 20, 2018 at 10:17 AM, Icenowy Zheng <icenowy@aosc.io>
>>wrote:
>>> Add option for Allwinner ARMv5 SoCs and a SoC suniv (which is a die
>>used
>>> for many new F-series products, including F1C100A, F1C100s, F1C200s,
>>> F1C500, F1C600).
>>>
>>> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
>>> ---
>>>  arch/arm/mach-sunxi/Kconfig    | 13 +++++++++++++
>>>  arch/arm/mach-sunxi/Makefile   |  1 +
>>>  arch/arm/mach-sunxi/sunxi_v5.c | 22 ++++++++++++++++++++++
>>>  3 files changed, 36 insertions(+)
>>>  create mode 100644 arch/arm/mach-sunxi/sunxi_v5.c
>>>
>>> diff --git a/arch/arm/mach-sunxi/Kconfig
>>b/arch/arm/mach-sunxi/Kconfig
>>> index 65509a35935f..78ac9ce70641 100644
>>> --- a/arch/arm/mach-sunxi/Kconfig
>>> +++ b/arch/arm/mach-sunxi/Kconfig
>>> @@ -59,3 +59,16 @@ config MACH_SUN9I
>>>         select ARM_GIC
>>>
>>>  endif
>>> +
>>> +menuconfig ARCH_SUNXI_V5
>>> +       bool "Allwinner SoCs"
>>
>>That name seems a little too generic. Maybe "Allwinner ARMv5 SoCs"?
>
> This is already required by armv5.
>
> Allwinner currently has only ARMv5,7,8 SoCs. ARMv8 is under
> arm64 architecture, and ARMv5 and v7 cannot be selected at the same time.

I'm going to try to back my way out of this hole by saying that they
should be more descriptive anyway (and it'll give clueless kconfiggers
a hint as to why they're not seeing their SoC listed)

However you're right, if both cannot be visible at the same time, then
it really doesn't matter if they both have the same name.

Sorry for the noise,

--=20
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/
