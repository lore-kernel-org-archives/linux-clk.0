Return-Path: <sboyd@codeaurora.org>
Date: Thu, 4 Aug 2016 13:57:34 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: prevent __of_clk_get_hw_from_provider() from
 returning NULL
Message-ID: <20160804205734.GA15690@codeaurora.org>
References: <1468919039-23004-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1468919039-23004-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

On 07/19, Masahiro Yamada wrote:
> The .get(_hw) callback of an OF clock provider can return a NULL
> pointer in some cases.
> 
> For example, of_clk_src_onecell_get() returns NULL for index 1 of a
> sparse array of clocks like follows:
> 
>   clk_num == 3
>   idx 0: UART clk
>   idx 1: NULL (no clk is allocated)
>   idx 2: I2C clk
> 
> In such cases, clk_get() successfully returns NULL.
> 
> A problem is that most drivers only check IS_ERR(), like follows:
> 
>   clk = devm_clk_get(dev, NULL);
>   if (IS_ERR(clk))
>           return PTR_ERR(clk);
> 
> It carries on moving forward and will probably be hit by a different
> error check with a different error message.

NULL is a valid clk pointer, so we can't really do anything here
besides rely on driver authors to do the right thing.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
