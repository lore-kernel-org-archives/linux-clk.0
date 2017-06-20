Return-Path: <sboyd@codeaurora.org>
Date: Mon, 19 Jun 2017 18:06:31 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Use of_device_get_match_data()
 helper
Message-ID: <20170620010631.GA4493@codeaurora.org>
References: <1497012583-24328-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <1497012583-24328-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On 06/09, Geert Uytterhoeven wrote:
> If CONFIG_OF=n:
> 
>     drivers/clk/renesas/renesas-cpg-mssr.c: In function ‘cpg_mssr_probe’:
>     drivers/clk/renesas/renesas-cpg-mssr.c:702: warning: dereferencing ‘void *’ pointer
>     drivers/clk/renesas/renesas-cpg-mssr.c:702: error: request for member ‘data’ in something not a structure or union
> 
> To fix this, use the of_device_get_match_data() helper, for which a
> dummy version is provided if CONFIG_OF=n.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
