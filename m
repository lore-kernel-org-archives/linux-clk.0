Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD04EC8740
	for <linux-clk@archiver.kernel.org>; Thu,  7 Sep 2023 15:46:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233539AbjIGPqe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Sep 2023 11:46:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345267AbjIGPfU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Sep 2023 11:35:20 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34CA019A9
        for <linux-clk@vger.kernel.org>; Thu,  7 Sep 2023 08:34:48 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-41243a67b62so7589031cf.2
        for <linux-clk@vger.kernel.org>; Thu, 07 Sep 2023 08:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694100861; x=1694705661; darn=vger.kernel.org;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J4f41YsSBkx4jVRvXl4Nds903quY9STr5t2ZITBPCIU=;
        b=nsMIyEiOaMsnXomT7dWhGFrzfRtEtzoYXfHty3h91rCWI7rflvE+onrs5i3xYe1EoI
         3oKz0Q0zaIB57Eevc60gSShNQcGVopom2RtjCPF8gqg/CZtTlXn378Kj4lBJblOSidyP
         6gZoOtBs7T+enTc4YiD3GHPupmU/R9Puq7GMMOSyo/kE7Fj1N10jw0rMqFeiTSvVLOuG
         obruvCZ2fZS0dkiZN1IboSYLd+U5jvXqs7CvxRyY+YpticTdGURLC7ZeqospMByViHXB
         2fur6G7QVprDss3RXXXOzWlVIdhbyU7bVLTdubMJl1Kg3yz6iOd/QI1qFJoK5e4k1V5U
         nt0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694100861; x=1694705661;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J4f41YsSBkx4jVRvXl4Nds903quY9STr5t2ZITBPCIU=;
        b=BE9BSNaja3T4mrjRRRPELyJPLsOQ098q3kLsb2hVY+Tb8JeUCwNPvNyMjiPqeLYLJr
         gP08UagGmaZNrXqagO2//fV5zmUhrGsAKnnSHmsbn80EuP4WI/GQ9vgBTbM1iPHJaiFa
         WAjxR/sxTbCqOAHGfPw+W2k/a53mFy+cv4xFjyBuWEjeu/7fU0SyTNoEbfoG25o87d2C
         fptPoqM6oBI/rFPUG3vtz5q8+CR79LIvv/DKw4h4jesfRLORcZNa19zxGJX8byUZr2Ey
         ngJQh46K4J1ueSbiUsDyKqhztr76v5YxMY6A3RAZVmUvl+FnnkHdrLEGKEI7BsLHn/Ih
         /nVg==
X-Gm-Message-State: AOJu0YzrwTclNJw8nyKFfoBW+0CEAziixqmjrSV4xuFp68YAIz8PH8Zz
        Rd8adIazmMz6ZIqwh6H99Okw59rXvafc86OGoM8WVJ0ETvQsbA==
X-Received: by 2002:ac8:4f0d:0:b0:411:ffe7:ece8 with SMTP id
 b13-20020ac84f0d000000b00411ffe7ece8mt18686628qte.14.1694096172656; Thu, 07
 Sep 2023 07:16:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230822134849.3352329-1-alessandro.carminati@gmail.com>
In-Reply-To: <20230822134849.3352329-1-alessandro.carminati@gmail.com>
From:   Alessandro Carminati <alessandro.carminati@gmail.com>
Date:   Thu, 7 Sep 2023 16:15:36 +0200
Message-ID: <CAPp5cGTshQJ3aLeLqv=CbaVeg9GnK_k9nsoaWrBKs1dcXzNZow@mail.gmail.com>
Subject: Re: [PATCH] Sanitize possible_parent_show to Handle Return Value of of_clk_get_parent_name
Cc:     Philip Daly <pdaly@redhat.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

this is a gentle ping

thank you
Alessandro Carminati

Il giorno mar 22 ago 2023 alle ore 15:49 Alessandro Carminati
<alessandro.carminati@gmail.com> ha scritto:
>
> In the possible_parent_show function, ensure proper handling of the return
> value from of_clk_get_parent_name to prevent potential issues arising from
> a NULL return.
> The current implementation invokes seq_puts directly on the result of
> of_clk_get_parent_name without verifying the return value, which can lead
> to kernel panic if the function returns NULL.
>
> This patch addresses the concern by introducing a check on the return
> value of of_clk_get_parent_name. If the return value is not NULL, the
> function proceeds to call seq_puts, providing the returned value as
> argument.
> However, if of_clk_get_parent_name returns NULL, the function provides a
> static string as argument, avoiding the panic.
>
> Reported-by: Philip Daly <pdaly@redhat.com>
> Signed-off-by: Alessandro Carminati (Red Hat) <alessandro.carminati@gmail.com>
> ---
>  drivers/clk/clk.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index c249f9791ae8..ab999644e185 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -3416,6 +3416,7 @@ static void possible_parent_show(struct seq_file *s, struct clk_core *core,
>                                  unsigned int i, char terminator)
>  {
>         struct clk_core *parent;
> +       const char *tmp;
>
>         /*
>          * Go through the following options to fetch a parent's name.
> @@ -3436,12 +3437,12 @@ static void possible_parent_show(struct seq_file *s, struct clk_core *core,
>                 seq_puts(s, core->parents[i].name);
>         else if (core->parents[i].fw_name)
>                 seq_printf(s, "<%s>(fw)", core->parents[i].fw_name);
> -       else if (core->parents[i].index >= 0)
> -               seq_puts(s,
> -                        of_clk_get_parent_name(core->of_node,
> -                                               core->parents[i].index));
> -       else
> +       else if (core->parents[i].index >= 0) {
> +               tmp = of_clk_get_parent_name(core->of_node, core->parents[i].index);
> +               seq_puts(s, tmp ? tmp : "(none)");
> +       } else {
>                 seq_puts(s, "(missing)");
> +       }
>
>         seq_putc(s, terminator);
>  }
> --
> 2.34.1
>
