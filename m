Return-Path: <sboyd@codeaurora.org>
Date: Mon, 1 Feb 2016 17:07:38 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2 06/16] clk: move core->parents allocation to
 clk_register()
Message-ID: <20160202010738.GU4848@codeaurora.org>
References: <1451298191-30815-1-git-send-email-yamada.masahiro@socionext.com>
 <1451298191-30815-7-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1451298191-30815-7-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/28, Masahiro Yamada wrote:
> Currently, __clk_core_init() allows failure of the kcalloc() for the
> core->parents.  So, clk_fetch_parent_index() and __clk_init_parent()
> also try to allocate core->parents in case it has not been allocated
> yet.  Scattering memory allocation here and there makes things
> complicated.
> 
> Like other clk_core members, allocate core->parents in clk_register()
> and let it fail in case of memory shortage.  If we cannot allocate
> such a small piece of memory, the system is already insane.  There is
> no point to postpone the memory allocation.
> 
> Also, allocate core->parents regardless of core->num_parents.  We want
> it even if core->num_parents == 1 because clk_fetch_parent_index()
> might be called against the clk_core with a single parent.
> 
> If core->num_parents == 0, core->parents is set to ZERO_SIZE_PTR. It
> is harmless because no access happens to core->parents in such a case.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
