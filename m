Return-Path: <jagan@amarulasolutions.com>
MIME-Version: 1.0
In-Reply-To: <20180905070819.gisznpkvvuqire7c@flea>
References: <20180904163609.10171-1-jagan@amarulasolutions.com>
 <20180904163609.10171-4-jagan@amarulasolutions.com> <20180905070819.gisznpkvvuqire7c@flea>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 5 Sep 2018 13:54:42 +0530
Message-ID: <CAMty3ZAzjSwq86BwB8O_7DrT0jrhn3ByzN34dY37pF3ZsAZ6uA@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] drm/sun4i: Enable DesignWare HDMI for SUN50I
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

On Wed, Sep 5, 2018 at 12:38 PM, Maxime Ripard
<maxime.ripard@bootlin.com> wrote:
> On Tue, Sep 04, 2018 at 10:06:09PM +0530, Jagan Teki wrote:
>> Allwinner SUN50I are now using DesignWare HDMI so enable
>> them as default. This can build DRM_SUN8I_DW_HDMI as module
>> since DRM in arm64 has module.
>>
>> Making this as defult to SUN8I, may cause an issue while
>> loading since arm32 DRM built as static.
>
> Uh? Why? We should fix this instead of working around it.

I didn't dig further on this. Since ARM64 has is fine with it both
(module and static) may be we can take this.
