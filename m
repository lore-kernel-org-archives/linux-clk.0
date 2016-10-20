Return-Path: <sboyd@codeaurora.org>
Date: Thu, 20 Oct 2016 16:42:03 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: boris.brezillon@free-electrons.com, mturquette@baylibre.com,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] clk: at91: Fix a return value in case of error
Message-ID: <20161020234203.GE26139@codeaurora.org>
References: <1474804438-27804-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1474804438-27804-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-ID: <linux-clk.vger.kernel.org>

On 09/25, Christophe JAILLET wrote:
> If 'clk_hw_register()' fails, it is likely that we expect to return an
> error instead of a valid pointer (which would mean success).
> 
> Fix commit f5644f10dcfb ("clk: at91: Migrate to clk_hw based registration
> and OF APIs")
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Applied to clk-fixes

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
