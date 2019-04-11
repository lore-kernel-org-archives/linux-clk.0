Return-Path: <SRS0=5rVA=SN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD8A8C10F13
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 11:07:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9A51B2133D
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 11:07:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DZJ/0aQV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbfDKLHp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Apr 2019 07:07:45 -0400
Received: from mail-vk1-f193.google.com ([209.85.221.193]:40737 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726629AbfDKLHp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Apr 2019 07:07:45 -0400
Received: by mail-vk1-f193.google.com with SMTP id l17so1268776vke.7
        for <linux-clk@vger.kernel.org>; Thu, 11 Apr 2019 04:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sI3RcBCGlQbSs+tY3l5lIFtS2QOZWLoKzIbUnKh5ras=;
        b=DZJ/0aQVTiuW44NQeudhJOpxFUFlkJQxZhfydVJgbQO8oLMisBNf/lHt7AzqmC1hr/
         oDN36lGMT7hwG4IWT605FpewMrN52KB4unGbnWc58ekaD8ACLwcOmcnL7/tvk2IHeLvo
         oSw/+t3wo+m1s9J9T+FFml7XstvJG63Wm4DP6JQRcylzs7cRRm0XPVSL97cZISeJl4NH
         buBVi7LScm7R2DC2DO556qEvMM8P5GLlBW7r+CjbxHG7+DByJDGc6AN9MHhetX5JfJ94
         OsCgkpdpQ4MQ/xGbnvD49Ykqn28JykLtvosXTeiDmEoQE8U+kzpKyzuStKrUrr9JA2tZ
         W4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sI3RcBCGlQbSs+tY3l5lIFtS2QOZWLoKzIbUnKh5ras=;
        b=MsILRHP/vkfTs9au1AYHxUAA+oerq1g3oqoG9n9ZLWV562bYpKmvZVFgDIy7OfB2fA
         1CwqORH21HXFmn8ZiS816O9jdkR37tIDqadyKdWIgUBYHn3Lhqxqlc67XkwFOJny7Po+
         42tT9Tu4aUFimcFC2EhfAIBv/iZ7wMl8Kmsi5sqrOODB6Zfhj9ER/rVBWV9DlnUWtGv5
         gZbs3DStZZhCZGwVHELSbX0UENVyKhaGU1qyGUizveY+FSSCzR7jQUsBn0wZfzbWkgYI
         YzBdKHPK0lBNVc8mfF4LAF4ty8nqzHKGlHNG2XsexldajMZ5mta5RePq9NM5EVpe0u5/
         kmxQ==
X-Gm-Message-State: APjAAAUp7BjwnS7qDYDe8zct5E8saJpOTVokXqgSmFc3q7J2VZDtLPbn
        a7eZUoFkIluA7jR6nNWzLwFRJ30jcs1Xzq0zyqZWAg==
X-Google-Smtp-Source: APXvYqxrypfyU6cGTEbD6qrnOa+G1zaVQRxEvKGT4YRyK1KDJ0yLqG5TO94uSoRlLMoqIXgTAjs8AJZNFnnh24iwVAI=
X-Received: by 2002:a1f:2c8:: with SMTP id 191mr26959530vkc.29.1554980864252;
 Thu, 11 Apr 2019 04:07:44 -0700 (PDT)
MIME-Version: 1.0
References: <1554980651-54136-1-git-send-email-hofrat@opentech.at>
In-Reply-To: <1554980651-54136-1-git-send-email-hofrat@opentech.at>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 11 Apr 2019 13:07:08 +0200
Message-ID: <CAPDyKFr-31H+nfnAeBuBuuXVshvEzHRJNfFa4KVHCTJx0Bk=zw@mail.gmail.com>
Subject: Re: [PATCH V2] clk: ux500: add range to usleep_range
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

On Thu, 11 Apr 2019 at 13:04, Nicholas Mc Guire <hofrat@opentech.at> wrote:
>
> Providing a range for usleep_range() allows the hrtimer subsystem to
> coalesce timers - the delay is runtime configurable so a factor 2
> is taken to provide the range. With the expected range for
> enable_delay_us being milliseconds, the range should lie in the 250us
> range which is sufficient for hrtimer optimization.
>
> Signed-off-by: Nicholas Mc Guire <hofrat@opentech.at>

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>
> Problem located with an experimental coccinelle script
> V2: As clarified by Ulf Hansson <ulf.hansson@linaro.org> the delays
>     here are typically in the millisecond range - so as proposed
>     replace the factor 2 by a 25% increase of max.
>
> Patch was compile tested with: u8500_defconfig (implies COMMON_CLK=y)
> (with some unrelated sparse warnings about not implemented system calls)
> Patch is against 5.1-rc4 (localversion-next is next=20190410)
>
>  drivers/clk/ux500/clk-sysctrl.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/ux500/clk-sysctrl.c b/drivers/clk/ux500/clk-sysctrl.c
> index 7c0403b..698306f 100644
> --- a/drivers/clk/ux500/clk-sysctrl.c
> +++ b/drivers/clk/ux500/clk-sysctrl.c
> @@ -42,7 +42,8 @@ static int clk_sysctrl_prepare(struct clk_hw *hw)
>                                 clk->reg_bits[0]);
>
>         if (!ret && clk->enable_delay_us)
> -               usleep_range(clk->enable_delay_us, clk->enable_delay_us);
> +               usleep_range(clk->enable_delay_us, clk->enable_delay_us +
> +                            (clk->enable_delay_us >> 2));
>
>         return ret;
>  }
> --
> 2.1.4
>
