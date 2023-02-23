Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01414C61DA4
	for <linux-clk@archiver.kernel.org>; Thu, 23 Feb 2023 02:11:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232814AbjBWCLD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Feb 2023 21:11:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232540AbjBWCLC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Feb 2023 21:11:02 -0500
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A37F836FD6
        for <linux-clk@vger.kernel.org>; Wed, 22 Feb 2023 18:11:01 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-536c02eea4dso152191847b3.4
        for <linux-clk@vger.kernel.org>; Wed, 22 Feb 2023 18:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=agmt99ERP4Lf0P7eQYv1KVKMj6iSmC6cQgnmN8jVaT8=;
        b=WZvGVnb+n+YRSIPY+/CTmrPz91UCo3sqyZ/dznec+MC+i4V9cCWSWBlKW4EgoThebN
         mW0X9hiTrUKd2Fl+aU0bKGMtGGV6/B97QZ3tL8iPlDkhLGoSVuEceCK6YWTGMVUY7IjD
         MSK4XIDFJyizrXC5JbI2ZfvodH4EuwHJIwUn2RvCpgwTqRNz7oFc3f9mtaV1wfGYP6kS
         tixxSoP9J7YsihVBzmRJ7y/pHmmjJf7LZNyqkYPoaJHLOb1Iu+lYdc5+PqJcE0Gggtdr
         JgQ/816rR88V4fv/WPmnt+dfyAICVmDoRoDxZIAQFXRZVjjfz+WJwOpjx48Eiu6H9XDT
         c2+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=agmt99ERP4Lf0P7eQYv1KVKMj6iSmC6cQgnmN8jVaT8=;
        b=waAIQo+t5L+YHWHz63Ell2hNiFKqH14TAWFmKlgDLBVn+tRdp8W9x2VXxpUOygFWm2
         F2rwjQlomct2UpXvmzNMMVkpw7Z8vOEGSeq+aRUr5uyrWmAT3fHApwQvzjbP4GrwgqCr
         jMW5ZNQhXLx2SIHI6nZOGmMVgRs/9R9oHAQuoqPqlCdVpHpePL5IEVkRWrwUHrupy4Ab
         8LwYsCHzowVFfP3A4bdUjg7UZUgj4ezm9dU7QEUNYJOtpQyimgdKbUiajZNiCxYXl5Sl
         dDOfSAr7WCLC8E6oVfEIAvFFhv1IwFhoDihf+jO/Q+LriH0Kk02d22YVpVo9iBGvpNF2
         SE8A==
X-Gm-Message-State: AO0yUKV+sQpEXWRLJpPWgUVNyn3ZGcbnx3qFSdAd+sU2gnJloHEn07UV
        Lz2tji/uKAUtj6dQ7pHrbzqL7khIin/QnNAufhcYqp+VO+ljWRIg
X-Google-Smtp-Source: AK7set9EP5ZbyAm7ORU/z9pS5I6CjY2Um0I5400dATxt8qpJFvve4/pI0e0j9SmFqqpSXv14xyD8Sh6ke7po12y3ISQ=
X-Received: by 2002:a25:f203:0:b0:9f8:119a:6f9a with SMTP id
 i3-20020a25f203000000b009f8119a6f9amr1055636ybe.10.1677118260856; Wed, 22 Feb
 2023 18:11:00 -0800 (PST)
MIME-Version: 1.0
References: <20230223013847.1218900-1-sboyd@kernel.org>
In-Reply-To: <20230223013847.1218900-1-sboyd@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 23 Feb 2023 04:10:50 +0200
Message-ID: <CAA8EJppgarZnGHEAfNwi768B_wz1jF0WEbTE2W1sWcs2nYRFPg@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: apcs-msm8986: Include bitfield.h for FIELD_PREP
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 23 Feb 2023 at 03:38, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Otherwise some configurations fail.
>
> Fixes: 027726365906 ("clk: qcom: add the driver for the MSM8996 APCS clocks")
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/clk/qcom/apcs-msm8996.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/qcom/apcs-msm8996.c b/drivers/clk/qcom/apcs-msm8996.c
> index 7ec4022c5b43..3e91e9e6da74 100644
> --- a/drivers/clk/qcom/apcs-msm8996.c
> +++ b/drivers/clk/qcom/apcs-msm8996.c
> @@ -7,6 +7,7 @@
>   */
>
>  #include <linux/bits.h>
> +#include <linux/bitfield.h>
>  #include <linux/clk-provider.h>
>  #include <linux/delay.h>
>  #include <linux/module.h>
> --
> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/
> https://git.kernel.org/pub/scm/linux/kernel/git/sboyd/spmi.git
>


-- 
With best wishes
Dmitry
