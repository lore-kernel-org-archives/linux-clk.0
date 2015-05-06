Return-Path: <javier.martinez@collabora.co.uk>
Message-ID: <5549DD88.1010803@collabora.co.uk>
Date: Wed, 06 May 2015 11:23:20 +0200
From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>,
 Mike Turquette <mturquette@linaro.org>
CC: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 03/19] clk: max-gen: Silence sparse warnings
References: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org> <1430897996-11597-4-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1430897996-11597-4-git-send-email-sboyd@codeaurora.org>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Hello Stephen,

On 05/06/2015 09:39 AM, Stephen Boyd wrote:
> drivers/clk/clk-max-gen.c:82:16: warning: symbol 'max_gen_clk_ops' was not declared. Should it be static?
> drivers/clk/clk-max-gen.c:109:5: warning: symbol 'max_gen_clk_probe' was not declared. Should it be static?
> drivers/clk/clk-max-gen.c:183:5: warning: symbol 'max_gen_clk_remove' was not declared. Should it be static?
> 
> Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>  drivers/clk/clk-max-gen.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/clk-max-gen.c b/drivers/clk/clk-max-gen.c
> index 6505049d50f1..35af9cb6da4f 100644
> --- a/drivers/clk/clk-max-gen.c
> +++ b/drivers/clk/clk-max-gen.c
> @@ -31,6 +31,8 @@
>  #include <linux/of.h>
>  #include <linux/export.h>
>  
> +#include "clk-max-gen.h"
> +
>  struct max_gen_clk {
>  	struct regmap *regmap;
>  	u32 mask;
> 

Looks good to me.

Acked-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Best regards,
Javier
