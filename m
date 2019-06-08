Return-Path: <SRS0=ATvf=UH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0FBEC28CC5
	for <linux-clk@archiver.kernel.org>; Sat,  8 Jun 2019 12:19:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B177820693
	for <linux-clk@archiver.kernel.org>; Sat,  8 Jun 2019 12:19:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbfFHMTU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 8 Jun 2019 08:19:20 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:44991 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726940AbfFHMTU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 8 Jun 2019 08:19:20 -0400
Received: by mail-lf1-f68.google.com with SMTP id r15so3515702lfm.11
        for <linux-clk@vger.kernel.org>; Sat, 08 Jun 2019 05:19:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kv8LRDtu3zScEd1g2FTIJ/r2SvprFN9fflNLXUa8I4A=;
        b=G2v9tfnq7+nWVN8mP5BElvPkO3MHWB/jwfLANHCnsmz7EvgBz6y1A2t9wEoktbtHrf
         GAS0Df+aVY3M8z5FAn38Pu1cO8WcI30Mma6Fk6POvlV0WL2rAK2x7o+zLyLpxAJ0Pxu/
         5JIiHBu9Myr5/MjfvII8uC570I5F7dMqhsHkAh1iPPV2GzewRzJEZ26YDfBGci5njKOO
         KypyL+bWwxwRoW5OhRBfrKjt1YY2fta4aZoKUSWeW6I0k5i5viGgMXa/QwXxrIeffjTL
         06TMQhBIaaPAvDhARFO3jqSiTP1MUXj7ju5WfB+YeOUnYoe8AkcXPfTSw5kqlgoM1JOP
         icww==
X-Gm-Message-State: APjAAAVvVhQDxDtbzSbaVkSZpPVHkMQkngyUDA2jez8sUwblfjuM7N6G
        R8xNDtosUfulDd82SMGmWwsyECWy0Y5c07lBNOk=
X-Google-Smtp-Source: APXvYqxXgq6+Qg2hLYqOYwHLwQeNuZJuuOw10MRdDNl9x9vLO2HmB+IKoDIhlcfP9HM1G9J+5Fwey5hqbIXRi1LNfjA=
X-Received: by 2002:a19:6e41:: with SMTP id q1mr21765238lfk.20.1559996358398;
 Sat, 08 Jun 2019 05:19:18 -0700 (PDT)
MIME-Version: 1.0
References: <057720844e78e615e46de34a73b16ffaf7dbfc10.1558686047.git.leonard.crestez@nxp.com>
 <20190607190522.D276520868@mail.kernel.org> <VI1PR04MB5055A1DBAC2C4AAC515CB494EE110@VI1PR04MB5055.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR04MB5055A1DBAC2C4AAC515CB494EE110@VI1PR04MB5055.eurprd04.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sat, 8 Jun 2019 14:19:06 +0200
Message-ID: <CAMuHMdW=AmTWZ-_KexHOj2HJS0TRcqONMVo7HLEd19VzAbTZZw@mail.gmail.com>
Subject: Re: [PATCH] clk: Add clk_parent entry in debugfs
To:     Leonard Crestez <leonard.crestez@nxp.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Leonard,

On Sat, Jun 8, 2019 at 9:26 AM Leonard Crestez <leonard.crestez@nxp.com> wrote:
> On 6/7/19 10:05 PM, Stephen Boyd wrote:
> > Quoting Leonard Crestez (2019-05-24 01:25:25)
>
> >> @@ -3040,10 +3051,11 @@ static void clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
> >>          debugfs_create_u32("clk_enable_count", 0444, root, &core->enable_count);
> >>          debugfs_create_u32("clk_protect_count", 0444, root, &core->protect_count);
> >>          debugfs_create_u32("clk_notifier_count", 0444, root, &core->notifier_count);
> >>          debugfs_create_file("clk_duty_cycle", 0444, root, core,
> >>                              &clk_duty_cycle_fops);
> >> +       debugfs_create_file("clk_parent", 0444, root, core, &current_parent_fops);
> >
> > Shouldn't we skip creation of this file if core->num_parents == 0? So
> > put this under the if condition below?
>
> It's still useful to determine clk tree structure from debugfs fields,
> otherwise you'd have to extract by parsing other files.
>
> Would you hide clk_rate for fixed-rate? I'd rather have everything
> available for uniformity, even if it's otherwise constant at runtime.

Unless I' missing something, there's a big difference here: all clocks
have a rate, but not all clocks have a parent.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
