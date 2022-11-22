Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3635C433FE
	for <linux-clk@archiver.kernel.org>; Tue, 22 Nov 2022 04:26:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229866AbiKVE0E (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Nov 2022 23:26:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbiKVE0C (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Nov 2022 23:26:02 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5264D2D1F2;
        Mon, 21 Nov 2022 20:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=lVS+dWrKKa9QN4MdUdUFheha5LFoDNY4SENDGiky6mk=; b=2PRvgAsBLf77FQydYNIC0SbAXo
        jpuDA+V9R9r3VOrIiLScCW0XEt6Lezh8f081zAzTYzy5S7qBzZd6NAxKt0t/QWBpSJaq/9QbYr4sy
        tdYDD84mu+67al/6+sERRexikjKfHVXfQ1uvZNURxDBYLaeLh9FvS/fuKi/w2/hXHpZT5uQGgIi0g
        FmxUFSAMm9RvOWMHSo5VHETsiwjnKEWDuGGJ2o6r2RtvNcOJLYzplLrT9qUcQ7g9CEUANILBiJU0p
        jTK2sMOr4Nf8OC0EzRBFCxGQLdaOiBi01IKVingxoTOx6d47ME+I+yB/IHjZSzcJZ/r5Xp+I/quDK
        oy8i6T6g==;
Received: from [2601:1c2:d80:3110::a2e7]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1oxKr1-003hki-7O; Tue, 22 Nov 2022 04:25:51 +0000
Message-ID: <b3c96714-f34a-eff1-3cf3-7d173b8f5295@infradead.org>
Date:   Mon, 21 Nov 2022 20:25:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH -next v2] clk: Fix one kernel-doc comment
Content-Language: en-US
To:     Yang Li <yang.lee@linux.alibaba.com>, mturquette@baylibre.com
Cc:     sboyd@kernel.org, wens@csie.org, jernej.skrabec@gmail.com,
        samuel@sholland.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
References: <20221122023826.101503-1-yang.lee@linux.alibaba.com>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20221122023826.101503-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi--

On 11/21/22 18:38, Yang Li wrote:
> drivers/clk/sunxi-ng/ccu_mmc_timing.c:54: warning: expecting prototype for sunxi_ccu_set_mmc_timing_mode(). Prototype was for sunxi_ccu_get_mmc_timing_mode() instead
> 
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3230
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

This looks good, although this file needs more work in a few places.

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.


> ---
> 
> change in v2:
> --According to Randy's suggestion, use the '-' replace ':' to separate function name and description.
> 
>  drivers/clk/sunxi-ng/ccu_mmc_timing.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu_mmc_timing.c b/drivers/clk/sunxi-ng/ccu_mmc_timing.c
> index de33414fc5c2..88c456a8e49b 100644
> --- a/drivers/clk/sunxi-ng/ccu_mmc_timing.c
> +++ b/drivers/clk/sunxi-ng/ccu_mmc_timing.c
> @@ -43,7 +43,7 @@ int sunxi_ccu_set_mmc_timing_mode(struct clk *clk, bool new_mode)
>  EXPORT_SYMBOL_GPL(sunxi_ccu_set_mmc_timing_mode);
>  
>  /**
> - * sunxi_ccu_set_mmc_timing_mode: Get the current MMC clock timing mode
> + * sunxi_ccu_get_mmc_timing_mode - Get the current MMC clock timing mode
>   * @clk: clock to query
>   *
>   * Returns 0 if the clock is in old timing mode, > 0 if it is in

-- 
~Randy
