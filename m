Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D12CC433ED
	for <linux-clk@archiver.kernel.org>; Tue, 18 May 2021 07:45:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 40DCA61350
	for <linux-clk@archiver.kernel.org>; Tue, 18 May 2021 07:45:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347243AbhERHqV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 May 2021 03:46:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347246AbhERHqQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 May 2021 03:46:16 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68316C06175F
        for <linux-clk@vger.kernel.org>; Tue, 18 May 2021 00:44:53 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id f6-20020a1c1f060000b0290175ca89f698so888352wmf.5
        for <linux-clk@vger.kernel.org>; Tue, 18 May 2021 00:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=HHcWoO4qJ8z0RqAAJdfXOss/jtjNrhOer7gnZ5JwlNk=;
        b=cnHtN5ydl39hoEoQp12yh3wyRiuCSnUFSBcG7KUqsL0HqsM6P/fSCQvyqUYrqaDq4+
         dvn2coapU7/6HOoOjLlpLGrm3reiFq3qHgumlHMlKHupx4FIMkxrCX3+/lO1L8DF7hOb
         44NXrMYXogA17PtpMO5Z1MepdMUUvB/JCplVOi9CxRjs75JDVEg18Af9AkBlGKg+Gr30
         LC9ldVR5xcmpDjuSrnbjXmq3jevgjcnoBC3t0P9a4zK+TDOjnF78N98qSVLPqC1sDm1w
         bYswhfwojgADJ9SuflmWLtTw6Rfv+NGb+KrEX+xWAsrIMci2LNJCdjfsC3erxDEnGXNF
         YuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=HHcWoO4qJ8z0RqAAJdfXOss/jtjNrhOer7gnZ5JwlNk=;
        b=WN5RW8g1bOXmAa7POPX84XN6Ww+SAQUWsCJ+bcu6zo3X11tc/eQyBetcS747gsJaGl
         7lOjmQPCwfHjFuCKZ5DYb2yt8Jnfv+uKL+JUX8JIvypTZWPzkEmaH2rT8vOFhJ/MlRja
         bX5FQB5lIiqCGkm5cJBf+7lEQ/6eVU7ZQffzEcIXdKuazxzCUwYYsD5WO/4Ou2eX3X42
         xU+/oi/A5HpntTwJGZKDXERHHbqeQZM8b6MGbQxRiT+g/a5yOWqaDisVWKVOP9+AF5x4
         j3FwRp7PSXtMOOXkxYKwuuNbCWgPVSHbsko4tHjVMao7KqS552FP/fr8QImSvadZ0Zqv
         0qnw==
X-Gm-Message-State: AOAM532CKOVgNydXhFkmxzLifJEmev6/0qpd9k5SbWmYGmz2nSw2RgYv
        9SDIKP481n0ZyRoYcCoPIy/Xrg==
X-Google-Smtp-Source: ABdhPJzZRuey5G4igcKlxuyw+V6B6t+IcAlmcEYLPisqKqdq6MRdavqmGNDg+CvK4/J5B8Xh6v0K3A==
X-Received: by 2002:a1c:7901:: with SMTP id l1mr3449311wme.98.1621323891914;
        Tue, 18 May 2021 00:44:51 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id m9sm20557689wrq.78.2021.05.18.00.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 00:44:51 -0700 (PDT)
References: <20210517203724.1006254-1-martin.blumenstingl@googlemail.com>
 <20210517203724.1006254-2-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.4.15; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        mturquette@baylibre.com, sboyd@kernel.org, narmstrong@baylibre.com,
        linux-clk@vger.kernel.org
Cc:     khilman@baylibre.com, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v1 1/3] clk: divider: Add re-usable determine_rate
 implementations
In-reply-to: <20210517203724.1006254-2-martin.blumenstingl@googlemail.com>
Message-ID: <1jtun01o5p.fsf@starbuckisacylon.baylibre.com>
Date:   Tue, 18 May 2021 09:44:51 +0200
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Mon 17 May 2021 at 22:37, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> These are useful when running on 32-bit systems to increase the upper
> supported frequency limit. clk_ops.round_rate returns a signed long
> which limits the maximum rate on 32-bit systems to 2^31 (or approx.
> 2.14GHz). clk_ops.determine_rate internally uses an unsigned long so
> the maximum rate on 32-bit systems is 2^32 or approx. 4.29GHz.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/clk/clk-divider.c    | 39 +++++++++++++++++++++++++++++++++++-
>  include/linux/clk-provider.h |  6 ++++++
>  2 files changed, 44 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
> index 344997203f0e..24c94d2a3643 100644
> --- a/drivers/clk/clk-divider.c
> +++ b/drivers/clk/clk-divider.c
> @@ -377,7 +377,6 @@ long divider_ro_round_rate_parent(struct clk_hw *hw, struct clk_hw *parent,
>  }
>  EXPORT_SYMBOL_GPL(divider_ro_round_rate_parent);
>  
> -
>  static long clk_divider_round_rate(struct clk_hw *hw, unsigned long rate,
>  				unsigned long *prate)
>  {
> @@ -399,6 +398,44 @@ static long clk_divider_round_rate(struct clk_hw *hw, unsigned long rate,
>  				  divider->width, divider->flags);
>  }
>  
> +int divider_determine_rate(struct clk_hw *hw, struct clk_rate_request *req,
> +			   const struct clk_div_table *table, u8 width,
> +			   unsigned long flags)
> +{
> +	int div;
> +
> +	div = clk_divider_bestdiv(hw, req->best_parent_hw, req->rate,
> +				  &req->best_parent_rate, table, width, flags);
> +
> +	req->rate = DIV_ROUND_UP_ULL((u64)req->best_parent_rate, div);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(divider_determine_rate);
> +
> +int divider_ro_determine_rate(struct clk_hw *hw, struct clk_rate_request *req,
> +			      const struct clk_div_table *table, u8 width,
> +			      unsigned long flags, unsigned int val)
> +{
> +	int div;
> +
> +	div = _get_div(table, val, flags, width);
> +
> +	/* Even a read-only clock can propagate a rate change */
> +	if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
> +		if (!req->best_parent_hw)
> +			return -EINVAL;
> +
> +		req->best_parent_rate = clk_hw_round_rate(req->best_parent_hw,
> +							  req->rate * div);
> +	}
> +
> +	req->rate = DIV_ROUND_UP_ULL((u64)req->best_parent_rate, div);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(divider_ro_determine_rate);

For a final version, could you factorize the code with the .round_rate()
variant ? It would remove a bit of duplication. 

Maybe determine_rate() can also replace round_rate() in the generic
divider ops ?

> +
>  int divider_get_val(unsigned long rate, unsigned long parent_rate,
>  		    const struct clk_div_table *table, u8 width,
>  		    unsigned long flags)
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 162a2e5546a3..d83b829305c0 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -629,6 +629,12 @@ long divider_ro_round_rate_parent(struct clk_hw *hw, struct clk_hw *parent,
>  				  unsigned long rate, unsigned long *prate,
>  				  const struct clk_div_table *table, u8 width,
>  				  unsigned long flags, unsigned int val);
> +int divider_determine_rate(struct clk_hw *hw, struct clk_rate_request *req,
> +			   const struct clk_div_table *table, u8 width,
> +			   unsigned long flags);
> +int divider_ro_determine_rate(struct clk_hw *hw, struct clk_rate_request *req,
> +			      const struct clk_div_table *table, u8 width,
> +			      unsigned long flags, unsigned int val);
>  int divider_get_val(unsigned long rate, unsigned long parent_rate,
>  		const struct clk_div_table *table, u8 width,
>  		unsigned long flags);

