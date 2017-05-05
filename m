Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hermes.aosc.io ([199.195.250.187]:54482 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751435AbdEEMec (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 5 May 2017 08:34:32 -0400
Date: Fri, 05 May 2017 20:34:16 +0800
In-Reply-To: <20170505123035.pwh3idz73ujrd3hx@lukather>
References: <20170504114858.9008-1-icenowy@aosc.io> <20170504114858.9008-12-icenowy@aosc.io> <CAGb2v67uE2iuP+wrL2t0fSMY8C1qnX=pYru7pZGX+0WhC_z2EA@mail.gmail.com> <8ad5de02ffc13348dfc71e9ec203205c@aosc.io> <20170505123035.pwh3idz73ujrd3hx@lukather>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Subject: Re: [linux-sunxi] [PATCH v6 11/13] ARM: dts: sun8i: add DE2 nodes for V3s SoC
To: linux-arm-kernel@lists.infradead.org,
        Maxime Ripard <maxime.ripard@free-electrons.com>
CC: devicetree <devicetree@vger.kernel.org>,
        linux-kernel-owner@vger.kernel.org,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
From: Icenowy Zheng <icenowy@aosc.io>
Message-ID: <47D16B11-E976-464C-92AD-213D837C8F68@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



于 2017年5月5日 GMT+08:00 下午8:30:35, Maxime Ripard <maxime.ripard@free-electrons.com> 写到:
>On Fri, May 05, 2017 at 04:53:43PM +0800, icenowy@aosc.io wrote:
>> > > +               de2_clocks: clock@1000000 {
>> > > +                       compatible =
>"allwinner,sun50i-h5-de2-clk";
>> > 
>> > I am a bit skeptical about this. Since the V3S only has one mixer,
>do
>> > the clocks
>> > for the second one even exist?
>> 
>> It's described in the de_clock.c in the BSP source code, and in
>hardware
>> these bits can be really set (although without clock output).
>> 
>> So I use this compatible which has still the extra clocks.
>
>If it's not usable, then it shouldn't be in the code, it's basically
>dead code.

Thus should we have one more DE2 CCU compatible without mixer1
clocks for V3s?

