Return-Path: <SRS0=xFW4=DQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79A7CC433DF
	for <linux-clk@archiver.kernel.org>; Fri,  9 Oct 2020 03:08:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 32D302222C
	for <linux-clk@archiver.kernel.org>; Fri,  9 Oct 2020 03:08:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nVQwOCpT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731428AbgJIDI1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Oct 2020 23:08:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728854AbgJIDI1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Oct 2020 23:08:27 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F27F8C0613D2
        for <linux-clk@vger.kernel.org>; Thu,  8 Oct 2020 20:08:25 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id u8so11023007ejg.1
        for <linux-clk@vger.kernel.org>; Thu, 08 Oct 2020 20:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hzGw1lvbVg1O3HNCohoxhIwjhrarR6bx4xHnMp+fTwA=;
        b=nVQwOCpT4g8JthNK5iKhQTdIhub03LKwwj+VQeTb9AxwTRzA14IPYtkGXyg7mr2g2P
         103MIxIUJueqFU5raKp6hQ1s2jkwBTcqiCAaqsHroAbD53GGHQf3iush7Zga+lloLKI/
         ZxsyRQ9XDTO84Jk2S0EH4sIwonDRImsAZSIQuPryowCT0ifE7Hxum8APtFrqDWRY6xD6
         JlvKRMdaZrWdzJUcpH3COjOAnwlAdMyOf2cFUP/G+HeUwwauZvJ2ibplB+W4Yb8unP0g
         FgDmYakty9KDf4xa+hElNINjgpJHEXdeKarV58HB7BM/i7iHmlHyz2C3f8RbC1KolLGz
         oMWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hzGw1lvbVg1O3HNCohoxhIwjhrarR6bx4xHnMp+fTwA=;
        b=Ny4pvtwqWi+0RImcZT4dqskHFKUp168lacNRBpV5PSq+n0UwwURZsWWz99Ub1aAShg
         ERvL8mOjLcs64mgmncJqSSk3yZCW0cJ0gON3d4DNBnenY7EQiS0fRXxO+SXpD4Lct3G0
         ivbmmgqA7zRfSzPcZPt3fzbefIs6TFiwm5r1shi+cQdbMgxm4Ma4syofu9EzAYxvqKU1
         qVZLcCo1KksgjG4wdDGQ0IcH8P6K6g8GmaDMKeCaTH1d5OYqGsUDKrUxIZWb79iHMOW4
         o9UrIvhAUJM2eDhpP3JvBOKpAfcjoYuTLgg42nVwrjL4h4O27aRXxcqmah4c3PXDNA9B
         nZWQ==
X-Gm-Message-State: AOAM531fXsRcTTySuJT0E6I/o6J26aW+29dN5+mapjEP4S8sLfSm6yIy
        KKhQC65A98LNj5OcIpR4f98CepU9Muz+R13fE9jqqNue6GkBkg==
X-Google-Smtp-Source: ABdhPJzdfJ12CT7GuLZ9yVOR9VOjID+zlikvAyb/8vEe5oCPoi6T9juJIFA/SAzgyRgth7l6QV6OV0by4F0ERELuOyw=
X-Received: by 2002:a17:906:f43:: with SMTP id h3mr11779717ejj.338.1602212904650;
 Thu, 08 Oct 2020 20:08:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200928084744.32478-1-jun.nie@linaro.org> <160211480321.310579.14554922934041815553@swboyd.mtv.corp.google.com>
In-Reply-To: <160211480321.310579.14554922934041815553@swboyd.mtv.corp.google.com>
From:   Jun Nie <jun.nie@linaro.org>
Date:   Fri, 9 Oct 2020 11:08:13 +0800
Message-ID: <CABymUCPS0BY7sroQ-yt5A-HPZeCwp5oMw98YT99SsSdMGT+Nsw@mail.gmail.com>
Subject: Re: [PATCH] clk: emit warning if fail to get parent clk
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawn.guo@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Stephen Boyd <sboyd@kernel.org> =E4=BA=8E2020=E5=B9=B410=E6=9C=888=E6=97=A5=
=E5=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=887:53=E5=86=99=E9=81=93=EF=BC=9A
>
> Quoting Jun Nie (2020-09-28 01:47:44)
> > Emit warning if fail to get parent clk to expose potential issue earlie=
r.
> > For example, clk_hw_get_rate() will return 0 for a clock without parent=
 core
> > while parent number is not zero. This cause opp always think it is swit=
ching
> > frequency from 0 to some other frequency. Crash may happen if we switch
> > from high frequency to low frequency and lower CPU voltage before clk r=
ate
> > switching.
>
> Thanks for the background reasoning. It's good to know what the problem
> is. Is there any way to change OPP so it can handle this scenario
> better?

Maybe we can save latest CPU voltage and lower the voltage per opp voltage
requirement instead of clk rate requirement.
>
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/clk/clk.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index 1a27e99ccb17..78b21b888e56 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -424,6 +424,7 @@ static void clk_core_fill_parent_index(struct clk_c=
ore *core, u8 index)
> >  {
> >         struct clk_parent_map *entry =3D &core->parents[index];
> >         struct clk_core *parent =3D ERR_PTR(-ENOENT);
> > +       int emit_warn =3D 0;
> >
> >         if (entry->hw) {
> >                 parent =3D entry->hw->core;
> > @@ -443,6 +444,12 @@ static void clk_core_fill_parent_index(struct clk_=
core *core, u8 index)
> >         /* Only cache it if it's not an error */
> >         if (!IS_ERR(parent))
> >                 entry->core =3D parent;
> > +       else if (parent !=3D ERR_PTR(-EPROBE_DEFER))
> > +               emit_warn =3D 1;
> > +
> > +       if (emit_warn || (!parent && core->num_parents))
> > +               pr_warn("Fail to get indexed %d parent for clk %s.",
> > +                       index, core->name);
>
> How do we know that this error isn't because the parent hasn't been
> probed yet?

Yes, this is chance that failure to probe parent also cause the error.
But I had thought there may
be unnecessary error message before the successful probing, though I
did not see it. If you think
it does not a matter, next version can emit warning on all error.

Jun
