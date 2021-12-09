Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF964C433EF
	for <linux-clk@archiver.kernel.org>; Thu,  9 Dec 2021 14:18:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232646AbhLIOVq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 9 Dec 2021 09:21:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232049AbhLIOVq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 9 Dec 2021 09:21:46 -0500
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99C97C061746
        for <linux-clk@vger.kernel.org>; Thu,  9 Dec 2021 06:18:12 -0800 (PST)
Received: by mail-qt1-x82d.google.com with SMTP id 8so5412475qtx.5
        for <linux-clk@vger.kernel.org>; Thu, 09 Dec 2021 06:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GWGkM9rurSb1eSEYFyRCEnmhOoHzPSD6HMJKf80oaYg=;
        b=Q+NEb8lUMRUWvd/mr5jIDet6HO2IaVk2ddCnCnm1NFIDlpaMi3NLUw21EvLbgp/XAp
         ILM02klMH6CpJXQiYtv9GXZ/gAehsY/OiYQHQdFTvcS99jIFKn27WgujyKSH4O/nkAq1
         H589pwrnxggrUaNugrDe9zfNJSYjmPhAHPXG6yF/ZYUhCNKGxRbWFR8rnUdEvu1dbx/3
         9vXrTFncksCCnIxDc3F4xxVty5zbI16N6FLmJqn0VrFIiTU57X7IFkKogQhOd5elfsdJ
         Xdl+XgRqnAP2Fr30PhXXVlQWdJf3DhZHuQHwJUlYZsyhed6YJ0Yglwsukf6Q36xDk1U+
         g50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GWGkM9rurSb1eSEYFyRCEnmhOoHzPSD6HMJKf80oaYg=;
        b=alODsffzy2QQGF0UygNX5AwJZJq+GIqb75ctDSOhbRYoRel3fzRFgJieaYAX+Z3TYW
         hQ3xPoh2TIprNcHJUMwrxaqIocZnt+xLvi1leByFAVj0TWbqwUYm5ofMq0X5wtxXjzxc
         QhnAMP4MBkfVTZ9jbztwRmd0FUvNfr8guwVVqOZOjlcH9wOAnWLYp/ELwVmi0tHmwjDj
         nUpyauxd28/BfonCkxG3xW43ldow6jT2Faa76JjtyBC0N6ZjX9E4g3lWPc5Q+PNj2F4z
         hwM3Goh8wQHArCRPTEOGlEKmIodpqmlfbymXYLR3qnM03ueqyY88CENCeFlI/q++iOld
         qFJA==
X-Gm-Message-State: AOAM530wO1NKjl0dkio3NqrUmIb8Qb6ny+qfuwhTYjIuxI/Qghdmoe82
        YwNgFBmu5HyF1CBdtAkpYwpvHbgMikRfCyJAZFP66n72GaB/zPwz7Qg=
X-Google-Smtp-Source: ABdhPJyLMtblBvaUarBKdmP7UG/UfVF1Bi1UWWytJvthVbqiX1FqHZ48k/aF/lII2J3lJfWgdbS0HQ7lZNCDLfwuOKA=
X-Received: by 2002:ac8:4e8c:: with SMTP id 12mr17673485qtp.45.1639059491769;
 Thu, 09 Dec 2021 06:18:11 -0800 (PST)
MIME-Version: 1.0
References: <20211208022210.1300773-1-dmitry.baryshkov@linaro.org>
 <20211208022210.1300773-3-dmitry.baryshkov@linaro.org> <CAG3jFyvuudxc_6Vh-24WcvgBDa0G2_uAtPYYtuBFoYosE3Ld1A@mail.gmail.com>
In-Reply-To: <CAG3jFyvuudxc_6Vh-24WcvgBDa0G2_uAtPYYtuBFoYosE3Ld1A@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 9 Dec 2021 17:18:00 +0300
Message-ID: <CAA8EJprC-jX-0otdLYJyGEnXzwpQVEcfo9jBRXhyVopxdHBMmA@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: qcom: dispcc-sdm845: park disp_cc_mdss_mdp_clk_src
To:     Robert Foss <robert.foss@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 9 Dec 2021 at 17:11, Robert Foss <robert.foss@linaro.org> wrote:
>
> On Wed, 8 Dec 2021 at 03:22, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > To stop disp_cc_mdss_mdp_clk_src from getting stuck during boot if it
> > was enabled by the bootloader, part it to the TCXO clock source.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/clk/qcom/dispcc-sdm845.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-sdm845.c
> > index 735adfefc379..f2afbba7bc72 100644
> > --- a/drivers/clk/qcom/dispcc-sdm845.c
> > +++ b/drivers/clk/qcom/dispcc-sdm845.c
> > @@ -858,6 +858,9 @@ static int disp_cc_sdm845_probe(struct platform_device *pdev)
> >
> >         clk_fabia_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
> >
> > +       /* Park disp_cc_mdss_mdp_clk_src */
> > +       clk_rcg2_park_safely(regmap, 0x2088, 0);
>
> Could the hardcoded number be replaced with
> disp_cc_mdss_mdp_clk_src.cmd_rcgr just to make this easier to read?
> Maybe the comment isn't needed with this change.

Nice idea!

>
> > +
> >         /* Enable hardware clock gating for DSI and MDP clocks */
> >         regmap_update_bits(regmap, 0x8000, 0x7f0, 0x7f0);
> >
>
> Reviewed-by: Robert Foss <robert.foss@linaro.org>



-- 
With best wishes
Dmitry
