Return-Path: <sboyd@codeaurora.org>
Date: Mon, 1 Feb 2016 17:07:33 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2 05/16] clk: change sizeof(struct clk *) to
 sizeof(*core->parents)
Message-ID: <20160202010733.GT4848@codeaurora.org>
References: <1451298191-30815-1-git-send-email-yamada.masahiro@socionext.com>
 <1451298191-30815-6-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1451298191-30815-6-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/28, Masahiro Yamada wrote:
> Now, the clock parent is not "struct clk *", but "struct clk_core *".
> Of course, the size of a pointer is always same, but strictly speaking,
> sizeof(struct clk *) should be sizeof(struct clk_core *) here.
> 
> This mismatch happened when we split the structure into struct clk
> and struct clk_core.  For the potential possibility of future renaming,
> sizeof(*core->parents) would be better.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
