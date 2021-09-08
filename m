Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 646EAC433EF
	for <linux-clk@archiver.kernel.org>; Wed,  8 Sep 2021 19:44:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 43C5061175
	for <linux-clk@archiver.kernel.org>; Wed,  8 Sep 2021 19:44:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352215AbhIHTpm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Sep 2021 15:45:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350977AbhIHTpl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Sep 2021 15:45:41 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D95FC061575
        for <linux-clk@vger.kernel.org>; Wed,  8 Sep 2021 12:44:33 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id b7so4807890iob.4
        for <linux-clk@vger.kernel.org>; Wed, 08 Sep 2021 12:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pEG9NavySLWdy1upAVmaIf1dDuKJCYTqEzed8oQQGD8=;
        b=CyIBEhnLQsXDqwARbirekG1YFjYcD7oCdYRow3tyboeFb2XGoxYLtD/l0BL7Bk6YuR
         VEri7WBhM4wJhhos/70mFl1baUzbF7QxtuXIcXDif2oN5A4UNXoK2kAVr+j7VQxqYp0/
         GOicdMMTXJOOZzusEjRQZxvyE8i5sPbVxqc0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pEG9NavySLWdy1upAVmaIf1dDuKJCYTqEzed8oQQGD8=;
        b=hIfsXslVI8UNZlr/CdUZhobfy2mDItC3CzfgQrbdRATxo1c8FdcFhKklGzRsU+0G/H
         U5ww+QYc/v+guFHjChYKFKFlwzGqhBg9Z1j3SNvO/jDySq4kyAAXfhrbTEZ1ohNCx9cH
         ELKuIs4eVkxDqtpPJf4zhKhEV5y1rnbOkYAlauS30LZ/CwWTFLsXAP97Mp0KDuYyhXI/
         iQwXNUawqFTIrfoo1t5KJpH7jJwnfvJvnRm0VGLii90988sFRtQPAvijhrVr/ORXtSTz
         oiaDJchDxT7WiBzMOzDK5XiPADeS6euzCuyLhADR5TklI5mi2V+xtgiNXFZd+/Hufx6c
         AHbQ==
X-Gm-Message-State: AOAM530jUdbKD5Bu+W0eO4AMxRlbvSphps7RkXsJPCVXqv+fRFmo0aWH
        X4EXzxqqjkWxbP1VSjfGNsyk950Zff2Nlw==
X-Google-Smtp-Source: ABdhPJzSE4mAw++WmXJVIroW6TOvKIFNvOfYiBYzFOw0z9hV2dKrDZI27Ab4wkIYow0zdD6MMoKsVA==
X-Received: by 2002:a05:6638:1613:: with SMTP id x19mr5329310jas.77.1631130272399;
        Wed, 08 Sep 2021 12:44:32 -0700 (PDT)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com. [209.85.166.171])
        by smtp.gmail.com with ESMTPSA id c25sm39897iom.9.2021.09.08.12.44.31
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Sep 2021 12:44:31 -0700 (PDT)
Received: by mail-il1-f171.google.com with SMTP id j15so3578143ila.1
        for <linux-clk@vger.kernel.org>; Wed, 08 Sep 2021 12:44:31 -0700 (PDT)
X-Received: by 2002:a05:6e02:214e:: with SMTP id d14mr1096154ilv.142.1631130271165;
 Wed, 08 Sep 2021 12:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210908111337.v2.1.I006bb36063555079b1a88f01d20e38d7e4705ae0@changeid>
In-Reply-To: <20210908111337.v2.1.I006bb36063555079b1a88f01d20e38d7e4705ae0@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 8 Sep 2021 12:44:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wp=zqx4j=srryypAfpRusHQinuhXjmu4G_HuBo7+PN1g@mail.gmail.com>
Message-ID: <CAD=FV=Wp=zqx4j=srryypAfpRusHQinuhXjmu4G_HuBo7+PN1g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] clk: rockchip: rk3399: make CPU clocks critical
To:     Brian Norris <briannorris@chromium.org>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Wed, Sep 8, 2021 at 11:14 AM Brian Norris <briannorris@chromium.org> wrote:
>
> The CPU clocks don't currently have any owner (e.g., cpufreq-dt doesn't
> enable() them -- and even if it did, it's not early enough compared to
> other consumers -- nor does arch/arm64/kernel/smp.c), and instead are
> simply assumed to be "on" all the time.
>
> They are also parents of a few other clocks which haven't been
> previously exposed for other devices to consume. If we want to expose
> those clocks, then the common clock framework may eventually choose to
> disable their parents (including the CPU PLLs) -- which is no fun for
> anyone.
>
> Thus, mark the CPU clocks as critical, to prevent them from being
> disabled implicitly.
>
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>
> Changes in v2:
>   - New, split from the patch that requires this change
>
>  drivers/clk/rockchip/clk-rk3399.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
