Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E83BC433F5
	for <linux-clk@archiver.kernel.org>; Fri, 10 Dec 2021 14:27:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242136AbhLJOav (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 10 Dec 2021 09:30:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242115AbhLJOav (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 10 Dec 2021 09:30:51 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00348C061746
        for <linux-clk@vger.kernel.org>; Fri, 10 Dec 2021 06:27:15 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id 207so13971824ljf.10
        for <linux-clk@vger.kernel.org>; Fri, 10 Dec 2021 06:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BGKXWuw5FUz2lq4nHR5DNaBBD34jKQ5R45i0rwQx8A4=;
        b=CFH1rcbCFxWIxQNVXDI/SWopb/coPzaZAEzM3Sa/u4vIAi0bWIwu9hHsVsg1JP22cN
         w6dRoEfSlFyytd2lGir7s3OyeBHb2XeP95QDveUnHCYX5I0+9y0WRl4+z2Km/BWQNVwj
         dEwfTcRv+3XBLE0oBDoc5lKT7k10TtW4Fzmr5iPCYWn9oTPtX8CDAPWYjqbXVagKABee
         M4VYmMlqiMbxt+nW8VOi/mGcKAgW/rom1+UgRDb0QJ+dMCgIBIqKpr/SgQdCA8xRA7yh
         9E/rhCGRnXjk6Trcettw1VOGmw0udP260Kq03kmuJWfSJRWvQR/r9uDhJ8sdkPQeC1So
         sOsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BGKXWuw5FUz2lq4nHR5DNaBBD34jKQ5R45i0rwQx8A4=;
        b=jMz98/pLnVFBc1uGYcBV6kQaYIh6ZawArGvqXXDtZMifC39kiegksgIJDmra2f0L7P
         DZ/oNKFgEmPTDosj/v2E8QM7O7iShdt8AUiyUKvh5li/Fqd30k2RrFRyHzfgliHz8VBa
         1lUGc1CLMy+Z+kG8WHPSRr2Wk/RqvPbiQixJbozR77VsGhi4fm9XXgiW5Nh4Z++oGivX
         cGRqmRPpCCzh9e61sryZ5ddgTKZS2G+nq3bXvqvsW7txem22sk8xPev4FXuiKlPXQ0i4
         AtQYi56O19oSMQW1c8JNYhqov6+NM75Yz9MxMZmcNPB2A6bYeJLvZhmyR4QAAAs8P3Qf
         lu3w==
X-Gm-Message-State: AOAM532Ve2FKxGnZHih9YWLOGUx1GFL/FfP9N452SnfA/ciARC1S+dz7
        jvGInRBlZG/JIgpMrzG/KI2eUSBIHFD1msHDCbKs+Q==
X-Google-Smtp-Source: ABdhPJxYRWACqh8JuGiabO+25iCguGw0nMuZkHb0WDUn9++dyMWSHn51B3QZUCANY/yv0gEz87yumHn8TBxOfr7TP3Q=
X-Received: by 2002:a05:651c:612:: with SMTP id k18mr13082335lje.383.1639146434178;
 Fri, 10 Dec 2021 06:27:14 -0800 (PST)
MIME-Version: 1.0
References: <20211129191156.29322-1-cristian.marussi@arm.com>
 <20211129191156.29322-17-cristian.marussi@arm.com> <CAKfTPtCDostniAStK2zNnFa+dtd1mHJ8zywyGXX9HZYf4u6z+w@mail.gmail.com>
 <20211210133019.GA6207@e120937-lin>
In-Reply-To: <20211210133019.GA6207@e120937-lin>
From:   Vincent Guittot <vincent.guittot@linaro.org>
Date:   Fri, 10 Dec 2021 15:27:02 +0100
Message-ID: <CAKfTPtD5jbENGv=9HW98Q3Z8vJ7eAeQU_cJEgxWO_WjAdzb1=g@mail.gmail.com>
Subject: Re: [PATCH v7 16/16] clk: scmi: Support atomic clock enable/disable API
To:     Cristian Marussi <cristian.marussi@arm.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        sudeep.holla@arm.com, james.quinlan@broadcom.com,
        jonathan.cameron@huawei.com, f.fainelli@gmail.com,
        etienne.carriere@linaro.org, Souvik.Chakravarty@arm.com,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 10 Dec 2021 at 14:30, Cristian Marussi <cristian.marussi@arm.com> wrote:
>
> On Fri, Dec 10, 2021 at 11:52:39AM +0100, Vincent Guittot wrote:
> > Hi Cristian,
> >
>
> Hi Vincent,
>
> thanks for the feedback, my replies below.
>
> > On Mon, 29 Nov 2021 at 20:13, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > >
> > > Support also atomic enable/disable clk_ops beside the bare non-atomic one
> > > (prepare/unprepare) when the underlying SCMI transport is configured to
> > > support atomic transactions for synchronous commands.
> > >
> > > Cc: Michael Turquette <mturquette@baylibre.com>
> > > Cc: Stephen Boyd <sboyd@kernel.org>
> > > Cc: linux-clk@vger.kernel.org
> > > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > > ---
> > > V5 --> V6
> > > - add concurrent availability of atomic and non atomic reqs
> > > ---
> > >  drivers/clk/clk-scmi.c | 56 +++++++++++++++++++++++++++++++++++-------
> > >  1 file changed, 47 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
> > > index 1e357d364ca2..50033d873dde 100644
> > > --- a/drivers/clk/clk-scmi.c
> > > +++ b/drivers/clk/clk-scmi.c
> > > @@ -88,21 +88,53 @@ static void scmi_clk_disable(struct clk_hw *hw)
> > >         scmi_proto_clk_ops->disable(clk->ph, clk->id);
> > >  }
> > >
> > > +static int scmi_clk_atomic_enable(struct clk_hw *hw)
> > > +{
> > > +       struct scmi_clk *clk = to_scmi_clk(hw);
> > > +
> > > +       return scmi_proto_clk_ops->enable_atomic(clk->ph, clk->id);
> > > +}
> > > +
> > > +static void scmi_clk_atomic_disable(struct clk_hw *hw)
> > > +{
> > > +       struct scmi_clk *clk = to_scmi_clk(hw);
> > > +
> > > +       scmi_proto_clk_ops->disable_atomic(clk->ph, clk->id);
> > > +}
> > > +
> > > +/*
> > > + * We can provide enable/disable atomic callbacks only if the underlying SCMI
> > > + * transport for an SCMI instance is configured to handle SCMI commands in an
> > > + * atomic manner.
> > > + *
> > > + * When no SCMI atomic transport support is available we instead provide only
> > > + * the prepare/unprepare API, as allowed by the clock framework when atomic
> > > + * calls are not available.
> > > + *
> > > + * Two distinct sets of clk_ops are provided since we could have multiple SCMI
> > > + * instances with different underlying transport quality, so they cannot be
> > > + * shared.
> > > + */
> > >  static const struct clk_ops scmi_clk_ops = {
> > >         .recalc_rate = scmi_clk_recalc_rate,
> > >         .round_rate = scmi_clk_round_rate,
> > >         .set_rate = scmi_clk_set_rate,
> > > -       /*
> > > -        * We can't provide enable/disable callback as we can't perform the same
> > > -        * in atomic context. Since the clock framework provides standard API
> > > -        * clk_prepare_enable that helps cases using clk_enable in non-atomic
> > > -        * context, it should be fine providing prepare/unprepare.
> > > -        */
> > >         .prepare = scmi_clk_enable,
> > >         .unprepare = scmi_clk_disable,
> > >  };
> > >
> > > -static int scmi_clk_ops_init(struct device *dev, struct scmi_clk *sclk)
> > > +static const struct clk_ops scmi_atomic_clk_ops = {
> > > +       .recalc_rate = scmi_clk_recalc_rate,
> > > +       .round_rate = scmi_clk_round_rate,
> > > +       .set_rate = scmi_clk_set_rate,
> > > +       .prepare = scmi_clk_enable,
> > > +       .unprepare = scmi_clk_disable,
> > > +       .enable = scmi_clk_atomic_enable,
> >
> > For  each clock, we have to start with  clk_prepare and then clk_enable
> > this means that for scmi clk we will do
> > scmi_clk_enable
> > then
> > scmi_clk_atomic_enable
> >
> > scmi_clk_enable and scmi_clk_atomic_enable ends up doing the same
> > thing: scmi_clock_config_set but the atomic version doesn't sleep
> >
> > So you will set enable twice the clock.
> >
> > This is confirmed when testing your series with virtio scmi backend as
> > I can see to consecutive scmi clk set enable request for the same
> > clock
> >
>
> Yes, I saw that double enable while testing with CLK debugfs entry BUT I
> thought that was due to the design of the debugfs entries (that calls
> prepare_enable and so prepare and enable in sequence) also becauase, a few
> versions ago, this series WAS indeed providing (beside bugs :P) the
> sleeping prepare XOR the atomic enable depending on the SCMI atomic support
> state (as you are suggesting now), BUT, after a few offline chats with you,
> my (probably faulty) understanding was that some partners, even on a system
> supporting atomic SCMI transfers, would have liked to be able to call the
> atomic .enable selectively only on some (tipically quickly to setup) clocks
> while keep calling the sleeping .prepare on some other (slower ones to
> settle). (while keeping all the other slower clk_rate setup ops non-atomic)
>
> So in v6/v7 I changed the API to provide both sleepable and atomic clk APIs
> when the underlying SCMI stack support atomic mode: this way, though, it is
> clearly up to the caller to decide what to do and if, generally, the
> clock framework just calls everytime both, it will result in a double
> enable.
>
> Was my understanding of the reqs about being able to selectively choose
> the sleep_vs_atomic mode in this way wrong ?

At clk framework level, a user must always call clk_prepare then
clk_enable. Usually clk_prepare is used to do action that can take
time like locking a pll and clk_prepare do the short and atomic action
like gating the clk.

Then, clk_prepare can be a nop if a clk is only doing clk gating as an
example. The same can happen for clk_enable when a pll can't be gated
as an example

What I wanted to say when we discussed offline is that scmi can
provide some PLL and some simple IP clock gating. The PLL would want
to be enabled during the clk_prepare because it's take time and you
can even sleep whereas IP clock gating want to be atomic
So scmi clock 0 might be a PLL with clk_prepare == scmi_clock_enable
and clk_enable == nop
but scmi clock 1 could the clock gating of a HW ip and want
clk_prepare == nop and clk_enable == scmi_clock_atomic_enable

>
> > In case of atomic mode, the clk_prepare should  be a nop
> >
>
> I can certainly revert to use the old exclusive approach, not providing
> a .prepare when atomic is supported, but then all clock enable ops on any
> clock defined on the system will be operated atomically withot any choice
> when atomic SCMI transactions are available.
>
> Ideally, we could like, on a SCMI system supporting atomic, to be able to
> 'tag' a specific clock something like 'prefer-non-atomic' and so selectively
> 'noppify' the .prepare or the .enable at the SCMI clk-driver level depending
> on such tag, but I cannot see any way to expose this from the CLK framework

Yes that would be the right behaviour IMHO

> API or DT, nor it seems suitable for a per-clock DT config option AND it
> would break the current logic of clk_is_enabled_when_prepared().
>
> Indeed clk_is_enabled_when_prepared() logic is ALREADY broken also by this V7
> since when providing also .enable/.disable on atomic transports, the core CLK
> framework would return clk_is_enabled_when_prepared() --> False which does
> NOT fit reality since our SCMI prepare/unprepare DO enable/disable clks even
> if .disable/.enable are provided too.
>
> Probably this last observation on clk_is_enabled_when_prepared() is enough
> to revert to the exclusive atomic/non-atomic approach and just ignore the
> customer wish to be able to selectively choose which clock to operate in
> atomic mode.

Another thing to keep in mind is the use of clk_prepare and clk_enable

clk_prepare/unprepare is usually called when you open/close a driver
whereas clk_enable/disable is called close to the use of the HW ip for
power consumption consideration. If you only use clk_prepare, the IP
will be clocked much more than needed. But if you alwayse use
clk_enable with atomic transfer, you end up taking lot of time to
enable your IP because the parent PLL will be locked at that time in
addition to miss some timing requirement

>
> Any thoughs before a V8 ?
>
> Thanks,
> Cristian
>
