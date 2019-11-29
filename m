Return-Path: <SRS0=1MK8=ZV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3896C432C0
	for <linux-clk@archiver.kernel.org>; Fri, 29 Nov 2019 15:36:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 97B4021736
	for <linux-clk@archiver.kernel.org>; Fri, 29 Nov 2019 15:36:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="o8NkfpCZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbfK2Pgc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Nov 2019 10:36:32 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35571 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726909AbfK2Pgb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 29 Nov 2019 10:36:31 -0500
Received: by mail-wr1-f68.google.com with SMTP id g17so3664948wro.2
        for <linux-clk@vger.kernel.org>; Fri, 29 Nov 2019 07:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=KwEZC+jRGDk7UY7WXWllWDw/w2RIa02HF7GIOwLTDjk=;
        b=o8NkfpCZ3WDeww+GADaSd6DYpVFTHRFD40r1XlPfINMNw7cy5g9vowQ1cqD9G0zbVz
         g8Uy30VvhEzr1DviU0E4tRpjTfsy/RVPYLb38M6vVcRV4/0gJhR/UMAg2Wl4cqpURGJ9
         s27OTVhu1mJSpaRja5TmH46VYg082KfP/kvyK4XCJHi0ey9/EiGSBkFFLD9WCYmmbVnB
         AFUM2GUdu+lE9WVxQ05fFLf3r4RMtPJdZTQbLL/NUutHvmv0Er0zkqlvp60+V3XX7R0z
         OlnnO+DTkpfHXCFvohmWAER3hzJCHIjGWV2maFzDFcuNQQNT2nA+97zRmG4a0+qXiWQX
         IGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=KwEZC+jRGDk7UY7WXWllWDw/w2RIa02HF7GIOwLTDjk=;
        b=Uydrt9NtYwGJibDuo7pHEcBo0WXWwlyiMgKTXnpdCKWpTxGG12FRkyf/UCkP8K4TPm
         kMxKhnL3XKxj2tk5yf6wMvISu+7URHLSOnX4XhDkrHiScz6bLLPenKZLO6r6NS1JaXvc
         fH2gpW8bkabYVtjk5U1ocncMecT49E6S3+5lXW2PZSjVc3PnwIJqScl/buip1JkDzUAB
         xMAhjeE9xgr4QKo79SjbAw4ZQz2+mj1d4Ys2knRwlZneAZF0M2jJ+y8H/aAi7y3du+ng
         qmFPf6EwuSSMuvvnPWl4quPyE/itv9G6mPtE/FPmDqibEJ59buSlkdO9HwRZDx1VqmJ5
         oYsg==
X-Gm-Message-State: APjAAAWng5hjSSTcQ7me88xdaGYY0spHl701B8KG2rf/AYoUOXvxwoM3
        61eSIcsoo4sB6Vhr7Azl9TUvfQ==
X-Google-Smtp-Source: APXvYqwq+J0xWTpe+3xS1eB5U31vujRWHfFyZVptmxL4ztOgAWSWTKShOqKlTesRIZhHWAZfkU2HMA==
X-Received: by 2002:adf:ef49:: with SMTP id c9mr34334530wrp.292.1575041789648;
        Fri, 29 Nov 2019 07:36:29 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id l4sm13415992wml.33.2019.11.29.07.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2019 07:36:28 -0800 (PST)
References: <20190924123954.31561-1-jbrunet@baylibre.com>
User-agent: mu4e 1.3.3; emacs 26.2
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] clk: let clock perform allocation in init
In-reply-to: <20190924123954.31561-1-jbrunet@baylibre.com>
Date:   Fri, 29 Nov 2019 16:36:28 +0100
Message-ID: <1jv9r27kzn.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Tue 24 Sep 2019 at 14:39, Jerome Brunet <jbrunet@baylibre.com> wrote:

> This patchset is a follow up on this pinky swear [0].
> Its purpose is:
>  * Clarify the acceptable use of clk_ops init() callback
>  * Let the init() callback return an error code in case anything
>    fail.
>  * Add the terminate() counter part of of init() to release the
>    resources which may have been claimed in init()
>
> After discussing with Stephen at LPC, I decided to drop the 2 last patches
> of the RFC [1]. I can live without it for now and nobody expressed a
> critical need to get the proposed placeholder.
>
> [0]: https://lkml.kernel.org/r/CAEG3pNB-143Pr_xCTPj=tURhpiTiJqi61xfDGDVdU7zG5H-2tA@mail.gmail.com
> [1]: https://lkml.kernel.org/r/20190828102012.4493-1-jbrunet@baylibre.com
>

Hi Stephen,

Do you think we can fit this into the incoming cycle ?

Cheers
Jerome

> Jerome Brunet (3):
>   clk: actually call the clock init before any other callback of the
>     clock
>   clk: let init callback return an error code
>   clk: add terminate callback to clk_ops
>
>  drivers/clk/clk.c                     | 38 ++++++++++++++++++---------
>  drivers/clk/meson/clk-mpll.c          |  4 ++-
>  drivers/clk/meson/clk-phase.c         |  4 ++-
>  drivers/clk/meson/clk-pll.c           |  4 ++-
>  drivers/clk/meson/sclk-div.c          |  4 ++-
>  drivers/clk/microchip/clk-core.c      |  8 ++++--
>  drivers/clk/mmp/clk-frac.c            |  4 ++-
>  drivers/clk/mmp/clk-mix.c             |  4 ++-
>  drivers/clk/qcom/clk-hfpll.c          |  6 +++--
>  drivers/clk/rockchip/clk-pll.c        | 28 ++++++++++++--------
>  drivers/clk/ti/clock.h                |  2 +-
>  drivers/clk/ti/clockdomain.c          |  8 +++---
>  drivers/net/phy/mdio-mux-meson-g12a.c |  4 ++-
>  include/linux/clk-provider.h          | 13 ++++++---
>  14 files changed, 90 insertions(+), 41 deletions(-)

