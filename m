Return-Path: <horms@verge.net.au>
Date: Thu, 7 May 2015 13:36:07 +0900
From: Simon Horman <horms@verge.net.au>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@linaro.org>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, Takashi Yoshii <takasi-y@ops.dti.ne.jp>,
	Magnus Damm <damm@opensource.se>
Subject: Re: [PATCH 09/19] clk: emev2: Silence sparse warnings
Message-ID: <20150507043607.GI28846@verge.net.au>
References: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
 <1430897996-11597-10-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1430897996-11597-10-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On Wed, May 06, 2015 at 12:39:46AM -0700, Stephen Boyd wrote:
> drivers/clk/shmobile/clk-emev2.c:37:14: warning: symbol 'smu_base' was not declared. Should it be static?
> 
> Cc: Takashi Yoshii <takasi-y@ops.dti.ne.jp>
> Cc: Magnus Damm <damm@opensource.se>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Acked-by: Simon Horman <horms+renesas@verge.net.au>

Stephen, I'm assuming that you or Mike will merge this.

> ---
>  drivers/clk/shmobile/clk-emev2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/shmobile/clk-emev2.c b/drivers/clk/shmobile/clk-emev2.c
> index 6c7c929c7765..5b60beb7d0eb 100644
> --- a/drivers/clk/shmobile/clk-emev2.c
> +++ b/drivers/clk/shmobile/clk-emev2.c
> @@ -34,7 +34,7 @@
>  static DEFINE_SPINLOCK(lock);
>  
>  /* not pretty, but hey */
> -void __iomem *smu_base;
> +static void __iomem *smu_base;
>  
>  static void __init emev2_smu_write(unsigned long value, int offs)
>  {
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
