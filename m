Return-Path: <SRS0=a4+1=V6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7D80C19759
	for <linux-clk@archiver.kernel.org>; Fri,  2 Aug 2019 01:57:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A32D320644
	for <linux-clk@archiver.kernel.org>; Fri,  2 Aug 2019 01:57:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F2qLX44K"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730600AbfHBB5g (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Aug 2019 21:57:36 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:46161 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbfHBB5g (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Aug 2019 21:57:36 -0400
Received: by mail-ed1-f68.google.com with SMTP id d4so70963626edr.13
        for <linux-clk@vger.kernel.org>; Thu, 01 Aug 2019 18:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kyPBhKH/JgTHErOVcN8NhRHLlMlXK7f8NN0qYPv8WHI=;
        b=F2qLX44KQctEuLWgZww4TNBRYWqTtnTDIO5Dg5012NhBBHDJzF5pJD0dSEknzA+5pO
         fgA5twiJtetznN2bWmj5NiMmjxd4NHA9T4IRk4uPFrN/VuyHxfgCIuntyCZNtfG3rZjB
         TzQXDKjMHGA/qCENrqofvIKrjO8B5HebpIZ372PFPeyJ09HE6TX/ZJ8XzP5F4AQ2bMcR
         tR+UYxr5zW6nhXnjK+Lv5Q1Y6CKwsZbqi2azsQhXM5OXw5tP8OfJM8iP4pbmDo5T4CCM
         zyTT1J6YccnsLsxGwIkla8969YlRTzdHrgXtbYGvn0HjaYqumBg4s/zwdEwAhe057NKq
         HuSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kyPBhKH/JgTHErOVcN8NhRHLlMlXK7f8NN0qYPv8WHI=;
        b=HPumoc2PRIUmcmVTfQ6uRWihIvPoc0q7rXMVZo9ufevaUWbN8RBQD8a8UJWcWbjNnF
         zXPW+U0XT2mRxsEys5OSptYan8GVaI6aJ8a3INcfY4aREbxJ46mBhNal5IuGzK0B1Yp5
         0kqNECbnYPmV/i515p6y5mDsLX6jKc+ABjUqOw8VRLZ+GjqLnkHzlPNYJG+O6JDupqh5
         CTMQBLVBJU2EpEnBkZ/Qi5Wt7U0qOBI6cunvUqdTSWrEAAfm6on1CVAGwy0VlfzViy5d
         lRZpi3/3hheuAIG4+8vWBSjFHjPRBgHKAFCSxf5Rbxm/JMillTHyEeRG46um9TCTGhGF
         Brug==
X-Gm-Message-State: APjAAAUzAV5PhCyzIprcGXE7gXDuSPJCFKbA2mxtlaHTBFkmUjes879d
        k9m7Ate9MJXVYyVy4EzRgRrHY1/gaGT8iij2WW++Ew==
X-Google-Smtp-Source: APXvYqzfHz0ExpaIBaZZdRWUm3onct75cPDUvd9wm1gW29/53Oie/26VftilCF496V9ZtIU1eS71cFQvQrVPyfGIuQg=
X-Received: by 2002:a50:addc:: with SMTP id b28mr117212723edd.174.1564711054201;
 Thu, 01 Aug 2019 18:57:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190731193517.237136-1-sboyd@kernel.org> <20190731193517.237136-8-sboyd@kernel.org>
In-Reply-To: <20190731193517.237136-8-sboyd@kernel.org>
From:   Chunyan Zhang <zhang.chunyan@linaro.org>
Date:   Fri, 2 Aug 2019 09:57:05 +0800
Message-ID: <CAG2=9p9bhEpWRAEWPsqwyEGAm4xeRtJmh1dQCvA808SPmiAR5Q@mail.gmail.com>
Subject: Re: [PATCH 7/9] clk: sprd: Don't reference clk_init_data after registration
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Baolin Wang <baolin.wang@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 1 Aug 2019 at 03:35, Stephen Boyd <sboyd@kernel.org> wrote:
>
> A future patch is going to change semantics of clk_register() so that
> clk_hw::init is guaranteed to be NULL after a clk is registered. Avoid
> referencing this member here so that we don't run into NULL pointer
> exceptions.
>
> Cc: Chunyan Zhang <zhang.chunyan@linaro.org>
> Cc: Baolin Wang <baolin.wang@linaro.org>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---
>
> Please ack so I can take this through clk tree

Acked-by: Chunyan Zhang <zhang.chunyan@linaro.org>

Thanks.

>
>  drivers/clk/sprd/common.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/sprd/common.c b/drivers/clk/sprd/common.c
> index a5bdca1de5d0..9d56eac43832 100644
> --- a/drivers/clk/sprd/common.c
> +++ b/drivers/clk/sprd/common.c
> @@ -76,16 +76,17 @@ int sprd_clk_probe(struct device *dev, struct clk_hw_onecell_data *clkhw)
>         struct clk_hw *hw;
>
>         for (i = 0; i < clkhw->num; i++) {
> +               const char *name;
>
>                 hw = clkhw->hws[i];
> -
>                 if (!hw)
>                         continue;
>
> +               name = hw->init->name;
>                 ret = devm_clk_hw_register(dev, hw);
>                 if (ret) {
>                         dev_err(dev, "Couldn't register clock %d - %s\n",
> -                               i, hw->init->name);
> +                               i, name);
>                         return ret;
>                 }
>         }
> --
> Sent by a computer through tubes
>
