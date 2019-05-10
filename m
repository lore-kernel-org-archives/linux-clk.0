Return-Path: <SRS0=JHcd=TK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 327B8C04A6B
	for <linux-clk@archiver.kernel.org>; Fri, 10 May 2019 03:28:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 02DD92182B
	for <linux-clk@archiver.kernel.org>; Fri, 10 May 2019 03:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1557458892;
	bh=Vodgijw9WRizuu9THwepTbSoYZ8ws+bZYRW+EAXnc5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=HQP9vDc3ngQOT8ci82zx/kKYDamZlUHjsnBCzBdMMEpTnQ5rS9ZTpPsuNv3w/bEt2
	 1XBSPLXYStt0RQM+uXJnDRpzfd8YswdeUY6UpsNJDbdffo8YjLi4WNtW8aLyGHMhGk
	 f/lCqzsFeQS0qpYwx1oY1vkoDm6mVV4i7RBwvT1A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbfEJD2L (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 9 May 2019 23:28:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:37916 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726880AbfEJD2L (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 9 May 2019 23:28:11 -0400
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DA6B72084A;
        Fri, 10 May 2019 03:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557458890;
        bh=Vodgijw9WRizuu9THwepTbSoYZ8ws+bZYRW+EAXnc5s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gQpZsDQDPDNB4zpoaSbm0NrOEyRfw2BQLvhe1PjydIwKZj65kqZXgWsw8o0buW1SP
         qA7AIiOu8aTFMaRuFPZMTSpwX0ALZV0FNkNcpKYDLLFLaxZN7IURhqLgVhG0YvCASL
         M3y79cQxl7bCd9d4nQQL/rqut2Nvy1btGirdopHg=
Date:   Fri, 10 May 2019 11:27:47 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Leonard Crestez <leonard.crestez@nxp.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] clk: imx6sll: Fix mispelling uart4_serial as serail
Message-ID: <20190510032746.GF15856@dragon>
References: <8776296d079b3b4d67d4421656238757a8ad373d.1556046082.git.leonard.crestez@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8776296d079b3b4d67d4421656238757a8ad373d.1556046082.git.leonard.crestez@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Apr 23, 2019 at 07:05:08PM +0000, Leonard Crestez wrote:
> This looks like a copy-paste error. This string is not referenced
> anywhere so it's safe to rename it.
> 
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>

I see this keep coming, so have to ask you to fix your patch sender.
The base64 encoding makes it very difficult to apply patch.  I have done
manual applying for your patches a couple of times, and I thought that's
just accident.  It seems not.  Please fix and resend. 

Shawn

> ---
>  drivers/clk/imx/clk-imx6sll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-imx6sll.c b/drivers/clk/imx/clk-imx6sll.c
> index 3bd2044cf25c..9def76df0879 100644
> --- a/drivers/clk/imx/clk-imx6sll.c
> +++ b/drivers/clk/imx/clk-imx6sll.c
> @@ -266,11 +266,11 @@ static void __init imx6sll_clocks_init(struct device_node *ccm_node)
>  	clks[IMX6SLL_CLK_EPIT1]		= imx_clk_gate2("epit1",	"perclk", base + 0x6c, 12);
>  	clks[IMX6SLL_CLK_EPIT2]		= imx_clk_gate2("epit2",	"perclk", base + 0x6c, 14);
>  	clks[IMX6SLL_CLK_GPT_BUS]	= imx_clk_gate2("gpt1_bus",	"perclk", base + 0x6c, 20);
>  	clks[IMX6SLL_CLK_GPT_SERIAL]	= imx_clk_gate2("gpt1_serial",	"perclk", base + 0x6c, 22);
>  	clks[IMX6SLL_CLK_UART4_IPG]	= imx_clk_gate2("uart4_ipg",	"ipg", base + 0x6c, 24);
> -	clks[IMX6SLL_CLK_UART4_SERIAL]	= imx_clk_gate2("uart4_serail",	"uart_podf", base + 0x6c, 24);
> +	clks[IMX6SLL_CLK_UART4_SERIAL]	= imx_clk_gate2("uart4_serial",	"uart_podf", base + 0x6c, 24);
>  	clks[IMX6SLL_CLK_GPIO1]		= imx_clk_gate2("gpio1",	"ipg", base + 0x6c, 26);
>  	clks[IMX6SLL_CLK_GPIO5]		= imx_clk_gate2("gpio5",	"ipg", base + 0x6c, 30);
>  
>  	/* CCGR2 */
>  	clks[IMX6SLL_CLK_GPIO6]		= imx_clk_gate2("gpio6",	"ipg",    base + 0x70, 0);
> -- 
> 2.17.1
> 
