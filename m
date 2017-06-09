Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: linux-sunxi@googlegroups.com, icenowy@aosc.io
Cc: maxime.ripard@free-electrons.com, Rob Herring <robh+dt@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [linux-sunxi] Re: [PATCH v2 01/11] dt-bindings: update the binding for Allwinner H3 TVE support
Date: Fri, 09 Jun 2017 23:24:47 +0200
Message-ID: <7305754.diZEu7DK25@jernej-laptop>
In-Reply-To: <53E8FC74-8AC0-461A-B875-812EE4A3267E@aosc.io>
References: <20170604160149.30230-1-icenowy@aosc.io> <20170609164915.enap3epreg5vr2gy@flea.home> <53E8FC74-8AC0-461A-B875-812EE4A3267E@aosc.io>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi!

Dne petek, 09. junij 2017 ob 18:51:02 CEST je Icenowy Zheng napisal(a):
> 于 2017年6月10日 GMT+08:00 上午12:49:15, Maxime Ripard <maxime.ripard@free-
electrons.com> 写到:
> >On Wed, Jun 07, 2017 at 04:48:50PM +0800, Icenowy Zheng wrote:
> >> >> @@ -189,6 +211,8 @@ supported.
> >> >> 
> >> >>  Required properties:
> >> >>    - compatible: value must be one of:
> >> >>      * allwinner,sun8i-v3s-de2-mixer
> >> >> 
> >> >> +    * allwinner,sun8i-h3-de2-mixer0
> >> >> +    * allwinner,sun8i-h3-de2-mixer1
> >> >
> >> >Again, please explain why we need to have different compatibles
> >> >here. If it's only about the number of planes, this should be dealt
> >> >with a property, not a compatible.
> >> 
> >> Only mixer0 has "VEP" and write-back support, at least on H3.
> >
> >What is that VEP? writeback support can also be expressed by a
> >property.
> 
> I don't know what VEP is...

VEP is probably Video Enhancement Processor (?). Although I'm not sure if that 
is really mixer specific. Icenowy, can you explain where did you get this info? 

Best regards,
Jernej

> 
> But we are really facing different cores, like sun50i-a64-mmc
> and sun50i-a64-emmc.
> 
> >Maxime
> 
> --
> You received this message because you are subscribed to the Google Groups
> "linux-sunxi" group. To unsubscribe from this group and stop receiving
> emails from it, send an email to linux-sunxi+unsubscribe@googlegroups.com.
> For more options, visit https://groups.google.com/d/optout.
