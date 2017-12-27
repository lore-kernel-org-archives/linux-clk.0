Return-Path: <sboyd@codeaurora.org>
Date: Tue, 26 Dec 2017 17:10:21 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: sean.wang@mediatek.com
Cc: mturquette@baylibre.com, matthias.bgg@gmail.com, jdelvare@suse.de,
	jamesjj.liao@mediatek.com, weiyi.lu@mediatek.com, arnd@arndb.de,
	linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: mediatek: remove unnecessary include header from
 reset.c
Message-ID: <20171227011021.GQ7997@codeaurora.org>
References: <b5937ad5c068eeec19005d40dbddb97e09c1b3d0.1514190227.git.sean.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <b5937ad5c068eeec19005d40dbddb97e09c1b3d0.1514190227.git.sean.wang@mediatek.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/25, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> In fact, the clk-mtk.h header is indeed not needed for reset.c and thus
> it's safe and good change to remove it from the file.
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> Reviewed-by: Jean Delvare <jdelvare@suse.de>
> Cc: Jean Delvare <jdelvare@suse.de>
> ---
>  drivers/clk/mediatek/reset.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
> index d3551d5..70ebb2e 100644
> --- a/drivers/clk/mediatek/reset.c
> +++ b/drivers/clk/mediatek/reset.c
> @@ -19,8 +19,6 @@
>  #include <linux/reset-controller.h>
>  #include <linux/slab.h>
>  
> -#include "clk-mtk.h"
> -

drivers/clk/mediatek/reset.c:64:6: warning: symbol 'mtk_register_reset_controller' was not declared. Should it be static?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
