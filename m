Return-Path: <sboyd@codeaurora.org>
Date: Mon, 9 Jan 2017 16:27:30 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: uniphier: remove unneeded #include <linux/delay.h>
Message-ID: <20170110002730.GK17126@codeaurora.org>
References: <1482719673-17573-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1482719673-17573-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/26, Masahiro Yamada wrote:
> This include was needed to suppress build error when this driver
> was initially merged because <linux/regmap.h> did not include
> <linux/delay.h> at that time.  (developers' headache across
> sub-systems)
> 
> The root cause has been fixed by commit adf08d481b52 ("regmap:
> include <linux/delay.h> from include/linux/regmap.h"), so this
> line can be dropped now.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
