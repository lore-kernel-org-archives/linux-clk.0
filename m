Return-Path: <SRS0=q34n=U2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7178C48BD6
	for <linux-clk@archiver.kernel.org>; Thu, 27 Jun 2019 15:34:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8BB242146E
	for <linux-clk@archiver.kernel.org>; Thu, 27 Jun 2019 15:34:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbfF0Pe0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Jun 2019 11:34:26 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:43069 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726506AbfF0Pe0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Jun 2019 11:34:26 -0400
Received: by mail-oi1-f195.google.com with SMTP id w79so1875051oif.10
        for <linux-clk@vger.kernel.org>; Thu, 27 Jun 2019 08:34:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oFbMfBYeaLKlhTqvQGiwOcE96tiMpSTCWtMG1/gEUaY=;
        b=UXbB//xlym7JCjSz99ldR7NTUqZFtUqP7nxO8lDomMbky607uL+bmncBRh0CHrcJvN
         Mv9rSlDfSAyyrcP8SruS7cFQyVSdBuSRSXw9j/G2Bq4ArNxcsb2uG8NWg4PjlT8M3XHt
         NpsCD13cbNCBueTkL94/0ne5O4ZnB9+ywrhdMkFV7a7+WyL59dNP/dCzXQJ/yABulhH8
         p1u+9sgZTZPO6pb4V7CLRLP+E/5UId0Wk9eiMHhZ8xzW+qXPbm/Ra7Cqd11ByeYg5zNj
         TzyN59wNqbewltzmi/GSSqGKGNJG8LaKhPEJRWo6F9ywadgBEDiGmO4xXAlz5q/oUfPo
         xYuQ==
X-Gm-Message-State: APjAAAUzH24ThCbFLMCzJRtVXrI68xmsVM5icBmIo68/UNLx7La2bVpw
        81gkGBd+N8BFqf5FqvSW+df3tK24LPYeBnHPMos=
X-Google-Smtp-Source: APXvYqyBJFVgH2hPYgiDr4NuGy+Mt3H0uRDFop6WEKLlnnxAIFRJogNDd05ZjfKmohuv2LqyQ036224+I/XwGTJaZqA=
X-Received: by 2002:aca:338a:: with SMTP id z132mr2753780oiz.54.1561649665440;
 Thu, 27 Jun 2019 08:34:25 -0700 (PDT)
MIME-Version: 1.0
References: <35dca44e929f49c7a00125bf18c3455198d4e18e.1561648504.git.leonard.crestez@nxp.com>
In-Reply-To: <35dca44e929f49c7a00125bf18c3455198d4e18e.1561648504.git.leonard.crestez@nxp.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 27 Jun 2019 17:34:14 +0200
Message-ID: <CAMuHMdWCJW_=9r1QndJeydFGaOAAe0pZrcC0xiAnY+iH8atENA@mail.gmail.com>
Subject: Re: [PATCH] clk: Add clk_min/max_rate entries in debugfs
To:     Leonard Crestez <leonard.crestez@nxp.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Leonard,

On Thu, Jun 27, 2019 at 5:22 PM Leonard Crestez <leonard.crestez@nxp.com> wrote:
> Add two files to expose min/max clk rates as determined by
> clk_core_get_boundaries, taking all consumer requests into account.
>
> This information does not appear to be otherwise exposed to userspace.
>
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>

Thanks for your patch!

> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -3031,10 +3031,34 @@ static int clk_duty_cycle_show(struct seq_file *s, void *data)
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
> +       clk_core_get_boundaries(core, &min_rate, &max_rate);

Probably you should clk_prepare_lock() first?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
