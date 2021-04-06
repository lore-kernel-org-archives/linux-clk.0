Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B1A1C433ED
	for <linux-clk@archiver.kernel.org>; Tue,  6 Apr 2021 18:14:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED671613D2
	for <linux-clk@archiver.kernel.org>; Tue,  6 Apr 2021 18:14:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235425AbhDFSOG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Apr 2021 14:14:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:41990 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232876AbhDFSOF (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 6 Apr 2021 14:14:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 20D406124C;
        Tue,  6 Apr 2021 18:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617732837;
        bh=I0f6571V+w1pmYWIQVIfSoPz4rhPcp0S3WPxD7utrOM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=AlKBpkvT6CuBNnAj7t6KDGjOvgj8B6vde3RS3i9exuXV46VU/PYtPL0mw17akq1F6
         xrPZIb87Yg9owDePTbTlD/lJACf14S8pfZlwgOFUd7UiTx6+VGA7bp6o0DsVtLko3p
         b/r/el1PgVSNg96cZGtb/KtWjiSgCLAyy4JG2msFuXBBrFOf9dgx89eNJQIIXaNIz7
         gMQ5HPiPfBhZ5IUJtZehtnTH6nGEamMA+fYxyhkIWKYDYPC1Ut/o36/Ht3ia3OCWHX
         DRImrIS2UvGYMc/7307wm80dKOOmYFqDGQOekFdcDag9vrrD1JURFCzxT1YpBvHKv1
         1nwIe9kxveYDA==
Subject: Re: [PATCH] clk: socfpga: arria10: Fix memory leak of socfpga_clk on
 error return
To:     Colin King <colin.king@canonical.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210406170115.430990-1-colin.king@canonical.com>
From:   Dinh Nguyen <dinguyen@kernel.org>
Message-ID: <8ad43a2d-ac0f-8c19-6e1a-82811a9d4495@kernel.org>
Date:   Tue, 6 Apr 2021 13:13:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210406170115.430990-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 4/6/21 12:01 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is an error return path that is not kfree'ing socfpga_clk leading
> to a memory leak. Fix this by adding in the missing kfree call.
> 
> Addresses-Coverity: ("Resource leak")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/clk/socfpga/clk-gate-a10.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/socfpga/clk-gate-a10.c b/drivers/clk/socfpga/clk-gate-a10.c
> index f5cba8298712..738c53391e39 100644
> --- a/drivers/clk/socfpga/clk-gate-a10.c
> +++ b/drivers/clk/socfpga/clk-gate-a10.c
> @@ -146,6 +146,7 @@ static void __init __socfpga_gate_init(struct device_node *node,
>   		if (IS_ERR(socfpga_clk->sys_mgr_base_addr)) {
>   			pr_err("%s: failed to find altr,sys-mgr regmap!\n",
>   					__func__);
> +			kfree(socfpga_clk);
>   			return;
>   		}
>   	}
> 

Acked-by: Dinh Nguyen <dinguyen@kernel.org>
