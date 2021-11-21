Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F24C433F5
	for <linux-clk@archiver.kernel.org>; Sun, 21 Nov 2021 23:37:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230455AbhKUXk6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 21 Nov 2021 18:40:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230418AbhKUXk6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 21 Nov 2021 18:40:58 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E08E8C061574
        for <linux-clk@vger.kernel.org>; Sun, 21 Nov 2021 15:37:52 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id o15-20020a9d410f000000b0055c942cc7a0so26148225ote.8
        for <linux-clk@vger.kernel.org>; Sun, 21 Nov 2021 15:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NyYOvvsaAIgLW7cvFAmLIlCUPt6c1jGipU6WKm7U5Ng=;
        b=aR/Lj+d3qGsvzxgSXtWSGxaR3hG/WC6IcRuF5sSjaNO9oXXXAqbfqUUSm1kD4dQasO
         wVw/KnUhc6eOHpUZaLxj4iIO9eJzmi+AdLCCzibIO+a91fb1C+/IejEs1UXAWlR4Jg7v
         inmUq1C9uZfewOTX/S1Kw5km5m6jT38MNkRtyalvK+RXwTgh/kCCBhS8Ripno8JzF9/W
         or0K/iHTUBG93oHWExuhPAnE2SqNpC+vfq8y4PWLaoMF5OyonX7R0oTMVzSxv21v+Hsi
         bJrkur++dt2Ygwih2FvEgyX2iSH/tppzKclTehdMi2/oWYi3yvd5gi4zlSv5jlVQUJWX
         Ae7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NyYOvvsaAIgLW7cvFAmLIlCUPt6c1jGipU6WKm7U5Ng=;
        b=FsIuFrcQTGiLvbeNYgmnru2FHYbIIGtIFJ3s68oHrRKUH0Mau9iqo4EkJWa7ZkdTDM
         qYLqXxatOogD5k5uim6CY360gzd+j2gvzpllBoBgmDuSLemafURlzMVoTIlLda0/Cy5X
         G5DcDU+kUGc3Ro4kxpvd1kFbsBZyPjBjpeCe7m7VOnuwmgmkC5a97vGuq7pi5YUZZ1xq
         Je4I7jlHbvsOWv45szg/cYVOhZPLLWzjXLDH164HihRP1XGifnQUBkXNKNd/pqwKIDNi
         u2eIvjsBLKRYpq2setubL/wqJyRFMp4geqMFkh+21XnnYaKi1Dwjy5sv2NjyK9MKd/Eg
         ghaw==
X-Gm-Message-State: AOAM532O80zteMqmMrjLyUsx/6KRmI/XLuFDKoqDM196oqa2R1L9d1Tw
        VHuyu4ErBzqBzbZYIR/lAYtF3vJYG13mWe+63omZXg==
X-Google-Smtp-Source: ABdhPJyqL0ofQJzAhskSuiogIcxhR3TLgaafImtSYOes3MSoY3O0dXFJ6HanC00mDsHa2VXyOiQ4qvRLvXgLlLDmi80=
X-Received: by 2002:a9d:74d0:: with SMTP id a16mr20028716otl.237.1637537872291;
 Sun, 21 Nov 2021 15:37:52 -0800 (PST)
MIME-Version: 1.0
References: <20211117072604.GC5237@kili>
In-Reply-To: <20211117072604.GC5237@kili>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 Nov 2021 00:37:40 +0100
Message-ID: <CACRpkdakVEfLBLZfyG1mc+kJtVOewDAV7wuZEVUq+6NSkLLHrw@mail.gmail.com>
Subject: Re: [PATCH] clk: versatile: clk-icst: use after free on error path
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Rob Herring <robh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Nov 17, 2021 at 8:26 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> This frees "name" and then tries to display in as part of the error
> message on the next line.  Swap the order.
>
> Fixes: 1b2189f3aa50 ("clk: versatile: clk-icst: Ensure clock names are unique")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
