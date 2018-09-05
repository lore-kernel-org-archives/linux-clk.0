Return-Path: <jagan@amarulasolutions.com>
MIME-Version: 1.0
In-Reply-To: <20180905070748.g43lfdqdhmoci6pk@flea>
References: <20180904163609.10171-1-jagan@amarulasolutions.com>
 <20180904163609.10171-3-jagan@amarulasolutions.com> <20180905070748.g43lfdqdhmoci6pk@flea>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 5 Sep 2018 13:51:25 +0530
Message-ID: <CAMty3ZBYjq8VBnwSqKhJgag1ARRvnPTVSpYT7SWu=A6pMwKEiA@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] drm/sun4i: Enable DE2 Mixer for SUN8I and SUN50I
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

On Wed, Sep 5, 2018 at 12:37 PM, Maxime Ripard
<maxime.ripard@bootlin.com> wrote:
> On Tue, Sep 04, 2018 at 10:06:08PM +0530, Jagan Teki wrote:
>> Allwinner SoC like SUN8I and SUN50I are now using DE2 Mixer
>> so enable them as default.
>>
>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>> ---
>> Changes for v4, v3:
>> - none
>> Changes for v2:
>> - Enable for SUN8I
>>
>>  drivers/gpu/drm/sun4i/Kconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/sun4i/Kconfig b/drivers/gpu/drm/sun4i/Kconfig
>> index c2c042287c19..cfa8b96273fb 100644
>> --- a/drivers/gpu/drm/sun4i/Kconfig
>> +++ b/drivers/gpu/drm/sun4i/Kconfig
>> @@ -61,7 +61,7 @@ config DRM_SUN8I_DW_HDMI
>>
>>  config DRM_SUN8I_MIXER
>>       tristate "Support for Allwinner Display Engine 2.0 Mixer"
>> -     default MACH_SUN8I
>> +     default MACH_SUN8I || (ARM64 && ARCH_SUNXI)
>
> I'm not really sure we should put it as a default. We should just
> enable it in the defconfig.

What would be the difference in both cases it would be build as module
since DRM_SUN4I=m for ARM64
