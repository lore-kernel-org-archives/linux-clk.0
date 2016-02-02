Return-Path: <sboyd@codeaurora.org>
Date: Mon, 1 Feb 2016 17:08:22 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2 13/16] clk: walk the orphan clock list more
 simply
Message-ID: <20160202010822.GB4848@codeaurora.org>
References: <1451298191-30815-1-git-send-email-yamada.masahiro@socionext.com>
 <1451298191-30815-14-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1451298191-30815-14-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/28, Masahiro Yamada wrote:
> This loop can be much simpler.  If a new parent is available for
> orphan clocks, __clk_init_parent(orphan) can detect it.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
