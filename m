Return-Path: <sboyd@codeaurora.org>
Date: Wed, 2 Dec 2015 22:35:04 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] clk: let of_clk_get_parent_name() fail for invalid
 clock-indices
Message-ID: <20151203063504.GA14699@codeaurora.org>
References: <1449109235-27214-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1449109235-27214-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/03, Masahiro Yamada wrote:
> Currently, of_clk_get_parent_name() returns a wrong parent clock name
> when "clock-indices" property exists and the target index is not
> found in the property.  In this case, NULL should be returned.
> 
> For example,
> 
>         oscillator {
>                 compatible = "myclocktype";
>                 #clock-cells = <1>;
>                 clock-indices = <1>, <3>;
>                 clock-output-names = "clka", "clkb";
>         };
> 
>         consumer {
>                 compatible = "myclockconsumer";
>                 clocks = <&oscillator 0>, <&oscillator 1>;
>         };
> 
> Currently, of_clk_get_parent_name(consumer_np, 0) returns "clka"
> (and of_clk_get_parent_name(consumer_np, 1) also returns "clka",
> this is correct).   Because the "clock-indices" in the clock parent
> does not contain <0>, of_clk_get_parent_name(consumer_np, 0) should
> return NULL.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
