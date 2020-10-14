Return-Path: <SRS0=IVDQ=DW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 035AFC43457
	for <linux-clk@archiver.kernel.org>; Thu, 15 Oct 2020 01:34:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A0BF822257
	for <linux-clk@archiver.kernel.org>; Thu, 15 Oct 2020 01:34:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="O8Vspp7C"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732287AbgJOBeh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Oct 2020 21:34:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728750AbgJOBeh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Oct 2020 21:34:37 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FE9FC05112B
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2020 16:08:07 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id v23so404626vsp.6
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2020 16:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NY8uHKKpja9Uac1xehW411eyYV4U0oSKh6doZcj/Pf4=;
        b=O8Vspp7ChzMcAAxZoKhsRbZSqDQruKcZgoXKzDouzA9zAbLJ48ZPbzUNS6moMSAi1f
         RcATXgQRYZjLe+VADRc1BvaJ4rXXzOzHLJzHNJIk9SVTTd2KYp0r/c28iBZuU45zy0sn
         GRaJn9sIPrVWQ1deTzEpCRjVaC8qvtrBtMgQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NY8uHKKpja9Uac1xehW411eyYV4U0oSKh6doZcj/Pf4=;
        b=auQqbhPa8zDRLDmQ7mCOBQiMVjZy/TW4cDRKOKMaTBaI6G17qqC/MgysXAzjeyaw1T
         rH5SW1MQO75Y+hT1zq9L4C/myFoZfElGeEBiASxkoL8O5VCCSAXRx9RcgVBu/hp8lj9+
         y2MQuZtjonpyzQcuyx08TWEE7cGa/+Q/t0r6IAzKyEDj+il9A1Sk37IaUJ78eUSwnSvK
         anttLOcVA9jFIpcfq9tzmPx8saMTsfb+uymYXGRmAmJrRH8zgHCaI6nLMGoTaL1nSC/g
         9ALWoxyvnh5LNEwuP7ATLaS8qMGD+kiTB4L1B47eDoSvmmbjvexAZvSHp5rBf7JJa3If
         BHZA==
X-Gm-Message-State: AOAM531TkXBjEnq6FqextYz8W1S3EZCpNfj0BcRjQR+ZdLO3HDchEQXt
        HpamqgcplCAy/j8sbzO3Mq48/cc6YNZbAw==
X-Google-Smtp-Source: ABdhPJxndwvIWUvg7rqLkE+bsqVcwOef4bFFbohD3rnpa+E35Uo7qbYjG9fqEhOd7lQ4Y4lo2egpng==
X-Received: by 2002:a67:d090:: with SMTP id s16mr1061044vsi.0.1602716885749;
        Wed, 14 Oct 2020 16:08:05 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id z1sm161787vkf.41.2020.10.14.16.08.04
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2020 16:08:04 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id f15so266169uaq.9
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2020 16:08:04 -0700 (PDT)
X-Received: by 2002:ab0:4923:: with SMTP id z32mr699751uac.121.1602716884104;
 Wed, 14 Oct 2020 16:08:04 -0700 (PDT)
MIME-Version: 1.0
References: <20201014140507.v3.1.I4567b5e7e17bbb15ef063d447cb83fd43746cb18@changeid>
 <20201014140507.v3.2.I75c409497d4dea9daefa53ec5f93824081c4ecbe@changeid>
 <160271345117.884498.6375969749730135625@swboyd.mtv.corp.google.com>
 <CAD=FV=UipL42FLRARc4V34bqEukaB=WQzAdr2Si2RUjPaAmE4g@mail.gmail.com> <160271644762.884498.446447786516269652@swboyd.mtv.corp.google.com>
In-Reply-To: <160271644762.884498.446447786516269652@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 14 Oct 2020 16:07:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VTEQMqnmC_OMtADTdrs+2zxCd8ODSRpxtxP6SKBnx2qg@mail.gmail.com>
Message-ID: <CAD=FV=VTEQMqnmC_OMtADTdrs+2zxCd8ODSRpxtxP6SKBnx2qg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] clk: qcom: lpass-sc7180: Disentangle the two clock devices
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Taniya Das <tdas@codeaurora.org>,
        "ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
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

On Wed, Oct 14, 2020 at 4:00 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Doug Anderson (2020-10-14 15:28:58)
> > Hi,
> >
> > On Wed, Oct 14, 2020 at 3:10 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > >
> > > Quoting Douglas Anderson (2020-10-14 14:05:22)
> > > > diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
> > > > index abcf36006926..48d370e2108e 100644
> > > > --- a/drivers/clk/qcom/lpasscorecc-sc7180.c
> > > > +++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
> > > > @@ -356,12 +356,48 @@ static const struct qcom_cc_desc lpass_audio_hm_sc7180_desc = {
> > > >         .num_gdscs = ARRAY_SIZE(lpass_audio_hm_sc7180_gdscs),
> > > >  };
> > > >
> > > > +static void lpass_pm_runtime_disable(void *data)
> > > > +{
> > > > +       pm_runtime_disable(data);
> > > > +}
> > > > +
> > > > +static void lapss_pm_clk_destroy(void *data)
> > > > +{
> > > > +       pm_clk_destroy(data);
> > > > +}
> > >
> > > Why are these helpers added again? And do we even need them? Can't we
> > > just pass pm_runtime_disable or pm_clk_destroy to the
> > > devm_add_action_or_reset() second parameter?
> >
> > Unfortunately, we can't due to the C specification.  Take a look at
> > all the other users of devm_add_action_or_reset() and they all have
> > pretty much the same stupid thing.
>
> Ok, but we don't need two of the same functions, right?

How would you write it more cleanly?  I suppose I could allocate an
extra structure somewhere and put in a tuple of (function_pointer,
dev_pointer) there and pass that as the data.  Then I could do:

  struct fp_dp_tuple {
    void (*fn)(void *);
    struct device *dev;
  };

  struct fp_dp_tuple *tuple = data;
  tuple->fn(tuple->dev);

...but now I've got to create that tuple and stash it somewhere,
right?  ...or am I missing some super easy/obvious solution for how I
can know whether to call pm_runtime_disable() or pm_clk_destroy()?


> > ...actually, do we even need the runtime_disable in the error path?
> > When the dev goes away does it matter if you left pm_runtime enabled
> > on it?
> >
>
> I don't know. The device isn't destroyed but maybe when the driver is
> unbound it resets the runtime PM counters?

Certainly it seems safest just to do it...

-Doug
