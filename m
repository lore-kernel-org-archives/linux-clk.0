Return-Path: <SRS0=hHRo=QV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C1A7C43381
	for <linux-clk@archiver.kernel.org>; Thu, 14 Feb 2019 16:41:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5AB67222DD
	for <linux-clk@archiver.kernel.org>; Thu, 14 Feb 2019 16:41:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="AZ2AEnRk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405027AbfBNQl4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 14 Feb 2019 11:41:56 -0500
Received: from mail-it1-f196.google.com ([209.85.166.196]:53438 "EHLO
        mail-it1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405270AbfBNQl4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 Feb 2019 11:41:56 -0500
Received: by mail-it1-f196.google.com with SMTP id x131so15311512itc.3
        for <linux-clk@vger.kernel.org>; Thu, 14 Feb 2019 08:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nZUgZrWLpNJNj0dPdhxN5UrwCAJjJPL6QeL3FNwHTLY=;
        b=AZ2AEnRkD+RYeCzT0pMkFx9U2jKFM4QSzdFcUludDEOIUPYlzxjDaQYx66xU2nDDmK
         MK1m3GMhYkSc/vR4BkVVnCXt2X8XDCR1zYAdwi59w1cmBQUg8b7nDS44JI9OT6UrdO2p
         CIP/A8a+Yw5ZMLxsEcmz4PcX4Gojoo5OuhLWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nZUgZrWLpNJNj0dPdhxN5UrwCAJjJPL6QeL3FNwHTLY=;
        b=o9a2WPjBQaYA1Y7/revmPKQ0DT47m73XmCYI/l82upotn/7s9nvnBgm54apNclpt61
         g2r9vvGQa5wGVlFRU1Bev3fei4eNQF/3/x0vU0lTq+zMDAiRD5Mu/RGU1AsvNm2QjzM3
         u/M5z7McnZtfmf3odZGGS/3C/BJi/O4pN5A4PyjNMX4RWll9oK7Fl0kz7vDPJXk8aANQ
         OIdL4PGM3h9Fxg+1qx9sjuSCJGzzg/4fz5As1QAeGUUUf34h5gV92SUz8ySTMhzU/miK
         cjXJ4l9NJlFlhsNx4zF/khr/YFF2/1gT8XDf0q1yh3ISJkuAuRGc6s57k5dTo2tYwgvz
         0v6g==
X-Gm-Message-State: AHQUAuZvK+gT6XLuafFzmBM47+DNNM7bjasDtWFwmk0iKqLG9wQwsrMW
        u+3PlHkSLEV9uUXg60Lijqzqw3QlTsB3065tewFa1Q==
X-Google-Smtp-Source: AHgI3IYTDE5K36tVLwuWmVH6OGw3qvS591qoAx4NEc6sbufjXjMzCKSoHrTAxu3WdfuB5KXKey1VAR87bta/KI2izTk=
X-Received: by 2002:a5d:97c8:: with SMTP id k8mr2930040ios.267.1550162515088;
 Thu, 14 Feb 2019 08:41:55 -0800 (PST)
MIME-Version: 1.0
References: <20190201154232.10505-1-jagan@amarulasolutions.com>
 <CAMty3ZBspvP=qZEK9vaowVq4f5W3Qx2qHkwcuAnCOOjV29=Y_Q@mail.gmail.com>
 <20190213090308.dlcwgcrhg264k2cu@flea> <CAMty3ZCSMRm-0suApB4Zb+kE1M2sWn3F7ugPBFWaL4ap7cJejQ@mail.gmail.com>
In-Reply-To: <CAMty3ZCSMRm-0suApB4Zb+kE1M2sWn3F7ugPBFWaL4ap7cJejQ@mail.gmail.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Thu, 14 Feb 2019 22:11:43 +0530
Message-ID: <CAMty3ZAUL8TWOec=VpJvBzPL1LE13XVMCWj6t-Gycmny38st_A@mail.gmail.com>
Subject: Re: [PATCH v7 00/23] drm/sun4i: Allwinner A64 MIPI-DSI support
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Chen-Yu Tsai <wens@csie.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree <devicetree@vger.kernel.org>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        linux-amarula@amarulasolutions.com,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Feb 13, 2019 at 2:49 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> On Wed, Feb 13, 2019 at 2:33 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> >
> > On Tue, Feb 12, 2019 at 03:16:02PM +0530, Jagan Teki wrote:
> > > On Fri, Feb 1, 2019 at 9:12 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> > > >
> > > > Here is next version changes for Allwinner A64 MIPI-DSI support
> > > >
> > > > This series grouped the changes like previous version[1] with different
> > > > sets to support three different panels types that can fit into the DSI
> > > > controller.
> > > >
> > > > set:1, for 4-lane, burst mode support
> > > > - patch 0001: 0009, DSI controller changes that support burst mode.
> > > >
> > > > set:2, for A64 DSI support
> > > > - patch 0010: tcon dclk divider computation based on A64 BSP.
> > > > - patch 0011: 0017, Allwinner A64 DSI controller changes.
> > > >
> > > > set:3, enable 4-lane burst mode panel:
> > > > - patch 0018: Overlay patch that enable Feiyang FY07024DI26A30-D
> > > >   burst mode panel on Pine64-LTS
> > > >
> > > > set:4, enable 4-lane video mode panel:
> > > > - patch 0019: msg type MIPI_DSI_GENERIC_SHORT_WRITE_2_PARAM support
> > > > - patch 0020: Overlay patch that enable Bananapi S070WV20-CT16 ICN6211
> > > >   panel on Bananapi M64
> > > >
> > > > set:5, enable 2-lane video mode panel:
> > > > - patch 0021, 0022: DSI hfp and hbp timings fixes
> > > > - patch 0023: Enable Techstar TS8550B panel on Amarula A64-Relic
> > > >
> > > > Changes for v7:
> > > > - moved vcc-dsi binding to required filed.
> > > > - drop quotes on fallback dphy bindings.
> > > > - drop min_rate clock pll-mipi patches.
> > > > - introduce dclk divider computation as like A64 BSP.
> > > > - add A64 DSI quark patches.
> > > > - fixed A64 DSI pipeline.
> > > > - add proper commit messages.
> > > > - collect Merlijn Wajer Tested-by credits.
> > > > Changes for v6:
> > > > - dropped unneeded changes, patches
> > > > - fixed all burst mode patches as per previous version comments
> > > > - rebase on master
> > > > - update proper commit message
> > > > - dropped unneeded comments
> > > > - order the patches that make review easy
> > > > Changes for v5:
> > > > - collect Rob, Acked-by
> > > > - droped "Fix VBP size calculation" patch
> > > > - updated vblk timing calculation.
> > > > - droped techstar, bananapi dsi panel drivers which may require
> > > >   bridge or other setup. it's under discussion.
> > > > Changes for v4:
> > > > - droppoed untested CCU_FEATURE_FIXED_POSTDIV check code in
> > > >   nkm min, max rate patches
> > > > - create two patches for "Add Allwinner A64 MIPI DSI support"
> > > >   one for has_mod_clk quirk and other one for A64 support
> > > > - use existing driver code construct for hblk computation
> > > > - dropped "Increase hfp packet overhead" patch [2], though BSP added
> > > >   this but we have no issues as of now.
> > > >   (no issues on panel side w/o this change)
> > > > - create separate function for vblk computation
> > > > - enable vcc-dsi regulator in dsi_runtime_resume
> > > > - collect Rob, Acked-by
> > > > - update MAINTAINERS file for panel drivers
> > > > - cleanup commit messages
> > > > - fixed checkpatch warnings/errors
> > > >
> > > > [1] https://patchwork.kernel.org/cover/10779893/
> > > >
> > > > Any inputs?
> > > > Jagan.
> > > >
> > > > Jagan Teki (23):
> > > >   drm/sun4i: sun6i_mipi_dsi: Compute burst mode loop N1 instruction
> > > >     delay
> > > >   drm/sun4i: sun6i_mipi_dsi: Support instruction loop selection
> > > >   drm/sun4i: sun6i_mipi_dsi: Setup burst mode timings
> > > >   drm/sun4i: sun6i_mipi_dsi: Simplify drq to support all modes
> > > >   drm/sun4i: tcon: Export get tcon0 routine
> > > >   drm/sun4i: sun6i_mipi_dsi: Probe tcon0 during dsi_bind
> > > >   drm/sun4i: sun6i_mipi_dsi: Setup burst mode
> > > >   drm/sun4i: sun6i_mipi_dsi: Enable trail_inv and trail_fill controls
> > > >   drm/sun4i: sun6i_mipi_dsi: Enable HBP, HSA_HSE for burst mode
> > >
> > > Can you pick these burst changes which are generic to all SoCs. and
> > > reset will send once we decide the tcon clock.
> >
> > These patches don't implement what we discussed last week, and as I
> > told you already, most of them really need some work on the commit log
> > and their explanations.
>
> If I'm not wrong, we discussed about tcon_dclk (PLL_MIPI) last week
> [1] and these burst changes between 01/23 to 09/23 which are generic
> changes to DSI and not related to clock. Apart from that I made few
> changes on commit logs between the versions (which I was mentioned on
> the cover-letter patch). If any issues issues on commit message,
> please let me know so-that I can rework.

Look like the same discussion rounding since from months. In fact I
have grouped all changes by 'sets of patches' in this series which I
was thinking of having more feasibility to review and merge, but seems
like it ended-up fusing which patches are more prior and which are
fixes. So, let me send it by breaking into different series based on
the issues and generic changes.
