Return-Path: <SRS0=E8mG=X2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E48ECE587
	for <linux-clk@archiver.kernel.org>; Tue,  1 Oct 2019 21:21:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 501D52190F
	for <linux-clk@archiver.kernel.org>; Tue,  1 Oct 2019 21:21:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gDE5dj7Z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbfJAVVH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 1 Oct 2019 17:21:07 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:44537 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727761AbfJAVVE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Oct 2019 17:21:04 -0400
Received: by mail-oi1-f194.google.com with SMTP id w6so15770555oie.11
        for <linux-clk@vger.kernel.org>; Tue, 01 Oct 2019 14:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ffy7ik8tMNlg+8qyltSb6cmvYYkvXVlCoaWdUSbEBAw=;
        b=gDE5dj7Z9tEK+pSj9YNBDU7alXjvcXJUaaBbdNsIae3poVVFRTM2wikSDKDzXarSvE
         WshslJcaWFjR37xUwc4zRQrS0p+nRU3xndQP2vxVovtYL3egfaWVZaW5bUujIKgfU+1f
         EjQVk2otICupo79nD7bXf8mpnUu9T20dgDgzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ffy7ik8tMNlg+8qyltSb6cmvYYkvXVlCoaWdUSbEBAw=;
        b=g+8G6rhQO9CyMVT7R6wA+Y3x/V1tkpZy/hYgiKmQq1fw+h7+C91nVv/8EdXmOpYq9g
         6zjduxZeM/8UndvlELt03+0egv1wmxzVaEXBtIkpDjb4w1sFt3xAOuosCuj7ztJVnwWQ
         ALM+POPD2UBCG80FTEDZRKGnkFUjLAjQX2ITgybM8Mfir3Nv3QmjCtpKsGVXQTKA2FWl
         lBBJx1SGnK/e5/0vrTSfeQ1wz8s2k1mpe4UqJu0Ivbjy2InTXKsYnizsys4Z6qzcrLrO
         lo2P7ZeL7nvKL5AblSPTod41KBTtRdOiURr7AdINNXbfI4P82hQBLb2yhB1tiNlAQJrG
         gbbA==
X-Gm-Message-State: APjAAAU7gKxzAWTbxXwd/gm6Bxi/RsNv3qcX8kmfhXBb3cdIQXPDDp0k
        bTyRVw9tEr6x0d+4fWfUiGDi2jGxMsw=
X-Google-Smtp-Source: APXvYqxFvZ8g+nmJEbXM+TRIpxtOL2c0PlJHE5dpQ+F89RETU/gK40/DgHWS/uu+kGXNOYdQiqWsRw==
X-Received: by 2002:aca:d9c3:: with SMTP id q186mr54583oig.53.1569964863244;
        Tue, 01 Oct 2019 14:21:03 -0700 (PDT)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com. [209.85.166.48])
        by smtp.gmail.com with ESMTPSA id b31sm4638599otc.70.2019.10.01.14.21.02
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2019 14:21:02 -0700 (PDT)
Received: by mail-io1-f48.google.com with SMTP id u8so51844640iom.5
        for <linux-clk@vger.kernel.org>; Tue, 01 Oct 2019 14:21:02 -0700 (PDT)
X-Received: by 2002:a5d:88c9:: with SMTP id i9mr221760iol.269.1569964861763;
 Tue, 01 Oct 2019 14:21:01 -0700 (PDT)
MIME-Version: 1.0
References: <20191001174439.182435-1-sboyd@kernel.org>
In-Reply-To: <20191001174439.182435-1-sboyd@kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 1 Oct 2019 14:20:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VBWuMwLOCvUK0JRsFPSvkCu2RNAa4=2g5CpsGRS--1UA@mail.gmail.com>
Message-ID: <CAD=FV=VBWuMwLOCvUK0JRsFPSvkCu2RNAa4=2g5CpsGRS--1UA@mail.gmail.com>
Subject: Re: [PATCH] clk: Don't cache errors from clk_ops::get_phase()
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Tue, Oct 1, 2019 at 10:44 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> We don't check for errors from clk_ops::get_phase() before storing away
> the result into the clk_core::phase member. This can lead to some fairly
> confusing debugfs information if these ops do return an error. Let's
> skip the store when this op fails to fix this. While we're here, move
> the locking outside of clk_core_get_phase() to simplify callers from
> the debugfs side.
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---
>
> Resending because I couldn't find this anywhere.

It was at:

https://lore.kernel.org/r/155692148370.12939.291938595926908281@swboyd.mtv.corp.google.com


> @@ -2640,14 +2640,14 @@ EXPORT_SYMBOL_GPL(clk_set_phase);
>
>  static int clk_core_get_phase(struct clk_core *core)
>  {
> -       int ret;
> +       int ret = 0;
>
> -       clk_prepare_lock();
> +       lockdep_assert_held(&prepare_lock);
>         /* Always try to update cached phase if possible */
>         if (core->ops->get_phase)
> -               core->phase = core->ops->get_phase(core->hw);
> -       ret = core->phase;
> -       clk_prepare_unlock();
> +               ret = core->ops->get_phase(core->hw);
> +       if (ret >= 0)
> +               core->phase = ret;

It doesn't matter much, but if it were me I'd add this under the "if
(core->ops->get_phase)" statement.  Then we don't keep doing a memory
write of 0 to "core->phase" all the time when "core->ops->get_phase"
isn't there.  ...plus (to me) it makes more logical sense.

I'd guess you were trying to make sure that core->phase got set to 0
like the old code did in __clk_core_init().  ...but that really
shouldn't be needed since the clk_core is initted with kzalloc().


> @@ -2661,10 +2661,16 @@ static int clk_core_get_phase(struct clk_core *core)
>   */
>  int clk_get_phase(struct clk *clk)
>  {
> +       int ret;
> +
>         if (!clk)
>                 return 0;
>
> -       return clk_core_get_phase(clk->core);
> +       clk_prepare_unlock();
> +       ret = clk_core_get_phase(clk->core);
> +       clk_prepare_unlock();

Probably the first of these two should be clk_prepare_lock() unless
you really really wanted the clock to be unlocked.


> @@ -2878,13 +2884,21 @@ static struct hlist_head *orphan_list[] = {
>  static void clk_summary_show_one(struct seq_file *s, struct clk_core *c,
>                                  int level)
>  {
> -       seq_printf(s, "%*s%-*s %7d %8d %8d %11lu %10lu %5d %6d\n",
> +       int phase;
> +
> +       seq_printf(s, "%*s%-*s %7d %8d %8d %11lu %10lu ",
>                    level * 3 + 1, "",
>                    30 - level * 3, c->name,
>                    c->enable_count, c->prepare_count, c->protect_count,
> -                  clk_core_get_rate(c), clk_core_get_accuracy(c),
> -                  clk_core_get_phase(c),
> -                  clk_core_get_scaled_duty_cycle(c, 100000));
> +                  clk_core_get_rate(c), clk_core_get_accuracy(c));
> +
> +       phase = clk_core_get_phase(c);

Don't you need a clk_prepare_lock() / clk_prepare_unlock() around this now?


> @@ -3349,10 +3366,7 @@ static int __clk_core_init(struct clk_core *core)
>          * Since a phase is by definition relative to its parent, just
>          * query the current clock phase, or just assume it's in phase.

Maybe update the comment to something like "clk_core_get_phase() will
cache the phase for us".


>          */
> -       if (core->ops->get_phase)
> -               core->phase = core->ops->get_phase(core->hw);
> -       else
> -               core->phase = 0;
> +       clk_core_get_phase(core);
