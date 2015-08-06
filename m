Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-pd0-f178.google.com ([209.85.192.178]:36655 "EHLO
	mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754376AbbHFL1b (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 6 Aug 2015 07:27:31 -0400
Received: by pdco4 with SMTP id o4so31376974pdc.3
        for <linux-clk@vger.kernel.org>; Thu, 06 Aug 2015 04:27:31 -0700 (PDT)
Message-ID: <1438860432.9642.1.camel@rajan.sibshivalik.com>
Subject: Re: [PATCH] clk: shmobile: div6: Fix memory leaks in
 cpg_div6_clock_init()
From: rajan <rajan.vaja@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-clk@vger.kernel.org
Date: Thu, 06 Aug 2015 16:57:12 +0530
In-Reply-To: <CAMuHMdXqn3=9PYs3nOS6sdbOFh0F4e0_rF5sXF81v-sA6ivk_A@mail.gmail.com>
References: <1438857590-9605-1-git-send-email-rajan.vaja@gmail.com>
	 <CAMuHMdXqn3=9PYs3nOS6sdbOFh0F4e0_rF5sXF81v-sA6ivk_A@mail.gmail.com>
Content-Type: multipart/mixed; boundary="=-b1xk0BWZfRto6v+3cfzw"
Mime-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--=-b1xk0BWZfRto6v+3cfzw
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

OK.

Thanks,
Rajan

--=-b1xk0BWZfRto6v+3cfzw
Content-Disposition: inline
Content-Description: Forwarded message - Re: [PATCH] clk: shmobile: div6:
 Fix memory leaks in cpg_div6_clock_init()
Content-Type: message/rfc822

Delivered-To: rajan.vaja@gmail.com
Received: by 10.202.224.133 with SMTP id x127csp934176oig; Thu, 6 Aug 2015
 04:19:18 -0700 (PDT)
X-Received: by 10.60.50.168 with SMTP id d8mr1031190oeo.41.1438859958374;
 Thu, 06 Aug 2015 04:19:18 -0700 (PDT)
Return-Path: <geert.uytterhoeven@gmail.com>
Received: from mail-oi0-x22f.google.com (mail-oi0-x22f.google.com.
 [2607:f8b0:4003:c06::22f]) by mx.google.com with ESMTPS id
 l7si295121oem.16.2015.08.06.04.19.17 (version=TLSv1.2
 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128); Thu, 06 Aug 2015 04:19:18
 -0700 (PDT)
Received-SPF: pass (google.com: domain of geert.uytterhoeven@gmail.com
 designates 2607:f8b0:4003:c06::22f as permitted sender)
 client-ip=2607:f8b0:4003:c06::22f;
Authentication-Results: mx.google.com; spf=pass (google.com: domain of
 geert.uytterhoeven@gmail.com designates 2607:f8b0:4003:c06::22f as
 permitted sender) smtp.mail=geert.uytterhoeven@gmail.com; dkim=pass
 header.i=@gmail.com
Received: by mail-oi0-x22f.google.com with SMTP id n130so11290453oih.2;
 Thu, 06 Aug 2015 04:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com;
 s=20120113;
 h=mime-version:sender:in-reply-to:references:date:message-id:subject
 :from:to:cc:content-type; bh=s+eTLw52bMgnroQowOrhyoouPuyojSW6nskB2iN+xKw=;
 b=kpJOcCh8S/CcFx0zatjSljzRCnK9Q/1LMHFqdH7fq+1HNrUCgb/VnB6iaf/mmBiSOQ
 blY38Zjnllq3kUlXohitdsgDGmSZnTCah7fDf8DYpt7Ycx956WemFAJ1dwrj8Qu1hXJM
 VBjddRqgy/vkSlfXNrDIs/0TBcNmdbrP3/GjHFtjD4k31WjHHbRX8AG5WsuVLOAD0RJS
 uNKxvXV7fDr8ky82QZcwgrWxxsA9hHX4THB1JIuKHdRsO39GsgV9cJ58WaYoE5T9hQ28
 8U8SzqMZEHGSIeKpJeGd048WSb/FLwUFpQtlcCrVTEnLWse7fGNzwt8z3qtxI3x2w6sC tRgA==
MIME-Version: 1.0
X-Received: by 10.202.90.5 with SMTP id o5mr940326oib.79.1438859957655;
 Thu, 06 Aug 2015 04:19:17 -0700 (PDT)
Sender: geert.uytterhoeven@gmail.com
Received: by 10.60.168.75 with HTTP; Thu, 6 Aug 2015 04:19:17 -0700 (PDT)
In-Reply-To: <1438857590-9605-1-git-send-email-rajan.vaja@gmail.com>
References: <1438857590-9605-1-git-send-email-rajan.vaja@gmail.com>
Date: Thu, 6 Aug 2015 13:19:17 +0200
X-Google-Sender-Auth: 5mlmNJRuc_m13diN93gLGPkpHA0
Message-ID: <CAMuHMdXqn3=9PYs3nOS6sdbOFh0F4e0_rF5sXF81v-sA6ivk_A@mail.gmail.com>
Subject: Re: [PATCH] clk: shmobile: div6: Fix memory leaks in
 cpg_div6_clock_init()
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Rajan Vaja <rajan.vaja@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,  Ulrich Hecht
 <ulrich.hecht+renesas@gmail.com>,  Wolfram Sang
 <wsa+renesas@sang-engineering.com>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Thu, Aug 6, 2015 at 12:39 PM, Rajan Vaja <rajan.vaja@gmail.com> wrote:
> Found memory leak while doing static analysis with cppcheck:
> [drivers/clk/shmobile/clk-div6.c:194]: (error) Memory leak: clock
>
> This patch fixes this memory leak as well other memory leaks found
> in same function.

We didn't bother adding those, as the system is completely busted if any of
these error paths are taken.

> Signed-off-by: Rajan Vaja <rajan.vaja@gmail.com>
> ---
>  drivers/clk/shmobile/clk-div6.c |    8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/shmobile/clk-div6.c b/drivers/clk/shmobile/clk-div6.c
> index 036a692..9affdfa 100644
> --- a/drivers/clk/shmobile/clk-div6.c
> +++ b/drivers/clk/shmobile/clk-div6.c
> @@ -191,6 +191,7 @@ static void __init cpg_div6_clock_init(struct device_node *np)
>         if (num_parents < 1) {
>                 pr_err("%s: no parent found for %s DIV6 clock\n",
>                        __func__, np->name);
> +               kfree(clock);
>                 return;
>         }
>
> @@ -198,8 +199,12 @@ static void __init cpg_div6_clock_init(struct device_node *np)
>                 GFP_KERNEL);
>         parent_names = kmalloc_array(num_parents, sizeof(*parent_names),
>                                 GFP_KERNEL);
> -       if (!parent_names)
> +       if (!clock->parents || !parent_names) {
> +               kfree(clock->parents);
> +               kfree(parent_names);
> +               kfree(clock);
>                 return;
> +       }
>
>         /* Remap the clock register and read the divisor. Disabling the
>          * clock overwrites the divisor, so we need to cache its value for the
> @@ -278,6 +283,7 @@ static void __init cpg_div6_clock_init(struct device_node *np)
>  error:
>         if (clock->reg)
>                 iounmap(clock->reg);
> +       kfree(clock->parents);
>         kfree(parent_names);
>         kfree(clock);
>  }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

--=-b1xk0BWZfRto6v+3cfzw--

