Return-Path: <wens@csie.org>
MIME-Version: 1.0
In-Reply-To: <1446214865-3972-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1446214865-3972-1-git-send-email-maxime.ripard@free-electrons.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 9 Nov 2015 11:43:44 +0800
Message-ID: <CAGb2v678TOTbAcJMbdLsg1AB-ze_hchG0Yw4or1ENwu_YzQGfw@mail.gmail.com>
Subject: Re: [PATCH 00/19] drm: Add Allwinner A10 display engine support
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
	devicetree <devicetree@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Chen-Yu Tsai <wens@csie.org>,
	Hans de Goede <hdegoede@redhat.com>, Alexander Kaplan <alex@nextthing.co>,
	Wynter Woods <wynter@nextthing.co>, Boris Brezillon <boris.brezillon@free-electrons.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Rob Clark <robdclark@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Maxime,

On Fri, Oct 30, 2015 at 10:20 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> Maxime Ripard (19):
>   clk: sunxi: Add display clock
>   clk: sunxi: Add PLL3 clock
>   clk: sunxi: Add TCON channel0 clock
>   clk: sunxi: Add TCON channel1 clock
>   clk: sunxi: add DRAM gates
>   clk: sunxi: Add Allwinner R8 AHB gates support
>   drm/panel: simple: Add timings for the Olimex LCD-OLinuXino-4.3TS
>   drm: Add Allwinner A10 Display Engine support
>   drm: sun4i: Add DT bindings documentation
>   drm: sun4i: Add RGB output
>   drm: sun4i: Add composite output
>   drm: sun4i: tv: Add PAL output standard
>   drm: sun4i: tv: Add NTSC output standard
>   ARM: sun5i: dt: Add pll3 and pll7 clocks
>   ARM: sun5i: dt: Add display and TCON clocks
>   ARM: sun5i: dt: Add DRAM gates
>   ARM: sun5i: dt: Add display blocks to the DTSI
>   ARM: sun5i: r8: Add AHB gates to the DTSI
>   ARM: sun5i: chip: Enable the TV Encoder

Can you add a patch adding the clock compatibles to
Documentation/devicetree/bindings/clock/sunxi.txt?

Thanks
ChenYu
