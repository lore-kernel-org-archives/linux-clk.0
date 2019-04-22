Return-Path: <SRS0=Z5yo=SY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F003C282CE
	for <linux-clk@archiver.kernel.org>; Mon, 22 Apr 2019 15:24:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 516E720874
	for <linux-clk@archiver.kernel.org>; Mon, 22 Apr 2019 15:24:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fKnMVMpV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727518AbfDVPYD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 Apr 2019 11:24:03 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:45732 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727286AbfDVPYD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 Apr 2019 11:24:03 -0400
Received: by mail-ua1-f66.google.com with SMTP id c13so3682442uao.12
        for <linux-clk@vger.kernel.org>; Mon, 22 Apr 2019 08:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w3Pnf0PVHhgl+BQ3JKTz8MLka9s6N/KnXRLtBDBZScw=;
        b=fKnMVMpV4Qk4IxDOjs/F0ojtTH4udnkZYVXM75JgNrpsQg6kT3ifiZ6nmak4qpxzg2
         kD7C/w3WyQ6L7+7MQTjTtYCU5fAoCQBuibSnbi3RRYUl+sNVQxY+CexOOWFR+GiZtbwI
         XCo8a5538HHWiJYT8e7jxNQBLVsLVPlgAg/Ow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w3Pnf0PVHhgl+BQ3JKTz8MLka9s6N/KnXRLtBDBZScw=;
        b=MTjSnUN2081AUf4CyH6IfScBJ+WwmtcogsFUb6PYLOnl63dDhrHItbPbK54HatJDZP
         9DUXJsfhLL+C+qq1knVaoLnojf8rjJlFVud3miqmjhKYZ71r8jHLnh9G+D2f4PwkiUpy
         1WMNTICaDy4hheEAvc3V6dXwdWP4uMePx2jTsw1cfQptS97NpAh+gis0yOSfpxW1oQnD
         JnH8BJ1qnn2LZDk0sB0KIlY61o4H5s+fRHeQAnWqXq142yzr/+93cvoG4QGIB3HkqD+0
         4x4Ow2w5VFb5lIhnrM9pv8SC4OpE+G2Qbg/r7KwhlozyFIW5InCMzFKoxbX5rFB08/bB
         qfjw==
X-Gm-Message-State: APjAAAWcsRM27NVxyvw82m7CBUqxMIyJmOFhrQSliwI9HFrsQt5og1Nz
        AxSihG2NYbeEOZC2VOCbohdHP60YX40=
X-Google-Smtp-Source: APXvYqyOGzam3fTH64pfjpriC8KRU28kTx3AJM/djGX/jdwR62zrouWwvkVzfTJ+5CptsgDw8Le+tA==
X-Received: by 2002:ab0:6803:: with SMTP id z3mr722520uar.87.1555946641746;
        Mon, 22 Apr 2019 08:24:01 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 20sm3330748uas.15.2019.04.22.08.24.00
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Apr 2019 08:24:00 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id g8so3716525uaj.0
        for <linux-clk@vger.kernel.org>; Mon, 22 Apr 2019 08:24:00 -0700 (PDT)
X-Received: by 2002:a9f:3c01:: with SMTP id u1mr10131975uah.19.1555946640050;
 Mon, 22 Apr 2019 08:24:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190412161747.107107-1-dianders@chromium.org>
In-Reply-To: <20190412161747.107107-1-dianders@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 22 Apr 2019 08:23:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xkdc_yPCjVUh96atdiB4fo4h3oNZYe45ef+eLeVUVM8g@mail.gmail.com>
Message-ID: <CAD=FV=Xkdc_yPCjVUh96atdiB4fo4h3oNZYe45ef+eLeVUVM8g@mail.gmail.com>
Subject: Re: [PATCH v2] clk: rockchip: undo several noc and special clocks as
 critical on rk3288
To:     Heiko Stuebner <heiko@sntech.de>,
        Elaine Zhang <zhangqing@rock-chips.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Caesar Wang <caesar.wang@rock-chips.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Ryan Case <ryandcase@chromium.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Elaine,

On Fri, Apr 12, 2019 at 9:18 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> This is mostly a revert of commit 55bb6a633c33 ("clk: rockchip: mark
> noc and some special clk as critical on rk3288") except that we're
> keeping "pmu_hclk_otg0" as critical still.
>
> NOTE: turning these clocks off doesn't seem to do a whole lot in terms
> of power savings (checking the power on the logic rail).  It appears
> to save maybe 1-2mW.  ...but still it seems like we should turn the
> clocks off if they aren't needed.
>
> About "pmu_hclk_otg0" (the one clock from the original commit we're
> still keeping critical) from an email thread:
>
> > pmu ahb clock
> >
> > Function: Clock to pmu module when hibernation and/or ADP is
> > enabled. Must be greater than or equal to 30 MHz.
> >
> > If the SOC design does not support hibernation/ADP function, only have
> > hclk_otg, this clk can be switched according to the usage of otg.
> > If the SOC design support hibernation/ADP, has two clocks, hclk_otg and
> > pmu_hclk_otg0.
> > Hclk_otg belongs to the closed part of otg logic, which can be switched
> > according to the use of otg.
> >
> > pmu_hclk_otg0 belongs to the always on part.
> >
> > As for whether pmu_hclk_otg0 can be turned off when otg is not in use,
> > we have not tested. IC suggest make pmu_hclk_otg0 always on.
>
> For the rest of the clocks:
>
> atclk: No documentation about this clock other than that it goes to
> the CPU.  CPU functions fine without it on.  Maybe needed for JTAG?
>
> jtag: Presumably this clock is only needed if you're debugging with
> JTAG.  It doesn't seem like it makes sense to waste power for every
> rk3288 user.  In any case to do JTAG you'd need private patches to
> adjust the pinctrl the mux the JTAG out anyway.
>
> pclk_dbg, pclk_core_niu: On veyron Chromebooks we turn these two
> clocks on only during kernel panics in order to access some coresight
> registers.  Since nothing in the upstream kernel does this we should
> be able to leave them off safely.  Maybe also needed for JTAG?
>
> hsicphy12m_xin12m: There is no indication of why this clock would need
> to be turned on for boards that don't use HSIC.
>
> pclk_ddrupctl[0-1], pclk_publ0[0-1]: On veyron Chromebooks we turn
> these 4 clocks on only when doing DDR transitions and they are off
> otherwise.  I see no reason why they'd need to be on in the upstream
> kernel which doesn't support DDRFreq.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v2:
> - Now keep pmu_hclk_otg0 as critical.
> - Updated description since this isn't a clean revert.
> - PWM patches have landed, so just one patch in the series now.
>
>  drivers/clk/rockchip/clk-rk3288.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)

From previous discussions I think you're all happy with this patch
now, right?  Care to give it an official Reviewed-by tag?

-Doug
