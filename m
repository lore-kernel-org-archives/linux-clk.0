Return-Path: <sboyd@codeaurora.org>
Date: Thu, 1 Oct 2015 11:05:34 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Paul Osmialowski <newchief@king.net.pl>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Russell King <linux@arm.linux.org.uk>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Paul Osmialowski <pawelo@king.net.pl>
Subject: Re: [PATCH v3] clk: add devm_of_clk_get() and
 devm_of_clk_get_by_name() functions
Message-ID: <20151001180534.GH19319@codeaurora.org>
References: <1443686626-26450-1-git-send-email-newchief@king.net.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1443686626-26450-1-git-send-email-newchief@king.net.pl>
List-ID: <linux-clk.vger.kernel.org>

On 10/01, Paul Osmialowski wrote:
> From: Paul Osmialowski <pawelo@king.net.pl>
> 
> These two functions are added to ease management of clocks obtained
> from OF device nodes.
> 
> They are particulary useful while iterating over DT subnodes using e.g.
> for_each_child_of_node(dev->of_node, child) in order do get resources
> (i.e. clocks) for subdevices defined by these DT subnodes.
> 
> For example:
> 
> some_device {
>     compatible = "something"
>     #address-cells = <1>;
>     #size-cells = <1>;
>     ranges;
> 
>     subdevice1: some_subdevice@some_address1 {
>         reg = <0xsome_address1 0xsome_size>
>         clocks = <&some_clock1>
>     }
> 
>     subdevice2: some_subdevice@some_address2 {
>         reg = <0xsome_address2 0xsome_size>
>         clocks = <&some_clock2>
>     }
> }
> 
> Normally, I'd have to use of_clk_get() on each subdevice node and then
> worry about proper resource release myself.
> 
> IMHO using devres infrastructure for this is far better. This patch adds
> missing functions needed to do it a better way.
> 
> Signed-off-by: Paul Osmialowski <pawelo@king.net.pl>

It sounds like your pinctrl binding will be rewritten so that
there isn't a need for this patch. Consider this patch rejected.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
