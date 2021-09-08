Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CCC2C433EF
	for <linux-clk@archiver.kernel.org>; Wed,  8 Sep 2021 19:45:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 69C6161179
	for <linux-clk@archiver.kernel.org>; Wed,  8 Sep 2021 19:45:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352156AbhIHTqV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Sep 2021 15:46:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352075AbhIHTqT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Sep 2021 15:46:19 -0400
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D12AAC061757
        for <linux-clk@vger.kernel.org>; Wed,  8 Sep 2021 12:45:10 -0700 (PDT)
Received: by mail-il1-x12b.google.com with SMTP id l10so3548532ilh.8
        for <linux-clk@vger.kernel.org>; Wed, 08 Sep 2021 12:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cY82i5QFt3f+oSOKzp91m6FG0+h9u8XPOeGXpy/rmp8=;
        b=PwjzusCCcXmrdIWclxRAbuawGLVSB/EhOV0thKoYUYRN8m+k7eb0NyC+XejhuiM7E2
         Lo8AkpNDdkwirrJNaeci63OOGFVyta6AEUcmcJjX72OKeVxDTK5zyN55XXQEu43RY1tS
         P2AQ+ZQLsdhztPCSDW3x+zG6Y8pSL2z1eP9g4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cY82i5QFt3f+oSOKzp91m6FG0+h9u8XPOeGXpy/rmp8=;
        b=24aVjrj7DTNJCFcGU5v8a4K4mArf+Bj1Lx/0V00IbG+xwbLMMLwo3D0q1wWRXXmXc+
         S0PUniYNqfbJaNKK0ooOF5nagUnE9rF8uKVGzQ0/CgG+Jkbu/wzggIAMvFwVketjHBsf
         2si1QTnBcl7M439sgzJez5vAcCpUlwZOQ61StmyQZwv7udoyQ3hIxy3DoNdJDyI4yo7k
         skr1haV9NnpDzYyHjvOq0mcLMUbkhe3NYMVy4k/oGrd6DSfuZnCO+9UUD3Ywys11gv/i
         ahIA0TqZRgYJzz9tP+uLrvPG/dWjHmisOXLObDnID67n21ckeBx74uXNZ6v8cliA1cND
         ZZaA==
X-Gm-Message-State: AOAM530aomA0Qitl06HM8uK7oxbs50xzcUeQfSpVGSCehiGjmxqoRBQC
        ccNjobAo9h3DNQwGE7UNZKoVrx1mu0zlcQ==
X-Google-Smtp-Source: ABdhPJx4l9LIVt0SGiXsyRJwBIynDU71C7zh59YIgTgugIb9z+yF2mcKzUGZaTUJs6zBOC7DoFlUdg==
X-Received: by 2002:a92:da04:: with SMTP id z4mr1179890ilm.101.1631130310135;
        Wed, 08 Sep 2021 12:45:10 -0700 (PDT)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com. [209.85.166.181])
        by smtp.gmail.com with ESMTPSA id m5sm23042ila.10.2021.09.08.12.45.08
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Sep 2021 12:45:09 -0700 (PDT)
Received: by mail-il1-f181.google.com with SMTP id x10so3539389ilm.12
        for <linux-clk@vger.kernel.org>; Wed, 08 Sep 2021 12:45:08 -0700 (PDT)
X-Received: by 2002:a05:6e02:e02:: with SMTP id a2mr1190609ilk.180.1631130308475;
 Wed, 08 Sep 2021 12:45:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210908111337.v2.1.I006bb36063555079b1a88f01d20e38d7e4705ae0@changeid>
 <20210908111337.v2.2.If29cd838efbcee4450a62b8d84a99b23c86e0a3f@changeid>
In-Reply-To: <20210908111337.v2.2.If29cd838efbcee4450a62b8d84a99b23c86e0a3f@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 8 Sep 2021 12:44:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Ua21T1S33nx9oFRLT8bhJFMazA_5Gd_+DQ+GYWm=q1Dw@mail.gmail.com>
Message-ID: <CAD=FV=Ua21T1S33nx9oFRLT8bhJFMazA_5Gd_+DQ+GYWm=q1Dw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] clk: rockchip: rk3399: expose PCLK_COREDBG_{B,L}
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
> We have DT IDs for PCLK_COREDBG_L and PCLK_COREDBG_B, but we don't
> actually expose them.
>
> Note that this requires the previous patch (making "armclkl" and
> "armclkb" into "critical" clocks) to prevent these clocks from taking
> down the CPU.
>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>
> Changes in v2:
>   - Split "CPU clocks are critical" to a new patch, to make it more
>     obvious
>
>  drivers/clk/rockchip/clk-rk3399.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
