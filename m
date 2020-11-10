Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA3CAC5517A
	for <linux-clk@archiver.kernel.org>; Tue, 10 Nov 2020 17:07:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8151D20781
	for <linux-clk@archiver.kernel.org>; Tue, 10 Nov 2020 17:07:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20150623.gappssmtp.com header.i=@monstr-eu.20150623.gappssmtp.com header.b="TdNHMW55"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730672AbgKJRH5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 Nov 2020 12:07:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726344AbgKJRH5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 10 Nov 2020 12:07:57 -0500
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16465C0613CF
        for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2020 09:07:55 -0800 (PST)
Received: by mail-ed1-x541.google.com with SMTP id cq7so13332289edb.4
        for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2020 09:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2DzsxEVUbZIb01puXVW/bT3rEmRoPOpSkxNXqK+jRRY=;
        b=TdNHMW555gDky6SjR0G58meQPRqlxg1JQ1rt3295aYJO+Gw/LpbN9GuUZx2QGDlqgl
         wz6Rhyx27WSTiqj91khzN/mLXv6gmBf0zphzCz7zkGjlrH39CZgxSIDkjyM8lT/azwTD
         pmmWwb+s1/hS+nP/tuS/FZPkpejRpOuWcADgBInMAW5i2VZz1pOtzh2g3vh1Jx73TZmA
         x60uaS8hwcFowq045Tp5lc7vfqM14UEckO88ky0ZzmlBEHgvNJYszLYQY/N7vR2Z68ka
         yxM6Y9hO94JTwUpst08taegwSdDWDe+p/7A7hVQjTvPo8MboFNYwgHpvCg4bVUycy7DJ
         ut7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2DzsxEVUbZIb01puXVW/bT3rEmRoPOpSkxNXqK+jRRY=;
        b=YIN/ocpZ1j0tYA3P/YCN0BFWQ9lRiPiCN1bL+aDh6Z3CHkYH4nuzEYZKh4YiBO2h1y
         otmyTMOkSKa+nwKSuKmMbFGMaTJX8kFGPjYAeYqsY3d7m+1lGbv9WSKIvh1uTP9MKkYY
         jTXcbWd7pEdoSV9vwbXzRIvCwFOwVZ06INXydlqfiWqd9fqKtlgi7OJUm1mQBnxtd6yi
         Ln9aadSQCi6MKUeKnZHnuhxZAwPSmDg4hr61ntLYu8oMH2q5IJGLp/Xt5SMCvCeRlL7U
         nSu6t1CWEcBHrX3+oive0Xb/oMWbcfkRjMiD6Driz5hCR/7aXuqrgD/sJTozJhOVlHsb
         3/0w==
X-Gm-Message-State: AOAM5324+Xjxts0cpROKRTZmseOsOfyEg04gd6N0ek+bBMPt5N6gBYNS
        cdqNHQvc7Qb5nAuJaFA9YTMO1w==
X-Google-Smtp-Source: ABdhPJylWuiruvazVv99WQxmOkSKdiwJnj6Rtz31tRZOOPYXcUNuCp2KZ0oGRI2yXj5u69At4sCxYg==
X-Received: by 2002:a50:e183:: with SMTP id k3mr306629edl.111.1605028073766;
        Tue, 10 Nov 2020 09:07:53 -0800 (PST)
Received: from [192.168.0.105] (nat-35.starnet.cz. [178.255.168.35])
        by smtp.gmail.com with ESMTPSA id d2sm5318702ejr.31.2020.11.10.09.07.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2020 09:07:52 -0800 (PST)
Subject: Re: [PATCH resend v2] microblaze: Replace <linux/clk-provider.h> by
 <linux/of_clk.h>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>
References: <20201110154851.3285695-1-geert+renesas@glider.be>
From:   Michal Simek <monstr@monstr.eu>
Message-ID: <dc5ce0ab-289d-7fa4-97f5-ced102afbfbf@monstr.eu>
Date:   Tue, 10 Nov 2020 18:07:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201110154851.3285695-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 10. 11. 20 16:48, Geert Uytterhoeven wrote:
> The MicroBlaze platform code is not a clock provider, and just needs to
> call of_clk_init().
> 
> Hence it can include <linux/of_clk.h> instead of <linux/clk-provider.h>.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> ---
> v2:
>   - Add Reviewed-by.
> ---
>  arch/microblaze/kernel/setup.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/microblaze/kernel/setup.c b/arch/microblaze/kernel/setup.c
> index 333b09658ca89105..7fcf5279ad15f61f 100644
> --- a/arch/microblaze/kernel/setup.c
> +++ b/arch/microblaze/kernel/setup.c
> @@ -9,7 +9,7 @@
>   */
>  
>  #include <linux/init.h>
> -#include <linux/clk-provider.h>
> +#include <linux/of_clk.h>
>  #include <linux/clocksource.h>
>  #include <linux/string.h>
>  #include <linux/seq_file.h>
> 

Applied.

M

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

