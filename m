Return-Path: <SRS0=KQjW=6N=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDEC8C83004
	for <linux-clk@archiver.kernel.org>; Wed, 29 Apr 2020 12:14:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C2B602074A
	for <linux-clk@archiver.kernel.org>; Wed, 29 Apr 2020 12:14:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tTLZnF5k"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgD2MOs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 Apr 2020 08:14:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726556AbgD2MOs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Apr 2020 08:14:48 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1311C03C1AD
        for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2020 05:14:47 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id a21so2307401ljj.11
        for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2020 05:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t0srpPN0nwlyjFhHaF4ibgTa/JwHHIQbEOB7fBzG6QA=;
        b=tTLZnF5kIusCAdwA9HNgdsweJr4mUMtTqr8Ekr6X777kaMhX+Vhu+WX7DllKVJsdke
         1lQVhTpjaZH0oxi+8vfHQaJxdcqKnrX6C9fOqUBbGsKCHgGz3TUlLmCo+dtB5xbj4mnH
         AU76EZWy/GcLRZif3lb0glyluqXV0gEWjtQMFZLRhGpTUNKMlCt2hSC3dvEe+TlC7UvQ
         gek+P2jqTiG/IhMlWMURGpHhMrNpibAGRwCRX2kvOh+Uyt+sGyeZcM2DhhxwRKDLB6Wp
         LP87J3N7G9fRYo4imcNGbvcSvlAaEQe1paMcUlNOSL4ROt9PrYY3C2VieuyunG317ppE
         LkBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t0srpPN0nwlyjFhHaF4ibgTa/JwHHIQbEOB7fBzG6QA=;
        b=mjIQ/weqpa2Kh6jIIsBqelZeevLtVoVyA48+KanJbBe8D2syclIBKUTqO56GCq8hFv
         llSCJZEsDG3ltEMa7rNevE/pdSXDMflG/6ATC9gZKZhnhz4Lowtsk0Ibj7iCqK+6bEoD
         jjC75DnE3rL9fsxXoR7VSOoISwnCja+jKL9TY5e2Akk/i9RPdsCuW/pOmcg4dT6ygDDf
         qAUw0U6Ymn/7dP5lAdXy79yitx01iPlTHJ58bpNUVFqjzgDpls3tDlJOg+h4UF/oIZy7
         o92zqrOS33lkXqvYy776o0DrZ1fGspktwzGpm7Vj8XjAzgdqmwNFE7IMZicz8IEpBHGm
         BM7w==
X-Gm-Message-State: AGi0PubqMRaZWM/Ninj20YvoDihfKArbjDDZbW9RQMmERyoARlE4G4Jt
        qZN0xPwBIyvzW0P98QMnvCr5uwMcVBRin1G5WBeCYA==
X-Google-Smtp-Source: APiQypIxAbz5j3HXwxIi1dQ00eUTerhBD5tGQ1Wnimo7fE4AnVIPvPeFy6/Jq6uOFl3sZDVM5jywXDnZ5ado4cimkqA=
X-Received: by 2002:a2e:8087:: with SMTP id i7mr19219536ljg.99.1588162486222;
 Wed, 29 Apr 2020 05:14:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200428204945.21067-1-robh@kernel.org>
In-Reply-To: <20200428204945.21067-1-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 29 Apr 2020 14:14:34 +0200
Message-ID: <CACRpkdaUzK0jsOknvXTrZueT=Bq7GnhbTg7mTzHtYtLqp0=pYg@mail.gmail.com>
Subject: Re: [PATCH] clk: versatile: Drop the legacy IM-PD1 clock code
To:     Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc:     SoC Team <soc@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Apr 28, 2020 at 10:49 PM Rob Herring <robh@kernel.org> wrote:

> Now that the non-DT IM-PD1 support code has been removed, drop the clock
> related code from clk-impd1.c.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> This is depends on the pending IM-PD1 DT support Linus has queued up.
> Perhaps apply on top of his PR '[GIT PULL] Versatile changes for v5.8
> take 1'.

I was actually gonna wait until next kernel cycle to do these cleanups,
but fine with me :D

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

If the clk maintainers are OK with it, I would have the ARM SoC folks
apply this on top of my Versatile patches in the ARM SoC tree.

Yours,
Linus Walleij
