Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Date: Thu, 11 May 2017 14:25:23 +0800
From: icenowy@aosc.io
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        Rob Herring <robh+dt@kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [linux-sunxi] [PATCH v2 20/20] ARM: sun5i: a10s-olinuxino: Enable
 HDMI
In-Reply-To: <20170510192358.taufs5tsyifueued@flea.home>
References: <cover.d697f34bb7b0605c5e76cbc4167a64453e5e0984.1493812478.git-series.maxime.ripard@free-electrons.com>
 <c7ac6faa0568e6418291255af537c4b070bdea63.1493812478.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v65S2pw3z8NZ+tkPkF=A=5z2toRkC+26pAs6La6CNyeXoQ@mail.gmail.com>
 <20170510192358.taufs5tsyifueued@flea.home>
Message-ID: <e273b954cab66fb17d07c9eb987778b6@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

在 2017-05-11 03:23，Maxime Ripard 写道：
> Hi,
> 
> On Thu, May 04, 2017 at 04:05:18PM +0800, Chen-Yu Tsai wrote:
>> On Wed, May 3, 2017 at 7:59 PM, Maxime Ripard
>> <maxime.ripard@free-electrons.com> wrote:
>> > The A10s Olinuxino has an HDMI connector. Make sure we can use it.
>> >
>> > Acked-by: Chen-Yu Tsai <wens@csie.org>
>> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>> > ---
>> >  arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts | 29 +++++++++++++++++-
>> >  1 file changed, 29 insertions(+), 0 deletions(-)
>> >
>> > diff --git a/arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts b/arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts
>> > index 894f874a5beb..1d13b6407222 100644
>> > --- a/arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts
>> > +++ b/arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts
>> > @@ -63,6 +63,17 @@
>> >                 stdout-path = "serial0:115200n8";
>> >         };
>> >
>> > +       connector {
>> > +               compatible = "hdmi-connector";
>> > +               type = "a";
>> 
>> Just curious, should we take this into consideration when creating
>> drm_connector?
> 
> I'm not sure, no other driver does so. And I haven't seen any of our
> boards with a HDMI-B, C or mini-HDMI connector.

Tablets usually come with micro-HDMI connector.

> 
> Maxime
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
