Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59EF4C64EC4
	for <linux-clk@archiver.kernel.org>; Mon,  6 Mar 2023 17:25:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229600AbjCFRZs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Mar 2023 12:25:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbjCFRZr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Mar 2023 12:25:47 -0500
X-Greylist: delayed 431 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 06 Mar 2023 09:25:05 PST
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [IPv6:2001:4b7a:2000:18::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38CD567037
        for <linux-clk@vger.kernel.org>; Mon,  6 Mar 2023 09:25:05 -0800 (PST)
Received: from SoMainline.org (unknown [89.205.226.44])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id D0A763EBA5;
        Mon,  6 Mar 2023 18:11:58 +0100 (CET)
Date:   Mon, 6 Mar 2023 18:11:55 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: Print an info line before disabling unused clocks
Message-ID: <20230306171155.nry43s42l3rtdojo@SoMainline.org>
References: <20230306134108.3099396-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230306134108.3099396-1-konrad.dybcio@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2023-03-06 14:41:08, Konrad Dybcio wrote:
> Currently, the regulator framework informs us before calling into
> their unused cleanup paths, which eases at least some debugging. The
> same could be beneficial for clocks, so that random shutdowns shortly
> after most initcalls are done can be less of a guess.
> 
> Add a pr_info before disabling unused clocks to do so.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/clk/clk.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index ae07685c7588..827a51fe6653 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1404,7 +1404,8 @@ static int __init clk_disable_unused(void)
>  	if (clk_ignore_unused) {
>  		pr_warn("clk: Not disabling unused clocks\n");
>  		return 0;
> -	}
> +	} else

You shouldn't need an else here, as the if body above returns.  That
also aligns this pr_info with the actual code that performs the clk
disablement.

With that fxed, thanks a lot for this useful info in dmesg! Feel free to
add my r-b.

- Marijn

> +		pr_info("clk: Disabling unused clocks\n");
>  
>  	clk_prepare_lock();
>  
> -- 
> 2.39.2
> 
