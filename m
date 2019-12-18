Return-Path: <SRS0=818c=2I=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8996C43603
	for <linux-clk@archiver.kernel.org>; Wed, 18 Dec 2019 18:56:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0A7542082E
	for <linux-clk@archiver.kernel.org>; Wed, 18 Dec 2019 18:56:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="k3zgNOVd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726699AbfLRS4n (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Dec 2019 13:56:43 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.21]:20093 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726698AbfLRS4n (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Dec 2019 13:56:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1576695401;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=RHrceRHBhza4YVXmCAi7LfS8ePHybs5o1mTm91RAdCw=;
        b=k3zgNOVdav1wsgQY5KG6E/620q/nFNyk9DhbJc2csQDO3J8U+GlFzzT1Rznoil7gOf
        EmhfHtYgQ66LLw4Ccxi3F1WSZchZ2atUy/DltEYjNeCj8mITMboqEYeHkymbsXPWw43r
        ZL0BgmxOJbz0i0JbWc4k4/YQ9XYkHvZY/x8xm8LR+bi8pV+qKCh/hWozQ3EQffvmkNxc
        8zrqwTu43ekXtreTOBxZoy//fPDtCr9Gt4iiBenG07/ValkcbxjZTWCrMgMvCAYU0z5F
        ifOa64BbKQ7Ig8f/Cq4pUCAEY/YqTLJw42SlPsJfU61hxIR0SH1B8XS68A7gct9s3GsM
        pJIQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u266HpF+ORJDY77yYxJueg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 46.0.7 DYNA|AUTH)
        with ESMTPSA id 9046ccvBIIocA4H
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 18 Dec 2019 19:50:38 +0100 (CET)
Date:   Wed, 18 Dec 2019 19:50:30 +0100
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH] clk: ux500: Fix up the SGA clock for some variants
Message-ID: <20191218185030.GA60941@gerhold.net>
References: <20191217210504.27888-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191217210504.27888-1-linus.walleij@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Dec 17, 2019 at 10:05:04PM +0100, Linus Walleij wrote:
> Some of the special PRCMU firmware variants were not
> properly detected in the Ux500 clock driver, resulting
> in the wrong clock for the SGA.
> 
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Stephan Gerhold <stephan@gerhold.net>

> ---
>  drivers/clk/ux500/u8500_of_clk.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/ux500/u8500_of_clk.c b/drivers/clk/ux500/u8500_of_clk.c
> index 72ed97c6662a..0aedd42fad52 100644
> --- a/drivers/clk/ux500/u8500_of_clk.c
> +++ b/drivers/clk/ux500/u8500_of_clk.c
> @@ -99,8 +99,10 @@ static void u8500_clk_init(struct device_node *np)
>  	if (fw_version != NULL) {
>  		switch (fw_version->project) {
>  		case PRCMU_FW_PROJECT_U8500_C2:
> +		case PRCMU_FW_PROJECT_U8500_MBL:
>  		case PRCMU_FW_PROJECT_U8520:
>  		case PRCMU_FW_PROJECT_U8420:
> +		case PRCMU_FW_PROJECT_U8420_SYSCLK:
>  			sgaclk_parent = "soc0_pll";
>  			break;
>  		default:
> -- 
> 2.21.0
> 
