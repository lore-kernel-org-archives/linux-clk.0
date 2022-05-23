Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 939B3C4332F
	for <linux-clk@archiver.kernel.org>; Mon, 23 May 2022 08:58:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232254AbiEWI57 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 May 2022 04:57:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232270AbiEWI55 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 May 2022 04:57:57 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B840377EC
        for <linux-clk@vger.kernel.org>; Mon, 23 May 2022 01:57:57 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id q18so12500901pln.12
        for <linux-clk@vger.kernel.org>; Mon, 23 May 2022 01:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1pYAgnzo2YXXPjeEjGklM5QuN3QjhD47g11mzbPUw+A=;
        b=fBjrkdIIUOKdjuwYiKpU+vPbSSc1KwCxIphHwgr5tSN18GxeGK/B1O1sm4jRrjgqGb
         zUc9eJdRGVuFKDZSDNc9ggsKVO0EGEeQp6RumTd0IG+bs50/zR4FNpFOOz41CYqHW45k
         Vs7dBXerXzyeiAXBAYuPdTrwz8TGfFgc/Gf1aGCNSkSngrC9hoqdMEa4i8mlewPJpD23
         JQ1AOgwkGlGVzhVH4UeY/dGInHnHUu14JSR3lO65argT+uvy8kSwwhA7fpZeM/TaOQPt
         gNoA1Q+LjgCi8fcGPaPLEwHSPP52s4BKsns+sftSRGowefHmaNUiAJo3F1jMuI2Xrhkp
         mMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1pYAgnzo2YXXPjeEjGklM5QuN3QjhD47g11mzbPUw+A=;
        b=bLXx5trBsTd9NblP3u3S6t2UiRimixGXPCPY/uxODM8uHYuM6aT2UjhHkpHXgtqwRs
         RZsIacpLoUgK2uJ5Y6p228o3Uj6rqs6+L3upUmmDI/BRrI3wZ6Vx5TFk7Epmf+N3xHFd
         K2cAOjXH+Q0I0AdMS8Br7luujZ4FJFLVwYB9dS8nkzObnij89B8EpmMcmA7OgVeWG7Y7
         2jT96c5TELB3ZatoJA9IeMcsgYro2BEOFwX5oy3snE65Tll7bqp4H1o2bQ7cdUyaoV8P
         El3yi0EUeMeMNxXuHgTBJWIMpT38hOVIpFXLQrMGV0d21XwH26/1v5S+I2opyuS5IrQL
         G7Yg==
X-Gm-Message-State: AOAM532VagWdI5zoR5LAL1E73rh1hnFyySZVD8+9EWp7wFRfp5NJnizV
        T7Yzvv/G9QYfcShiatuIE6O5vNXgUNYZLJNjqpMPJ3PYxwk=
X-Google-Smtp-Source: ABdhPJzQjUmsY1uzuoBK7JFpJwVjDmowYMXcr16Irn5o1uHnxf27mIUaEFlfATsfhvAcR0kfZWhM2uZMHTBsUCII8CI=
X-Received: by 2002:a17:903:1c6:b0:161:9fbc:5a6 with SMTP id
 e6-20020a17090301c600b001619fbc05a6mr21913131plh.65.1653296276851; Mon, 23
 May 2022 01:57:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220519214133.1728979-1-vladimir.zapolskiy@linaro.org> <20220519214133.1728979-3-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20220519214133.1728979-3-vladimir.zapolskiy@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Mon, 23 May 2022 10:57:45 +0200
Message-ID: <CAG3jFys-BEb6AeYYef_Wqa-LvnkJjsBOT0QeGg=0ytikf_dEog@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: qcom: camcc-sm8250: Fix topology around
 titan_top power domain
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 19 May 2022 at 23:41, Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> On SM8250 two found VFE GDSC power domains shall not be operated, if
> titan top is turned off, thus the former power domains will be set as
> subdomains by a GDSC registration routine.
>
> Fixes: 5d66ca79b58c ("clk: qcom: Add camera clock controller driver for SM8250")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/clk/qcom/camcc-sm8250.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/clk/qcom/camcc-sm8250.c b/drivers/clk/qcom/camcc-sm8250.c
> index 439eaafdcc86..d68376077d51 100644
> --- a/drivers/clk/qcom/camcc-sm8250.c
> +++ b/drivers/clk/qcom/camcc-sm8250.c
> @@ -2205,6 +2205,8 @@ static struct clk_branch cam_cc_sleep_clk = {
>         },
>  };
>
> +static struct gdsc titan_top_gdsc;
> +
>  static struct gdsc bps_gdsc = {
>         .gdscr = 0x7004,
>         .pd = {
> @@ -2238,6 +2240,7 @@ static struct gdsc ife_0_gdsc = {
>                 .name = "ife_0_gdsc",
>         },
>         .flags = POLL_CFG_GDSCR,
> +       .parent = &titan_top_gdsc.pd,
>         .pwrsts = PWRSTS_OFF_ON,
>  };
>
> @@ -2247,6 +2250,7 @@ static struct gdsc ife_1_gdsc = {
>                 .name = "ife_1_gdsc",
>         },
>         .flags = POLL_CFG_GDSCR,
> +       .parent = &titan_top_gdsc.pd,
>         .pwrsts = PWRSTS_OFF_ON,
>  };
>
> --
> 2.33.0
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
