Return-Path: <scott.branden@broadcom.com>
Return-Path: <scott.branden@broadcom.com>
Subject: Re: [PATCH] [media] clk-kona-setup: Delete two error messages for a
 failed memory allocation in parent_process()
To: SF Markus Elfring <elfring@users.sourceforge.net>,
 bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org,
 Alex Elder <elder@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Stephen Boyd <sboyd@codeaurora.org>
References: <022c9ba4-f3c4-e4e3-f804-2bd54937a138@users.sourceforge.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: Scott Branden <scott.branden@broadcom.com>
Message-ID: <a7a7f4b5-6b4f-3606-550f-3dd37274fa61@broadcom.com>
Date: Tue, 26 Sep 2017 09:46:53 -0700
MIME-Version: 1.0
In-Reply-To: <022c9ba4-f3c4-e4e3-f804-2bd54937a138@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Thanks for cleanup.


On 17-09-26 08:05 AM, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 26 Sep 2017 16:54:20 +0200
>
> Omit extra messages for a memory allocation failure in this function.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
Acked-by: Scott Branden <scott.branden@broadcom.com>
> ---
>   drivers/clk/bcm/clk-kona-setup.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/clk/bcm/clk-kona-setup.c b/drivers/clk/bcm/clk-kona-setup.c
> index c37a7f0e83aa..281f4322355c 100644
> --- a/drivers/clk/bcm/clk-kona-setup.c
> +++ b/drivers/clk/bcm/clk-kona-setup.c
> @@ -579,18 +579,13 @@ static u32 *parent_process(const char *clocks[],
>   	 */
>   	parent_names = kmalloc_array(parent_count, sizeof(*parent_names),
>   			       GFP_KERNEL);
> -	if (!parent_names) {
> -		pr_err("%s: error allocating %u parent names\n", __func__,
> -				parent_count);
> +	if (!parent_names)
>   		return ERR_PTR(-ENOMEM);
> -	}
>   
>   	/* There is at least one parent, so allocate a selector array */
>   	parent_sel = kmalloc_array(parent_count, sizeof(*parent_sel),
>   				   GFP_KERNEL);
>   	if (!parent_sel) {
> -		pr_err("%s: error allocating %u parent selectors\n", __func__,
> -				parent_count);
>   		kfree(parent_names);
>   
>   		return ERR_PTR(-ENOMEM);
