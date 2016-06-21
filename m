Return-Path: <sboyd@codeaurora.org>
Date: Mon, 20 Jun 2016 17:46:24 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-kernel@lists.codethink.co.uk,
	Bintian Wang <bintian.wang@huawei.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: hi6220: fix missing clk.h include
Message-ID: <20160621004624.GI1521@codeaurora.org>
References: <1465307648-15660-1-git-send-email-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1465307648-15660-1-git-send-email-ben.dooks@codethink.co.uk>
List-ID: <linux-clk.vger.kernel.org>

On 06/07, Ben Dooks wrote:
> Fix the warning from missing "clk.h" include which
> defines hi6220_register_clkdiv() function.
> 
> drivers/clk/hisilicon/clkdivider-hi6220.c:102:12: warning: symbol 'hi6220_register_clkdiv' was not declared. Should it be static?
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
