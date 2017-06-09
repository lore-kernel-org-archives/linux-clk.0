Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hermes.aosc.io ([199.195.250.187]:59350 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751706AbdFIQvM (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 9 Jun 2017 12:51:12 -0400
Date: Sat, 10 Jun 2017 00:51:02 +0800
In-Reply-To: <20170609164915.enap3epreg5vr2gy@flea.home>
References: <20170604160149.30230-1-icenowy@aosc.io> <20170604160149.30230-2-icenowy@aosc.io> <20170607084544.kgclybyxxttfk3ko@flea.lan> <092D4797-0034-4C39-A30A-92CFAB23AAF8@aosc.io> <20170609164915.enap3epreg5vr2gy@flea.home>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Subject: Re: [linux-sunxi] Re: [PATCH v2 01/11] dt-bindings: update the binding for Allwinner H3 TVE support
To: maxime.ripard@free-electrons.com,
        Maxime Ripard <maxime.ripard@free-electrons.com>
CC: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@siol.net>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
From: Icenowy Zheng <icenowy@aosc.io>
Message-ID: <53E8FC74-8AC0-461A-B875-812EE4A3267E@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



于 2017年6月10日 GMT+08:00 上午12:49:15, Maxime Ripard <maxime.ripard@free-electrons.com> 写到:
>On Wed, Jun 07, 2017 at 04:48:50PM +0800, Icenowy Zheng wrote:
>> >> @@ -189,6 +211,8 @@ supported.
>> >>  Required properties:
>> >>    - compatible: value must be one of:
>> >>      * allwinner,sun8i-v3s-de2-mixer
>> >> +    * allwinner,sun8i-h3-de2-mixer0
>> >> +    * allwinner,sun8i-h3-de2-mixer1
>> >
>> >Again, please explain why we need to have different compatibles
>> >here. If it's only about the number of planes, this should be dealt
>> >with a property, not a compatible.
>> 
>> Only mixer0 has "VEP" and write-back support, at least on H3.
>
>What is that VEP? writeback support can also be expressed by a
>property.

I don't know what VEP is...

But we are really facing different cores, like sun50i-a64-mmc
and sun50i-a64-emmc.

>
>Maxime
