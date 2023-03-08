Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BF1CC64EC4
	for <linux-clk@archiver.kernel.org>; Wed,  8 Mar 2023 20:36:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbjCHUgM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Mar 2023 15:36:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229941AbjCHUgL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Mar 2023 15:36:11 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD8FAC9A54
        for <linux-clk@vger.kernel.org>; Wed,  8 Mar 2023 12:35:44 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id h17-20020a17090aea9100b0023739b10792so59356pjz.1
        for <linux-clk@vger.kernel.org>; Wed, 08 Mar 2023 12:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678307744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xb3oXL/582pA/8xkedQpp0d04qUqIawwKO53Qn/8m1w=;
        b=gJ5rbHxi/B0bqOQnKay63aFibmzKUa8nEOG2XWBQHh6lfedaEagtMEoAUPZv79vl6j
         NRKcYQxlEiORecnQphxZm2xyKWhWqtQf/8aD3GP5aK6A6ZeQhgTptGySneyJAoDGfmnA
         TGOh6oDNo52qqH0f1xGDnh0LSXe+7KCLgLqAevu+IQE90QRfjiO6q6WHa1oDQeBbbjJy
         ZGP7FIBTu+ZC1eWCjAAt8nAirvElhq4RZbIHxi+i5JD1aRFi6FDRpg/sV0tT83cLYyGD
         D3mA+exSObhnhXeqDlia3plR6HgIwECtlzrKOdsTp3wvvjj4Vns32exzmUmqqmqwneeY
         Ol2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678307744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xb3oXL/582pA/8xkedQpp0d04qUqIawwKO53Qn/8m1w=;
        b=y79tBpZNWqhRTaM3p9P6bJDbKOXeJY1E1GodRYohwIVYeaaMoLNdz4zX7I5YO7W1zV
         u8GSU+dD/9BYBlELy5IOClR8ezp3T0nK//8Cc/KcsGRs/93M9bMbvJ+y6y1yBQsKtUb9
         Gh72AFAubA1+13oN91wDzgiQt4IZib0m2a2wLqDbSyYcvjrtG9YGaR1+YwDyHICUQEAI
         /3wyIDX++BTBBRgr3s/vgfEnsKTDEkgL6OIOojrCAyw+h6cFOfGw4pdETa+78Onv88Pz
         OEt1s/j0K/GDTDx3XFJXxuYmiAOAtBjf3h4kt7BNw8U2Di7HKnzi+HCQV9HGzz/XeZWM
         KvJg==
X-Gm-Message-State: AO0yUKUt7+TyHS8z0xZyNdmOY0Jh8wXis6YjD8h89GdacP2ubJd/IFyZ
        4M15YzlkcyY6YRn5f1YbZkz/7N2WxHSQ9vT2tweGgw==
X-Google-Smtp-Source: AK7set9I/RIVkOIbZ4hE7+iXxtoC2iLTaQTWzwpVeG4RLK48BT44yU4/UX6KNxuISfGHjZ+wetbJ3bcAMqgnEaZakl4=
X-Received: by 2002:a17:903:48b:b0:19a:fdca:e405 with SMTP id
 jj11-20020a170903048b00b0019afdcae405mr7856731plb.10.1678307743998; Wed, 08
 Mar 2023 12:35:43 -0800 (PST)
MIME-Version: 1.0
References: <20230302014639.297514-1-saravanak@google.com> <CACRpkdacG4yxtZqwG5hKRY_8nY9qWeNPb-ZttMCnFH7ojZ3kCA@mail.gmail.com>
 <CAGETcx-W3o=rQoVLnKkvk=oTAMiwEcqAZ_trcMPBuune-7Hoiw@mail.gmail.com>
 <32edd2dd9557b7e3debbd8f1bccccd8d.sboyd@kernel.org> <20230308160140.GA2347814@dev-arch.thelio-3990X>
In-Reply-To: <20230308160140.GA2347814@dev-arch.thelio-3990X>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 8 Mar 2023 12:35:07 -0800
Message-ID: <CAGETcx-mHPrBamtX7=+3wHjXprrngnsVoMnBAp_jehByZO64pw@mail.gmail.com>
Subject: Re: [PATCH v2] clk: Mark a fwnode as initialized when using
 CLK_OF_DECLARE() macro
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel-team@android.com, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Mar 8, 2023 at 8:01=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> On Mon, Mar 06, 2023 at 11:15:54AM -0800, Stephen Boyd wrote:
> > Quoting Saravana Kannan (2023-03-03 13:24:00)
> > > On Thu, Mar 2, 2023 at 5:14=E2=80=AFAM Linus Walleij <linus.walleij@l=
inaro.org> wrote:
> > > >
> > > > Works like a charm on U8500!
> > > > Tested-by: Linus Walleij <linus.walleij@linaro.org>
> > > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > >
> > > Stephen, Does this look good? Can we have Greg pull this in?
> > >
> >
> > I picked it up for fixes. Will send it off later this week.
>
> This change causes a build regression:
>
>   drivers/clk/mvebu/kirkwood.c:358:1: error: expected identifier or '('
>   CLK_OF_DECLARE(98dx1135_clk, "marvell,mv98dx1135-core-clock",
>   ^
>   include/linux/clk-provider.h:1367:21: note: expanded from macro 'CLK_OF=
_DECLARE'
>           static void __init name##_of_clk_init_declare(struct device_nod=
e *np) \
>                              ^
>   <scratch space>:124:1: note: expanded from here
>   98dx1135_clk_of_clk_init_declare
>   ^
>   drivers/clk/mvebu/kirkwood.c:358:1: error: invalid digit 'd' in decimal=
 constant
>   include/linux/clk-provider.h:1372:34: note: expanded from macro 'CLK_OF=
_DECLARE'
>           OF_DECLARE_1(clk, name, compat, name##_of_clk_init_declare)
>                                           ^
>   <scratch space>:125:3: note: expanded from here
>   98dx1135_clk_of_clk_init_declare
>     ^
>   drivers/clk/mvebu/kirkwood.c:358:1: error: invalid digit 'd' in decimal=
 constant
>   include/linux/clk-provider.h:1372:34: note: expanded from macro 'CLK_OF=
_DECLARE'
>           OF_DECLARE_1(clk, name, compat, name##_of_clk_init_declare)
>                                           ^
>   <scratch space>:125:3: note: expanded from here
>   98dx1135_clk_of_clk_init_declare
>     ^
>   drivers/clk/mvebu/kirkwood.c:358:1: error: invalid digit 'd' in decimal=
 constant
>   include/linux/clk-provider.h:1372:34: note: expanded from macro 'CLK_OF=
_DECLARE'
>           OF_DECLARE_1(clk, name, compat, name##_of_clk_init_declare)
>                                           ^
>   <scratch space>:125:3: note: expanded from here
>   98dx1135_clk_of_clk_init_declare
>     ^
>   4 errors generated.
>
> The clock's name starts with a number, resulting in an invalid C
> function name. Are clock names ABI? Should this be fixed by adjusting
> the name like so or adjusting where the name appears in the function
> defined by CLK_OF_DECLARE()?
>

Not sure if the name matters, but it's just simpler to fix the macro
than add churn to all those drivers. Can you send a patch that just
adds __ in the front of the function name in the macro please?

Thanks,
Saravana

> diff --git a/drivers/clk/mvebu/kirkwood.c b/drivers/clk/mvebu/kirkwood.c
> index 8bc893df4736..5d0a7e3bfde5 100644
> --- a/drivers/clk/mvebu/kirkwood.c
> +++ b/drivers/clk/mvebu/kirkwood.c
> @@ -355,5 +355,5 @@ CLK_OF_DECLARE(kirkwood_clk, "marvell,kirkwood-core-c=
lock",
>                kirkwood_clk_init);
>  CLK_OF_DECLARE(mv88f6180_clk, "marvell,mv88f6180-core-clock",
>                kirkwood_clk_init);
> -CLK_OF_DECLARE(98dx1135_clk, "marvell,mv98dx1135-core-clock",
> +CLK_OF_DECLARE(mv98dx1135_clk, "marvell,mv98dx1135-core-clock",
>                kirkwood_clk_init);
>
> Cheers,
> Nathan
