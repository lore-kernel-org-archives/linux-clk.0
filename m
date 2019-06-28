Return-Path: <SRS0=HIww=U3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6349C4321A
	for <linux-clk@archiver.kernel.org>; Fri, 28 Jun 2019 11:58:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 911AA2086D
	for <linux-clk@archiver.kernel.org>; Fri, 28 Jun 2019 11:58:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbfF1L6j (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Jun 2019 07:58:39 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:41799 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726524AbfF1L6j (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 28 Jun 2019 07:58:39 -0400
Received: by mail-ot1-f66.google.com with SMTP id o101so5376280ota.8
        for <linux-clk@vger.kernel.org>; Fri, 28 Jun 2019 04:58:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wjwJQWvjkPZB5+dI0ZXVDAKQLoC3P8jLetBVFWbvwO8=;
        b=GubQv+VXfbJZtDIQEXBXseOMjR1dOuQtx1KAz2DqdHyM4WUBpO0H9tvEi2iwb8QF8K
         7Yqmjlmt06UehRinQn5iNP/QKLYqh/dlB+dHJR0+s2PnaCQjQ7Bngu/P4j0t75xToep6
         XWuf0m3sSdLXcbMnTnJBaGG0QRUT72+pLTcMSNLogEqMZLoaVb7yuNIyehMLp5etG0oD
         u1p/pHx6qnEdT7ZWjnQgpSimWZfKNBAZxWlcZx83B4XUlVms8kHWEqBlqOlGjJ9+pcVv
         mHvDD/2iCF42TWSzOXcYxDEJtjuPxtBKbxvbKTEQFLaXy31YQy6rTT0RwU2gzklIZFLt
         PgJA==
X-Gm-Message-State: APjAAAV79w/Y/cFET2sjBUUdn/fCzvIjTkrWSRKkN5exnb1GVVwoXq9v
        kVDm/1Ex9/NGIe+Me1QaPOj307t0zN9bgNfTVVU=
X-Google-Smtp-Source: APXvYqzp6jHaeNCs5Hjcl/XOjy/kK6sCjD6SeRPImxs4gU9dfYyFNwTdcdO6JwHVVamhG7ocnB+YrZfiAF79btrJ72U=
X-Received: by 2002:a9d:704f:: with SMTP id x15mr7768914otj.297.1561723118484;
 Fri, 28 Jun 2019 04:58:38 -0700 (PDT)
MIME-Version: 1.0
References: <0c12208398cadb7450b6b7745e99c55770c0ccf8.1561709827.git.leonard.crestez@nxp.com>
In-Reply-To: <0c12208398cadb7450b6b7745e99c55770c0ccf8.1561709827.git.leonard.crestez@nxp.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 28 Jun 2019 13:58:27 +0200
Message-ID: <CAMuHMdWVoYPZFZPmfTWMU3pZc633uqkn70MyApcPhgUSgmCW-A@mail.gmail.com>
Subject: Re: [PATCH v2] clk: Add clk_min/max_rate entries in debugfs
To:     Leonard Crestez <leonard.crestez@nxp.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Leonard,

On Fri, Jun 28, 2019 at 10:19 AM Leonard Crestez
<leonard.crestez@nxp.com> wrote:
> Add two files to expose min/max clk rates as determined by
> clk_core_get_boundaries, taking all consumer requests into account.
>
> This information does not appear to be otherwise exposed to userspace.
>
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>

> Changes since v1:
> * Call clk_prepare_lock/clk_prepare_unlock (Geert)
> * Also include in clk_dump, but only with non-default values
> Link to v1: https://patchwork.kernel.org/patch/11019873/

Thanks for the update!

> Didn't add to clk_summary because min/max rates are rarely used and
> clk_summary already has too many columns.

Agreed.

> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -591,10 +591,12 @@ static void clk_core_get_boundaries(struct clk_core *core,
>                                     unsigned long *min_rate,
>                                     unsigned long *max_rate)
>  {
>         struct clk *clk_user;
>
> +       lockdep_assert_held(&prepare_lock);
> +

I guess the clock maintainers want to see the addition of this check
spun off into a separate patch....

> @@ -3062,10 +3071,38 @@ static int clk_duty_cycle_show(struct seq_file *s, void *data)
>
>         return 0;
>  }
>  DEFINE_SHOW_ATTRIBUTE(clk_duty_cycle);
>
> +static int clk_min_rate_show(struct seq_file *s, void *data)
> +{
> +       struct clk_core *core = s->private;
> +       unsigned long min_rate, max_rate;
> +
> +       clk_prepare_lock();
> +       clk_core_get_boundaries(core, &min_rate, &max_rate);
> +       seq_printf(s, "%lu\n", min_rate);
> +       clk_prepare_unlock();

You can move the release of the lock one line up.

> +
> +       return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(clk_min_rate);
> +
> +static int clk_max_rate_show(struct seq_file *s, void *data)
> +{
> +       struct clk_core *core = s->private;
> +       unsigned long min_rate, max_rate;
> +
> +       clk_prepare_lock();
> +       clk_core_get_boundaries(core, &min_rate, &max_rate);
> +       seq_printf(s, "%lu\n", max_rate);
> +       clk_prepare_unlock();

You can move the release of the lock one line up.

> +
> +       return 0;
> +}

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
