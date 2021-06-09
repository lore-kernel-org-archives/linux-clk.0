Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B0C1C47095
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jun 2021 08:31:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 420D361359
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jun 2021 08:31:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234057AbhFIIc6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Jun 2021 04:32:58 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:22171 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232333AbhFIIc6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 9 Jun 2021 04:32:58 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id D449924000F;
        Wed,  9 Jun 2021 08:31:01 +0000 (UTC)
Date:   Wed, 9 Jun 2021 10:31:01 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: at91: fix count of periph clocks passed to
 pmc_data_allocate
Message-ID: <YMB8RYhCY4WVQXg+@piout.net>
References: <20210609080145.44226-1-clement.leger@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210609080145.44226-1-clement.leger@bootlin.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

hi,

Subject should have been:
clk: at91: sama5d2: fix count of periph clocks passed to pmc_data_allocate



On 09/06/2021 10:01:44+0200, Clément Léger wrote:
> When allocating clk_hw structure, only the periph32 clocks are considered.
> Since sama5d2_periphck are also added to the phws there is currently an
> out of bound write. Fix this by adding the count of periphck to periph32ck.
> 
> Signed-off-by: Clément Léger <clement.leger@bootlin.com>
Fixes: a2038077de9a ("clk: at91: add sama5d2 PMC driver")

> ---
>  drivers/clk/at91/sama5d2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/at91/sama5d2.c b/drivers/clk/at91/sama5d2.c
> index 3d1f78176c3e..663b73a032ee 100644
> --- a/drivers/clk/at91/sama5d2.c
> +++ b/drivers/clk/at91/sama5d2.c
> @@ -170,7 +170,7 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
>  
>  	sama5d2_pmc = pmc_data_allocate(PMC_AUDIOPLLCK + 1,
>  					nck(sama5d2_systemck),
> -					nck(sama5d2_periph32ck),
> +					nck(sama5d2_periphck) + nck(sama5d2_periph32ck),
>  					nck(sama5d2_gck), 3);
>  	if (!sama5d2_pmc)
>  		return;
> -- 
> 2.32.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
