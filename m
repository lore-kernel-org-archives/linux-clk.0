Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75238C433ED
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 01:33:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 31FF160241
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 01:33:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234335AbhDBBdL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Apr 2021 21:33:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234352AbhDBBdI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Apr 2021 21:33:08 -0400
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDFB8C061788
        for <linux-clk@vger.kernel.org>; Thu,  1 Apr 2021 18:33:07 -0700 (PDT)
Received: by mail-qv1-xf2a.google.com with SMTP id x16so1948005qvk.3
        for <linux-clk@vger.kernel.org>; Thu, 01 Apr 2021 18:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rmXvhNS1+k323Z8LSQfd1I6F5jgkUSmL4z9mFbMJoIY=;
        b=I/yfNAl6CtevwhHcv0+2/PMR9YurFE4VdSxzuYrNmg7OlwG3b2Oe3Y3brGd6i+ELae
         5AaswauxpJFKPxosVmCt1cuc3TErmeD3/PVap8thC0eFyggPSSNqw89Ck+mHyAWSTe2+
         OKCtY7F9KQabXhwbx/c6zO8LC5/JA/PAsAvIugVPOTpZT+xadCNkijlDhPBLA1CWuJWE
         I5JMFkFavvr5zPb2N+w6jtPjk0Mmy+2YKGZyryCOqGVwXrgy9d16Vy75HcD9BceRUnSr
         4JrZg2DrPZZU/zgqm26zPO1X9LVTfvj0WLsKozernJEh6uMh0O0aF46ceF41LXVYVi9/
         RoBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rmXvhNS1+k323Z8LSQfd1I6F5jgkUSmL4z9mFbMJoIY=;
        b=QDv97K5v+Gx4goOCLfHL+51y4dMz9NP9O+WsH13Rc5Fsveu4KAuntrp5zxPxjwKN1c
         xtLmVZT08Q+ycjueSf2kX+WLsSq7MP0Mq6kchcGdgbCMQTgyx6cOtrboBhTj9L/9iAgj
         gGyJ0m+64fEuJblct6ebQednhmr02h5Mfidwoydft7m+CgK9OuXnxVY/2u4cxmW03E2R
         fPpgB0GR93qYAMcMbN9OvzXqdfj2ip3dbyv+ttP8yc3udFgsCl1TL4wcywxU56PBggt8
         yGreU9a/hYdnOOcKkSJnKnkdWJUa/+mQR5eqEbAA03QLIJ+ojsp5qFsREZZtXgpFsiJf
         Hirg==
X-Gm-Message-State: AOAM5338lpC0rY1W7S4+kWbjK+rKMeQ6rklfZ1j7YuJ2ykbNxuQyTbNs
        YGt7rzyMK2utnRcqBlmIAF3moyfBob852xvMTqjm1A==
X-Google-Smtp-Source: ABdhPJxPlxM1dj9OM9yqlSH9CS7Z0w+siAIis+SuuU3q5Y2Vd9+fA9cI4yyOEQsn8S7nlSuNEtROCjaNGSJFBLa2TVQ=
X-Received: by 2002:ad4:4e23:: with SMTP id dm3mr11015107qvb.4.1617327187201;
 Thu, 01 Apr 2021 18:33:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
 <20210325111144.2852594-14-dmitry.baryshkov@linaro.org> <21bc5248-57b8-243d-300f-1bc39162c37f@codeaurora.org>
In-Reply-To: <21bc5248-57b8-243d-300f-1bc39162c37f@codeaurora.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 2 Apr 2021 04:32:56 +0300
Message-ID: <CAA8EJppZvGs8SO5=ooL+pOHc9xopCXmmxHq8zNdLN5RVdgNCxQ@mail.gmail.com>
Subject: Re: [PATCH v1 13/15] clk: qcom: videocc-sdm845: remove unsupported
 clock sources
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Taniya,

On Fri, 2 Apr 2021 at 04:23, Taniya Das <tdas@codeaurora.org> wrote:
>
> Hi Dmitry,
>
> On 3/25/2021 4:41 PM, Dmitry Baryshkov wrote:
> > video_pll0_out_even/_odd are not supported neither in the upstream nor
> > in the downstream kernels, so drop those clock sources.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/clk/qcom/videocc-sdm845.c | 8 +-------
> >   1 file changed, 1 insertion(+), 7 deletions(-)
> >
> > diff --git a/drivers/clk/qcom/videocc-sdm845.c b/drivers/clk/qcom/videocc-sdm845.c
> > index 5d6a7724a194..7153f044504f 100644
> > --- a/drivers/clk/qcom/videocc-sdm845.c
> > +++ b/drivers/clk/qcom/videocc-sdm845.c
> > @@ -21,24 +21,18 @@
> >   enum {
> >       P_BI_TCXO,
> >       P_CORE_BI_PLL_TEST_SE,
> > -     P_VIDEO_PLL0_OUT_EVEN,
> >       P_VIDEO_PLL0_OUT_MAIN,
> > -     P_VIDEO_PLL0_OUT_ODD,
> >   };
> >
> >   static const struct parent_map video_cc_parent_map_0[] = {
> >       { P_BI_TCXO, 0 },
> >       { P_VIDEO_PLL0_OUT_MAIN, 1 },
> > -     { P_VIDEO_PLL0_OUT_EVEN, 2 },
> > -     { P_VIDEO_PLL0_OUT_ODD, 3 },
>
> These are supported from the design, please do not remove them. It is
> just that in SW currently it is not being used.
> But SW can decide to use them as they want. As said earlier these are
> defined in the HW plans and thus do not want them to be updated manually
> to create a mismatch.

I see your point here. I'll drop these patches and refresh the
parent_data conversion patches.

>
> >       { P_CORE_BI_PLL_TEST_SE, 4 },
> >   };
> >
> >   static const char * const video_cc_parent_names_0[] = {
> >       "bi_tcxo",
> >       "video_pll0",
> > -     "video_pll0_out_even",
> > -     "video_pll0_out_odd",
> >       "core_bi_pll_test_se",
> >   };
> >
> > @@ -79,7 +73,7 @@ static struct clk_rcg2 video_cc_venus_clk_src = {
> >       .clkr.hw.init = &(struct clk_init_data){
> >               .name = "video_cc_venus_clk_src",
> >               .parent_names = video_cc_parent_names_0,
> > -             .num_parents = 5,
> > +             .num_parents = 3,
> >               .flags = CLK_SET_RATE_PARENT,
> >               .ops = &clk_rcg2_shared_ops,
> >       },
> >
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation.
>
> --



-- 
With best wishes
Dmitry
