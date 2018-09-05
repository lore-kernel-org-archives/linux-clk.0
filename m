Return-Path: <jagan@amarulasolutions.com>
MIME-Version: 1.0
In-Reply-To: <20180905070335.dclhpxjld4vdkdu4@flea>
References: <20180904163609.10171-1-jagan@amarulasolutions.com> <20180905070335.dclhpxjld4vdkdu4@flea>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 5 Sep 2018 13:25:30 +0530
Message-ID: <CAMty3ZDVnsjJ0eRx1LxFjX+ti85=jRy=1x_sZ5d3yCHsVCD3HA@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] clk: sunxi-ng: Enable DE2_CCU for SUN8I and SUN50I
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>,
	Jernej Skrabec <jernej.skrabec@siol.net>, Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will.deacon@arm.com>, David Airlie <airlied@linux.ie>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Wed, Sep 5, 2018 at 12:33 PM, Maxime Ripard
<maxime.ripard@bootlin.com> wrote:
> On Tue, Sep 04, 2018 at 10:06:06PM +0530, Jagan Teki wrote:
>> Allwinner SoC like SUN8I and SUN50I has DE2 CCU so enable them
>> as default.
>>
>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>> ---
>> Changes for v4, v3:
>> - none
>> Changes for v2:
>> - Enable for MACH_SUN8I
>>
>>  drivers/clk/sunxi-ng/Kconfig | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/clk/sunxi-ng/Kconfig b/drivers/clk/sunxi-ng/Kconfig
>> index 826674d090fd..e20182aa9748 100644
>> --- a/drivers/clk/sunxi-ng/Kconfig
>> +++ b/drivers/clk/sunxi-ng/Kconfig
>> @@ -63,6 +63,8 @@ config SUN8I_V3S_CCU
>>
>>  config SUN8I_DE2_CCU
>>       bool "Support for the Allwinner SoCs DE2 CCU"
>> +     default MACH_SUN8I || (ARM64 && ARCH_SUNXI)
>> +     depends on DRM_SUN4I && (MACH_SUN8I || (ARM64 && ARCH_SUNXI))
>
> I don't see why there's a dependency on the DRM driver. I'm pretty
> sure this would even break simplefb.

Ok, got it. I will drop the depends on just add default.
