Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC5E4C433EF
	for <linux-clk@archiver.kernel.org>; Thu,  7 Oct 2021 17:45:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9259261262
	for <linux-clk@archiver.kernel.org>; Thu,  7 Oct 2021 17:45:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241738AbhJGRrR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Oct 2021 13:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233719AbhJGRrR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Oct 2021 13:47:17 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89D0DC061570
        for <linux-clk@vger.kernel.org>; Thu,  7 Oct 2021 10:45:23 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id p18so7553862vsu.7
        for <linux-clk@vger.kernel.org>; Thu, 07 Oct 2021 10:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f/SSd9taA/ux/WcbF4zPpx1nrfRSaWr/6ufk+sBjGOU=;
        b=C6OV7fNTNszO83NEHaEe9WFS92ipi/64+l5QWmrSf08rqt21EdnbkzayDbeQbffi8q
         4EWmBrvGTjXk+RskDMJyaOKcdhNgkhuFRmA0dqtR+2QoW5HNYt3KBYu8nzbKLKgkjz93
         FQABPrg1LfIwwUdGSgzk8+H5moBYA8C7xiQueXjfOnfLBkqGIF7lssvawMvmoX7/PKWv
         7FheqBOhkduhYGMxsRwICIRa6gj+Y60RtPOTQnfFw3qEpiNyUyt6awddo1vVc94PK/D9
         ewFPU/aqeVl6SiMmF1dGHZH2dbPU1llOpwspC/hCI6y532BiXHKx06E64YciBBxxcwrd
         urow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f/SSd9taA/ux/WcbF4zPpx1nrfRSaWr/6ufk+sBjGOU=;
        b=qIPp3zdfWxBJctwJ782Haf134NGCY5Wv562S455nRyxqX/3ntLV38bcPwBogFcRDxr
         SrR4vX2vonHm7Avz/hrQh7D4YOO3WDVMl6Ar5butJtuxVNzikM+B+uUmHdqcfn6at+J9
         Nmcv8+EMi9up4jAR659j3QlEjbaeHv/wGNh6SwE5G9tDgmrXm61JFota2YUvpZVzORJO
         ArnH95mBQR0B2dCHTVJcU3JyQxb6EasGLL3JcjWvGSCsIrFhZ/8koiMmmO7Vo/B0JWfW
         scWeUXhJeHT/RZjGAgwjH0w/jz3TxS+A3euiEGGaBK5JjfVWZ4j1AkRWbojawUaIf+D5
         sb4A==
X-Gm-Message-State: AOAM53091uzMtQSN+jzGOomEybMNZrfPSKkZO0iXtKKvbv6JSaDYmo0K
        GpAEgzoKB4xIIOzW5JKK49o3FZ16LD9ZC1WTspVT3A==
X-Google-Smtp-Source: ABdhPJzs3BsUO8cKJEPJ0Qs45Sbe9/yBxJbj4v7ac+DJsZWM5TBVKa/rt3x2n3ALCUEU8THowSqy5JBQI6SxyrUFihM=
X-Received: by 2002:a67:d289:: with SMTP id z9mr6123652vsi.39.1633628722573;
 Thu, 07 Oct 2021 10:45:22 -0700 (PDT)
MIME-Version: 1.0
References: <20211007140904.3085-1-semen.protsenko@linaro.org> <CAHp75Ve1+pJ3Mqc7ErDSheLu5rEvSOf2Cq9JtSfOxSFrazNObg@mail.gmail.com>
In-Reply-To: <CAHp75Ve1+pJ3Mqc7ErDSheLu5rEvSOf2Cq9JtSfOxSFrazNObg@mail.gmail.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Thu, 7 Oct 2021 20:45:11 +0300
Message-ID: <CAPLW+4=3Mx9HuLdDo8YQ7tjVMi2kaTP23N1E2b5Krp_RJbO5-g@mail.gmail.com>
Subject: Re: [PATCH v4] clk: Add write operation for clk_parent debugfs node
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Mike Tipton <mdtipton@codeaurora.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 7 Oct 2021 at 17:39, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>
> On Thu, Oct 7, 2021 at 5:09 PM Sam Protsenko <semen.protsenko@linaro.org> wrote:
> >
> > Useful for testing mux clocks. One can write the index of the parent to
> > be set into clk_parent node, starting from 0. Example
> >
> >     # cd /sys/kernel/debug/clk/mout_peri_bus
> >     # cat clk_possible_parrents
> >       dout_shared0_div4 dout_shared1_div4
> >     # cat clk_parent
> >       dout_shared0_div4
> >     # echo 1 > clk_parent
> >     # cat clk_parent
> >       dout_shared1_div4
> >
> > CLOCK_ALLOW_WRITE_DEBUGFS has to be defined in drivers/clk/clk.c in
> > order to use this feature.
>
> ...
>
> > +static ssize_t current_parent_write(struct file *file, const char __user *ubuf,
> > +                                   size_t count, loff_t *ppos)
> > +{
> > +       struct seq_file *s = file->private_data;
> > +       struct clk_core *core = s->private;
> > +       struct clk_core *parent;
>
> > +       char buf[4] = { 0 };
>
> We may use {} (in a more standardized way), but see below.
>
> > +       u8 idx;
> > +       int err;
>
> > +       if (copy_from_user(&buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
> > +               return -EFAULT;
> > +
> > +       err = kstrtou8(buf, 0, &idx);
> > +       if (err)
> > +               return err;
>
> NIH kstrotu8_from_user().
>

Cool, didn't know about that API existence. Will fix in v5.

> > +       parent = clk_core_get_parent_by_index(core, idx);
> > +       if (!parent)
> > +               return -ENOENT;
> > +
> > +       clk_prepare_lock();
> > +       err = clk_core_set_parent_nolock(core, parent);
> > +       clk_prepare_unlock();
> > +       if (err)
> > +               return err;
> > +
> > +       return count;
> > +}
>
> ...
>
> > +#ifdef CLOCK_ALLOW_WRITE_DEBUGFS
> > +               if (core->num_parents > 1) {
> > +                       debugfs_create_file("clk_parent", 0644, root, core,
> > +                                           &current_parent_rw_fops);
>
> > +               } else {
> > +                       debugfs_create_file("clk_parent", 0444, root, core,
> > +                                           &current_parent_fops);
> > +               }
> > +#else
> >                 debugfs_create_file("clk_parent", 0444, root, core,
> >                                     &current_parent_fops);
>
> Dup. You can avoid it.
>

You're right, will be fixed in v5.

Thanks for the review!

> > +#endif
> > +       }
>
> --
> With Best Regards,
> Andy Shevchenko
