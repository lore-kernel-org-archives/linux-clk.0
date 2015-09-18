Return-Path: <hdegoede@redhat.com>
Subject: Re: [linux-sunxi] [PATCH 0/5] ARM: sunxi: Introduce CHIP support
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org
References: <1442566130-3497-1-git-send-email-maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <55FC2F99.5020409@redhat.com>
Date: Fri, 18 Sep 2015 11:36:57 -0400
MIME-Version: 1.0
In-Reply-To: <1442566130-3497-1-git-send-email-maxime.ripard@free-electrons.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hi,

On 09/18/2015 04:48 AM, Maxime Ripard wrote:
> Hi,
>
> Here is a serie introducing the support for the Allwinner R8 and the
> Nextthing's CHIP.
>
> Support is almost complete for the CHIP itself, the only missing part
> for now is the WiFi chip that needs to be powered through two combined
> regulators (AXP209's LDO3 and LDO4). The audio codec is also missing
> since it's not already enabled in the DT.
>
> Both these features will be addressed eventually.
>
> Let me know what you think,

Assuming you will be fixing Chen-Yu's comments this series looks good
to me and is:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> Maxime
>
> Maxime Ripard (5):
>    ARM: sunxi: Add R8 support
>    ARM: sun5i: Add R8 DTSI
>    ARM: sun5i: dt: Move uart3 pinctrl node to common DTSI
>    ARM: sun5i: dt: Add UART3 CTS and RTS pins
>    ARM: sun5i: Add C.H.I.P DTS
>
>   arch/arm/boot/dts/Makefile          |   3 +-
>   arch/arm/boot/dts/sun5i-a10s.dtsi   |   7 -
>   arch/arm/boot/dts/sun5i-r8-chip.dts | 261 ++++++++++++++++++++++++++++++++++++
>   arch/arm/boot/dts/sun5i-r8.dtsi     |  61 +++++++++
>   arch/arm/boot/dts/sun5i.dtsi        |  14 ++
>   arch/arm/mach-sunxi/sunxi.c         |   3 +-
>   drivers/clk/sunxi/clk-sunxi.c       |   1 +
>   7 files changed, 341 insertions(+), 9 deletions(-)
>   create mode 100644 arch/arm/boot/dts/sun5i-r8-chip.dts
>   create mode 100644 arch/arm/boot/dts/sun5i-r8.dtsi
>
