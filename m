Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1EC7C433EF
	for <linux-clk@archiver.kernel.org>; Wed,  6 Oct 2021 19:13:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D00361186
	for <linux-clk@archiver.kernel.org>; Wed,  6 Oct 2021 19:13:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231807AbhJFTPW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Oct 2021 15:15:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229926AbhJFTPV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Oct 2021 15:15:21 -0400
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C5EEC061746
        for <linux-clk@vger.kernel.org>; Wed,  6 Oct 2021 12:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=TRSrECSNLAyabpRrwaj0M92rPXMzopooMn+5rsE8OIM=; b=Qv3z63LhTuVs9tItQhX4jMtSXr
        c5CSSAnQ6ti2AMdb9kLhSmH+yX66nqP5WJ2zDcyB6le5KFCZAhrxbqFVX4RI1bSPzs7xo9pstJXS6
        dp3FgzXtsusPLdzyEQUMvac3f3OioJQV15ENSTHosNLry/tKFmttv39RjN1HfEdsR01wxqkVtLxf3
        DZDgx3EoO40RxmEwFwhY/DH8qTkNl8zOQ1Rv9vrTaHn7+71Bqz7n05zSyYpZsOhySSHOUOqF1tdWk
        0sfjryyBeHk5yLLvovLvDztdPxaz0ChIvT1A46WXHxuAHcbb2AqamXMYqTrF88+EPpVKC1Y9inTt2
        Jyp6m66w==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mYCM4-00FOhe-U3; Wed, 06 Oct 2021 19:13:29 +0000
Subject: Re: [PATCH] clk: imx: Make CLK_IMX8ULP select MXC_CLK
To:     Fabio Estevam <festevam@gmail.com>, abel.vesa@nxp.com
Cc:     shawnguo@kernel.org, ping.bai@nxp.com, linux-clk@vger.kernel.org
References: <20211006190008.1935051-1-festevam@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <52250c6f-2955-a3e9-8d52-ec6c44a43710@infradead.org>
Date:   Wed, 6 Oct 2021 12:13:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211006190008.1935051-1-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 10/6/21 12:00 PM, Fabio Estevam wrote:
> Building CLK_IMX8ULP without selecting MXC_CLK causes the following
> build errors:
> 
> ld: drivers/clk/imx/clk-imx8ulp.o: in function `imx8ulp_clk_cgc2_init':
> clk-imx8ulp.c:(.text+0xd0): undefined reference to `imx_ccm_lock'
> ld: clk-imx8ulp.c:(.text+0x14f): undefined reference to `imx_clk_hw_pllv4'
> ld: clk-imx8ulp.c:(.text+0x15a): undefined reference to `imx_ccm_lock'
> 
> Avoid this problem by making CLK_IMX8ULP select MXC_CLK.
> 
> Fixes: c43a801a5789 ("clk: imx: Add clock driver for imx8ulp")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.

> ---
>   drivers/clk/imx/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig
> index b81d6437ed95..c08edbd04d22 100644
> --- a/drivers/clk/imx/Kconfig
> +++ b/drivers/clk/imx/Kconfig
> @@ -102,5 +102,6 @@ config CLK_IMX8QXP
>   config CLK_IMX8ULP
>   	tristate "IMX8ULP CCM Clock Driver"
>   	depends on ARCH_MXC || COMPILE_TEST
> +	select MXC_CLK
>   	help
>   	    Build the driver for i.MX8ULP CCM Clock Driver
> 


-- 
~Randy
