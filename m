Return-Path: <sboyd@codeaurora.org>
Date: Fri, 20 Nov 2015 16:37:02 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] clk: split of_clk_get_parent_name() into two
 functions
Message-ID: <20151121003702.GC28998@codeaurora.org>
References: <1448004981-11133-1-git-send-email-yamada.masahiro@socionext.com>
 <1448004981-11133-3-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1448004981-11133-3-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

On 11/20, Masahiro Yamada wrote:
> Currently, there is no function to get the clock name of the given
> node.  Create a new helper function, of_clk_get_name().  This is
> useful to get the clock name where "clock-indices" property is used.
> 
>   of_clk_get_name(): get the clock name in the given node
>   of_clk_get_parent_name(): get the name of the parent clock
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> I want to use of_clk_get_name() for my clk drivers for my SoCs,
> which I will submit later.
> 
> I found this helper function is useful.

I don't see how this is useful. Is the new driver so generic it
doesn't know what clocks it's outputting? We've been trying to
move people away from using clock-output-names, so most likely
this sort of information should be conveyed from DT via the
compatible string and a table in the driver that matches up the
compatible string with the list of clock names.

> @@ -3102,7 +3114,6 @@ const char *of_clk_get_parent_name(struct device_node *np, int index)
>  		}
>  	}
>  
> -

Noise. Please remove.

>  	of_node_put(clkspec.np);
>  	return clk_name;
>  }

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
