Return-Path: <SRS0=818c=2I=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE905C43603
	for <linux-clk@archiver.kernel.org>; Wed, 18 Dec 2019 14:29:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C24BB218AC
	for <linux-clk@archiver.kernel.org>; Wed, 18 Dec 2019 14:29:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HuS/e4+D"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727025AbfLRO3G (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Dec 2019 09:29:06 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:34365 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726856AbfLRO3G (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Dec 2019 09:29:06 -0500
Received: by mail-vs1-f66.google.com with SMTP id g15so1515423vsf.1
        for <linux-clk@vger.kernel.org>; Wed, 18 Dec 2019 06:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rF1lzaN7ZtNimtu61xWEihnpnMw5Eewhqv540/+iG/c=;
        b=HuS/e4+DbERHT1ZptlDgDYMveeq5qW4njVvNnvdu3AIW9YJuS0UqrDW8/29V5fYhZc
         0c833qkXiZrwtZ300ExLFlpqRc/UWvHZK5/fid5ZeAAvE/9T2htuW8Ni4NOTC0lYNfBC
         rvHiw1jj/OMslpQ14f8Do8b7pJ96sc0MusWnbhlX6ec7LXBp7to/A5qzoGyGMKIgGvJg
         lkBB9x0/HvBhmHoS3T6pJhL7RyKKZawrybGZ60yGZiL6lATxhreOsdlWt+rtg75NqruX
         5obypk+f7/HVv4TDFDtlHtR/OGEpyo0kqa/2HWcsh8SS4RxNpzCua3DIIZ5do+xzdG81
         /yVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rF1lzaN7ZtNimtu61xWEihnpnMw5Eewhqv540/+iG/c=;
        b=lSSzS06/Jf+0KEhctWAwd45sqabrclWxmqsSWA7fD6Yblk69/E9yk/sMpo9ijavArj
         Sy59HfR3iiw2sW8pK1QiZOzokumgNUdeHeGUInZL+dgI9Rc8H+B20q9qN9mhIHamw5Xq
         lntVHdXo6EHOfpNwfdbkZxXVzgWAj/e3xeYwLWqPt/9+gq8Qj/LZrDYB2lcPyB1tzqLJ
         VJWwb09GJSZdKo6jgMGCKAcqCLh2AwYrVqhZxKlWe2LoZkOhfo9FijygbK2vH5FKoBtR
         DP5akrcepNR8htM6USjCFMeGCJz+8Z4Yyxyy+QfYPP5UkD6wCJnHeaBO6BCcorzGehjU
         LcjQ==
X-Gm-Message-State: APjAAAWEx73NrANzkELfM++d4uOuQrYnp2FCw+9ow8aoO8UW1gYzV2VJ
        G/t8mQ829a1AcWrOeIjJoluTpcJhJ3dxBZ3n/h/bQQ==
X-Google-Smtp-Source: APXvYqzPLbRwCLND4lK2HKlgi2pzXF6lNDTSHtd1sjTaObLPyxjIh1SMVpXd4PlETuVb/d4buGHIdDokPHJwIaH7xLY=
X-Received: by 2002:a67:b649:: with SMTP id e9mr1630768vsm.34.1576679345323;
 Wed, 18 Dec 2019 06:29:05 -0800 (PST)
MIME-Version: 1.0
References: <20191217210504.27888-1-linus.walleij@linaro.org>
In-Reply-To: <20191217210504.27888-1-linus.walleij@linaro.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 18 Dec 2019 15:28:28 +0100
Message-ID: <CAPDyKFpHTh=-KAOqqSaXy-z2s5cNSOdGKJfP9Vk7uD39D=fUOQ@mail.gmail.com>
Subject: Re: [PATCH] clk: ux500: Fix up the SGA clock for some variants
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 17 Dec 2019 at 22:05, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Some of the special PRCMU firmware variants were not
> properly detected in the Ux500 clock driver, resulting
> in the wrong clock for the SGA.
>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/clk/ux500/u8500_of_clk.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clk/ux500/u8500_of_clk.c b/drivers/clk/ux500/u8500_of_clk.c
> index 72ed97c6662a..0aedd42fad52 100644
> --- a/drivers/clk/ux500/u8500_of_clk.c
> +++ b/drivers/clk/ux500/u8500_of_clk.c
> @@ -99,8 +99,10 @@ static void u8500_clk_init(struct device_node *np)
>         if (fw_version != NULL) {
>                 switch (fw_version->project) {
>                 case PRCMU_FW_PROJECT_U8500_C2:
> +               case PRCMU_FW_PROJECT_U8500_MBL:
>                 case PRCMU_FW_PROJECT_U8520:
>                 case PRCMU_FW_PROJECT_U8420:
> +               case PRCMU_FW_PROJECT_U8420_SYSCLK:
>                         sgaclk_parent = "soc0_pll";
>                         break;
>                 default:
> --
> 2.21.0
>
