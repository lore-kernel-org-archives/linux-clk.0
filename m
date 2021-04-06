Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D7FC433ED
	for <linux-clk@archiver.kernel.org>; Tue,  6 Apr 2021 18:37:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 59EC0613D4
	for <linux-clk@archiver.kernel.org>; Tue,  6 Apr 2021 18:37:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240602AbhDFShv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Apr 2021 14:37:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:36906 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237219AbhDFShu (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 6 Apr 2021 14:37:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8B968613BE;
        Tue,  6 Apr 2021 18:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617734262;
        bh=PcnQ0Zv6P2Zfsr2lvCKYMJmmSH9RHOTt52HDpy/5Lgw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=KN4BYlDz+z2BvOqVmSXYZvl/bGRD3p45gVLqRKF2W9Nu4HYVmvmqaEKB9C+U7L6tV
         CcxCKJcugYuRGajuDr8DJBLVOMR92Fa9/+jmWpThDRDavaU5p0bTCX1SSZfMpuDtzO
         UNyqdlM/bfFUFG454vmvyE/A4mq0+Mqe0xmblckrzf3B+2ONxkyeZ/YaHAnABbkG4R
         GBP1T9+25GWmd0kFDB5krZFTFtotB3sDNG4GMIj3s5dSIQN7dDUloe8gUXCHElyDIY
         JBiOZJX3ei74EexAGOpfphMNgcptCFqQi7AMj8+i2eAfMv5KQgegKxPRKdBY0vN5+f
         mP5QtUTt5r/XQ==
Subject: Re: [PATCH][next] clk: socfpga: remove redundant initialization of
 variable div
To:     Colin King <colin.king@canonical.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210406182746.432861-1-colin.king@canonical.com>
From:   Dinh Nguyen <dinguyen@kernel.org>
Message-ID: <128f3972-d83a-6103-647e-d84f1ebfaa5c@kernel.org>
Date:   Tue, 6 Apr 2021 13:37:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210406182746.432861-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 4/6/21 1:27 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable div is being initialized with a value that is
> never read and it is being updated later with a new value.  The
> initialization is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/clk/socfpga/clk-gate-s10.c | 2 +-
>   drivers/clk/socfpga/clk-pll-s10.c  | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/socfpga/clk-gate-s10.c b/drivers/clk/socfpga/clk-gate-s10.c
> index f9f403d7bb58..b84f2627551e 100644
> --- a/drivers/clk/socfpga/clk-gate-s10.c
> +++ b/drivers/clk/socfpga/clk-gate-s10.c
> @@ -31,7 +31,7 @@ static unsigned long socfpga_dbg_clk_recalc_rate(struct clk_hw *hwclk,
>   						  unsigned long parent_rate)
>   {
>   	struct socfpga_gate_clk *socfpgaclk = to_socfpga_gate_clk(hwclk);
> -	u32 div = 1, val;
> +	u32 div, val;
>   
>   	val = readl(socfpgaclk->div_reg) >> socfpgaclk->shift;
>   	val &= GENMASK(socfpgaclk->width - 1, 0);
> diff --git a/drivers/clk/socfpga/clk-pll-s10.c b/drivers/clk/socfpga/clk-pll-s10.c
> index bc37461d43c0..70076a80149d 100644
> --- a/drivers/clk/socfpga/clk-pll-s10.c
> +++ b/drivers/clk/socfpga/clk-pll-s10.c
> @@ -107,7 +107,7 @@ static unsigned long clk_boot_clk_recalc_rate(struct clk_hw *hwclk,
>   					 unsigned long parent_rate)
>   {
>   	struct socfpga_pll *socfpgaclk = to_socfpga_clk(hwclk);
> -	u32 div = 1;
> +	u32 div;
>   
>   	div = ((readl(socfpgaclk->hw.reg) &
>   		SWCTRLBTCLKSEL_MASK) >>
> 

Acked-by: Dinh Nguyen <dinguyen@kernel.org>
