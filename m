Return-Path: <elder@linaro.org>
Return-Path: <elder@linaro.org>
Subject: Re: [PATCH] clk-kona-setup: Use kmalloc_array() in parent_process()
To: SF Markus Elfring <elfring@users.sourceforge.net>,
 bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, Matt Porter <mporter@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Stephen Boyd <sboyd@codeaurora.org>,
 Vaishali Thakkar <vaishali.thakkar@oracle.com>
References: <1fb2e894-93d3-3dbe-ca05-7e29e4c60e2a@users.sourceforge.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Julia Lawall <julia.lawall@lip6.fr>
From: Alex Elder <elder@linaro.org>
Message-ID: <887a42c4-6cff-6d03-c62a-ffd3da128738@linaro.org>
Date: Wed, 14 Sep 2016 13:45:11 -0500
MIME-Version: 1.0
In-Reply-To: <1fb2e894-93d3-3dbe-ca05-7e29e4c60e2a@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 09/14/2016 01:40 PM, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 14 Sep 2016 20:26:05 +0200
> 
> A multiplication for the size determination of a memory allocation
> indicated that an array data structure should be processed.
> Thus use the corresponding function "kmalloc_array".
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Probably not needed in practice, but safer nevertheless.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>  drivers/clk/bcm/clk-kona-setup.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/bcm/clk-kona-setup.c b/drivers/clk/bcm/clk-kona-setup.c
> index 526b0b0..a2e7e91 100644
> --- a/drivers/clk/bcm/clk-kona-setup.c
> +++ b/drivers/clk/bcm/clk-kona-setup.c
> @@ -586,8 +586,9 @@ static u32 *parent_process(const char *clocks[],
>  	}
>  
>  	/* There is at least one parent, so allocate a selector array */
> -
> -	parent_sel = kmalloc(parent_count * sizeof(*parent_sel), GFP_KERNEL);
> +	parent_sel = kmalloc_array(parent_count,
> +				   sizeof(*parent_sel),
> +				   GFP_KERNEL);
>  	if (!parent_sel) {
>  		pr_err("%s: error allocating %u parent selectors\n", __func__,
>  				parent_count);
> 
