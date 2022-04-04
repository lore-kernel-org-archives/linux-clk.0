Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A924BC433F5
	for <linux-clk@archiver.kernel.org>; Mon,  4 Apr 2022 10:16:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234078AbiDDKSB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 4 Apr 2022 06:18:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240712AbiDDKSB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 4 Apr 2022 06:18:01 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40BE63C709
        for <linux-clk@vger.kernel.org>; Mon,  4 Apr 2022 03:16:05 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id b43so12148397ljr.10
        for <linux-clk@vger.kernel.org>; Mon, 04 Apr 2022 03:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RW97g66jMMqWl9IXimhumbEyK0WqJKyRD2XVp7wquiE=;
        b=iIciZQ9DiSMbLFGM+f0yAHgT1G6e3xYvIFfnuJtGr7OMf7jrpka04VhC6xPygmq8Zf
         9k800BsKxfF7M+3NZ7sPRFPl2IMb47iMuLl5+4v0SKvc52cEEa1JgNsbaOlhSftXKOxc
         o1pz7rp2tk0TjM9OvjY84JbKPMMvY/ky/I4R4+qOq8ygMBndlz7hmEVO2GUd6HWWwcHE
         mTBbrCVYHrtuviAn/xAZkiqjX9Kb2E5/xHxzKUnuWNU1YUaVgNiMoTApQYmZok7YfRGd
         BdidMI99PTDkx8FNdkNH+ivmQnXn9vRNPF4Enu3/UA8DVDHyPyTRfu6IIaoqplnLjRkz
         Tbgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RW97g66jMMqWl9IXimhumbEyK0WqJKyRD2XVp7wquiE=;
        b=Nk9ru0kGMP25dhvaIURNZm9yQLr8RyfoqwYIeMPrg32wU5I7ObJ4hOce85FwJn706H
         q0PUPAyRZO2zbr2x2DUP/quDf0dC0B/LCEwGH77CTRyrdB/WrOUZK5fucod6bH5lM4lT
         sV/yYQN+ou5A0W/MMhwE2no49qryyPnyAPQKzcY8+wTXYuPUt8dMGFv90yKO08Yuga4h
         dUtcPQYsQmM/FYDCHvqlROigy8KWfwQBFk5WtKwQwYxtvvAhf1clRSKmbRNefEwETJ0Q
         Z++HpdhaAckNKHqOUJC77I+CL9xVgm/GQWhReKiYh0FXh5sanvLm3T+aYZPk75O0YcD+
         Qgtw==
X-Gm-Message-State: AOAM5321V/o//moC2Ui27Rrs62Ac8kpXC1QkVsFPdmIeEIuINpZakSpa
        5Voh/fk+3RDwLNCB0fuS9h75RiKFpXKcL1Z8i772fw==
X-Google-Smtp-Source: ABdhPJyWbNpjO8lOJ1OkFl5H9DNrkpo1qoOQHewMtgOEP/x9/DNbUTeMBI7wzyIFMVQm5h4iHoL5Czc755lbuhTVRpU=
X-Received: by 2002:a2e:9048:0:b0:249:78bb:375e with SMTP id
 n8-20020a2e9048000000b0024978bb375emr21293757ljg.229.1649067363479; Mon, 04
 Apr 2022 03:16:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220319225156.1451636-1-linus.walleij@linaro.org>
In-Reply-To: <20220319225156.1451636-1-linus.walleij@linaro.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 4 Apr 2022 12:15:27 +0200
Message-ID: <CAPDyKFqpND5Z+XPoWQBkNbsuSWvbHhN1NC_7y+x=rkiuBRe6Ug@mail.gmail.com>
Subject: Re: [PATCH 0/5 v2] U8500 clkout clocks v2
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, 19 Mar 2022 at 23:53, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This second iteration adds patches that:
>
> - Drops custom .is_enabled and .is_prepared implementations
>   for the U8500 PRCMU clocks.
> - Rewrite the PRCMU clocks to use clk_hw
> - Then adds the new clkout clocks in the same style
>
> Modernizing the PRCMU clock was necessary so the new clock
> would not look off.
>
> We can go on and fix the rest of the ux500 clocks to use
> clk_hw style registration on top of this series if there
> is desire.
>
> Linus Walleij (5):
>   dt-bindings: clock: u8500: Add clkout clock bindings
>   clk: ux500: Drop .is_enabled state from PRCMU clocks
>   clk: ux500: Drop .is_prepared state from PRCMU clocks
>   clk: ux500: Rewrite PRCMU clocks to use clk_hw_*
>   clk: ux500: Implement the missing CLKOUT clocks
>
>  .../bindings/clock/stericsson,u8500-clks.yaml |  57 +++
>  drivers/clk/ux500/clk-prcmu.c                 | 253 ++++++++-----
>  drivers/clk/ux500/clk.h                       |  70 ++--
>  drivers/clk/ux500/u8500_of_clk.c              | 349 ++++++++++--------
>  include/dt-bindings/clock/ste-db8500-clkout.h |  17 +
>  5 files changed, 464 insertions(+), 282 deletions(-)
>  create mode 100644 include/dt-bindings/clock/ste-db8500-clkout.h
>

For the series (besides the minor nitpick at patch5):

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe
