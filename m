Return-Path: <sboyd@codeaurora.org>
Date: Mon, 28 Sep 2015 16:05:23 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Paul Osmialowski <newchief@king.net.pl>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Russell King <linux@arm.linux.org.uk>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Paul Osmialowski <pawelo@king.net.pl>
Subject: Re: [PATCH 0/1] add devm_of_clk_get() and devm_of_clk_get_by_name()
 functions
Message-ID: <20150928230523.GR23081@codeaurora.org>
References: <1443081808-19688-1-git-send-email-newchief@king.net.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1443081808-19688-1-git-send-email-newchief@king.net.pl>
List-ID: <linux-clk.vger.kernel.org>

On 09/24, Paul Osmialowski wrote:
> From: Paul Osmialowski <pawelo@king.net.pl>
> 
> While working on my pinctrl driver I've found lack of devres compatible
> equivalent for of_clk_get() function. I'd like to use it for the following
> (incomplete) piece of device tree configuration:
> 
> pinctrl: pinctrl {
> 	compatible = "fsl,kinetis-pinctrl";
> 	#address-cells = <1>;
> 	#size-cells = <1>;
> 	ranges;
> 
> 	port_a@40049000 {
> 		compatible = "fsl,kinetis-pin-bank";
> 		reg = <0x40049000 0x1000>;
> 		clocks = <&sim SIM_CLK_SCGC5_PORTA>;
> 	};
> 
> 	port_b@4004a000 {
> 		compatible = "fsl,kinetis-pin-bank";
> 		reg = <0x4004a000 0x1000>;
> 		clocks = <&sim SIM_CLK_SCGC5_PORTB>;
> 	};
> ...
> };
> 
> In my pinconf-generic compatible fsl,kinetis-pinctrl driver, I'm iterating
> over fsl,kinetis-pin-bank nodes using for_each_child_of_node(dev->of_node,
> child) along with of_match_node() in order to grab resources (I/O base
> address, clock gate).
> 
> Normally, I'd have to use of_clk_get() on each pin bank device_node and
> then worry about proper resource release myself.
> 

I'd say your binding is wrong. Either the container node
"pinctrl" is a software concept that contains the two devices for
port_a and port_b or there's only one pinctrl device that happens
to span some number of 0x1000 size banks. The former would be
written as so

	pinctrl {
		compatible = "fsl,kenetis-pinctrl";
		reg = <0x40049000 0x2000>;
		clocks = <&sim SIM_CLK_SCGC5_PORTA>, <&sim SIM_CLK_SCGC5_PORTB>;
	};

and the latter would drop the container node and have two nodes
that probed the same driver instance twice.


 	port_a@40049000 {
 		compatible = "fsl,kinetis-pin-bank";
 		reg = <0x40049000 0x1000>;
 		clocks = <&sim SIM_CLK_SCGC5_PORTA>;
 	};
 
 	port_b@4004a000 {
 		compatible = "fsl,kinetis-pin-bank";
 		reg = <0x4004a000 0x1000>;
 		clocks = <&sim SIM_CLK_SCGC5_PORTB>;
 	};

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
