Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A83D3C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 16 Sep 2021 23:00:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 817956120D
	for <linux-clk@archiver.kernel.org>; Thu, 16 Sep 2021 23:00:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235152AbhIPXCM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Sep 2021 19:02:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229997AbhIPXCM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Sep 2021 19:02:12 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B506C061574
        for <linux-clk@vger.kernel.org>; Thu, 16 Sep 2021 16:00:51 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id y28so24801939lfb.0
        for <linux-clk@vger.kernel.org>; Thu, 16 Sep 2021 16:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YtuNCfPas1u7j+vOUj5r+OSrvpqp8H0ieDTP3/AumOw=;
        b=nOikGvY586bOwke1p6iHCOO0pb+ZtaQJTBDy04BbiuArKgqYKjqCkQ9EXTIh8UeOSC
         QF0hMvthMhMXUBGKzWTqw609m5lgWe602Eo+wjW6cAP8Ry1QG3LRYd5OxZVU9RK6CtLk
         dbQstM6ZDAb0rIJgrgU2eSX3V+nW45IK56iHfCv17RtHZfSxjOeIjGQnK5cfH0332oRd
         QVRTr7vw9Ykt9YCeOk6OUVqi6ELd+pzsE/1XllPAP9BalES38pvh+7Q4SNoFqRrlOHXp
         LJkm6YQt68AvNncQjJlo3sFHY0MqBKd3NwuaYfAHSLngPxYtVtYoXf7iHvLRCTs4S74A
         Haog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YtuNCfPas1u7j+vOUj5r+OSrvpqp8H0ieDTP3/AumOw=;
        b=efaVW4cRhvv0WZnQ2SraZJRtb9yJ1h0S2BSMcea6fqdl3yShxmOnjg2nULi4mpLeLa
         kQMqC1XWyQBMylZmvk09jEaQXMrtafpjuzf4e9274V5uSciRNzm7jc1EUgOctPqNwulJ
         ro7DIBc75scogKB6K0d2fKu/Q+75PTMcr2rRvBwdWJQ46H/leHG2pbE+r2++LtcnH6hT
         4Ev9qgh9So2sWcIs8//0olUDgjD17mgFzGaJMpM/BNwo1KnPrKRC0i+F/04t10EAkR5v
         JqVdPRoyLuyDFq3GrrSYPxGZ2nfN7G5fWFFswBLk4dJr8hHq3rgbburH9AV+2u9vUnHg
         t7XQ==
X-Gm-Message-State: AOAM5322mcPRGUV0hFrf1+hy+YrhIVnCHDJhCCYRlbX5iP8f60qUkviW
        RRmnQQn/IFOO4IjF0zTHPehrpiuiI24NsX8balO3Zg==
X-Google-Smtp-Source: ABdhPJwsK3nK2fMz2dOaOJX+NbgFf9O2ljxmrcLpQZX60PdNdOwBFuhbuwUO5/RWM6selp9fFzztM0KD3y0Q00GvJog=
X-Received: by 2002:a05:6512:e89:: with SMTP id bi9mr5658663lfb.95.1631833249701;
 Thu, 16 Sep 2021 16:00:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210901180833.4558932d@endymion>
In-Reply-To: <20210901180833.4558932d@endymion>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 17 Sep 2021 01:00:38 +0200
Message-ID: <CACRpkdZzZzu_7T022snkP7+DpJc1D-ir8M0ZF-qiRZy-GUEj4g@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: versatile: Rename ICST to CLK_ICST
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Sep 1, 2021 at 6:08 PM Jean Delvare <jdelvare@suse.de> wrote:

> For consistency, prefix the ICST config option with CLK as all other
> clock source drivers have.
>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>

Fine by me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
