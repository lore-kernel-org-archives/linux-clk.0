Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30C5DC433EF
	for <linux-clk@archiver.kernel.org>; Thu,  7 Oct 2021 13:40:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B0D361139
	for <linux-clk@archiver.kernel.org>; Thu,  7 Oct 2021 13:40:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241197AbhJGNmH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Oct 2021 09:42:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240942AbhJGNmE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Oct 2021 09:42:04 -0400
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C5FFC061746
        for <linux-clk@vger.kernel.org>; Thu,  7 Oct 2021 06:40:11 -0700 (PDT)
Received: by mail-vs1-xe2d.google.com with SMTP id p2so6757909vst.10
        for <linux-clk@vger.kernel.org>; Thu, 07 Oct 2021 06:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1c9Bs6nusuoOL+e643re/tA4r0t8kYh/Scmw4S9IkZ8=;
        b=fT0+k27En3TnyRcfJlq4l1jQwbd3HzcNL5RPtCGxNg+eUKjfNnq1IjHURXEQTV88Vo
         fr7qmB971FqWJwgnI0zWK+K9Jd08S2RATuEd7Ky4PChGehZXbXQuV+922dpWYepU59dR
         /hNhHpaY6mKO/822LpygHj6dGlbVK88kHvi3zk6e04S4rZqKVDBi300XSl5GQPLMWWGA
         Cq4USwlybP1lOv3KuiCMlh4jiteUCnFaORnTXloduWgbWpuf+lnep990ICR1kA787A7s
         oaRzkCPjIw4D1uDRZKGVDRa1S1DyIdbKzGYnysCFrA8w0T043J0YOi08as8KUHC61lHw
         F5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1c9Bs6nusuoOL+e643re/tA4r0t8kYh/Scmw4S9IkZ8=;
        b=mIF2v+CrJoUX6gxPaqS//AgasTQma46vAa+cAxdtvcBelsY1hyBn/XIraS1vlYbZ+3
         btzMD4WrpIWVlONCCOtQbNPhNhMhgWeEvRo0BNpkGvY0qmr4ebvzepJGSSm7rEusCTFc
         F3XxQW4Mf3BU54cQoCwSy3TXIQHQC+xXV7I0ZMV0xYVV6nDIpHFzdjP86Qnqj4cQ5Mom
         E58Ey41d+mEl6B6BqqWJg2btboIW44EQxyEOaVuecIt8kaVOpOmCM/Wa8DGnNbx0v+/t
         iNtAOr/7jOCcKjRooNYnAVdLGDW2OX+b2ATlJxnXTmb8e9ZaKDU2xgLdHBDvQU27vIoC
         L+BQ==
X-Gm-Message-State: AOAM533CP4Ig1EgeJkWs6AA/n+GVS6/HI6O8fR9Qy9lfRjBQRhpHT7Gx
        shREE/puoQqDYLx1byGRgyNO3oZ/69D0Y+sbYEQCcQ==
X-Google-Smtp-Source: ABdhPJzDRlKFY14qZ2gPiRb6EyUDNAJg6Tx1mRwv4DIkuJdoBnTMESa0Ii3Ads1kGPK9oZd30QVKqELb8a7goNzF42Q=
X-Received: by 2002:a67:1781:: with SMTP id 123mr3771949vsx.1.1633614008836;
 Thu, 07 Oct 2021 06:40:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210914141939.26410-1-semen.protsenko@linaro.org>
 <CAPLW+4mhr4pJAUyGNpfWDnxgTsJ7-fj0hw=ehV8YkqRmaBSnag@mail.gmail.com> <CAMuHMdXVM4HZ6H4e=7u14qwmqszmR4cvNZ=K4h9O079fxZB95g@mail.gmail.com>
In-Reply-To: <CAMuHMdXVM4HZ6H4e=7u14qwmqszmR4cvNZ=K4h9O079fxZB95g@mail.gmail.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Thu, 7 Oct 2021 16:39:56 +0300
Message-ID: <CAPLW+4neBGCKShs-S=sGpWUY74oPifAdPD5stkq8cXf80LR_cA@mail.gmail.com>
Subject: Re: [PATCH] clk: Add clk_set_parent debugfs node
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Mike Tipton <mdtipton@codeaurora.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Geert,

On Tue, 5 Oct 2021 at 13:43, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Sam,
>
> On Tue, Oct 5, 2021 at 12:11 PM Sam Protsenko
> <semen.protsenko@linaro.org> wrote:
> > On Tue, 14 Sept 2021 at 17:19, Sam Protsenko <semen.protsenko@linaro.org> wrote:
> > > Useful for testing mux clocks. One can write the index of the parent to
> > > set into clk_set_parent node, starting from 0. Example
> > >
> > >     # cat clk_possible_parrents
> > >       dout_shared0_div4 dout_shared1_div4
> > >     # cat clk_parent
> > >       dout_shared0_div4
> > >     # echo 1 > clk_set_parent
> > >     # cat clk_parent
> > >       dout_shared1_div4
> > >
> > > Define CLOCK_ALLOW_WRITE_DEBUGFS in drivers/clk/clk.c in order to use
> > > this feature.
> > >
> > > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > > ---
> >
> > + Adding more folks for review
> >
> > Guys, can you please review this one?
>
> Thanks for your patch!
>

Thanks for review! :)

> > > --- a/drivers/clk/clk.c
> > > +++ b/drivers/clk/clk.c
> > > @@ -3214,6 +3214,30 @@ static int current_parent_show(struct seq_file *s, void *data)
> > >  }
> > >  DEFINE_SHOW_ATTRIBUTE(current_parent);
> > >
> > > +#ifdef CLOCK_ALLOW_WRITE_DEBUGFS
> > > +static int clk_set_parent_set(void *data, u64 val)
>
> u64 is overkill, num_parents is u8.
>

u64 is required by simple_attr_open() signature, because
clk_set_parent_set() is being passed there as a parameter eventually
(via DEFINE_DEBUGFS_ATTRIBUTE()). But yeah, I'll use u8 when reworking
the code for using with existing 'clk_parent' file.

> > > +{
> > > +       struct clk_core *core = data, *parent;
> > > +       int ret;
> > > +
> > > +       if (val >= core->num_parents)
> > > +               return -EINVAL;
>
> clk_core_get_parent_by_index() called below already checks this.
>

Thanks, will remove this.

> > > +
> > > +       parent = clk_core_get_parent_by_index(core, val);
> > > +       if (IS_ERR_OR_NULL(parent))
> > > +               return PTR_ERR(parent);

Also just noticed that this block is incorrect. I should've used just
'if (!parent)' here instead. I remember Russel King was raising the
question about removing that API for good, as too many people tend to
use that incorrectly, and now I can see why.

> > > +
> > > +       clk_prepare_lock();
> > > +       ret = clk_core_set_parent_nolock(core, parent);
> > > +       clk_prepare_unlock();
> > > +
> > > +       return ret;
> > > +}
> > > +
> > > +DEFINE_DEBUGFS_ATTRIBUTE(clk_set_parent_fops, NULL, clk_set_parent_set,
> > > +                        "%llu\n");
> > > +#endif
> > > +
> > >  static int clk_duty_cycle_show(struct seq_file *s, void *data)
> > >  {
> > >         struct clk_core *core = s->private;
> > > @@ -3285,9 +3309,14 @@ static void clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
> > >                 debugfs_create_file("clk_parent", 0444, root, core,
> > >                                     &current_parent_fops);
> > >
> > > -       if (core->num_parents > 1)
> > > +       if (core->num_parents > 1) {
> > >                 debugfs_create_file("clk_possible_parents", 0444, root, core,
> > >                                     &possible_parents_fops);
> > > +#ifdef CLOCK_ALLOW_WRITE_DEBUGFS
> > > +               debugfs_create_file("clk_set_parent", 0200, root, core,
> > > +                                   &clk_set_parent_fops);
> > > +#endif
>
> Why add a new file, instead of making the existing "clk_parent" file
> writable, like is done for "clk_rate"?
> Yes, "clk_parent" prints a name, while you use a parent number, but
> I guess that can be fixed? Or even both can be accepted?
>

Ok, I'll merge that feature into existing 'clk_parent' file. At the
time I implemented this I was busy with something else, and use
existing code around as an example. But it's not too hard to do this
properly, by defining 'struct file_operations' manually, like it's
done for example in dwc3_lsp_write(). Will send v2 with fixes shortly.

> > > +       }
> > >
> > >         if (core->ops->debug_init)
> > >                 core->ops->debug_init(core->hw, core->dentry);
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
