Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37FA2C77B75
	for <linux-clk@archiver.kernel.org>; Fri, 21 Apr 2023 13:43:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231285AbjDUNnM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 21 Apr 2023 09:43:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232555AbjDUNmx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 Apr 2023 09:42:53 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E555212CB9
        for <linux-clk@vger.kernel.org>; Fri, 21 Apr 2023 06:42:18 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-b991e510fbcso1044936276.1
        for <linux-clk@vger.kernel.org>; Fri, 21 Apr 2023 06:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682084537; x=1684676537;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JDE51zksfO+2BQYs2uxEkBWwzXHikJbqw2bzLyRXwaw=;
        b=wpGNGkwCP6qhmDCTaIgu67XqT1Ne8yFuulkw6+VKZDDLlhH/MTjSIyQhwRY9T3goum
         /oR12owOzVb3UpnwFxZxcN6a8zQ57W5RXkREo7mqJo2O/xt0DWcorbVH2pUIYtA76px9
         MJ44uNf6YWHiQryP15EFD2/29KE3jBLjb1a6n9yYiXiXKvRuWnbCyr74FbU0LQZd92zJ
         9izLLhcDEVT0XSH8RnybC46qTo2qKlBCPVJ+w68b6UVqdMsJx5r7MOoNrDgojopmlk9g
         yAAFncbSjRK5C6++USLE/ehJIAyQSwOBAC+79NgJRZgTXLvVhreT61b8LFqvicp1uKbQ
         PDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682084537; x=1684676537;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JDE51zksfO+2BQYs2uxEkBWwzXHikJbqw2bzLyRXwaw=;
        b=j7VkTfyNOYZtwnkg9gxEFVcA88wqsIW29vaWMk8HTzqYKV0osRU2ihclKwb7shxj8h
         g4CBrwLJXkZwOuefshdkIsg9vk+cnMMjZB/X4jIiTeIsUh/w5LGsl0eZlChiVYLUhUBl
         OTJecWA9JAv+kTfFi+c+F0b08I6XWvBbkEtlmxRZE8vS02P165IYjkggXhX+zBi2qpCI
         s2cz6yf5kJHHXzCGpLxOf6LA7AFGTYMjaRon4iRa30u0iaR8Z9LwasEqHizYibW8OtS3
         Ns1+39mNODJoBEd3ZfOwDigUkBanyqU2JcyZPKp1aKKY+5R2tX+kdNRBNydxm3AwFp2O
         qpKA==
X-Gm-Message-State: AAQBX9fveJIgJ+1+Ik/oGUg/4YG6A2zBIlNJknN5Es07zPEAzLeDF9Dw
        mkQHaK+W29qMY3DEjrTw+Xz7yvl0AA5ZFiUUhK/3YA==
X-Google-Smtp-Source: AKy350a5SILKYcpime34mpGOMEVeRMBKWl75iNX3Pwr4E7FN7GNe+ZdrX2VuLz9ewSKOn6gkqrDRwwfejYqjRpydKAY=
X-Received: by 2002:a25:bc8:0:b0:b92:510a:7320 with SMTP id
 191-20020a250bc8000000b00b92510a7320mr2321396ybl.42.1682084537629; Fri, 21
 Apr 2023 06:42:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230420115520.16472-1-quic_tdas@quicinc.com>
In-Reply-To: <20230420115520.16472-1-quic_tdas@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 21 Apr 2023 16:42:06 +0300
Message-ID: <CAA8EJprthTKxCDsMHTXZrLCyhGgTfF3LvqhkrF2-b6XFygKJ2A@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: camcc-sc7180: Add parent dependency to all
 camera GDSCs
To:     Taniya Das <quic_tdas@quicinc.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_skakitap@quicinc.com, quic_cponnapa@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 20 Apr 2023 at 14:55, Taniya Das <quic_tdas@quicinc.com> wrote:
>
> Mark titan_top_gdsc as parent to all other camera GDSCs.

Please expand the commit message. Your text describes what the patch
does, but it can be observed from the patch itself. Please describe
why it is done.

>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/camcc-sc7180.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/clk/qcom/camcc-sc7180.c b/drivers/clk/qcom/camcc-sc7180.c
> index e2b4804695f3..8a4ba7a19ed1 100644
> --- a/drivers/clk/qcom/camcc-sc7180.c
> +++ b/drivers/clk/qcom/camcc-sc7180.c
> @@ -1480,12 +1480,21 @@ static struct clk_branch cam_cc_sys_tmr_clk = {
>         },
>  };
>
> +static struct gdsc titan_top_gdsc = {
> +       .gdscr = 0xb134,
> +       .pd = {
> +               .name = "titan_top_gdsc",
> +       },
> +       .pwrsts = PWRSTS_OFF_ON,
> +};
> +
>  static struct gdsc bps_gdsc = {
>         .gdscr = 0x6004,
>         .pd = {
>                 .name = "bps_gdsc",
>         },
>         .pwrsts = PWRSTS_OFF_ON,
> +       .parent = &titan_top_gdsc.pd,
>         .flags = HW_CTRL,
>  };
>
> @@ -1495,6 +1504,7 @@ static struct gdsc ife_0_gdsc = {
>                 .name = "ife_0_gdsc",
>         },
>         .pwrsts = PWRSTS_OFF_ON,
> +       .parent = &titan_top_gdsc.pd,
>  };
>
>  static struct gdsc ife_1_gdsc = {
> @@ -1503,6 +1513,7 @@ static struct gdsc ife_1_gdsc = {
>                 .name = "ife_1_gdsc",
>         },
>         .pwrsts = PWRSTS_OFF_ON,
> +       .parent = &titan_top_gdsc.pd,
>  };
>
>  static struct gdsc ipe_0_gdsc = {
> @@ -1512,15 +1523,9 @@ static struct gdsc ipe_0_gdsc = {
>         },
>         .pwrsts = PWRSTS_OFF_ON,
>         .flags = HW_CTRL,
> +       .parent = &titan_top_gdsc.pd,
>  };
>
> -static struct gdsc titan_top_gdsc = {
> -       .gdscr = 0xb134,
> -       .pd = {
> -               .name = "titan_top_gdsc",
> -       },
> -       .pwrsts = PWRSTS_OFF_ON,
> -};
>
>  static struct clk_hw *cam_cc_sc7180_hws[] = {
>         [CAM_CC_PLL2_OUT_EARLY] = &cam_cc_pll2_out_early.hw,
> --
> 2.17.1
>


-- 
With best wishes
Dmitry
