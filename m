Return-Path: <SRS0=IVDQ=DW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE5DC433DF
	for <linux-clk@archiver.kernel.org>; Thu, 15 Oct 2020 01:29:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B23522257
	for <linux-clk@archiver.kernel.org>; Thu, 15 Oct 2020 01:29:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kDj1thWf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388164AbgJOB3x (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Oct 2020 21:29:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732271AbgJOB3j (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Oct 2020 21:29:39 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18136C002162
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2020 17:11:06 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id u7so453138vsq.11
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2020 17:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vuT8pXckD4G5mqRoDaNZXfyEuBjKdvi4YHo538crQqA=;
        b=kDj1thWfBp9ND5fsIRzzlQxx3hC0LGm7cEqbBEnwd+XGDqir5G+X1UucDnUoE80iky
         Qqdu7RThHoo/lxJctjAGvQYixQMIk5qX6xV/XsPyg8LG/Ttk8lPGRAC/L1YHDHF4QNX6
         ljvgAoqkK/ciKTKi0NaX4YCwned85FNcuxZzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vuT8pXckD4G5mqRoDaNZXfyEuBjKdvi4YHo538crQqA=;
        b=skZSxC/ji1MOAR99fEDd1w/qKksMBugBdqzHM5JHIZtovzH+eMaqEa+qvWCLpES2b9
         2QJDg4oetUh0U7rPNgu0qjy70M0qMh4dDmcwbiyDEhTDkGh7GEJDDUgKTxERtCHOulwD
         clijhpsbp8ENUpLO5Pny4jhi8sRmCG685cCZE8Ns54pvYGFqyserKmL6CO6as46xjpIV
         eSWHkzsjnoWoFndO3+lW/lFXf0L3TJsIrch068Vvi/FcXlTD/ffohbtyTT8xBCmc8eNH
         PuIF+o+MA9IdD6GuvRXVOFG4mCLXcXknMEjspL5BNBO3HQkXNFoQmsO8TZJNS3mILw+q
         2/lg==
X-Gm-Message-State: AOAM530a6Fz5Z00R9zK+iQN0R2GCBANiGSHc+5m1kv3qZs3KOe2JqAd3
        TmdYdka+4wo3/9geDqbAEepN8yY1deHdtA==
X-Google-Smtp-Source: ABdhPJyHtZpBfM71HBWESZ7sYN0rS3y0EhI2HbgvNAIrs5U4rcLx+J3k2Il9n/RVY7Qg5rMNJHaW9Q==
X-Received: by 2002:a67:8b45:: with SMTP id n66mr1043653vsd.45.1602720665123;
        Wed, 14 Oct 2020 17:11:05 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id y5sm158283uay.0.2020.10.14.17.11.04
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2020 17:11:04 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id r21so299577uaw.10
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2020 17:11:04 -0700 (PDT)
X-Received: by 2002:a9f:31ce:: with SMTP id w14mr875001uad.104.1602720663718;
 Wed, 14 Oct 2020 17:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20201014140507.v3.1.I4567b5e7e17bbb15ef063d447cb83fd43746cb18@changeid>
 <20201014140507.v3.2.I75c409497d4dea9daefa53ec5f93824081c4ecbe@changeid>
 <160271345117.884498.6375969749730135625@swboyd.mtv.corp.google.com>
 <CAD=FV=UipL42FLRARc4V34bqEukaB=WQzAdr2Si2RUjPaAmE4g@mail.gmail.com>
 <160271644762.884498.446447786516269652@swboyd.mtv.corp.google.com>
 <CAD=FV=VTEQMqnmC_OMtADTdrs+2zxCd8ODSRpxtxP6SKBnx2qg@mail.gmail.com> <160271840430.884498.12165227808003957407@swboyd.mtv.corp.google.com>
In-Reply-To: <160271840430.884498.12165227808003957407@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 14 Oct 2020 17:10:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UUTTGLNHe2pESfbWaXSxs1u4BOVgru6ic4arGgYkZdVg@mail.gmail.com>
Message-ID: <CAD=FV=UUTTGLNHe2pESfbWaXSxs1u4BOVgru6ic4arGgYkZdVg@mail.gmail.com>
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

On Wed, Oct 14, 2020 at 4:33 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Doug Anderson (2020-10-14 16:07:52)
> > Hi,
> >
> > On Wed, Oct 14, 2020 at 4:00 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > >
> > > Quoting Doug Anderson (2020-10-14 15:28:58)
> > > > Hi,
> > > >
> > > > On Wed, Oct 14, 2020 at 3:10 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > > > >
> > > > > Quoting Douglas Anderson (2020-10-14 14:05:22)
> > > > > > diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
> > > > > > index abcf36006926..48d370e2108e 100644
> > > > > > --- a/drivers/clk/qcom/lpasscorecc-sc7180.c
> > > > > > +++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
> > > > > > @@ -356,12 +356,48 @@ static const struct qcom_cc_desc lpass_audio_hm_sc7180_desc = {
> > > > > >         .num_gdscs = ARRAY_SIZE(lpass_audio_hm_sc7180_gdscs),
> > > > > >  };
> > > > > >
> > > > > > +static void lpass_pm_runtime_disable(void *data)
> > > > > > +{
> > > > > > +       pm_runtime_disable(data);
> > > > > > +}
> > > > > > +
> > > > > > +static void lapss_pm_clk_destroy(void *data)
> > > > > > +{
> > > > > > +       pm_clk_destroy(data);
> > > > > > +}
> > > > >
> > > > > Why are these helpers added again? And do we even need them? Can't we
> > > > > just pass pm_runtime_disable or pm_clk_destroy to the
> > > > > devm_add_action_or_reset() second parameter?
> > > >
> > > > Unfortunately, we can't due to the C specification.  Take a look at
> > > > all the other users of devm_add_action_or_reset() and they all have
> > > > pretty much the same stupid thing.
> > >
> > > Ok, but we don't need two of the same functions, right?
> >
> > How would you write it more cleanly?
>
> Oh I see I'm making it confusing. Patch 1 has two functions for
> pm_runtime_disable() and pm_clk_destroy(), called
> lpass_pm_runtime_disable() and lapss_pm_clk_destroy() respectively
> (please fix the lapss typo regardless).

Oops, sorry for the typo.


> Then this patch seems to introduce them again, but really the diff is
> getting confused and it looks like the functions are introduced again.
> Can you move them to this location (or at least near it) in the first
> patch so that this doesn't look like they're being introduced again?

Yeah.  v4 coming up soon then.


> > > > ...actually, do we even need the runtime_disable in the error path?
> > > > When the dev goes away does it matter if you left pm_runtime enabled
> > > > on it?
> > > >
> > >
> > > I don't know. The device isn't destroyed but maybe when the driver is
> > > unbound it resets the runtime PM counters?
> >
> > Certainly it seems safest just to do it...
> >
>
> Can you confirm? I'd rather not carry extra code.

Confirmed that we need it.  Specifically from
"Documentation/power/runtime_pm.rst"

> Drivers in ->remove() callback should undo the runtime PM changes done
> in ->probe(). Usually this means calling pm_runtime_disable(),
> pm_runtime_dont_use_autosuspend() etc.

It's my assertion that having it in devm is as good as having it in
the remove() callback because devres_release_all() follows the
remove() calls in base/dd.c
