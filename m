Return-Path: <sboyd@codeaurora.org>
Date: Fri, 26 Feb 2016 09:42:14 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: Ignore disabled DT clock providers
Message-ID: <20160226174214.GR28849@codeaurora.org>
References: <1456502071-13516-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1456502071-13516-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On 02/26, Geert Uytterhoeven wrote:
> of_clk_init() uses for_each_matching_node_and_match() to find clock
> providers, which returns all matching device nodes, whether they are
> enabled or not. Hence clock providers that are disabled explicitly in DT
> using e.g.
> 
> 	"status = "disabled";
> 
> are still activated.
> 
> Add a check to ignore device nodes that are not enabled, like
> of_irq_init() does.
> 
> Reported-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied to clk-next

Too bad there isn't a for_each_available_matching_node_and_match()
macro to make this all one line. It would be a mouthful though.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
