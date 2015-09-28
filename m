Return-Path: <sboyd@codeaurora.org>
Date: Mon, 28 Sep 2015 16:13:28 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Paul Osmialowski <newchief@king.net.pl>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Russell King <linux@arm.linux.org.uk>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Paul Osmialowski <pawelo@king.net.pl>
Subject: Re: [PATCH 1/1] clk: add devm_of_clk_get() and
 devm_of_clk_get_by_name() functions
Message-ID: <20150928231328.GS23081@codeaurora.org>
References: <1443081808-19688-1-git-send-email-newchief@king.net.pl>
 <1443081808-19688-2-git-send-email-newchief@king.net.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1443081808-19688-2-git-send-email-newchief@king.net.pl>
List-ID: <linux-clk.vger.kernel.org>

On 09/24, Paul Osmialowski wrote:
> From: Paul Osmialowski <pawelo@king.net.pl>
> 
> These two functions were added to ease management of clocks obtained
> from OF device nodes.
> 

All the words that were in the cover letter for this single patch
should have been here in the commit text instead. If we were to
look back on this commit text a year from now we'd learn that
things got easier for clock management, but not *why* things got
easier.

Cover letters for single patches are practically useless by the
way. That's because they duplicate the diffstat that is already
in the patch and summarize the subject of the patch. Please don't
send cover letters for single patches.

> diff --git a/include/linux/clk.h b/include/linux/clk.h
> index 0df4a51..d7763f1 100644
> --- a/include/linux/clk.h
> +++ b/include/linux/clk.h
> @@ -504,4 +504,24 @@ static inline struct clk *of_clk_get_by_name(struct device_node *np,
>  }
>  #endif
>  
> +#if defined(CONFIG_OF) && defined(CONFIG_COMMON_CLK) && defined(CONFIG_HAVE_CLK)

Doesn't CONFIG_COMMON_CLK imply CONFIG_HAVE_CLK? So drop that
config check? Also, devm_*() functions are documented in
Documentation, so please update that file too, if it even makes
sense to have this new API.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
