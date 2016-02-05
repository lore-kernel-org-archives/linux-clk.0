Return-Path: <wens@csie.org>
MIME-Version: 1.0
In-Reply-To: <20160203203120.GF3327@lukather>
References: <1452785109-6172-1-git-send-email-maxime.ripard@free-electrons.com>
 <1452785109-6172-11-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v67fqMUQsG-+zVxfgE3UzY7uyomBkwxgNHeXbqA1pwM8pA@mail.gmail.com> <20160203203120.GF3327@lukather>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 5 Feb 2016 17:49:45 +0800
Message-ID: <CAGb2v64QJJ07_ej5Jk8zY=i33yxtJebuF0S0-SwnQDmG0P5jMA@mail.gmail.com>
Subject: Re: [PATCH v2 10/26] ARM: sun5i: a13: Add display and TCON clocks
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, David Airlie <airlied@linux.ie>,
	Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	devicetree <devicetree@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>,
	Alexander Kaplan <alex@nextthing.co>, Boris Brezillon <boris.brezillon@free-electrons.com>,
	Wynter Woods <wynter@nextthing.co>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Rob Clark <robdclark@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Thu, Feb 4, 2016 at 4:31 AM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> Hi,
>
> On Sun, Jan 17, 2016 at 01:06:07AM +0800, Chen-Yu Tsai wrote:
>> > +                       compatible = "allwinner,sun4i-a10-tcon-ch0-clk";
>> > +                       reg = <0x01c20118 0x4>;
>> > +                       clocks = <&pll3>, <&pll7>, <&pll3x2>, <&pll7x2>;
>> > +                       clock-output-names = "tcon-ch0-sclk";
>> > +               };
>> > +
>> > +               tcon_ch1_clk: clk@01c2012c {
>> > +                       #clock-cells = <0>;
>> > +                       compatible = "allwinner,sun4i-a10-tcon-ch1-clk";
>> > +                       reg = <0x01c2012c 0x4>;
>> > +                       clocks = <&pll3>, <&pll7>, <&pll3x2>, <&pll7x2>;
>> > +                       clock-output-names = "tcon-ch1-sclk";
>> > +               };
>>
>> I suggest moving these to sun5i.dtsi, as they are shared amongst them.
>
> Eventually, yes, but I don't have an a10s board handy, and I couldn't
> test the clocks that needs to be taken by simplefb.
>
> Once properly tested, they can definitely be moved to sun5i.dtsi.

Acked-by: Chen-Yu Tsai <wens@csie.org>
