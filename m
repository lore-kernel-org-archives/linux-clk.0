Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F39E9C43334
	for <linux-clk@archiver.kernel.org>; Fri, 24 Jun 2022 00:27:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbiFXA1V (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 23 Jun 2022 20:27:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiFXA1U (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Jun 2022 20:27:20 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04C4C527C7
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 17:27:20 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-fe023ab520so1637451fac.10
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 17:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=vLPxQpPVe53r4Mmfefvo8bhM2y//XoAwBTSHLhdIZPQ=;
        b=MyDz/Sjcr8o+Jg+xDYH48Fl5WxupXhtIMJBqfOTWYuOy+VhCnX/qkbZOVPjkAlNxAM
         X3Fv8LuoMcN5F6GXeFtsBxzWDMzq7ky0tYus1++h0irkP4A9d03Ft6UxH6hNzlnnR9OG
         S/L6duzsWf6bP0o731XIjZNA5h2d6TULlXpro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=vLPxQpPVe53r4Mmfefvo8bhM2y//XoAwBTSHLhdIZPQ=;
        b=G9mYZIkvzx8xfAH5bdm8I208P+LQD1u+O1GP99RBwyCSp7Fo3Td1yW6OWXiXx6fKco
         OhUkpgiAv8nETXLRr+5naxLE3VmIUEzOfswxSdP9J4svW+5DHgSPAjPKiFkTL35g9COK
         OxhRX77RLeNszawXPp3oQhZCrFSeAimMHngS85yq1X903Y0hUxbFXafZR66UpUm9T7y/
         7vlIe7c1QA86Em4hjzu9i0NxW9b2gRlTyTtrbxt+5QGlpsObyNq0oMs44XZbdJ9yhqPA
         8MIHpeTNAmUWjuL7z8+Q148B5IWsNWyUgvkYj/fCxuBGRRrvQKNtwN5AYrd6f3eX8ZOr
         2gVw==
X-Gm-Message-State: AJIora9Ljrq2Gnh02w4oLiQrBdpNnZHFl15y395tKEWOqLji6PSNcPEx
        LES7UY38pEDeHrfblq0WsQSgh2+UvCRgZky1pG1xNA==
X-Google-Smtp-Source: AGRyM1uB/dutJHNaka6kNs4qoT8rU8wUqlI3HgOkLTqitXnSC3bXULQe/NMJ3pyp4NsEokhzwdvdz6WoxIpBtRaxW1Y=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr413726oap.63.1656030439375; Thu, 23 Jun
 2022 17:27:19 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 23 Jun 2022 17:27:18 -0700
MIME-Version: 1.0
In-Reply-To: <20220620215150.1875557-1-dmitry.baryshkov@linaro.org>
References: <20220620215150.1875557-1-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 23 Jun 2022 17:27:18 -0700
Message-ID: <CAE-0n53X6mwQuoZAgC-mBP42HKqy=NuE7nJpgHGk-pYSFQpcjQ@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: gcc-ipq806x: use parent_data for the last
 remaining entry
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Ansuel Smith <ansuelsmth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dmitry Baryshkov (2022-06-20 14:51:50)
> Use parent_data for the last remaining entry (pll4). This clock is
> provided by the lcc device.
>
> Fixes: cb02866f9a74 ("clk: qcom: gcc-ipq806x: convert parent_names to parent_data")
> Cc: Ansuel Smith <ansuelsmth@gmail.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/gcc-ipq806x.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/qcom/gcc-ipq806x.c b/drivers/clk/qcom/gcc-ipq806x.c
> index 718de17a1e60..6447f3e81b55 100644
> --- a/drivers/clk/qcom/gcc-ipq806x.c
> +++ b/drivers/clk/qcom/gcc-ipq806x.c
> @@ -79,7 +79,9 @@ static struct clk_regmap pll4_vote = {
>         .enable_mask = BIT(4),
>         .hw.init = &(struct clk_init_data){
>                 .name = "pll4_vote",
> -               .parent_names = (const char *[]){ "pll4" },
> +               .parent_data = &(const struct clk_parent_data){
> +                       .fw_name = "pll4", .name = "pll4",

Is there a DT binding update?
