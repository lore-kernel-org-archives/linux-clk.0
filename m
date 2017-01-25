Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailgw02.mediatek.com ([210.61.82.184]:63935 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751183AbdAYDB4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 24 Jan 2017 22:01:56 -0500
Message-ID: <1485313240.1348.0.camel@mtksdaap41>
Subject: Re: [PATCH] clk: mediatek: Fix MT8135 dependencies
From: James Liao <jamesjj.liao@mediatek.com>
To: Jean Delvare <jdelvare@suse.de>
CC: <linux-clk@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
        "Andreas =?ISO-8859-1?Q?F=E4rber?=" <afaerber@suse.de>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Date: Wed, 25 Jan 2017 11:00:40 +0800
In-Reply-To: <20170124130912.14375a32@endymion>
References: <20170124130912.14375a32@endymion>
Content-Type: text/plain; charset="ISO-8859-1"
MIME-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, 2017-01-24 at 13:09 +0100, Jean Delvare wrote:
> The MT8135 is a 32-bit SoC, so only propose it on ARM architecture,
> not ARM64.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Fixes: 234d511d8c15 ("clk: mediatek: Add hardware dependency")
> Cc: Andreas Färber <afaerber@suse.de>
> Cc: James Liao <jamesjj.liao@mediatek.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>

Acked-by: James Liao <jamesjj.liao@mediatek.com>

> ---
>  drivers/clk/mediatek/Kconfig |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> --- linux-4.10-rc4.orig/drivers/clk/mediatek/Kconfig	2017-01-24 12:55:50.192100713 +0100
> +++ linux-4.10-rc4/drivers/clk/mediatek/Kconfig	2017-01-24 12:59:08.703066604 +0100
> @@ -52,9 +52,9 @@ config COMMON_CLK_MT2701_BDPSYS
>  
>  config COMMON_CLK_MT8135
>  	bool "Clock driver for Mediatek MT8135"
> -	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	depends on (ARCH_MEDIATEK && ARM) || COMPILE_TEST
>  	select COMMON_CLK_MEDIATEK
> -	default ARCH_MEDIATEK
> +	default ARCH_MEDIATEK && ARM
>  	---help---
>  	  This driver supports Mediatek MT8135 clocks.
>  
> 


