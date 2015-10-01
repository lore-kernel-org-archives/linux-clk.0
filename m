Return-Path: <pawelo@king.net.pl>
Date: Thu, 1 Oct 2015 09:52:20 +0200 (CEST)
From: Paul Osmialowski <pawelo@king.net.pl>
To: Stephen Boyd <sboyd@codeaurora.org>
cc: Paul Osmialowski <pawelo@king.net.pl>,
        Michael Turquette <mturquette@baylibre.com>,
        Russell King <linux@arm.linux.org.uk>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/1] add devm_of_clk_get() and devm_of_clk_get_by_name()
 functions
In-Reply-To: <20150930220415.GD18556@codeaurora.org>
Message-ID: <alpine.LNX.2.00.1510010943400.25759@localhost.localdomain>
References: <1443081808-19688-1-git-send-email-newchief@king.net.pl> <20150928230523.GR23081@codeaurora.org> <alpine.LNX.2.00.1509290611050.3931@localhost.localdomain> <20150930220415.GD18556@codeaurora.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On Wed, 30 Sep 2015, Stephen Boyd wrote:

> In the pinctrl node we would have
> 
>  	pinctrl {
>  		compatible = "fsl,kenetis70-pinctrl";
>  		reg = <0x40049000 0x2000>;
>  		clocks = <&sim SIM_CLK_SCGC5_PORTA>, <&sim SIM_CLK_SCGC5_PORTB>;
> 
> 		uart_default: uart_default {
> 			mux {
> 				pins = "porta_3", "portb_2";
> 				function = "uart";
> 			};
> 
> 			rx {
> 				bias-pull-pin-default;
> 			};
> 		};
>  	};
> 
> And then in the uart node we would have
> 
> 	uart@f00000 {
> 		compatible = "vendor,uart";
> 		reg = <0xf00000 0x100>;
> 		pinctrl-names = "default";
> 		pinctrl-0 = <&uart_default>;
> 	};
> 

Seems like there's another thing I wanted to avoid. The correctness of 
these pin strings will not be checked until the runtime. They need to 
properly encode pin bank and pin number within the bank. No chances it can 
be validated at .dtb build time. But I guess this is proper way for 
generic pinctrl bindings. I mostly (but not completely) based my approach 
on rockchip examples (e.g. rk3288) but it looks like they are not entirely 
sane.

Thanks,
Paul
