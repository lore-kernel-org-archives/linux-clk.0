Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4297EC07E9B
	for <linux-clk@archiver.kernel.org>; Fri,  9 Jul 2021 13:00:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 243E96023E
	for <linux-clk@archiver.kernel.org>; Fri,  9 Jul 2021 13:00:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231478AbhGINCn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Jul 2021 09:02:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231455AbhGINCn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Jul 2021 09:02:43 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93644C0613E7
        for <linux-clk@vger.kernel.org>; Fri,  9 Jul 2021 05:59:59 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id t19so9155870qkg.7
        for <linux-clk@vger.kernel.org>; Fri, 09 Jul 2021 05:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qHUKIAO+ag23hTE+JlEANC815kPjbkRicggysyG8Jlg=;
        b=i3JcU8eAJ1FUfNlg79X+U4p7WO3GFW7qB8FvtBD5WhofvVvu2G56A3JOA5/vdgHN6c
         zvfJGzH11cmDvGR5fGVJL4DPvmx2/a/mk9GYI28b5BrtQXpC0EDOEPpV90ZNeCLpph+b
         OgqvUPA10mCm+2bqy/hBzMKrLS3GC9J6C2NdK1Xg04LO7jLBmsZGBezYvB2dXxvsdrQh
         5ymM8/UDsXY81dWl0xecHiNrSkw8ubKlXwV6Z01SQZqIf7bMmA2kJzTMJl6rsfEJIin/
         ayKkeJzm7ZDZgs/05IUiH2yMczzGls8HjeyD3OgYdwiA7vEDSMPwpXlDBRbHggWKPit3
         BTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qHUKIAO+ag23hTE+JlEANC815kPjbkRicggysyG8Jlg=;
        b=tWXJRj3ZX4M82N5NTTqs61J/MtvkcWr3KU1eaCC9pk2a56m+9kDGjOv6ViBbSNEee4
         zdCyRSiQRlw8Xqu/S+gwc5UQUqkiuyoas3Ie9nrhFgZwBZzmGg3v4lY22xfiSopRzy8y
         +z1nubmpegu14h0HJG1zM8/2gXF8qFAH2FhccWIf7/sz3wD7CF8/EwFYnObyf/wot2SE
         LBVyct/jL6d9Q/DWkB8yVfp8XepNY65kTqIbxB5BuP+1MUntR0gfcXf3PjFa6ne4U5kd
         lbnDRMEYmTkaqw90ILWKjVr9Iqdp0bfpxbve7phahSbI/oGshNOwThWuyB/t+3Vjn3RZ
         I0Kw==
X-Gm-Message-State: AOAM533ypKp9NtFJokWCzSH8Z4Rrk8MdnFue175u+kRQSiqTvxlbqym/
        IXWrlgBSRyOhZo9S7+w50ekbrLSME+JfYmvqLQJWHw==
X-Google-Smtp-Source: ABdhPJzndnsCyyGh8jUxDgcociSvc3ryge/5xkRw/ChC+jM3JKLtHvs2x6l09me2hWKF0pHigePtxJza/9DSKC6iXGA=
X-Received: by 2002:ae9:e309:: with SMTP id v9mr13906999qkf.138.1625835598668;
 Fri, 09 Jul 2021 05:59:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210709043136.533205-1-dmitry.baryshkov@linaro.org>
 <20210709043136.533205-5-dmitry.baryshkov@linaro.org> <CAPDyKFprYK8bSk+rdnDt3xRUR9BRNdyRiBdefO+s7qzOwHf7hg@mail.gmail.com>
 <CAA8EJprrjz=o7Ymt1mNBZASzTeX==1ceRTeKA4f3QrVMcpO6xg@mail.gmail.com> <CAPDyKFoLcsYLisEiOF66dDsV+759c5k0PD64uxU11jc5VTdNYQ@mail.gmail.com>
In-Reply-To: <CAPDyKFoLcsYLisEiOF66dDsV+759c5k0PD64uxU11jc5VTdNYQ@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 9 Jul 2021 15:59:47 +0300
Message-ID: <CAA8EJpr2HEm4R+bGrH6DHA_z8bjN69Zam9UUiAeKAr5vsCKr3A@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 4/7] clk: qcom: gdsc: enable optional power
 domain support
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 9 Jul 2021 at 15:18, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Fri, 9 Jul 2021 at 13:46, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Fri, 9 Jul 2021 at 12:33, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > >
> > > On Fri, 9 Jul 2021 at 06:32, Dmitry Baryshkov
> > > <dmitry.baryshkov@linaro.org> wrote:
> > > >
> > > > On sm8250 dispcc and videocc registers are powered up by the MMCX power
> > > > domain. Currently we used a regulator to enable this domain on demand,
> > > > however this has some consequences, as genpd code is not reentrant.
> > > >
> > > > Teach Qualcomm clock controller code about setting up power domains and
> > > > using them for gdsc control.
> > > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >
> > > [...]
> > >
> > > > diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> > > > index 51ed640e527b..9401d01533c8 100644
> > > > --- a/drivers/clk/qcom/gdsc.c
> > > > +++ b/drivers/clk/qcom/gdsc.c
> > > > @@ -427,6 +427,7 @@ int gdsc_register(struct gdsc_desc *desc,
> > > >                         continue;
> > > >                 scs[i]->regmap = regmap;
> > > >                 scs[i]->rcdev = rcdev;
> > > > +               scs[i]->pd.dev.parent = desc->dev;
> > > >                 ret = gdsc_init(scs[i]);
> > > >                 if (ret)
> > > >                         return ret;
> > > > @@ -439,6 +440,8 @@ int gdsc_register(struct gdsc_desc *desc,
> > > >                         continue;
> > > >                 if (scs[i]->parent)
> > > >                         pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
> > > > +               else if (!IS_ERR_OR_NULL(dev->pm_domain))
> > >
> > > So dev_pm_domain_attach() (which calls genpd_dev_pm_attach() is being
> > > called for gdsc platform device from the platform bus', to try to
> > > attach the device to its corresponding PM domain.
> > >
> > > Looking a bit closer to genpd_dev_pm_attach(), I realize that we
> > > shouldn't really try to attach a device to its PM domain, when its OF
> > > node (dev->of_node) contains a "#power-domain-cells" specifier. This
> > > is because it indicates that the device belongs to a genpd provider
> > > itself. In this case, a "power-domains" specifier tells that it has a
> > > parent domain.
> > >
> > > I will post a patch that fixes this asap.
> >
> > I think there is nothing to fix here. The dispcc/videocc drivers
> > provide clocks in addition to the gdsc power domain. And provided
> > clocks would definitely benefit from having the dispcc device being
> > attached to the power domain which governs clock registers (MMCX in
> > our case). Thus I think it is perfectly valid to have:
> >
> > rpmhpd device:
> >  - provides MMCX domain.
> >
> > dispcc device:
> >  - is attached to the MMCX domain,
>
> We don't need this, it's redundant and weird to me.
>
> Also I am kind of worried that you will hit another new path in genpd,
> causing locking issues etc, as it has not been designed to work like
> this (a provider device and a child domain sharing the same "parent").

So, which domain should the dispcc device belong to? It's registers
are powered by the MMCX domain. I can not attach it to the child
(GDSC) domain either: in the case of videocc there are 4 child
domains.
An alternative would be to request that all users of the provided
clocks power on one of the child domains. However this is also not
perfect. If some generic code (e.g. clock framework) calls into
provided clocks (e.g. because of assigned-clock-rates), this can
happen w/o proper power domain being powered up yet.

>
> >  - provides MDSS_GDSC
>
> It's perfectly fine that dispcc acts as a genpd provider. In this
> case, the corresponding PM domain should be assigned as a child for
> the parent MMCX domain. That should make this work, I think.
>
> >  - provides clocks
>
> That sounds reasonable as well.
>
> >
> > >
> > > > +                       pm_genpd_add_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
> > > >         }
> > > >
> > > >         return of_genpd_add_provider_onecell(dev->of_node, data);
> > > > @@ -457,6 +460,8 @@ void gdsc_unregister(struct gdsc_desc *desc)
> > > >                         continue;
> > > >                 if (scs[i]->parent)
> > > >                         pm_genpd_remove_subdomain(scs[i]->parent, &scs[i]->pd);
> > > > +               else if (!IS_ERR_OR_NULL(dev->pm_domain))
> > >
> > > Ditto.
> > >
> > > > +                       pm_genpd_remove_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
> > > >         }
> > > >         of_genpd_del_provider(dev->of_node);
> > > >  }
> > > > --
> > > > 2.30.2
> > > >
> > >
>
> Kind regards
> Uffe



-- 
With best wishes
Dmitry
