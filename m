Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp2-g21.free.fr ([212.27.42.2]:54525 "EHLO smtp2-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752735AbcERLJI (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Wed, 18 May 2016 07:09:08 -0400
Subject: Re: [PATCH 5/9] MIPS: Loongson-1A: workaround of pll register's
 write-only property
To: Binbin Zhou <zhoubb@lemote.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, linux-clk@vger.kernel.org
References: <1463569018-25189-1-git-send-email-zhoubb@lemote.com>
From: Mason <slash.tmp@free.fr>
Message-ID: <573C4D44.1050600@free.fr>
Date: Wed, 18 May 2016 13:08:52 +0200
MIME-Version: 1.0
In-Reply-To: <1463569018-25189-1-git-send-email-zhoubb@lemote.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 18/05/2016 12:56, Binbin Zhou wrote:

> diff --git a/arch/mips/loongson32/common/platform.c b/arch/mips/loongson32/common/platform.c
> index 24f35b6..0c3c608 100644
> --- a/arch/mips/loongson32/common/platform.c
> +++ b/arch/mips/loongson32/common/platform.c
> @@ -62,9 +62,15 @@ struct platform_device ls1x_uart_pdev = {
>  
>  void __init ls1x_serial_set_uartclk(struct platform_device *pdev)
>  {
> -	struct clk *clk;
> +	u32 ls1x_uartclk;
>  	struct plat_serial8250_port *p;
>  
> +#ifdef CONIFG_CPU_LOONGSON1A

CONIFG? :-)
