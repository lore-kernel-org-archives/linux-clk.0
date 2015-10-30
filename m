Return-Path: <sboyd@codeaurora.org>
Date: Fri, 30 Oct 2015 09:29:25 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	clk <linux-clk@vger.kernel.org>, Mason <slash.tmp@free.fr>
Subject: Re: [PATCH v4] clk: tango4: clkgen driver for Tango4 platforms
Message-ID: <20151030162925.GC19782@codeaurora.org>
References: <562A5506.2070402@sigmadesigns.com>
 <20151029005658.GA19782@codeaurora.org>
 <563361B8.7090300@sigmadesigns.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <563361B8.7090300@sigmadesigns.com>
List-ID: <linux-clk.vger.kernel.org>

On 10/30, Marc Gonzalez wrote:
> diff --git a/Documentation/devicetree/bindings/clock/tango4-clock.txt b/Documentation/devicetree/bindings/clock/tango4-clock.txt
> new file mode 100644
> index 000000000000..19c580a7bda2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/tango4-clock.txt
> @@ -0,0 +1,23 @@
> +* Sigma Designs Tango4 Clock Generator
> +
> +The Tango4 clock generator outputs cpu_clk and sys_clk (the latter is used
> +for RAM and various peripheral devices). The clock binding described here
> +is applicable to all Tango4 SoCs.
> +
> +Required Properties:
> +
> +- compatible: should be "sigma,tango4-clkgen".

You should add sigma to the vendor prefix file
Documentation/devicetree/bindings/vendor-prefixes.txt

Send that patch to the DT maintainers (Rob has been applying most
vendor prefix patches).

Otherwise this patch looks fine and I'll apply it to clk-next
after v4.4-rc1 comes out (in about 2 weeks). We'll target v4.5.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
