Return-Path: <sboyd@codeaurora.org>
Date: Fri, 20 Nov 2015 09:18:22 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] clk: remove redundant negative index check in
 of_clk_get_parent_name()
Message-ID: <20151120171822.GO32672@codeaurora.org>
References: <1448004981-11133-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1448004981-11133-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

On 11/20, Masahiro Yamada wrote:
> This if-block can be dropped because the of_parse_phandle_with_args()
> in the following line returns -EINVAL for negative index.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
