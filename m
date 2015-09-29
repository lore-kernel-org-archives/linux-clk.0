Return-Path: <pawelo@king.net.pl>
Date: Tue, 29 Sep 2015 06:45:24 +0200 (CEST)
From: Paul Osmialowski <pawelo@king.net.pl>
To: Stephen Boyd <sboyd@codeaurora.org>
cc: Michael Turquette <mturquette@baylibre.com>,
        Russell King <linux@arm.linux.org.uk>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Osmialowski <pawelo@king.net.pl>
Subject: Re: [PATCH 0/1] add devm_of_clk_get() and devm_of_clk_get_by_name()
 functions
In-Reply-To: <20150928230523.GR23081@codeaurora.org>
Message-ID: <alpine.LNX.2.00.1509290611050.3931@localhost.localdomain>
References: <1443081808-19688-1-git-send-email-newchief@king.net.pl> <20150928230523.GR23081@codeaurora.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

Thanks for all of your comments.

On Mon, 28 Sep 2015, Stephen Boyd wrote:

> I'd say your binding is wrong. Either the container node
> "pinctrl" is a software concept that contains the two devices for
> port_a and port_b or there's only one pinctrl device that happens
> to span some number of 0x1000 size banks. The former would be
> written as so
> 
> 	pinctrl {
> 		compatible = "fsl,kenetis-pinctrl";
> 		reg = <0x40049000 0x2000>;
> 		clocks = <&sim SIM_CLK_SCGC5_PORTA>, <&sim SIM_CLK_SCGC5_PORTB>;
> 	};
>

I tried this and actually this looks similar to my first approach to this 
driver. I wasn't happy with the fact that pin banks are so loosely coupled 
with resources they use.

I thought that making pin controller a container for pin bank devices 
would create better coupling and simply look better in DT file.

With this first approach example pin definition would look like:

fsl,kinetis-pins = <PORT_A 0 1 &pcfg_pull_pin_default> ...

where the binding format is fsl,kinetis-pins = <bank pin function CONFIG>

&pcfg_pull_pin_default is defined as:

pcfg_pull_pin_default: pcfg-pull-pin-default {
	bias-pull-pin-default;
};

...and PORT_A would have to be defined as preprocessor macro in some 
header file:

#define PORT_A   0
#define PORT_B   1
#define PORT_C   2
#define PORT_D   3
#define PORT_E   4
#define PORT_F   5
#define PORT_NUM 6

That's another thing I'd want to avoid.

I wanted a DT file which driver could use to figure out how many pin banks 
there are, what clocks and IO ranges they use and how pins are associated 
with banks.

Now I see I pasted example from some old file (sorry for that), it differs 
in one small detail, so again:

pinctrl: pinctrl {
        compatible = "fsl,kinetis-pinctrl";
        #address-cells = <1>;
        #size-cells = <1>;
        ranges;

        port_a: pin-bank@40049000 {
                compatible = "fsl,kinetis-pin-bank";
                reg = <0x40049000 0x1000>;
                clocks = <&sim SIM_CLK_SCGC5_PORTA>;
        };

        port_b: pin-bank@4004a000 {
                compatible = "fsl,kinetis-pin-bank";
                reg = <0x4004a000 0x1000>;
                clocks = <&sim SIM_CLK_SCGC5_PORTB>;
        };
...
};

Now, assuming use of of_find_node_by_phandle(), example pin definition 
would look like:

fsl,kinetis-pins = <&port_a 0 1 &pcfg_pull_pin_default> ...

Things are getting connected together, no preprocessor definitions, no 
extra header file. What can be wrong with this design?

I'll prepare second iteration with updated documentation (and other 
smaller cleanups) soon.

Thanks,
Paul
