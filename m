Return-Path: <f.fainelli@gmail.com>
Return-Path: <f.fainelli@gmail.com>
Subject: Re: [PATCH] [media] clk-kona-setup: Delete two error messages for a
 failed memory allocation in parent_process()
To: SF Markus Elfring <elfring@users.sourceforge.net>,
 bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org,
 Alex Elder <elder@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <022c9ba4-f3c4-e4e3-f804-2bd54937a138@users.sourceforge.net>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <d2a61d77-6bb0-b3ac-747f-1ca1a196d7b3@gmail.com>
Date: Tue, 26 Sep 2017 10:40:06 -0700
MIME-Version: 1.0
In-Reply-To: <022c9ba4-f3c4-e4e3-f804-2bd54937a138@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 09/26/2017 08:05 AM, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 26 Sep 2017 16:54:20 +0200
> 
> Omit extra messages for a memory allocation failure in this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Can you use subjects that match previous submissions done to the driver:

6e2e7c9fdae3 clk-kona-setup: Use kmalloc_array() in parent_process()
f37fccce4cc1 clk: bcm: kona: Migrate to clk_hw based registration and OF
APIs
4087a5f2e5e7 clk: bcm/kona: Do not use sizeof on pointer type
7926b3f8c626 clk: bcm/kona: Remove ccu_list
dc613840a625 clk: bcm281xx: add clock hysteresis support
a597faccc7ee clk: bcm281xx: add clock policy support
03548ec06ad3 clk: bcm281xx: define CCU clock data statically
b12151ca5cd7 clk: bcm281xx: initialize CCU structures statically
e756325206eb clk: bcm281xx: use init_data.name for clock name
e813d49d2a47 clk: bcm281xx: don't use unnamed structs or unions
1a5823c9209f clk: bcm281xx: don't disable unused peripheral clocks
1f27f15258bf clk: bcm281xx: add initial clock framework support

[media] is not appropriate here, other than that, the changes look good,
thanks.

> ---
>  drivers/clk/bcm/clk-kona-setup.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/bcm/clk-kona-setup.c b/drivers/clk/bcm/clk-kona-setup.c
> index c37a7f0e83aa..281f4322355c 100644
> --- a/drivers/clk/bcm/clk-kona-setup.c
> +++ b/drivers/clk/bcm/clk-kona-setup.c
> @@ -579,18 +579,13 @@ static u32 *parent_process(const char *clocks[],
>  	 */
>  	parent_names = kmalloc_array(parent_count, sizeof(*parent_names),
>  			       GFP_KERNEL);
> -	if (!parent_names) {
> -		pr_err("%s: error allocating %u parent names\n", __func__,
> -				parent_count);
> +	if (!parent_names)
>  		return ERR_PTR(-ENOMEM);
> -	}
>  
>  	/* There is at least one parent, so allocate a selector array */
>  	parent_sel = kmalloc_array(parent_count, sizeof(*parent_sel),
>  				   GFP_KERNEL);
>  	if (!parent_sel) {
> -		pr_err("%s: error allocating %u parent selectors\n", __func__,
> -				parent_count);
>  		kfree(parent_names);
>  
>  		return ERR_PTR(-ENOMEM);
> 


-- 
Florian
