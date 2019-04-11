Return-Path: <SRS0=5rVA=SN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D05C282CE
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 09:37:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DB83920693
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 09:37:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yverb6g6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727070AbfDKJhW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Apr 2019 05:37:22 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:37030 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727067AbfDKJhW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Apr 2019 05:37:22 -0400
Received: by mail-vs1-f66.google.com with SMTP id w13so3099773vsc.4
        for <linux-clk@vger.kernel.org>; Thu, 11 Apr 2019 02:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E0RUi/kejPKZCj7BHFvrKKp1MxUL0gG7xD1zAO9nQbI=;
        b=yverb6g6sUZ/FDWwIrwhwTZBN+oqv1lvXZbYBCzakMNcb44LfLjJaBhnr6/r9Ot5hS
         T1MT4KDmD9Ge2eXLtcFw4NW7n7/plIx82oms0G3JOUX3IAiZERPpMYZAbpLZ7qfMBdGp
         hkQw2GAAlI2Vg4B+u9rcxBFzCAefVoIaFrko6Gin9JaS7Ugr5940uuf8Qy3eGbV5obxd
         ca0K8ZyEivfI3EjulkPMapY4gCfsHn5NauN3Xy+fyjxeSkKv9DQ7yIIaBSQvgT5wOL5a
         e1ygwiZpB7SNp/5azdCDVuqBZO5pI1GXbCEoI+L5PGeMMSXYQDXWaI/y6S5UlzbZcJLA
         yD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E0RUi/kejPKZCj7BHFvrKKp1MxUL0gG7xD1zAO9nQbI=;
        b=BvUTb8bFif3eBNjP05d4IBJ9ZE39QebPDAeHmmox7gG9pV5TuD5S+gBxKxV2JSwF/X
         GtfTdmZ4P0xYorwsEhKYqs9Y5d7/Dlj6lyd9GdPV/11KSo/3ENojYtLVqWBSfObAW71C
         p8gMhuLsZisdaWt0TRvq4vw3e5VtNIb52khbI8e80fvzyKZJ0OkFRApzCZne37knXoP8
         w8tqwgI8hV8JpwHnmdOeqwyyepGBOf0YDCnEzl2tLQ93b6oC/zOBkpuirKG9JSiCa+Tp
         1+Pk3xpzl4gvoqFVdOM+XH2xy6jKZWG8EjgQnQj82Y1TRaOjjgImQWP4iPqekWPhUOkZ
         YMkQ==
X-Gm-Message-State: APjAAAXAP9LtICzJz6okoy5QGDhLIQLUGZ3EbSZXXAjVCjiT5lFz+Fgz
        geqqx1VTCQaoZHTXoQl+5pPWul6GstmNIUbrfij/0Q==
X-Google-Smtp-Source: APXvYqwcopvZUv2KuCNMlklTT9VKx16b7FdyOzqt+Gi24MGHfn+4rK59BaEZXNMLPxt2xTRw+TsvwlsTkOwxSobJxXg=
X-Received: by 2002:a67:2e8c:: with SMTP id u134mr27000829vsu.57.1554975441619;
 Thu, 11 Apr 2019 02:37:21 -0700 (PDT)
MIME-Version: 1.0
References: <1554606804-29453-1-git-send-email-hofrat@opentech.at>
In-Reply-To: <1554606804-29453-1-git-send-email-hofrat@opentech.at>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 11 Apr 2019 11:36:45 +0200
Message-ID: <CAPDyKFp2yC88O3q6kO+tNVwzkJVySQW7PA0Cm5xjHEX31x275w@mail.gmail.com>
Subject: Re: [PATCH RFC] clk: ux500: add range to usleep_range
To:     Nicholas Mc Guire <hofrat@opentech.at>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, 7 Apr 2019 at 05:13, Nicholas Mc Guire <hofrat@opentech.at> wrote:
>
> Providing a range for usleep_range() allows the hrtimer subsystem to
> coalesce timers - the delay is runtime configurable so a factor 2
> is taken to provide the range.
>
> Signed-off-by: Nicholas Mc Guire <hofrat@opentech.at>
> ---
>
> Problem located with an experimental coccinelle script
>
> Q: Basically usleep_range() with min == max never makes much sense notably
>    in non-atomic context. If the factor of 2 is tolerable or a fixed
>    offset of e.g. 1000 would be more suitable is not clear to me - maybe
>    someone familiar with that driver can clarify this.
>
> Patch was compile tested with: u8500_defconfig (implies COMMON_CLK=y)
> (with some sparse warnings about not implemented system calls)
>
> Patch is against 5.1-rc3 (localversion-next is next=20190405)
>
>  drivers/clk/ux500/clk-sysctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/ux500/clk-sysctrl.c b/drivers/clk/ux500/clk-sysctrl.c
> index 7c0403b..a1fa3fb 100644
> --- a/drivers/clk/ux500/clk-sysctrl.c
> +++ b/drivers/clk/ux500/clk-sysctrl.c
> @@ -42,7 +42,7 @@ static int clk_sysctrl_prepare(struct clk_hw *hw)
>                                 clk->reg_bits[0]);
>
>         if (!ret && clk->enable_delay_us)
> -               usleep_range(clk->enable_delay_us, clk->enable_delay_us);
> +               usleep_range(clk->enable_delay_us, clk->enable_delay_us*2);

The range being used is actually in ms, so not sure we actually need
to double it for the range.

How about adding ~25% instead, along the lines of below:
usleep_range(clk->enable_delay_us, clk->enable_delay_us +
(clk->enable_delay_us >> 2));

Kind regards
Uffe
