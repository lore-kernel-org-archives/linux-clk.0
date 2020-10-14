Return-Path: <SRS0=IVDQ=DW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFF48C43467
	for <linux-clk@archiver.kernel.org>; Thu, 15 Oct 2020 02:04:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 97CA322257
	for <linux-clk@archiver.kernel.org>; Thu, 15 Oct 2020 02:04:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ElM2+r+w"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727924AbgJOCEi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Oct 2020 22:04:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727172AbgJOCEi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Oct 2020 22:04:38 -0400
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com [IPv6:2607:f8b0:4864:20::a43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7895EC05BD0D
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2020 15:29:13 -0700 (PDT)
Received: by mail-vk1-xa43.google.com with SMTP id n141so149835vke.9
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2020 15:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FFNmhfthsf5pFmuohFdBe/J1wSqD3GGj/IpnA7g1A30=;
        b=ElM2+r+wNX9S0QX15/URuzFWDAgrQuroEb/3vWVNqelEtF3zeNVJX5JYXXEHfLzm8b
         1+VO0qGMtKHyuKoYmWKxcRcr38VNqOCXnxuvQ49A318FaWwdq5hv+zGSlBBIen0PvDjH
         1UKWTabxwoO4qh6CK3L1+Mxnl9lwc5CuqFAvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FFNmhfthsf5pFmuohFdBe/J1wSqD3GGj/IpnA7g1A30=;
        b=JExZZ/YfONr53mBabKSFTjAqnwAMi+nq1R8C2zG05esxdxnB84TQbKegwRCqwf5zPc
         hLNuWe1AIE+rASdlcIA4nDhQUC6xqOuvAJ4BHRpvWCfad57LZzeB4jpsu/twqRuy+CxZ
         4wrmtDU86vgU238Y/UIKj9TvlBT6Lb0C/RyQMkVo34iMJaCYsDFL9hq1EtiEMxwopGtA
         XSwAW7QS6Bz77OKcMhAK1DSWTNRHPlCl2UI9Qf58veoo7u7q6MSmSWgw1tpoAxb8/48u
         xb/AC7LfAIP2UH6Wa71LLj2VZOyI4nBPdGuKknquzjSY95rzVDEC2wzced6bQRHYdiFn
         iHCA==
X-Gm-Message-State: AOAM5323UwErKgSgH1857E43XXtmx9g7IYx/ar1TRaSWsx02RK+BcAex
        +HdS9ERtiU0qX65HRft4rTcj3s04j8eKbg==
X-Google-Smtp-Source: ABdhPJzNUjdGBGA+hs9z/s1yLmYfqHdlFzVpVcxcYiabYWPGW6X5hHgBcAcpbrAQJP4wq5zWsC2Hjg==
X-Received: by 2002:a1f:210d:: with SMTP id h13mr1043269vkh.0.1602714551987;
        Wed, 14 Oct 2020 15:29:11 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id w137sm150716vkw.11.2020.10.14.15.29.10
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2020 15:29:10 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id c7so247543uaq.4
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2020 15:29:10 -0700 (PDT)
X-Received: by 2002:a9f:31ce:: with SMTP id w14mr725901uad.104.1602714550250;
 Wed, 14 Oct 2020 15:29:10 -0700 (PDT)
MIME-Version: 1.0
References: <20201014140507.v3.1.I4567b5e7e17bbb15ef063d447cb83fd43746cb18@changeid>
 <20201014140507.v3.2.I75c409497d4dea9daefa53ec5f93824081c4ecbe@changeid> <160271345117.884498.6375969749730135625@swboyd.mtv.corp.google.com>
In-Reply-To: <160271345117.884498.6375969749730135625@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 14 Oct 2020 15:28:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UipL42FLRARc4V34bqEukaB=WQzAdr2Si2RUjPaAmE4g@mail.gmail.com>
Message-ID: <CAD=FV=UipL42FLRARc4V34bqEukaB=WQzAdr2Si2RUjPaAmE4g@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] clk: qcom: lpass-sc7180: Disentangle the two clock devices
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Taniya Das <tdas@codeaurora.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Wed, Oct 14, 2020 at 3:10 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Douglas Anderson (2020-10-14 14:05:22)
> > diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
> > index abcf36006926..48d370e2108e 100644
> > --- a/drivers/clk/qcom/lpasscorecc-sc7180.c
> > +++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
> > @@ -356,12 +356,48 @@ static const struct qcom_cc_desc lpass_audio_hm_sc7180_desc = {
> >         .num_gdscs = ARRAY_SIZE(lpass_audio_hm_sc7180_gdscs),
> >  };
> >
> > +static void lpass_pm_runtime_disable(void *data)
> > +{
> > +       pm_runtime_disable(data);
> > +}
> > +
> > +static void lapss_pm_clk_destroy(void *data)
> > +{
> > +       pm_clk_destroy(data);
> > +}
>
> Why are these helpers added again? And do we even need them? Can't we
> just pass pm_runtime_disable or pm_clk_destroy to the
> devm_add_action_or_reset() second parameter?

Unfortunately, we can't due to the C specification.  Take a look at
all the other users of devm_add_action_or_reset() and they all have
pretty much the same stupid thing.  This is a pretty great grep, for
instance:

git grep devm_add_action_or_reset.*clk_disable_unprepare

I did a quick Google search and the top hit was a stack overflow that
explained it:

https://stackoverflow.com/questions/559581/casting-a-function-pointer-to-another-type

The net-net is that the answer there says:

> Hence, since a void* is not compatible with a struct my_struct*, a
> function pointer of type void (*)(void*) is not compatible with a
> function pointer of type void (*)(struct my_struct*), so this
> casting of function pointers is technically undefined behavior.

I suppose I could try to add devm variants of these functions
somewhere more general if you think it's a good idea, though there it
seems like there's not a huge need since these two greps are zero:

git grep devm_add_action_or_reset.*runtime_disable
git grep devm_add_action_or_reset.*pm_clk_destroy

...actually, do we even need the runtime_disable in the error path?
When the dev goes away does it matter if you left pm_runtime enabled
on it?

-Doug
