Return-Path: <sboyd@codeaurora.org>
Date: Thu, 8 Dec 2016 15:14:44 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] clk: cdce925: Fix limit check
Message-ID: <20161208231444.GX5423@codeaurora.org>
References: <20161111214905.29481-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20161111214905.29481-1-christophe.jaillet@wanadoo.fr>
List-ID: <linux-clk.vger.kernel.org>

On 11/11, Christophe JAILLET wrote:
> It is likely that instead of '1>64', 'q>64' was expected.
> 
> Moreover, according to datasheet,
>    http://www.ti.com/lit/ds/symlink/cdce925.pdf
>    SCAS847I - JULY 2007 - REVISED OCTOBER 2016
> PLL settings limits are: 16 <= q <= 63
> So change the upper limit check from 64 to 63.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
