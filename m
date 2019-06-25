Return-Path: <SRS0=Kcvz=UY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA034C4646C
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 03:15:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9E54B20665
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 03:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561432525;
	bh=lfgP7NT0+SHhYmeRMEcYjoGW2q4RrpTeDG9woGn9lM8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=uIdv6rv2wzDtyLJAF4mW/1MYIOudY69WAOXKC/qy4kfC+BIk71jrDhFFt9jrXQZb1
	 j8qmI+/+GrkKEFIAkoQK6SxkcqyAphAspgRaurCV6J5Wtdf/3Lo0GMW6wCuFoP3C0x
	 nz4t8KYxpvcUuhjMorfCAB8wwctwj63KHsr+NfrI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727223AbfFYDPZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Jun 2019 23:15:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:46772 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726836AbfFYDPZ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 24 Jun 2019 23:15:25 -0400
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8851E20820
        for <linux-clk@vger.kernel.org>; Tue, 25 Jun 2019 03:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561432523;
        bh=lfgP7NT0+SHhYmeRMEcYjoGW2q4RrpTeDG9woGn9lM8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=iSyFXgcfPyIDtyYh/h+oq1c0TbruARaJJot9ttD73roAABu8kkgrXW8LgSg6qLQYo
         OoTNj+CRLoy88ebPfu+s1ce1vBwuLF7/QKFLLt3N1N58dLHArNji+6Z8VJU9uQwLbR
         WaTYgOP2fRhbV/VpqFvloK1D6T/AGkNRdDNIfmXE=
Received: by mail-wr1-f43.google.com with SMTP id x17so16013098wrl.9
        for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2019 20:15:23 -0700 (PDT)
X-Gm-Message-State: APjAAAUjFFDBg/xIBaCGKN2DHxs+vtL2XRyHRBedydFHIK498AvEXqYc
        xhFSKDLexJeMIElHkfn14A025eoY8jkZUONv7gU=
X-Google-Smtp-Source: APXvYqxwAYorposvWwzJLRsp2KQ2dY0FCXVRdOd/3twSSrj9/M48cTokNT8TKt/n6SwhXWpnNJw1D81iEb/mUL74IHU=
X-Received: by 2002:a5d:4311:: with SMTP id h17mr116608587wrq.9.1561432522143;
 Mon, 24 Jun 2019 20:15:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190622022254.GA7789@wens.csie.org> <20190625030141.0D26320652@mail.kernel.org>
In-Reply-To: <20190625030141.0D26320652@mail.kernel.org>
From:   Chen-Yu Tsai <wens@kernel.org>
Date:   Tue, 25 Jun 2019 11:15:12 +0800
X-Gmail-Original-Message-ID: <CAGb2v64COVAo2uCVjZumDHb6HMmHoS4YBbNMHsd7w7-_3t84bw@mail.gmail.com>
Message-ID: <CAGb2v64COVAo2uCVjZumDHb6HMmHoS4YBbNMHsd7w7-_3t84bw@mail.gmail.com>
Subject: Re: [GIT PULL] clk: sunxi-ng: clk parent rewrite part 1 - take 2
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Chen-Yu Tsai <wens@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Jun 25, 2019 at 11:01 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Chen-Yu Tsai (2019-06-21 19:22:54)
> > Hi,
> >
> > Take 2 has build errors in drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c
> > fixed.
> >
> > The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> >
> >   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> >
> > are available in the Git repository at:
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi-ng-parent-rewrite-part-1-take-2
> >
> > for you to fetch changes up to 89f27fb2dd348d8d52a97e6ebec15c64fe461a25:
> >
> >   clk: sunxi-ng: sun8i-r: Use local parent references for SUNXI_CCU_GATE (2019-06-22 10:13:16 +0800)
> >
> > ----------------------------------------------------------------
>
> Thanks. Pulled into clk-next. I applied this patch on top though to
> clean up the debugfs patch. A newline was missing. Does it make sense? I
> haven't tested it at all.

Looks good to me. Thanks for the cleanup.

Tested-by: Chen-Yu Tsai <wens@csie.org>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>


>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 093161ca4dcc..09d8e84a1968 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2997,11 +2997,10 @@ static int clk_flags_show(struct seq_file *s, void *data)
>  }
>  DEFINE_SHOW_ATTRIBUTE(clk_flags);
>
> -static int possible_parents_show(struct seq_file *s, void *data)
> +static void possible_parent_show(struct seq_file *s, struct clk_core *core,
> +                                unsigned int i, char terminator)
>  {
> -       struct clk_core *core = s->private;
>         struct clk_core *parent;
> -       int i;
>
>         /*
>          * Go through the following options to fetch a parent's name.
> @@ -3015,22 +3014,6 @@ static int possible_parents_show(struct seq_file *s, void *data)
>          * specified directly via a struct clk_hw pointer, but it isn't
>          * registered (yet).
>          */
> -       for (i = 0; i < core->num_parents - 1; i++) {
> -               parent = clk_core_get_parent_by_index(core, i);
> -               if (parent)
> -                       seq_printf(s, "%s ", parent->name);
> -               else if (core->parents[i].name)
> -                       seq_printf(s, "%s ", core->parents[i].name);
> -               else if (core->parents[i].fw_name)
> -                       seq_printf(s, "<%s>(fw) ", core->parents[i].fw_name);
> -               else if (core->parents[i].index >= 0)
> -                       seq_printf(s, "%s ",
> -                                  of_clk_get_parent_name(core->of_node,
> -                                                         core->parents[i].index));
> -               else
> -                       seq_puts(s, "(missing) ");
> -       }
> -
>         parent = clk_core_get_parent_by_index(core, i);
>         if (parent)
>                 seq_printf(s, "%s", parent->name);
> @@ -3045,6 +3028,19 @@ static int possible_parents_show(struct seq_file *s, void *data)
>         else
>                 seq_puts(s, "(missing)");
>
> +       seq_putc(s, terminator);
> +}
> +
> +static int possible_parents_show(struct seq_file *s, void *data)
> +{
> +       struct clk_core *core = s->private;
> +       int i;
> +
> +       for (i = 0; i < core->num_parents - 1; i++)
> +               possible_parent_show(s, core, i, ' ');
> +
> +       possible_parent_show(s, core, i, '\n');
> +
>         return 0;
>  }
>  DEFINE_SHOW_ATTRIBUTE(possible_parents);
>
