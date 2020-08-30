Return-Path: <SRS0=SJ9u=CI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF14FC433E6
	for <linux-clk@archiver.kernel.org>; Sun, 30 Aug 2020 10:07:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8DB8920714
	for <linux-clk@archiver.kernel.org>; Sun, 30 Aug 2020 10:07:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CR3yBp4e"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728757AbgH3KHk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 30 Aug 2020 06:07:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725869AbgH3KHh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 30 Aug 2020 06:07:37 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E217DC061573
        for <linux-clk@vger.kernel.org>; Sun, 30 Aug 2020 03:07:35 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id z17so1909991lfi.12
        for <linux-clk@vger.kernel.org>; Sun, 30 Aug 2020 03:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dNsRAqkpb7LZUriy3bYigquvN7E89ZUZ6a0Kz5iQgtM=;
        b=CR3yBp4eF8gKwB94L2+Av9mspgjaQGAeGq8CagVhQyQcSS5sDkiA2Bjkxows0LNG2W
         4VJM2kNR2Q0MBPpzOfSI76DXw5f7LvJXSGK8S/ZN6mk5H/JThx0Wul6RUWRMnN2ePUV8
         wYqyQaOVOjcBHxXpGUR6QyvtTnW1WC0ajzsCqO2cAJ2xBGmAWFSlBtb9pocP+iO3dHFr
         40a24lVcbeYwulKpH71uhXLpncipggPnqzjR66SE4NbEMtd71/V6df4WmmBgrdwnSjU9
         nI6teYtkcGSIovCkUWdL8z2XWKmsrPX7+eij4chqEgYPUWlLhUil66KToCQKok5boyB+
         WnZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dNsRAqkpb7LZUriy3bYigquvN7E89ZUZ6a0Kz5iQgtM=;
        b=DWKwp2741YlRuoTYV4/qIaePtYkM21K9HhviReWZqek9j8aUN4gSmP27O+ZeH/tN6j
         pri+E9Wc+0QsvrZZFd4NJJJWaMLJ4puCyYtOMIO8uHnWaM2a44ZTmMZAP3OOYW7bdKHv
         T73H3qc5fhurzH20DhOx/Y6yl5VqFnV7D4Hb9JD8xrrXWDTVSDnwVxIK6Sk1hvaE1lxO
         iZq+1vzJG2itr/bfntm7D5OR8VwsC8o/NCv3temiG9h+jzMR+og+PIagWzxoHxqy9QVo
         NLU7SbC4Nt/VDoam1S0D2tYeqgTP64uulR+OviZtfOil+uxCzswMt5A/75sIrnufwsWy
         IFow==
X-Gm-Message-State: AOAM530La9umpu3ZNCONElrD4tcwbalupx4tRtlByjC0ucaAgCnfnebr
        aYpZg3F1L47OF2xKNWpidJwCXzYCBvoFUhPcCxg+QQ==
X-Google-Smtp-Source: ABdhPJys34Tj/H6BMuD4li7gNKtPjNXFTtG/dt6qc79bH1fBaaihFbrJhQPAbU6UvAQfixj/pjHIpIsLEhzSQ88UfoQ=
X-Received: by 2002:ac2:4c05:: with SMTP id t5mr3290753lfq.89.1598782048574;
 Sun, 30 Aug 2020 03:07:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200829175704.GA10998@Kaladin>
In-Reply-To: <20200829175704.GA10998@Kaladin>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 30 Aug 2020 12:07:17 +0200
Message-ID: <CACRpkdZ+_eDPntPhfhF3bAP-afsVUaCfWowZL-otr8TcKdRP+w@mail.gmail.com>
Subject: Re: [PATCH] clk: versatile: Add of_node_put() before return statement
To:     Sumera Priyadarsini <sylphrenadin@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Julia Lawall <Julia.Lawall@lip6.fr>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, Aug 29, 2020 at 7:57 PM Sumera Priyadarsini
<sylphrenadin@gmail.com> wrote:

> Every iteration of for_each_available_child_of_node() decrements
> the reference count of the previous node, however when control is
> transferred from the middle of the loop, as in the case of a return
> or break or goto, there is no decrement thus ultimately resulting in
> a memory leak.
>
> Fix a potential memory leak in clk-impd1.c by inserting
> of_node_put() before a return statement.
>
> Issue found with Coccinelle.
>
> Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
