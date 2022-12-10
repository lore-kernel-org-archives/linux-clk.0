Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 026FBC4332F
	for <linux-clk@archiver.kernel.org>; Sat, 10 Dec 2022 19:11:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbiLJTLB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 10 Dec 2022 14:11:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbiLJTLA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 10 Dec 2022 14:11:00 -0500
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2D5D13FA2
        for <linux-clk@vger.kernel.org>; Sat, 10 Dec 2022 11:10:58 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-3704852322fso94059387b3.8
        for <linux-clk@vger.kernel.org>; Sat, 10 Dec 2022 11:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wMKlZ/XsQ/RdDfIxg477G91ZfmGJ9kv/1t3NaSxe8I0=;
        b=I2eH+MgR5SeGOdBzAAYEcMED5kcnPrFJUaA4zv9Id6KCJG62srQleG3RD2iSLuegkQ
         vO5RVM7A3MdadypzwTtzkx9AldJp3b6kOwOKD2oID/EirUPBporFmeyCVgMLwpaqO+MP
         sMbTaF73UHRm3Tk7xrAfZeIA5UfSYvWvXi0Wz6cCDPfdDEWCBHIRwnWJouv65wGAFcxE
         E/y2E0J+crmQP66rt5v39yDHVMqoq1lHk7cS4Ojr1FZXGqcfZTwPekUiYjzW2CIe3NV/
         XSyCw4eNY750eWFmFyPCOG0NeoQEwX7YP39yTUrgTUwKduCQWcWj6Qha6oqpfjcZ9UH7
         LVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wMKlZ/XsQ/RdDfIxg477G91ZfmGJ9kv/1t3NaSxe8I0=;
        b=BdjLT1N+kw9y2P4Ec66T2jwX7ZcsuiozLdRWjAC6lA0O08GHzNGBjGzl2aP0islgAJ
         cktPrX0913PchM92Chl9Vrz7iHfZZMtY2hCFZ/jJWl8hwTrsX0x1xwg3zsDvM/9Hz1sl
         aloaP5j7evh3+gniys9pBAeY6cu9wni9ymh+d5jlt4sFvjeX8wNJwgpmUV+f7pSk3kvv
         exPneb2ViBrWYDtOVe2S58CLeNOSnXF1mSSaXhnkSB/2EPe+h8lkBCtwoNPb/Y7CMIDK
         V2prYL+VgB1yxBivAcQwItGlap+qsBT09HlZhP1REevETNbCccvg6vvsddYFWc1Mr+oe
         YlfQ==
X-Gm-Message-State: ANoB5pkMW102dnmTs9IO9//qINlIk8r5NqRFMCCi/ttsfwECM7ea18lN
        YH1Hf/LlegEf9wWTHP3k23aS1Zhrd1O3N+Pcp06TYg==
X-Google-Smtp-Source: AA0mqf7R+gG44S3wvy6vkMr40xZSszYJhEawjax/JeCM6OoYN/7Mej+y9NKqwfFUnbAf0kJMrJhf99A16SdxVN7YGQY=
X-Received: by 2002:a81:6c52:0:b0:370:4c23:eacc with SMTP id
 h79-20020a816c52000000b003704c23eaccmr25291714ywc.127.1670699457998; Sat, 10
 Dec 2022 11:10:57 -0800 (PST)
MIME-Version: 1.0
References: <20221208143945.50279-1-dmitry.baryshkov@linaro.org> <20221209012131.0054CC433F0@smtp.kernel.org>
In-Reply-To: <20221209012131.0054CC433F0@smtp.kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 10 Dec 2022 22:10:47 +0300
Message-ID: <CAA8EJppsZAhqwOcUzWQTh-ePwVWWxpfufaRF9TASTX0LfgUuHg@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: clk-spmi-pmic-div: convert to use parent_data
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 9 Dec 2022 at 04:21, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-12-08 06:39:45)
> > diff --git a/drivers/clk/qcom/clk-spmi-pmic-div.c b/drivers/clk/qcom/clk-spmi-pmic-div.c
> > index f2cf55cee2fd..aa015c51ab4f 100644
> > --- a/drivers/clk/qcom/clk-spmi-pmic-div.c
> > +++ b/drivers/clk/qcom/clk-spmi-pmic-div.c
> > @@ -175,6 +175,10 @@ static const struct clk_ops clk_spmi_pmic_div_ops = {
> >         .round_rate = clk_spmi_pmic_div_round_rate,
> >  };
> >
> > +static const struct clk_parent_data clk_spmi_pmic_parent_data = {
> > +       .index = 0,
> > +};
>
> Why not put this on the stack? clk core should be deep copying.

Thanks, fixed in v2

-- 
With best wishes
Dmitry
