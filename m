Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D004C433EF
	for <linux-clk@archiver.kernel.org>; Sun, 26 Jun 2022 22:03:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230205AbiFZWC7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 26 Jun 2022 18:02:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229986AbiFZWC7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 26 Jun 2022 18:02:59 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AFBF2DC5
        for <linux-clk@vger.kernel.org>; Sun, 26 Jun 2022 15:02:58 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id sb34so15252917ejc.11
        for <linux-clk@vger.kernel.org>; Sun, 26 Jun 2022 15:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XfW/VwtrLWMZiQ+jQiAJFUp/vxYAvVxarx6R7M3NLzw=;
        b=NL/pTwUmJuOCKwFUHOqE5dIQcvjsKCof8imstS6QeTcl/ajghafvgi4TK9Mpw3af9H
         QzGQW3/0kVUankXisBitlqTGT8igJiJCU682miE+yE+0ut1KnabMk+ubPf9xZuXg6Xn7
         i509es9NbFjLphSLOWfCG24/f255kMPL+pck45DfXa8DbEG2nL7SCmVgnMIhmlPapOTc
         I0dhP+IkLCn4M3+gtGU7wrqc1vFsQ2gGOG4kufA9Ob8FncL+FkI/GAvqsapux9iiQAMD
         bZsrOy5AvIlMD5xx/DVv54Q4wH7wy3LgmeJZ5K6LApkvgHHR4Q1a9M0HFzK0nENY79AM
         IZtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XfW/VwtrLWMZiQ+jQiAJFUp/vxYAvVxarx6R7M3NLzw=;
        b=t3TDazr5YvCE0G5yp2zAZjUkmZoemLNsTSnHjfXHLu1a5miYjIbDdtVAIbEPorzhwh
         JDFVne1jNJqy8yHG9+VhaQsK7OPSBruIOjXBM/bhFW12m+WP8J1PoOEvJTFoUhfLO35D
         c1EDGEwU7a6jdNR/UpPjEHIN7sQfnBquMtfkVFW+hTPNYUV6xQluo1osnEnt/D5JAMG8
         jDhzEG5r8QNEuHqiottNx6bZ6FV153KhZvEFlLhTVlAvoSqovrpBGoOhNl84X813LzxL
         25EFvc/twPLWLIk3AS2kMkrUoShIBHduXMDa5D/lfhR5VEbSTI6pVBGs0WbL5boRjt7S
         eQ/Q==
X-Gm-Message-State: AJIora8QtKS0y8vMMckb96hZd/LNqcN5ZOjrgMxNGa/eGuHe3Oxon0UD
        I9BzqedAjWOsV28npY8KpzLvzyhXSyO6TBLEKCE=
X-Google-Smtp-Source: AGRyM1vKQnwhvoQofdNB0MEwK/QKGv/LjtJ95CZtJvpQ6lqMbLI4kkKCimwdLIHfgjFwNvtXilCR8wdIFzDBvw/OjBg=
X-Received: by 2002:a17:906:7386:b0:715:7024:3df7 with SMTP id
 f6-20020a170906738600b0071570243df7mr9908436ejl.543.1656280976621; Sun, 26
 Jun 2022 15:02:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220624102719.4166125-1-windhl@126.com>
In-Reply-To: <20220624102719.4166125-1-windhl@126.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Mon, 27 Jun 2022 00:02:45 +0200
Message-ID: <CAFBinCB3=JWs78oC1GrZ_JkW56np1CAVkW25uST5hhYfoXxu-A@mail.gmail.com>
Subject: Re: [PATCH] clk/meson: Hold reference returned by of_get_parent()
To:     Liang He <windhl@126.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com,
        mturquette@baylibre.com, sboyd@kernel.org, khilman@baylibre.com,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello,

thank you for submitting this patch!

On Fri, Jun 24, 2022 at 12:28 PM Liang He <windhl@126.com> wrote:
[...]
>  these bugs are compiled tested in 5.19rc2 with at91_dt_defconfig
Please note that you're changing some drivers which are only in the
arch/arm/configs/multi_v7_defconfig while others are only in
arch/arm64/configs/defconfig
I think at91_dt_defconfig will not compile any of the drivers below

[...]
> diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
> index 8f3b7a94a667..54188319f349 100644
> --- a/drivers/clk/meson/meson8b.c
> +++ b/drivers/clk/meson/meson8b.c
> @@ -3796,8 +3796,11 @@ static void __init meson8b_clkc_init_common(struct device_node *np,
>         struct clk *notifier_clk;
>         struct regmap *map;
>         int i, ret;
> +       struct device_node *tp;
This function uses reverse christmas tree sorting, so the longest line
goes on top while the shortest should stay on the bottom.
Can you please explain what "tp" stands for? Personally I would call
this variable parent_np, but maybe "tp" has a similar meaning.


Best regards,
Martin
