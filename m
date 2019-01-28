Return-Path: <SRS0=UrzD=QE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD0ABC282C8
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jan 2019 09:36:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7B02921736
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jan 2019 09:36:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="AY7yun73"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbfA1JgX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Jan 2019 04:36:23 -0500
Received: from mail-it1-f194.google.com ([209.85.166.194]:50637 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726672AbfA1JgW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Jan 2019 04:36:22 -0500
Received: by mail-it1-f194.google.com with SMTP id z7so19627418iti.0
        for <linux-clk@vger.kernel.org>; Mon, 28 Jan 2019 01:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ozesp4rWwiinrHtP2lbjF0VXem3poIT2No6pvmp0vP4=;
        b=AY7yun73QD+EMNMwN0Y9/iGld70czBDXBhZwOgwRagFJXGF4+NVDKL7UmP/oFwxqMa
         bx3rn5BaL6yp5Cf4amrzXIkfjukg6OKP6aXwgTM0QqGO5rzZ41224LwdVvL3SHWhpBL2
         aR2HTIR8GnB108wOYdYBcqWMpVgeDWctVrae4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ozesp4rWwiinrHtP2lbjF0VXem3poIT2No6pvmp0vP4=;
        b=TLs9MTpazK0E54V5egalIgjb1GB0CbASKFBmFdmSj/H003+AtBLT7QrkcYJlRjjx80
         daZ/YleowWrc03pdiCvi29D+OgGzbsPU1TEkrPF0z9W7YQD39VvWsdzSwCxjl4megd0z
         9OTqXfUGOGJ4TxwwI5DRK0cPNXM7DVZLVg7jSuJ6H7FYHaSouC+s0vpAmBB8Rga9dJs7
         3Wmn4NDFpB0E0CPOwBu9FH3aQ1/i44nMvoW6bylFRJszBY01ItjInuuNCd0SCmV6RGV9
         L4XPMDoEBD7HUw1nxHjUmx7RXkMrn/Oy8bx7471Wt6ZS6Rg7NlQLn80pshpB4kMaGVXX
         ILLw==
X-Gm-Message-State: AJcUukc6z/52dAhkRgh9gJDmlffmsdBFJybQCic2dkAWiLSLnvvMHoFV
        3ckRwA/Afbzam7h9djSfzhNNOtMUDHweY0xQDN0Bww==
X-Google-Smtp-Source: ALg8bN6pbH8aim/d9XQIpdNF6Ci4nzcWf2S1jjcKEHd6gLiFxhxCMBZ3bZKyOFJKx+7PoFzRn8eTtVwDlkiO4D5JUu4=
X-Received: by 2002:a02:781e:: with SMTP id p30mr13465792jac.85.1548668181627;
 Mon, 28 Jan 2019 01:36:21 -0800 (PST)
MIME-Version: 1.0
References: <20190124195900.22620-1-jagan@amarulasolutions.com>
 <20190124195900.22620-12-jagan@amarulasolutions.com> <20190125212433.ni2jg3wvpyjazlxf@flea>
In-Reply-To: <20190125212433.ni2jg3wvpyjazlxf@flea>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Mon, 28 Jan 2019 15:06:10 +0530
Message-ID: <CAMty3ZAsH2iZ+JEqTE3D58aXfGuhMSg9YoO56ZhhOeE4c4yQHQ@mail.gmail.com>
Subject: Re: [PATCH v6 11/22] clk: sunxi-ng: a64: Add minimum rate for PLL_MIPI
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

On Sat, Jan 26, 2019 at 2:54 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> On Fri, Jan 25, 2019 at 01:28:49AM +0530, Jagan Teki wrote:
> > Minimum PLL used for MIPI is 500MHz, as per manual, but
> > lowering the min rate by 300MHz can result proper working
> > nkms divider with the help of desired dclock rate from
> > panel driver.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > Acked-by: Stephen Boyd <sboyd@kernel.org>
>
> Going 200MHz below the minimum doesn't seem really reasonable. What
> is the issue that you are trying to fix here?
>
> It looks like it's picking bad dividers, but if that's the case, this
> isn't the proper fix.

As I stated in earlier patches, the whole idea is pick the desired
dclk divider based dclk rate. So the dotclock, sun4i_dclk_round_rate
is unable to get the proper dclk divider at the end, so it eventually
picking up wrong divider value and fired vblank timeout.

So, we come-up with optimal and working min_rate 300MHz in pll-mipi to
get the desired clock something like below.
[    2.415773] [drm] No driver support for vblank timestamp query.
[    2.424116] sun4i_dclk_round_rate: min_div = 4 max_div = 127, rate = 55000000
[    2.424172] ideal = 220000000, rounded = 0
[    2.424176] ideal = 275000000, rounded = 0
[    2.424194] ccu_nkm_round_rate: rate = 330000000
[    2.424197] ideal = 330000000, rounded = 330000000
[    2.424201] sun4i_dclk_round_rate: div = 6 rate = 55000000
[    2.424205] sun4i_dclk_round_rate: min_div = 4 max_div = 127, rate = 55000000
[    2.424209] ideal = 220000000, rounded = 0
[    2.424213] ideal = 275000000, rounded = 0
[    2.424230] ccu_nkm_round_rate: rate = 330000000
[    2.424233] ideal = 330000000, rounded = 330000000
[    2.424236] sun4i_dclk_round_rate: div = 6 rate = 55000000
[    2.424253] ccu_nkm_round_rate: rate = 330000000
[    2.424270] ccu_nkm_round_rate: rate = 330000000
[    2.424278] sun4i_dclk_recalc_rate: val = 1, rate = 330000000
[    2.424281] sun4i_dclk_recalc_rate: val = 1, rate = 330000000
[    2.424306] ccu_nkm_set_rate: rate = 330000000, parent_rate = 297000000
[    2.424309] ccu_nkm_set_rate: _nkm.n = 5
[    2.424311] ccu_nkm_set_rate: _nkm.k = 2
[    2.424313] ccu_nkm_set_rate: _nkm.m = 9
[    2.424661] sun4i_dclk_set_rate div 6
[    2.424668] sun4i_dclk_recalc_rate: val = 6, rate = 55000000

But look like this wouldn't valid for all other dclock rates, say BPI
panel has 30MHz clock that would failed with this logic.

On the other side Allwinner BSP calculating dclk divider based on the
SoC's. for A33 [1] it is fixed dclk divider of 4 and for A64 is is
calculated based on the bpp/lanes.

Since the above min_rate is not desired for possible panels clock, I
think we can rely on BSP to make a move here. I'm planning to do these
changes in next version.

Let me know if you have any comments here?

[1] https://patchwork.kernel.org/patch/10777519/
