Return-Path: <SRS0=pe6Q=5W=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F1F3C2BA19
	for <linux-clk@archiver.kernel.org>; Mon,  6 Apr 2020 11:03:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1D4FE206F5
	for <linux-clk@archiver.kernel.org>; Mon,  6 Apr 2020 11:03:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727045AbgDFLD2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Apr 2020 07:03:28 -0400
Received: from mx2.suse.de ([195.135.220.15]:37606 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726883AbgDFLD2 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 6 Apr 2020 07:03:28 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id E2369AD12;
        Mon,  6 Apr 2020 11:03:25 +0000 (UTC)
Subject: Re: [PATCH 1/9] ARM: Remove redundant COMMON_CLK selects
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Alexander Shiyan <shc_work@mail.ru>,
        Lubomir Rintel <lkundrak@v3.sk>,
        linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
References: <20200405025123.154688-1-sboyd@kernel.org>
 <20200405025123.154688-2-sboyd@kernel.org>
From:   =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Software Solutions Germany GmbH
Message-ID: <f3d1bf68-f40f-858d-8caf-268ad9231553@suse.de>
Date:   Mon, 6 Apr 2020 13:03:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200405025123.154688-2-sboyd@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Am 05.04.20 um 04:51 schrieb Stephen Boyd:
> The mulitplatform config already selects COMMON_CLK, so selecting it
> again is not useful. Remove these selects from ARM platforms that are
> part of the multiplatform build.
> 
> Cc: "Andreas Färber" <afaerber@suse.de>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Alexander Shiyan <shc_work@mail.ru>
> Cc: Lubomir Rintel <lkundrak@v3.sk>
> Cc: <linux-arm-kernel@lists.infradead.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---
>   arch/arm/mach-actions/Kconfig  | 1 -
>   arch/arm/mach-clps711x/Kconfig | 1 -
>   arch/arm/mach-mmp/Kconfig      | 1 -
>   3 files changed, 3 deletions(-)
> 
> diff --git a/arch/arm/mach-actions/Kconfig b/arch/arm/mach-actions/Kconfig
> index b5e0ac965ec0..00fb4babccdd 100644
> --- a/arch/arm/mach-actions/Kconfig
> +++ b/arch/arm/mach-actions/Kconfig
> @@ -7,7 +7,6 @@ menuconfig ARCH_ACTIONS
>   	select ARM_GLOBAL_TIMER
>   	select CACHE_L2X0
>   	select CLKSRC_ARM_GLOBAL_TIMER_SCHED_CLOCK
> -	select COMMON_CLK
>   	select GENERIC_IRQ_CHIP
>   	select HAVE_ARM_SCU if SMP
>   	select HAVE_ARM_TWD if SMP

Reviewed-by: Andreas Färber <afaerber@suse.de> (Actions)

New targets such as Realtek or Sunplus don't select it anymore, but it 
seems we didn't clean up all the old ones yet.

Thanks,
Andreas

-- 
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer
HRB 36809 (AG Nürnberg)
