Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C085C48BDF
	for <linux-clk@archiver.kernel.org>; Thu, 10 Jun 2021 14:30:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4886E610A5
	for <linux-clk@archiver.kernel.org>; Thu, 10 Jun 2021 14:30:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231445AbhFJOcL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 10 Jun 2021 10:32:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231454AbhFJOcK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 10 Jun 2021 10:32:10 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBA35C061760
        for <linux-clk@vger.kernel.org>; Thu, 10 Jun 2021 07:30:00 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id go18-20020a17090b03d2b029016e4ae973f7so2846268pjb.0
        for <linux-clk@vger.kernel.org>; Thu, 10 Jun 2021 07:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WAIw/Rwu5BfzassT+alfD6qJ0zIc5FQswOka0Hsn+Pg=;
        b=oAab248luw/C5YmYfz26rJUXz6+AudYZgoU4tBw4OAkwGUfZbTYC0PCUQCvmemil9s
         SlKYgcXVFiXYGxbNuzDLPru/ac9L6ZlviSO6mQabLWTjDL5A2dZJnFqX83Ic1IMOVO2y
         5jK8L4OUBY90qde3m7NOkr6VihMxRANPf6sxHPM8b9mqI8GGVuxGEFf2gQjb07+XVOoO
         kdZC/amW8Ed49gMS24E1zjDmVIEOndDu6q6NhgoR1+frgiU3oaRXKGcGt2/jP4SmCveU
         X2XFTbWIFYh22WkwMlwR8UDGQvnHXmq66ukf0tskFtuJZZsKjckl25ggCr+Dha4NUwhr
         t3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WAIw/Rwu5BfzassT+alfD6qJ0zIc5FQswOka0Hsn+Pg=;
        b=Qa9sV4WdluCK2EqoGgEaZsmr0ecxv05NUZIjTGYDRG9wlxqgiwhNk8VZfHGS04EkUh
         1G1RNvdPMnrLMUfgfIzi+5yd4DxAqMaoL5X+Qh4RYbDY2Fxe+nxgUSNHUPHT4+OW9a10
         o1NyeuaB8OZ5XOWVGm2GN6NzbBAua8Tq35K/s+fgyrGtdjRFSVHOyUEOMEdEsH+PC84e
         RUPH78s/zTT6OVb4KIb9vKjiTOnUq7X9GL7MKt7lg0eoqWL76YmTN82piiKJqpe7IZrg
         DLC54piRkjRo7qDtDUl5rYzZ/SUJyfH5VlK0lC1P9Mz62LZb4RFzbqq5UZ5pY5G/lLmn
         2rPg==
X-Gm-Message-State: AOAM531o7LygpupfMNk8dVankD+GDXBdd6VVsOzQgBozOd2OSh4FFxvc
        aaA1dOf3q/2Uq4m4217TZTZr
X-Google-Smtp-Source: ABdhPJy5V2yMkuXeobYWfKg0xU3WwZDRykGMwSqfzVQPY47TpPPxpWkpgmeMmwq2ZBIT2d+aMmc9Zg==
X-Received: by 2002:a17:90a:80c5:: with SMTP id k5mr3697723pjw.129.1623335400290;
        Thu, 10 Jun 2021 07:30:00 -0700 (PDT)
Received: from thinkpad ([2409:4072:6d9e:80ad:d341:9a16:2c5c:2249])
        by smtp.gmail.com with ESMTPSA id o3sm2715814pfd.41.2021.06.10.07.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 07:29:59 -0700 (PDT)
Date:   Thu, 10 Jun 2021 19:59:53 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Edgar Bernardi Righi <edgar.righi@lsitec.org.br>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/6] clk: actions: Fix SD clocks factor table on Owl
 S500 SoC
Message-ID: <20210610142953.GA315240@thinkpad>
References: <cover.1622119892.git.cristian.ciocaltea@gmail.com>
 <ca94fddbb790d2c4de25213c65e306f497e119e7.1622119892.git.cristian.ciocaltea@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca94fddbb790d2c4de25213c65e306f497e119e7.1622119892.git.cristian.ciocaltea@gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, May 27, 2021 at 04:16:40PM +0300, Cristian Ciocaltea wrote:
> Drop the unsupported entries in the factor table used for the SD[0-2]
> clocks definitions on the Actions Semi Owl S500 SoC.
> 
> Fixes: ed6b4795ece4 ("clk: actions: Add clock driver for S500 SoC")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
> Changes in v2:
>  - Re-added entry "{ 24, 1, 25 }" to sd_factor_table, according to the
>    datasheet (V1.8+), this is a valid divider
> 
>  drivers/clk/actions/owl-s500.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/actions/owl-s500.c b/drivers/clk/actions/owl-s500.c
> index 75b7186185b0..42abdf964044 100644
> --- a/drivers/clk/actions/owl-s500.c
> +++ b/drivers/clk/actions/owl-s500.c
> @@ -127,8 +127,7 @@ static struct clk_factor_table sd_factor_table[] = {
>  	{ 12, 1, 13 }, { 13, 1, 14 }, { 14, 1, 15 }, { 15, 1, 16 },
>  	{ 16, 1, 17 }, { 17, 1, 18 }, { 18, 1, 19 }, { 19, 1, 20 },
>  	{ 20, 1, 21 }, { 21, 1, 22 }, { 22, 1, 23 }, { 23, 1, 24 },
> -	{ 24, 1, 25 }, { 25, 1, 26 }, { 26, 1, 27 }, { 27, 1, 28 },
> -	{ 28, 1, 29 }, { 29, 1, 30 }, { 30, 1, 31 }, { 31, 1, 32 },
> +	{ 24, 1, 25 },
>  
>  	/* bit8: /128 */
>  	{ 256, 1, 1 * 128 }, { 257, 1, 2 * 128 }, { 258, 1, 3 * 128 }, { 259, 1, 4 * 128 },
> @@ -137,8 +136,7 @@ static struct clk_factor_table sd_factor_table[] = {
>  	{ 268, 1, 13 * 128 }, { 269, 1, 14 * 128 }, { 270, 1, 15 * 128 }, { 271, 1, 16 * 128 },
>  	{ 272, 1, 17 * 128 }, { 273, 1, 18 * 128 }, { 274, 1, 19 * 128 }, { 275, 1, 20 * 128 },
>  	{ 276, 1, 21 * 128 }, { 277, 1, 22 * 128 }, { 278, 1, 23 * 128 }, { 279, 1, 24 * 128 },
> -	{ 280, 1, 25 * 128 }, { 281, 1, 26 * 128 }, { 282, 1, 27 * 128 }, { 283, 1, 28 * 128 },
> -	{ 284, 1, 29 * 128 }, { 285, 1, 30 * 128 }, { 286, 1, 31 * 128 }, { 287, 1, 32 * 128 },
> +	{ 280, 1, 25 * 128 },
>  	{ 0, 0, 0 },
>  };
>  
> -- 
> 2.31.1
> 
