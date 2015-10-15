Return-Path: <Marc_Gonzalez@sigmadesigns.com>
Return-Path: <Marc_Gonzalez@sigmadesigns.com>
Subject: Re: [PATCH v2] clk: tango4: clkgen driver for Tango4 ARM platforms
To: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette
	<mturquette@baylibre.com>
CC: clk <linux-clk@vger.kernel.org>, Mason <slash.tmp@free.fr>
References: <5613DBA2.20708@sigmadesigns.com>
 <20151008013054.GC26883@codeaurora.org> <561FCBB2.8030703@sigmadesigns.com>
From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Message-ID: <561FCC7A.2090505@sigmadesigns.com>
Date: Thu, 15 Oct 2015 17:55:38 +0200
MIME-Version: 1.0
In-Reply-To: <561FCBB2.8030703@sigmadesigns.com>
Content-Type: text/plain; charset="ISO-8859-1"
List-ID: <linux-clk.vger.kernel.org>

On 15/10/2015 17:52, Marc Gonzalez wrote:

> Provide support for Sigma Designs Tango4 (ARM-based) clock generator.
> NOTE: This driver is INCOMPATIBLE with Tango3 clkgen.
> 
> Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
> ---
> Changes in v2:
> Provide missing includes
> Use masks instead of bit-fields :-(
> Error handling
> Style nits
> Model the clkgen block as a single node

And the corresponding DT will be along these lines:

	clocks {
		ranges;
		#address-cells = <1>;
		#size-cells = <1>;

		xtal: xtal {
			compatible = "fixed-clock";
			clock-frequency = <27000000>;
			#clock-cells = <0>;
		};

		clkgen: clkgen@10000 {
			compatible = "sigma,tango4-clkgen";
			reg = <0x10000 0x30>;
			clocks = <&xtal>;
			clock-output-names = "cpuclk", "sysclk";
			#clock-cells = <1>;
		};

		periphclk: periphclk {
			compatible = "fixed-factor-clock";
			clocks = <&clkgen 0>;
			clock-mult = <1>;
			clock-div  = <2>;
			#clock-cells = <0>;
		};
	};


Regards.
