Return-Path: <sboyd@codeaurora.org>
Date: Wed, 30 Sep 2015 15:04:15 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Paul Osmialowski <pawelo@king.net.pl>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Russell King <linux@arm.linux.org.uk>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/1] add devm_of_clk_get() and devm_of_clk_get_by_name()
 functions
Message-ID: <20150930220415.GD18556@codeaurora.org>
References: <1443081808-19688-1-git-send-email-newchief@king.net.pl>
 <20150928230523.GR23081@codeaurora.org>
 <alpine.LNX.2.00.1509290611050.3931@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <alpine.LNX.2.00.1509290611050.3931@localhost.localdomain>
List-ID: <linux-clk.vger.kernel.org>

On 09/29, Paul Osmialowski wrote:
> Hi Stephen,
> 
> Thanks for all of your comments.
> 
> On Mon, 28 Sep 2015, Stephen Boyd wrote:
> 
> > I'd say your binding is wrong. Either the container node
> > "pinctrl" is a software concept that contains the two devices for
> > port_a and port_b or there's only one pinctrl device that happens
> > to span some number of 0x1000 size banks. The former would be
> > written as so
> > 
> > 	pinctrl {
> > 		compatible = "fsl,kenetis-pinctrl";
> > 		reg = <0x40049000 0x2000>;
> > 		clocks = <&sim SIM_CLK_SCGC5_PORTA>, <&sim SIM_CLK_SCGC5_PORTB>;
> > 	};
> >
> 
> I tried this and actually this looks similar to my first approach to this 
> driver. I wasn't happy with the fact that pin banks are so loosely coupled 
> with resources they use.
> 
> I thought that making pin controller a container for pin bank devices 
> would create better coupling and simply look better in DT file.
> 
> With this first approach example pin definition would look like:
> 
> fsl,kinetis-pins = <PORT_A 0 1 &pcfg_pull_pin_default> ...
> 
> where the binding format is fsl,kinetis-pins = <bank pin function CONFIG>
> 
> &pcfg_pull_pin_default is defined as:
> 
> pcfg_pull_pin_default: pcfg-pull-pin-default {
> 	bias-pull-pin-default;
> };

The function and pin number should be part of the configuration
node as well. Say we need to configure the uart pins for
bias-pull-pin-default and the rx pin is in port at pin 3 and the
tx pin is in port b at pin 2.

In the pinctrl node we would have

 	pinctrl {
 		compatible = "fsl,kenetis70-pinctrl";
 		reg = <0x40049000 0x2000>;
 		clocks = <&sim SIM_CLK_SCGC5_PORTA>, <&sim SIM_CLK_SCGC5_PORTB>;

		uart_default: uart_default {
			mux {
				pins = "porta_3", "portb_2";
				function = "uart";
			};

			rx {
				bias-pull-pin-default;
			};
		};
 	};

And then in the uart node we would have

	uart@f00000 {
		compatible = "vendor,uart";
		reg = <0xf00000 0x100>;
		pinctrl-names = "default";
		pinctrl-0 = <&uart_default>;
	};

> 
> ...and PORT_A would have to be defined as preprocessor macro in some 
> header file:
> 
> #define PORT_A   0
> #define PORT_B   1
> #define PORT_C   2
> #define PORT_D   3
> #define PORT_E   4
> #define PORT_F   5
> #define PORT_NUM 6
> 
> That's another thing I'd want to avoid.

Ok. We avoided it in the example above by putting the port in the
pin name.

> 
> I wanted a DT file which driver could use to figure out how many pin banks 
> there are, what clocks and IO ranges they use and how pins are associated 
> with banks.
> 
> Now I see I pasted example from some old file (sorry for that), it differs 
> in one small detail, so again:
> 
> pinctrl: pinctrl {
>         compatible = "fsl,kinetis-pinctrl";
>         #address-cells = <1>;
>         #size-cells = <1>;
>         ranges;
> 
>         port_a: pin-bank@40049000 {
>                 compatible = "fsl,kinetis-pin-bank";
>                 reg = <0x40049000 0x1000>;
>                 clocks = <&sim SIM_CLK_SCGC5_PORTA>;
>         };
> 
>         port_b: pin-bank@4004a000 {
>                 compatible = "fsl,kinetis-pin-bank";
>                 reg = <0x4004a000 0x1000>;
>                 clocks = <&sim SIM_CLK_SCGC5_PORTB>;
>         };
> ...
> };
> 
> Now, assuming use of of_find_node_by_phandle(), example pin definition 
> would look like:
> 
> fsl,kinetis-pins = <&port_a 0 1 &pcfg_pull_pin_default> ...
> 
> Things are getting connected together, no preprocessor definitions, no 
> extra header file. What can be wrong with this design?

Having fsl,kinetis-pins is already a problem because it doesn't
use the generic pinctrl bindings to pick the function for a pin.
Once you use the generic bindings, the need for a header file and
preprocessor definitions will go away too.

I looked at the reference manual for this k70 SoC. It seems that
the hardware designers had a macro with a maximum of 32 pins, but
this SoC needed more than that, so they copy/pasted the macro a
few times to get the number of pins they needed. That's fine. It
can be treated either as one big pinctrl device and driver or as
multiple devices (one for each port) where the same driver probes
multiple times.

Either way, to handle the functions you're going to need to have
an SoC specific driver that knows what functions are supported on
that particular SoC. So it's probably easier to do the big device
and driver, and then you would know how many banks there are
because the SoC specific compatible string would convey that
information already.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
