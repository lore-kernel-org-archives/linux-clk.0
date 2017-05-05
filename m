Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.csie.ntu.edu.tw ([140.112.30.61]:38156 "EHLO
        smtp.csie.ntu.edu.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754740AbdEEDZt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 May 2017 23:25:49 -0400
MIME-Version: 1.0
In-Reply-To: <20170504114858.9008-13-icenowy@aosc.io>
References: <20170504114858.9008-1-icenowy@aosc.io> <20170504114858.9008-13-icenowy@aosc.io>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 5 May 2017 11:25:25 +0800
Message-ID: <CAGb2v66jveLaAQ2wfd=LRwUy9zWjiycKqTyacFw=ZmuF8feOtg@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH v6 12/13] ARM: dts: sun8i: add pinmux for
 LCD pins of V3s SoC
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, May 4, 2017 at 7:48 PM, Icenowy Zheng <icenowy@aosc.io> wrote:
> Allwinner V3s SoC features a set of pins that have functionality of RGB
> LCD, the pins are at different pin ban than other SoCs.
>
> Add pinctrl node for them.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  arch/arm/boot/dts/sun8i-v3s.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi b/arch/arm/boot/dts/sun8i-v3s.dtsi
> index 0a895179d8ae..a37d68b227bc 100644
> --- a/arch/arm/boot/dts/sun8i-v3s.dtsi
> +++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
> @@ -297,6 +297,15 @@
>                                 function = "i2c0";
>                         };
>
> +                       lcd_rgb666_pins: lcd_rgb666@0 {

Drop the trailing "@0". Otherwise,

Acked-by: Chen-Yu Tsai <wens@csie.org>

> +                               pins = "PE0", "PE1", "PE2", "PE3", "PE4",
> +                                      "PE5", "PE6", "PE7", "PE8", "PE9",
> +                                      "PE10", "PE11", "PE12", "PE13", "PE14",
> +                                      "PE15", "PE16", "PE17", "PE18", "PE19",
> +                                      "PE23", "PE24";
> +                               function = "lcd";
> +                       };
> +
>                         uart0_pins_a: uart0@0 {
>                                 pins = "PB8", "PB9";
>                                 function = "uart0";
> --
> 2.12.2
>
> --
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe@googlegroups.com.
> For more options, visit https://groups.google.com/d/optout.
