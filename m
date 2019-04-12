Return-Path: <SRS0=khTx=SO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61C4BC282CE
	for <linux-clk@archiver.kernel.org>; Fri, 12 Apr 2019 15:41:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 233C02082E
	for <linux-clk@archiver.kernel.org>; Fri, 12 Apr 2019 15:41:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IuhEhZ75"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727027AbfDLPlh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Apr 2019 11:41:37 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:40519 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726911AbfDLPlh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Apr 2019 11:41:37 -0400
Received: by mail-ua1-f68.google.com with SMTP id b8so3370792uaq.7
        for <linux-clk@vger.kernel.org>; Fri, 12 Apr 2019 08:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zz1SQZu2GGszLBjVKsHpw5QwWKr5To4JSYJmkOPSXXQ=;
        b=IuhEhZ75ZbFmoK4HEJZVvq3EYjdJ19JcVajy5FegrrNH1jrwRq8GEkHswMEE/v7DxI
         S3T1ECgl6FT+ObnWfU5j9Za7ch2w2PT4xQApCOverWIArbaCp1Pc1/QPtDG17cRnIT6P
         Im+cCiWnRJDyBrph9fQ7HFq8Q4P26MFtdOrP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zz1SQZu2GGszLBjVKsHpw5QwWKr5To4JSYJmkOPSXXQ=;
        b=dbIwGLcipZnTro2ypN2Yf61/aK4AeiRxdfYOY0PJAv71AVOm5yl+HRIci/S6SBg0xk
         5fdbKa1YSWIB5eLQEfvDIJAde9gnl9vTdC1oACbEWNk9rwO92C0fCPKC+BanTcrY/uui
         eXMgI3sMg5IUQHWlV/KjHDtZR8Ug1MxOLOVSJ3a8x3kMdACakO3rPZzN9a1w4ERThJ9S
         +b3srmycssE01Um7tSq4dtW8IM/pKNsOlqsqsLQJyBYh1Qa3zTtePTRP83oV4P2Kod6X
         J57KkMcOcnmzyl20rh8/0TMmUT/0HxldyQqdhZMTE++8oUdq5gEjV8mrLxbzMX5meAGq
         f+sQ==
X-Gm-Message-State: APjAAAVr6jsQi+M3ixeDrrPPHHp6CvHTszLEOdg57TWmANNFFwS5lI/Y
        PXtzNHbFDgU35gZ3wyMth6Rzli8Fl28=
X-Google-Smtp-Source: APXvYqy89qFXv2wJZtgcGE77Hn8CSeu40bxmQizSHGg6jMZG5KobDm8fmI8Cc6bOPgeG84fNTi+gQw==
X-Received: by 2002:ab0:73d3:: with SMTP id m19mr31212267uaq.46.1555083695490;
        Fri, 12 Apr 2019 08:41:35 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 2sm24616120vke.27.2019.04.12.08.41.31
        for <linux-clk@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Apr 2019 08:41:31 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id t78so5810460vsc.1
        for <linux-clk@vger.kernel.org>; Fri, 12 Apr 2019 08:41:31 -0700 (PDT)
X-Received: by 2002:a67:8154:: with SMTP id c81mr32689301vsd.37.1555083690923;
 Fri, 12 Apr 2019 08:41:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190409204707.150347-1-dianders@chromium.org>
 <1491b5f1-e9f9-5718-76e5-0a49814ed76d@rock-chips.com> <CAD=FV=Ue3C3gMWx9hnQr=+LU77xdemLbsWozFZoCuQAACjiCUg@mail.gmail.com>
 <1820193.6uR021mFLB@diego> <1f61e93d-c1d9-4438-de0e-d65c7eb248bf@rock-chips.com>
In-Reply-To: <1f61e93d-c1d9-4438-de0e-d65c7eb248bf@rock-chips.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 12 Apr 2019 08:41:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V8OdOCd819i51WnBSo=C=Y7dqBtH1gTpZiVhnNWn4OJg@mail.gmail.com>
Message-ID: <CAD=FV=V8OdOCd819i51WnBSo=C=Y7dqBtH1gTpZiVhnNWn4OJg@mail.gmail.com>
Subject: Re: [PATCH 1/3] Revert "clk: rockchip: mark noc and some special clk
 as critical on rk3288"
To:     "elaine.zhang" <zhangqing@rock-chips.com>
Cc:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Caesar Wang <caesar.wang@rock-chips.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Ryan Case <ryandcase@chromium.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Thu, Apr 11, 2019 at 6:43 PM elaine.zhang <zhangqing@rock-chips.com> wro=
te:
> >>> -     "pmu_hclk_otg0",
> >>>
> >>> It's a soc bug, pmu_hclk_otg0 must always on.
> >>>
> >>> So you said in your previous commit message.  However we've shipped
> >>> lots and lots of Chromebooks with this clock off.  Can you explain
> >>> what is broken?  Is this only needed for gadget mode (which we don't
> >>> use), for instance?
> >>>
> >>> test case:
> >>>
> >>> recovery test,  < 1 hour , system crash.
> >>>
> >>> log:
> >>>
> >>> [  127.569629] I[0:      swapper/0:    0] GOTGCTL        @0xFFFFFF800=
0B80000 : 0x00400010
> >>> [  127.569644] I[0:      swapper/0:    0] GOTGINT        @0xFFFFFF800=
0B80004 : 0x00400010
> >>> [  127.569659] I[0:      swapper/0:    0] GAHBCFG        @0xFFFFFF800=
0B80008 : 0x00400010
> >>> [  127.569673] I[0:      swapper/0:    0] GUSBCFG        @0xFFFFFF800=
0B8000C : 0x00400010
> >>> [  127.569688] I[0:      swapper/0:    0] GRSTCTL        @0xFFFFFF800=
0B80010 : 0x00400010
> >>> [  127.569702] I[0:      swapper/0:    0] GINTSTS        @0xFFFFFF800=
0B80014 : 0x00400010
> >>> [  127.569718] I[0:      swapper/0:    0] GINTMSK        @0xFFFFFF800=
0B80018 : 0x00400010
> >>> [  127.569733] I[0:      swapper/0:    0] GRXSTSR        @0xFFFFFF800=
0B8001C : 0x00400010
> >>> [  127.569748] I[0:      swapper/0:    0] GRXFSIZ        @0xFFFFFF800=
0B80024 : 0x00400010
> >> I don't know what a "recovery test" is and I don't understand your log=
s.
> >>
> >> Can you explain we do not run into this on Chromebooks?
> >>
> >>
> >>> reason:
> >>>
> >>> USB OTG controller supports turning off most logic power, and then on=
ly one PMU module is left. This clock cannot be turned off, which is simila=
r to the always on module in USB OTG.
> >> Can't you just add a patch to the dwc2 driver to have it grab this
> >> clock?  I assume this clock doesn't need to be turned on unless you're
> >> using the OTG contoller in a certain way?
> > So far we don't really know where the clock in question is sitting
> > in the clock hirarchy. For example the kernel got a new interconnect
> > framework recently, so handling non-device clocks in a device may haunt
> > us later on.
> >
> > @Elaine: could you elaborate what pmu_hclk_otg0 actually is for please?
>
> Doug:
>
> Recovry test: Regular factory tests, including restart, adb debugging,
> clear data/factory Settings, and clear cache.
> I'm not clear whether the test was added by chromebooks.
>
> Heiko:
>
> pmu_hclk_otg0=EF=BC=9A pmu ahb clock
>
> Function: Clock to pmu module when hibernation and/or ADP is
> enabled.Must be greater than or equal to 30 MHz.

Does this mean we can enable hibernation in dwc2 once we turn this
clock on?  I think right now hibernation doesn't work for dwc2 on
rk3288.  Not that I know a ton about dwc2's hibernation modes, but
I've certainly bumped up against it when enabling power down modes.
In fact I'm planning to post some patches soon...  I'll CC you.


> If the SOC design does not support hibernation/ADP function, only have
> hclk_otg, this clk can be switched according to the usage of otg.
> If the SOC design support hibernation/ADP, has two clocks, hclk_otg and
> pmu_hclk_otg0.
> Hclk_otg belongs to the closed part of otg logic, which can be switched
> according to the use of otg.
>
> pmu_hclk_otg0 belongs to the always on part.
>
> As for whether pmu_hclk_otg0 can be turned off when otg is not in use,
> we have not tested. IC suggest make pmu_hclk_otg0 always on.

OK.  I'm fine with this clock staying as a critical clock for now.

I'll send out a v2 shortly.

-Doug
