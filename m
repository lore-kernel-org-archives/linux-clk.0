Return-Path: <tony@atomide.com>
Date: Fri, 17 Mar 2017 07:18:13 -0700
From: Tony Lindgren <tony@atomide.com>
To: Tero Kristo <t-kristo@ti.com>
Cc: linux-clk@vger.kernel.org, linux-omap@vger.kernel.org,
	sboyd@codeaurora.org, mturquette@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	Paul Walmsley <paul@pwsan.com>
Subject: Re: [PATCHv2 1/9] Documentation: dt-bindings: Add binding
 documentation for TI clkctrl clocks
Message-ID: <20170317141813.GS20572@atomide.com>
References: <1489741781-12816-1-git-send-email-t-kristo@ti.com>
 <1489741781-12816-2-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1489741781-12816-2-git-send-email-t-kristo@ti.com>
List-ID: <linux-clk.vger.kernel.org>

* Tero Kristo <t-kristo@ti.com> [170317 02:12]:
> From: Tony Lindgren <tony@atomide.com>
> +Example: Clock controller node on omap 4430:
> +
> +&cm2 {
> +	l4per: cm@1400 {
> +		cm_l4per@0 {
> +			cm_l4per_clkctrl: clk@20 {
> +				compatible = "ti,clkctrl";
> +				reg = <0x20 0x1b0>;
> +				#clock-cells = <4>;
> +			};
> +		};
> +	};
> +};

The #clock-cells = <4> is a typo left over from earlier revisions,
care to update it to 2 like the binding doc specifies?

Regards,

Tony
