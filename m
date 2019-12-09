Return-Path: <SRS0=N9em=Z7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A553C43603
	for <linux-clk@archiver.kernel.org>; Mon,  9 Dec 2019 08:14:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 13126205ED
	for <linux-clk@archiver.kernel.org>; Mon,  9 Dec 2019 08:14:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KbrLtzdh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727144AbfLIIOc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Dec 2019 03:14:32 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43749 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727044AbfLIIOc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Dec 2019 03:14:32 -0500
Received: by mail-wr1-f68.google.com with SMTP id d16so15028043wre.10
        for <linux-clk@vger.kernel.org>; Mon, 09 Dec 2019 00:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=AcgLGm7viqYLtzzzItqiBgRAJc7u9gPt8FVNqhrSFaM=;
        b=KbrLtzdhPemv7Vo5JgncXJELnB7JXpuQc3g26YZLUrOm9lhh9fBwnAayfnXoVV/k6f
         wx9kagwIrfp4GIyrXM0IFQdzmVQW7/pAdbpr7YDJL5rbYnKQoMMIvF4mRdLKddfUJWlA
         mOzvh7uPXGI4pTKGKgYowVn5n1wjTL7VzUzLvUxiTVJIMf3rNkJlaX54gDcoY+TxA3mW
         UulZA+lwZXG36YHfRWwA824TPCfpC8besZFUdDdFoDGlxtZHZQewC7dpPyOxwJPXq57T
         sULW2Av2TaYBwZykVeegEUe6wEeLCq4GGk8qxsyKPfXsniuBUWE93C/Fv++8F7kZMxPQ
         +bqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=AcgLGm7viqYLtzzzItqiBgRAJc7u9gPt8FVNqhrSFaM=;
        b=Sq7y76UPQPxgbUm3g6L/hotTwRHn68GqZYzbx3KkDuJi3RQaAaHFsfxr4VIOViQNfA
         hP8CjTGN8tUCDlcR17q6bnRxICO2iHaffnH3YEuK4df++/oXDrw8TCjx5zBoCR21oMtx
         PEbLh/U4VfdYi85Zxlfbm/B6AELPpuasaaXyGFNQpjazjkbmcfZn+3WZMST0hs8E0jV4
         CyqqC9QWIsRtr4NXZu6vmjmwsHC9wHYu0iI63UZHXwfLXeU40A8EEOZcV7NkSxdIW1ou
         fmyE0nkMSBAyAmjEVvvz1g+PzLTuMQY4vibK49ttU1D30OnZu1fMw5wuGAQtr3px67Mv
         LwVA==
X-Gm-Message-State: APjAAAUfurWJf0AKxBS+qbM/m/xEJTb1IDOPCJsiB/xkDUo+bvXJZFkV
        sz1ROsRPA4Jb7hu9EDSlCaNxI4wjMQZrow==
X-Google-Smtp-Source: APXvYqxuTOVqf0wHC82YMfT2qW5Wx8i0bM21lI8quO2aM7yX46nM1bHiooHJzZhXrlwsSFJ1tugfFg==
X-Received: by 2002:a5d:558d:: with SMTP id i13mr592723wrv.364.1575879270365;
        Mon, 09 Dec 2019 00:14:30 -0800 (PST)
Received: from dell ([2.27.35.145])
        by smtp.gmail.com with ESMTPSA id z6sm12539699wmz.12.2019.12.09.00.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 00:14:29 -0800 (PST)
Date:   Mon, 9 Dec 2019 08:14:24 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: Fix continuation of of_clk_detect_critical()
Message-ID: <20191209081424.GE3468@dell>
References: <20191206133414.23925-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191206133414.23925-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 06 Dec 2019, Geert Uytterhoeven wrote:

> The second line of the of_clk_detect_critical() function signature is
> not indented according to coding style.
> 
> Fixes: d56f8994b6fb928f ("clk: Provide OF helper to mark clocks as CRITICAL")

This is not suitable for Stable.

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/clk/clk.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 9c5b9419e585f845..06ea776830473c2a 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -4799,8 +4799,8 @@ static int parent_ready(struct device_node *np)
>   *
>   * Return: error code or zero on success
>   */
> -int of_clk_detect_critical(struct device_node *np,
> -					  int index, unsigned long *flags)

Not sure what happened here.

> +int of_clk_detect_critical(struct device_node *np, int index,
> +			   unsigned long *flags)

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
