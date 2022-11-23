Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D3C7C4332F
	for <linux-clk@archiver.kernel.org>; Wed, 23 Nov 2022 07:47:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236148AbiKWHr3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Nov 2022 02:47:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235978AbiKWHrZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Nov 2022 02:47:25 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D68B2FA71A
        for <linux-clk@vger.kernel.org>; Tue, 22 Nov 2022 23:47:23 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id ud5so40875439ejc.4
        for <linux-clk@vger.kernel.org>; Tue, 22 Nov 2022 23:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UEcPvC0veko8ckCQ5xSU4HwVhDKVe2LDCl6nmVZjKyw=;
        b=AROXWoilYo1+FcY44eeAnnezmH5yc7R8adzgIrMxsFshPsY+cbBcfFjExiKTDLxnYu
         M+lxmPWDPwnuKr4CG6ydIjyW/GKvWVyxO07LMQDMvo0w2byta7ExfOYsibdnJdKJgLjX
         DRiCMxCt5ElJf8+yk4+uroTNZQ1WeD2CfizKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UEcPvC0veko8ckCQ5xSU4HwVhDKVe2LDCl6nmVZjKyw=;
        b=0pPd9vws02jryZ9x0jTBpg7rqENA2FKJEBCuCySSQtxJzQ6AnHYgi8P7uV8s8y7DsL
         kjIvZoHoZMpcmeuU6W2H+YR8jdmsuvfnjd9DtPoCMhDiucsfA1PFdyMaINcsoZ+X7osG
         3FE/f6NOk9BlQN5IjPnmZxUaMxP3+m1vBlLQmaCxaQVn9IQznHtH2OOK+TZ4GIG/w7LT
         VAEkCx8IaqNNQ0wrOMXSGzKChr2DYJ0F9WLmKRUkH/t7hWN38vbuJWeTAfuhgO25zDbU
         ldMoVTAI1/ctVnVFsxgZ8HMPTPITlMyKGpa7e1N8+Bqtb8AE38QUtSBFsLU1qvgC9X7G
         xnyA==
X-Gm-Message-State: ANoB5pnQs8CF1PHq99wlNymZmQA5ErtphI6JoqvYQa+nWwEZSpcAFAEI
        yd8vv/Kj5zJ0NvyBxTHH0texEbTDRVqXZtU6vOYRaA==
X-Google-Smtp-Source: AA0mqf61b9+K6zJAJAAeDkaPTJn4RABsbvs+y1velXsRcRDW2ibDy/5YQmyvylwetcLMAFhoge1djFKeAUGBuggCWio=
X-Received: by 2002:a17:906:32d9:b0:7ae:31a0:5727 with SMTP id
 k25-20020a17090632d900b007ae31a05727mr6743445ejk.540.1669189642132; Tue, 22
 Nov 2022 23:47:22 -0800 (PST)
MIME-Version: 1.0
References: <20221113180945.1626061-1-dario.binacchi@amarulasolutions.com> <Y3vPQ4A/hjYHs8vD@linaro.org>
In-Reply-To: <Y3vPQ4A/hjYHs8vD@linaro.org>
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date:   Wed, 23 Nov 2022 08:47:11 +0100
Message-ID: <CABGWkvp+Z91uAbegJS2Tfk41O7j+JQ18RAmFoK-MSApHRpEBpQ@mail.gmail.com>
Subject: Re: [PATCH] clk: imx: DRY cleanup of imx_obtain_fixed_clock_hw()
To:     Abel Vesa <abel.vesa@linaro.org>
Cc:     linux-kernel@vger.kernel.org, michael@amarulasolutions.com,
        Amarula patchwork <linux-amarula@amarulasolutions.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Abel,

On Mon, Nov 21, 2022 at 8:19 PM Abel Vesa <abel.vesa@linaro.org> wrote:
>
> On 22-11-13 19:09:44, Dario Binacchi wrote:
> > The imx_obtain_fixed_clock() and imx_obtain_fixed_clock_hw() functions
> > behave pretty similarly, DRY and call one from another.
> >
> > No functional changes intended.
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >
> > ---
> >
> >  drivers/clk/imx/clk.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/drivers/clk/imx/clk.c b/drivers/clk/imx/clk.c
> > index 5582f18dd632..573b1a6ca1dc 100644
> > --- a/drivers/clk/imx/clk.c
> > +++ b/drivers/clk/imx/clk.c
> > @@ -104,9 +104,7 @@ struct clk_hw *imx_obtain_fixed_clock_hw(
> >  {
> >       struct clk *clk;
> >
> > -     clk = imx_obtain_fixed_clock_from_dt(name);
> > -     if (IS_ERR(clk))
> > -             clk = imx_clk_fixed(name, rate);
> > +     clk = imx_obtain_fixed_clock(name, rate);
>
> NACK here. You're switching to a non "clk_hw" based variant that
> should/would be removed in the near future.
>
> In the future, we want the clock providers to not used "clk" based APIs.
>
> Rule is, AFAIR, to use "clk" based APIs in clock consumer drivers only,
> while using "clk_hw" based APIs in clock provider drivers only.
>
> Right now, only the imx5 and vf610 clock provider drivers still use the
> 'clk' based API. Once those are switched to 'clk_hw' based, all the 'clk'
> i.MX specific APIs will be removed for good.

Thanks for your explanations.

Best regards,

Dario

>
> >       return __clk_get_hw(clk);
> >  }
> >
> > --
> > 2.32.0
> >



-- 

Dario Binacchi

Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
