Return-Path: <SRS0=z+8+=6U=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72528C28CBC
	for <linux-clk@archiver.kernel.org>; Wed,  6 May 2020 17:21:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5350C20936
	for <linux-clk@archiver.kernel.org>; Wed,  6 May 2020 17:21:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728685AbgEFRVt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 May 2020 13:21:49 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:56430 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727872AbgEFRVt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 May 2020 13:21:49 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id 00E752A1E8A
Subject: Re: [PATCH] soc: mediatek: mmsys: Drop <linux/clk-provider.h>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        CK Hu <ck.hu@mediatek.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200506120204.31422-1-geert+renesas@glider.be>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <56149461-e60a-a1a0-a43c-67a9913bd7f6@collabora.com>
Date:   Wed, 6 May 2020 19:21:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200506120204.31422-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Geert,

Thank you for your patch.

On 6/5/20 14:02, Geert Uytterhoeven wrote:
> After the split, the mt8173 MMSYS driver is no longer a clock provider,
> and thus does not need to include <linux/clk-provider.h>.
> 
> Fixes: 13032709e2328553 ("clk / soc: mediatek: Move mt8173 MMSYS to platform driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

> ---
>  drivers/soc/mediatek/mtk-mmsys.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 05e322c9c301ad91..bb5ccd5b0386c041 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -4,7 +4,6 @@
>   * Author: James Liao <jamesjj.liao@mediatek.com>
>   */
>  
> -#include <linux/clk-provider.h>
>  #include <linux/device.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
> 
